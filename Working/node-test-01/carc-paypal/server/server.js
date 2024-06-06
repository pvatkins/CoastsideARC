// const express = require('express');
import express from "express";
import https from "https";
import fs from "fs";
import mysql from "mysql";
// import { Liquid } from 'liquidjs';

// const fetch = require("node-fetch");
import fetch from "node-fetch";

// const config = require("dotenv/config")
import "dotenv/config";

// const path = require("path");
import path from "path";
import bodyParser from 'body-parser';
import cors from 'cors';


const {
  PAYPAL_CLIENT_ID,
  PAYPAL_CLIENT_SECRET,
  ENVIRONMENT,
  KEY_PATH,
  CERT_PATH,
  PORT = 5556,
  MY_SQL_SERVER,
  MY_SQL_USER,
  MY_SQL_PWD,
  MY_SQL_DB,
  MY_SQL_PORT = 3306,
  SUCCESS_URL,
  CANCEL_URL } = process.env;

var options = {
  key: fs.readFileSync(KEY_PATH),
  cert: fs.readFileSync(CERT_PATH)
};
const environment = ENVIRONMENT || 'sandbox';
const base = environment === 'sandbox' ? "https://api-m.sandbox.paypal.com" : "https://api-m.paypal.com";
const app = express();

function esc_tv(varName) {
  return "_|" + varName + "|_";
}

app.engine('sjf.html', (filePath, options, callback) => { // define the template engine
  fs.readFile(filePath, (err, content) => {
    if (err) return callback(err)
    // this is an extremely simple template engine
    const rendered = content.toString()
      .replace(esc_tv('title'), `<title>${options.title}</title>`)
      .replace(esc_tv('message'), `${options.message}`)
      .replace(/_\|pp_id\|_/g, `${options.pp_id}`) // to replace ALL
      .replace(/_\|succ_url\|_/g, `${options.succ_url}`) // to replace ALL
      .replace(/_\|canc_url\|_/g, `${options.canc_url}`) // to replace ALL
      .replace(/_\|client_id\|_/g, `${options.client_id}`) // to replace ALL
      .replace(esc_tv('P6'), `${options.P6}`)
      .replace(esc_tv('P1'), `${options.P1}`)
      .replace(esc_tv('P2'), `${options.P2}`)
      .replace(esc_tv('P3'), `${options.P3}`)
      .replace(esc_tv('P4'), `${options.P4}`)
      .replace(esc_tv('P5'), `${options.P5}`)
      .replace(esc_tv('P7'), `${options.P7}`)
    return callback(null, rendered)
  })
})
app.set('views', './views') // specify the views directory
app.set('view engine', 'sjf.html') // register the template engine

// app.use(cors({
//   // origin: 'http://localhost:8000',
//   methods: ["POST"]
// }));

// host static files
app.use(express.static("client"));

// parse post params sent in body in json format
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(bodyParser.json());

/**
 * Generate an OAuth 2.0 access token for authenticating with PayPal REST APIs.
 * @see https://developer.paypal.com/api/rest/authentication/
 */
const generateAccessToken = async () => {
  try {
    if (!PAYPAL_CLIENT_ID || !PAYPAL_CLIENT_SECRET) {
      throw new Error("MISSING_API_CREDENTIALS");
    }
    const auth = Buffer.from(
      PAYPAL_CLIENT_ID + ":" + PAYPAL_CLIENT_SECRET,
    ).toString("base64");
    const response = await fetch(`${base}/v1/oauth2/token`, {
      method: "POST",
      body: "grant_type=client_credentials",
      headers: {
        Authorization: `Basic ${auth}`,
      },
    });

    const data = await response.json();
    return data.access_token;
  } catch (error) {
    console.error("Failed to generate Access Token:", error);
  }
};

/**
 * Create an order to start the transaction.
 * @see https://developer.paypal.com/docs/api/orders/v2/#orders_create
 */
const createOrder = async (cart) => {
  // use the cart information passed from the front-end to calculate the purchase unit details
  console.log(
    "shopping cart information passed from the frontend createOrder() callback:",
    cart,
  );

  const accessToken = await generateAccessToken();
  const url = `${base}/v2/checkout/orders`;
  const payload = {
    intent: "CAPTURE",
    purchase_units: [
      {
        amount: {
          currency_code: "USD",
          value: cart[0].quantity,
        },
        custom_id: cart[0].pp_id,
      },
    ],
  };

  const response = await fetch(url, {
    headers: {
      "Content-Type": 'application/json',
      'Authorization': `Bearer ${accessToken}`,
      'Paypal-Request-Id': cart[0].pp_id,
      // Uncomment one of these to force an error for negative testing (in sandbox mode only). Documentation:
      // https://developer.paypal.com/tools/sandbox/negative-testing/request-headers/
      // "PayPal-Mock-Response": '{"mock_application_codes": "MISSING_REQUIRED_PARAMETER"}'
      // "PayPal-Mock-Response": '{"mock_application_codes": "PERMISSION_DENIED"}'
      // "PayPal-Mock-Response": '{"mock_application_codes": "INTERNAL_SERVER_ERROR"}'
    },
    method: "POST",
    body: JSON.stringify(payload),
  });

  return handleResponse(response);
};

/**
 * Capture payment for the created order to complete the transaction.
 * @see https://developer.paypal.com/docs/api/orders/v2/#orders_capture
 */
