<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8" />
    <title>PayPal Entries.php</title>

    <style>
        .div1 {
            height: calc(100vh - 250px);
            width: calc(100vw - 100px);
        }

        #table3 {
            border-spacing: 0;  /* is working */
        }

        /* Styling the Header (and default width of most columns) */
        .div1 th {
            border-left: none;
            border-right: 1px solid #bbbbbb;
            padding: 10px;
            width: 70px; 
            min-width: 70px;
            position: sticky;
            top: 0;
            background: #727272;
            color: #e0e0e0;
            font-weight: normal;
            z-index: 4;
        }

        .div1 th:nth-child(1),
        .div1 th:nth-child(2),
        .div1 th:nth-child(3) {
            z-index:5;
        }


        /*
        .div1 tr:nth-child(1) {
            position: sticky;
            top: 0'
        }
        */

        /* Freezing the First column */
        .div1 th:nth-child(1),
        .div1 td:nth-child(1) {
            position: sticky;
            left: 0;
            width: 40px;
            min-width: 40px;
        }

        /* Freezing the Second Column */
        .div1 th:nth-child(2),
        .div1 td:nth-child(2) {
            position: sticky;
            left: 51px;
            width: 150px;
            min-width: 150px;
        }

        /* Freezing the Third Column */
        .div1 th:nth-child(3),
        .div1 td:nth-child(3) {
            position: sticky;
            left: 212px;
            width: 150px;
            min-width: 150px;
        }

        /* Set width of Fourth Column */
        .div1 th:nth-child(4),
        .div1 td:nth-child(4) {
            width: 100px;
            min-width: 100px;
        }

        /* Set width of 14th Column */
        .div1 th:nth-child(14),
        .div1 td:nth-child(14) {
            width: 120px;
            min-width: 120px;
        }

        /* Set width of 15th Column */
        .div1 th:nth-child(15),
        .div1 td:nth-child(15) {
            width: 150px;
            min-width: 150px;
        }

        /* Provide a background color for the first, second and third frozen columns
        .div_maintb td:nth-child(1),
        .div_maintb td:nth-child(2),
        .div_maintb td:nth-child(3) {
            background: rgb(230,230,230);
            z-index:3;
        }

        .div1 td:nth-child(1),
        .div1 td:nth-child(2) 
        .div1 td:nth-child(3) {
            z-index: 3;
        }
        */
        /* done */

        html {
            font-family: "liberation", monospace;
            font-size: 12;
        }

        /*

        td, th {
            border: 1px solid rgb(150,150,150);
            padding: 5px;
        }

        th {
            background-color: rgb(235,235,235);
            position: sticky;
        }

        */

        td {
            text-align: center;
        }


        tr:nth-child(even) td {
            background-color: rgb(230,240,230);
        }

        tr:nth-child(odd) td {
            background-color: rgb(240,230,230);
        }

        /*
        
        tr>th: first-child,  tr>td: first-child {
            position: sticky;
            left: 0;
            background-color: yellow;
        }
        
        caption {
            padding: 10px;
            font-size: 16px;
            position: sticky;
            text-align: left;
            top: 0px;
            left: 400px;
        }

        .tableContainer {
            height: 200px;
            width: 700px;
            overflow: auto;
            overflow-x: auto;
            border: 2px solid red;
            border-radius: 10px;
            margin: 20px;
            padding: 20px;
            max-width: fit-content;
        }

        .table {
            position: sticky;
            top:0px;
            min-width: max-content;
            padding: 10px;

            border-collapse: collapse;
            border: 2px solid rgb(200,200,200);
            letter-spacing: 0px;
            font-size: 16px;
        }
        */
    </style>

    <script>
        // Globals
        const numRecords = 12;  // The number of records to be displayed
        var arr_pp_grossamount = [];
        var arr_pp_paypalfee = [];
        var arr_pp_netamount = [];
        // end Globals

        var obj = new Object;
        obj.numRecords = numRecords;
        const jsonString = JSON.stringify(obj);
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (this.status === 500) {
            }
            if ((this.status === 200) && (this.readyState === 4)) {
                var m1, m2, m3;
                const response = this.response;
                if (response === '\r\n') {
                    m1 = "Success: failed";
                    m2 = "ErrorMsg: just \\r\\n";
                    m3 = "The SQL query never came down from the server";
                } else {
                    let pdata = JSON.parse(response);
                    myarr = pdata.myarr;
                    let pp_response = [];
                    arr_pp_grossamount = [];
                    arr_pp_paypalfee = [];
                    arr_pp_netamount = [];
                    let pp_paypalfee;
                    let pp_netamount;
                    let pp_grossamount;

                    for (ix=0; ix < myarr.length; ix++) {

                        pp_response.push(myarr[ix]['pp_response']);
                        let pp_grossamount = null;
                        let pp_paypalfee = null;
                        let pp_netamount = null;

                        if (pp_response[ix] != undefined){
                            let rix = JSON.parse(pp_response[ix]);
                            //console.log(rix);
                            //console.log(rix["orderID"]);
                            let sellerBreakdown = rix["purchase_units"][0]["payments"]["captures"][0]["seller_receivable_breakdown"];
                           
                            let pp_grossamount = sellerBreakdown["gross_amount"]["value"];
                            let pp_paypalfee = sellerBreakdown["paypal_fee"]["value"];
                            let pp_netamount = sellerBreakdown["net_amount"]["value"];  

                            //console.log("gross:", pp_grossamount);
                            //console.log("fee:  ",pp_paypalfee);
                            //console.log("net:  ", pp_netamount);

                            arr_pp_grossamount.push(pp_grossamount);
                            arr_pp_paypalfee.push(pp_paypalfee);
                            arr_pp_netamount.push(pp_netamount);
                        } else {
                            arr_pp_grossamount.push(pp_grossamount);
                            arr_pp_paypalfee.push(pp_paypalfee);
                            arr_pp_netamount.push(pp_netamount);
                        }
                    }

                    const len = Math.min(myarr.length,numRecords);
                    // let table1HTML = createTable1Header(len);
                    // let table2HTML = createTable2Header(len);
                    let table3HTML = createTable3Header(len);

                    for (ix=0; ix < len; ix++) {
                        // table1HTML += createTable1Row(myarr[ix]);
                        // table2HTML += createTable2Row(myarr[ix],ix);
                        table3HTML += createTable3Row(myarr[ix],ix);
                    }

                    // table1HTML += createTableFooter();
                    // table2HTML += createTableFooter();
                    table3HTML += createTableFooter();

                    // document.getElementById("table1").innerHTML = table1HTML;
                    // document.getElementById("table2").innerHTML = table2HTML;
                    document.getElementById("table3").innerHTML = table3HTML;

                    // document.getElementById("Button1").innerHTML = "Earlier";
                    // document.getElementById("Button2").innerHTML = "Later";
                    
                }
            }
        }
        xhr.open("POST", "servLastEntries.php", true);
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.send(jsonString);

        function createTable3Header(N) {
            return (
                `<table id="table3" class="table">
                    <thead>
                        <caption>
                            Composite record for the last ` + Number(N) +
                                    ` rows of the pp_tnx table.
                        </caption>
                        <tr>
                            <th>indx</th>
                            <th>call</th>
                            <th>name</th>
                            <th>date</th>
                            <th>years</th>
                            <th>prmry</th>
                            <th>famly</th>
                            <th>rptr</th>
                            <th>dptr</th>
                            <th>sbttl</th>
                            <th>PayPalFee</th>
                            <th>club</th>
                            <th>Total</th>
                            <th>pp_id</th>
                            <th>pp_orderID</th>  
                            <th>status</th>
                            <th>pp_grossamnt</th>
                            <th>pp_paypalfee</th>
                            <th>pp_netamnt</th>
                        </tr>
                    </thead>
                    <tbody>`
            );
        }

        function createTable3Row(rowdata,ix) {

            const ppidhead = rowdata['pp_id'].substring(0,8);
            const pp_grossamount = arr_pp_grossamount[ix];
            const pp_paypalfee = arr_pp_paypalfee[ix];
            const pp_netamount = arr_pp_netamount[ix];

            return (
                `<tr>` + 
                    `<td>` + rowdata['myindex']            + `</td>` +
                    `<td>` + rowdata['callsigns']          + `</td>` +
                    `<td>` + rowdata['FullName']           + `</td>` +
                    `<td>` + rowdata['mydate']             + `</td>` +
                    `<td>` + rowdata['years']              + `</td>` +
                    `<td>` + rowdata["primary"]            + `</td>` +
                    `<td>` + rowdata['family']             + `</td>` +
                    `<td>` + rowdata['repeater']           + `</td>` +
                    `<td>` + rowdata['digipeater']         + `</td>` +
                    `<td>` + rowdata['subtotal']           + `</td>` +
                    `<td>` + rowdata['paypalfee']          + `</td>` +
                    `<td>` + rowdata['clubreceives']       + `</td>` +
                    `<td>` + rowdata['total']              + `</td>` +
                    `<td>` + rowdata['pp_id']              + `</td>` +
                    `<td>` + rowdata['pp_orderID']         + `</td>` +
                    `<td>` + rowdata['transaction_status'] + `</td>` +
                    `<td>` + pp_grossamount                + `</td>` +
                    `<td>` + pp_paypalfee                  + `</td>` +
                    `<td>` + pp_netamount                  + `</td>` +
                `</tr>` );
            }

        function createTableFooter() {
            return "</tbody></table>";
        }
    </script>
</head>

<body>
    <div class="div1">
        <div id="table3" class="div_maintb"></div>
    </div>
    <!--
    <div class="tableContainer">
        <div id="table3"></div>
    </div>
    -->
</body>

</html>