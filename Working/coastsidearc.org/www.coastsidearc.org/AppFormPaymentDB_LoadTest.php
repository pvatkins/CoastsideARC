
let primary = 0;
let family = 0;
let subtotal = 0;
let repeater = 0;
let digipeater = 0;
let callsign_text = '';
let paypal = 0;
let club = 0;
let optional = 0;
let total = 0;
let checkbox_checked = false;
let newmember_checked = document.getElementById("newchecked");
let cbstate = "";
let numberChecked = 0; /* global variable */
let Ncallsigns = 0;
let prorata = 0;
let monthfactor = 0;
let fullyear = 0;
let jon_cred = false;
call callsign_change();

console.log("jon_cred = " & jon_cred);

function getProRata() {
    const d = new Date();
    let month = d.getMonth();
    return (12-month);
}

function getDate() {
    const timeElapsed = Date.now();
    const today = new Date(timeElapsed);
    return today.toUTCString();
}

function dollars(amount) {
    var myStr = "$" + Number(amount).toFixed(2).padStart(7," ");
    return myStr;
}
 
function dolltxt(amount) {
    var myStr = Number(amount).toFixed(2).padStart(7," ");
    return myStr;
}

function roundoff(mynum,places) {
    const x = Math.pow(10,places)
    return Math.round(mynum * x)/x;
}

function newmember_change() {
    newmember_checked = document.getElementById("newchecked").checked;
    amount_change();
    return;
}

function callsign_change(){
    /* using regular expressions, replace  each instance ofconsecutive 
    whitespace and commas with a single space and eliminate 
    leading/trailing spaces  */
    callsign_text = callsigns.value.replace(/[,\s]+/g, " ").trim().toUpperCase();
    /* count the number of callsigns */
    Ncallsigns = callsign_text.split(" ").length;
    if (Ncallsigns===undefined){Ncallsigns=0;}
    amount_change();
    return;
}

function repeater_change() {
    repeater = document.getElementById("repeater").value;
    amount_change();
    return;
}

function digipeater_change() {
    digipeater = document.getElementById("digipeater").value;
    amount_change();
    return;   
}

function years_change(){
    numberChecked = countYears();
    if (numberChecked > 0) {
        document.getElementById("numChecked").innerHTML= "Number of Years checked = " +
            roundoff(numberChecked,0);
    } else {
        document.getElementById("numChecked").innerHTML= "At least one Year must be selected"; 
    }
    amount_change();
    return;
}

function countYears(){
    var yearbox = document.getElementsByName("yrchecked");
    var ybl = yearbox.length;
    var numberChecked = 0;
    
    for (var ix=0; ix<ybl; ix++) {
        if (yearbox[ix].checked)
            numberChecked++;
    }
    return numberChecked;
}

function amount_change() 
{
    /* We will assume Case 0 for testing purposes, realizing that the actual rates
    may go up or down when PayPal agreement & account for the club is finalized */
    const fee_scale = 0;
    const table_fixedfee =   [0.4900, 0.5000, 0.4500, 0.4500];
    const table_percentage = [0.0349, 0.0300, 0.0289, 0.0199];
    const paypal_fixedfee   = table_fixedfee[fee_scale];
    const paypal_percentage = table_percentage[fee_scale];
    const yearly_dues = 20.00;
    var yearbox = document.getElementsByName("yrchecked");

    numberChecked = countYears();
    monthfactor = Number(document.getElementById("ProRata").innerHTML);
    if (yearbox[0].checked && newmember_checked) {
        fullyear = (numberChecked-1);
        prorata = monthfactor/12.0;
    } else {
        fullyear = numberChecked;
        prorata = 0.0;
    }
    primary = (fullyear + prorata) * yearly_dues;

    /* Add $3 for each additional family member in the same application */
    if (Ncallsigns===undefined){Ncallsigns=0;}
    if (Ncallsigns > 1) {
        family = (Ncallsigns-1) * 3.00 * numberChecked;
    } else {
        family = 0;
    }

    repeater   = parseFloat(document.getElementById("repeater").value);
    digipeater = parseFloat(document.getElementById("digipeater").value);

    subtotal = primary + family + repeater + digipeater;
    
    /* Unique */
    checkbox_checked = document.getElementById("ppfeechecked").checked;

    /* Calculate how the funds are shared between the club and PayPal */
    if (checkbox_checked) {
        /* in this case, the payor pays for the transaction */
        club     = roundoff(subtotal,2);
        total    = roundoff((club + paypal_fixedfee)/(1.0-paypal_percentage),2);
        optional = roundoff(total - club,2);
        paypal   = roundoff(total - club,2);
        cbstate  = "Checked";
    } else {
        /* In this case, the club pays for the transaction */
        paypal   = roundoff(subtotal * paypal_percentage + paypal_fixedfee,2);
        club     = roundoff(subtotal - paypal,2);
        total    = roundoff(paypal + club,2);
        optional = roundoff(0.00,2);
        cbstate  = "UnChecked";
    }
    document.getElementById("primary").innerHTML  = dollars(primary);
    document.getElementById("family").innerHTML   = dollars(family);
    document.getElementById("subtotal").innerHTML = dollars(subtotal);
    document.getElementById("optional").innerHTML = dollars(optional);
    document.getElementById("paypal").innerHTML   = dollars(paypal);
    document.getElementById("club").innerHTML     = dollars(club);
    document.getElementById("total").innerHTML    = dollars(total);
    document.getElementById("NowTime").innerHTML  = getDate();
    document.getElementById("ProRata").innerHTML  = getProRata();
    return;
}

function prepareReceipt() {
    MystrDate  = getDate();
    Element_01 = MystrDate;
    Element_02 = callsign_text;
    Element_03 = dollars(primary);
    Element_04 = dollars(family);
    Element_05 = dollars(repeater);
    Element_06 = dollars(digipeater);
    Element_07 = dollars(subtotal);
    Element_08 = cbstate;
    Element_09 = dollars(paypal);
    Element_10 = dollars(club);
    Element_11 = dollars(total);

    const obj = { 
        date:         MystrDate, 
        callsigns:    callsign_text, 
        primary:      dollars(primary), 
        family:       dollars(family),
        repeater:     dollars(repeater),
        digipeater:   dollars(digipeater),
        subtotal:     dollars(subtotal),
        checkbox:     cbstate,
        paypalfee:    dollars(paypal),
        clubreceives: dollars(club),
        total:        dollars(total)}

    const myJSON = JSON.stringify(obj);
    const myelement = document.getElementById('my-detail-container');
    myelement.innerHTML = "";
    myelement.innerHTML = myJSON;
    return;
}

function onSubmit(event) {
    // initPayPalButton(dollars(total));
    let tA = "P1="  + dolltxt(primary);
    let tB = "&P2=" + dolltxt(family);
    let tC = "&P3=" + dolltxt(repeater);
    let tD = "&P4=" + dolltxt(digipeater);
    let tE = "&P5=" + dolltxt(paypal);
    let tF = "&P6=" + callsign_text.split(" ")[0];



    // let mm = "https://coastsidearc.org:5555/?" + tA + tB + tC + tD + tE + tF;
    let mm = "https://coastsidearc.org/www.coastsidearc.org/PaymentDBWedge.php/?" + tA + tB + tC + tD + tE + tF;

    mm = mm.replaceAll(/\s/g, ""); // remove all space characters from mm
    // prepareReceipt();
    window.location.replace(mm);              
}