const captureOrder = async (orderID) => {
  const accessToken = await generateAccessToken();
  const url = `${base}/v2/checkout/orders/${orderID}/capture`;

  const response = await fetch(url, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      Authorization: `Bearer ${accessToken}`,
      // Uncomment one of these to force an error for negative testing (in sandbox mode only). Documentation:
      // https://developer.paypal.com/tools/sandbox/negative-testing/request-headers/
      // "PayPal-Mock-Response": '{"mock_application_codes": "INSTRUMENT_DECLINED"}'
      // "PayPal-Mock-Response": '{"mock_application_codes": "TRANSACTION_REFUSED"}'
      // "PayPal-Mock-Response": '{"mock_application_codes": "INTERNAL_SERVER_ERROR"}'
    },
  });

  return handleResponse(response);
};

async function handleResponse(response) {
  try {
    const jsonResponse = await response.json();
    return {
      jsonResponse,
      httpStatusCode: response.status,
    };
  } catch (err) {
    const errorMessage = await response.text();
    throw new Error(errorMessage);
  }
}

app.post("/api/orders", async (req, res) => {
  try {
    // use the cart information passed from the front-end to calculate the order amount detals
    console.log("MY TEST ORDER: ", req.body);
    const { cart } = req.body;
    const result = await SelectPaypalTnx(cart[0].pp_id);
    console.log(result[0].transaction_status);
    if (result[0].transaction_status != 'pending') {
      // has been dealt with. Cannot pay again... handles back button in browser
      throw "Order paid already:";
    }
    const { jsonResponse, httpStatusCode } = await createOrder(cart);
    res.status(httpStatusCode).json(jsonResponse);
  } catch (error) {
    console.error("Failed to create order:", error);
    res.status(500).json({ error: "Failed to create order." });
  }
});

app.post("/api/orders/:orderID/capture", async (req, res) => {
  try {
    console.log("MY TEST CAPTURE: ", req.params);
    const { orderID } = req.params;
    const { jsonResponse, httpStatusCode } = await captureOrder(orderID);
    const pp_id = jsonResponse.purchase_units[0].payments.captures[0].custom_id;
    const result = UpdatePaypalTnx(pp_id, orderID, jsonResponse);
    result.then(() => {
      // console.log(JSON.stringify(jsonResponse,null,2));
      res.status(httpStatusCode).json(jsonResponse);
    });
  } catch (error) {
    console.error("Failed to create order:", error);
    res.status(500).json({ error: "Failed to capture order." });
  }
});

const pool = mysql.createPool({
  connectionLimit: 10,
  host: MY_SQL_SERVER,
  user: MY_SQL_USER,
  port: MY_SQL_PORT,
  password: MY_SQL_PWD,
  database: MY_SQL_DB
});

app.get('/paypal', async (req, res) => {
  res.sendFile(path.resolve("./client/checkout.html"));
});

app.post('/api/success/:pp_id_arg', async (req, res, next) => {
  const { pp_id_arg } = req.params;
  res.status(200).json({ to_do: `change record for ${pp_id_arg} to posted` })
});

const SelectPaypalTnx = async (pp_id) => {
  pp_id = "'".concat(pp_id, "'");
  return new Promise((resolve, reject) => {
    pool.query(`SELECT * FROM pp_tnx WHERE pp_id=${pp_id}`, (error, elements) => {
      if (error) {
        return reject(error);
      }
      return resolve(elements);
    });
  });
};

const UpdatePaypalTnx = async (pp_id, orderID, jResp) => {
  pp_id = "'".concat(pp_id, "'");
  let pp_orderID = "'".concat(orderID, "'");
  let jr = { 'orderID': jResp['id'], 'purchase_units': jResp['purchase_units'] };
  console.log(JSON.stringify(jr, null, 2));
  return new Promise((resolve, reject) => {
    pool.query(`UPDATE pp_tnx set transaction_status = 'posted', pp_orderID = ${pp_orderID}, pp_response = '${JSON.stringify(jr, null)}' WHERE pp_id=${pp_id}`, (error, elements) => {
      if (error) {
        return reject(error);
      }
      return resolve(elements);
    });
  });
};

app.get('/make_payment/:pp_id_arg', async (req, res, next) => {
  const { pp_id_arg } = req.params;
  // let result = [];
  try {
    const result = await SelectPaypalTnx(pp_id_arg);
    // res.status(200).json({ pp_tnx: result });
    console.log('test result[0] ', result[0]);
    if (result.length == 0) { throw "pp_id does not exist in db."; }
    if (result.length > 0) {
      const {
        callsigns,
        primary,
        family,
        repeater,
        digipeater,
        paypalfee,
        pp_total,
        transaction_status } = result[0];
      if (transaction_status == 'pending') {
        res.render('index', {
          'pp_id': pp_id_arg,
          'P1': primary,
          'P2': family,
          'P3': repeater,
          'P4': digipeater,
          'P5': paypalfee,
          'P6': callsigns,
          'P7': pp_total,
          'succ_url': SUCCESS_URL,
          'canc_url': CANCEL_URL,
          'client_id': PAYPAL_CLIENT_ID,
        });
      } else {
        console.log("Not a pending payment:");
        res.status(500).json({ error: "Not a pending payment." });
      }
    } else {
      console.log("Failed to make payment:");
      res.status(500).json({ error: "Failed to make payment." });
    }
  } catch (e) {
    console.log(e);
    res.sendStatus(500);
  };

});

https.createServer(options, app).listen(PORT);

// app.listen(PORT, () => {
//   console.log(`Example app listening on port ${PORT}`)
// });
