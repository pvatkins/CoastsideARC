<!DOCTYPE html>
<html lang="en">
    
    <head>
        <title>Client DB</title>
        <meta charset="UTF-8">
        <meta name="description" content="Page for Dues Renewal and PayPal interface">
        <meta name="viewport"    content="width=device-width, initial-scale=1.0">
        <link href="css/Layout.css" media="all" rel="stylesheet"  type="text/css">
        <!-- <link href="css/AppFormPaymentDB.css" media="all" rel="stylesheet"  type="text/css"> -->

        <script type="text/javascript">
            /*

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
            let numberChecked = 0; // global variable 
            let Ncallsigns = 0;
            let prorata = 0;
            let monthfactor = 0;
            let fullyear = 0;
            //call callsign_change();
            */
            let newmember_checked = document.getElementById("newchecked");
            let Ncallsigns = 0;

            function initializePage() {
                updateYearBoxes();
            }

            function getProRata() {
                const d = new Date();
                let month = d.getMonth();
                return (12-month);
            }
            
            function getDate() {
                //var timeNow = <?php echo (date("Y-m-d H:i:s")) ?>;
                return "2023-11-18 11:21:55";
            }
            
            function getYear() {
                const timeElapsed = Date.now();
                const today = new Date(timeElapsed); 
                return today.getFullYear();
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

            function getYearsString(){
                var yearbox = document.getElementsByName("yrchecked");
                var ybl = yearbox.length;
                var YearsString = '';
                var TextToAdd = '';
                for (var ix=0; ix<ybl; ix++){
                    if (yearbox[ix].checked) {
                        TextToAdd = yearbox[ix].parentElement.innerText;
                        if (YearsString == ""){
                            YearsString = TextToAdd;
                        } else {
                            YearsString = YearsString.concat( ",", TextToAdd);
                        }   
                    }
                }
                return YearsString;
            }

            function updateYearBoxes() {
                var yearbox = document.getElementsByName("yrChecked");
                var vbl = yearbox.length;
                var ThisYear = parseFloat(getYear());
                for (var ix=0; ix<ybl; ix++) {
                    yearbox[ix].parentElement.innerHTML = Number(ThisYear + ix).toFixed(0);
                }
            }


        document.addEventListener('DOMContentLoaded', function() {
            const form = document.querySelector('form');

            // Do something with the form element.

            form.addEventListener('submit', function(event) {
                event.preventDefault();

                // Format the form data into a JSON object.
                var jsondict = {};
                var MyJSON = "";

                jsondict['FullName']        = 'UNKNOWN';
                jsondict['success']         = true;
                jsondict['errorMessage']    = "none";

                const jsonString = JSON.stringify(jsondict);
                document.getElementById("jsonout").innerHTML = jsonString;
            }
        }

            function amount_change() 
            {
                const paypal_fixedfee   = 0.49;
                const paypal_percentage = 0.0349;
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
                jsondict['primary'] = dollars(primary);
                document.getElementById("primary").innerHTML  = jsondict['primary'];

                /*========================================================================*/

                /* Add $3 for each additional family member in the same application */
                if (Ncallsigns===undefined){Ncallsigns=0;}
                if (Ncallsigns > 1) {
                    family = (Ncallsigns-1) * 3.00 * numberChecked;
                } else {
                    family = 0;
                }
                jsondict['family'] = dollars(family);
                document.getElementById("family").innerHTML = jsondict['family'];

                /*========================================================================*/

                repeater   = parseFloat(document.getElementById("repeater").value);
                jsondict['repeater']        = dollars(repeater);

                /*========================================================================*/

                digipeater = parseFloat(document.getElementById("digipeater").value);
                jsondict['digipeater']      = dollars(digipeater);

                /*========================================================================*/

                subtotal = primary + family + repeater + digipeater;
                jsondict['subtotal']        = dollars(subtotal);
                document.getElementById("subtotal").innerHTML = jsondict['subtotal'];

                /*========================================================================*/
                
                /* Unique */
                checkbox_checked = document.getElementById("ppfeechecked").checked;
                jsondict['pay_paypal'] = (checkbox_checked) ? ('yes')  :('no');

                /*========================================================================*/

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

                jsondict['paypalfee'] = dollars(paypal);
                jsondict['clubreceives'] = dollars(club);
                jsondict['total'] = dollars(total);

                document.getElementById("paypal").innerHTML   = jsondict['paypalfee'];
                document.getElementById("optional").innerHTML = dollars(optional);
                document.getElementById("club").innerHTML     = jsondict['clubreceives'];
                document.getElementById("total").innerHTML    = jsondict['total'];

                /*========================================================================*/

                jsondict['date'] = getDate();
                document.getElementById("NowTime").innerHTML  = jsondict['date']

                /*========================================================================*/

                jsondict['transaction_status'] = 'pending';

                /*========================================================================*/

                document.getElementById("ProRata").innerHTML  = getProRata();

                jsonString = JSON.stringify(jsondict);
                document.getElementById("jsonout").innerHTML = jsonString;
                return;
            }

            function OnSubmit(event) {
                document.querySelector('form').addEventListener('submit', function(event) {
                    event.preventDefault();
                    const jsonString = JSON.stringify(jsonData);

                // Send the JSON data to the server.
                
                    const xhr = new XMLHttpRequest();
                    xhr.open('POST', '/AppFormPaymentDB_Receptor.php');
                    xhr.setRequestHeader('Content-Type', 'application/json');
                    xhr.send(JSONstring);
                
                });
            }
        
        </script>

        <style>
            /* The container */
            .yrcontainer {
                display: block;
                position: relative;
                padding-left: 35px;
                margin-bottom: 12px;
                cursor: pointer;
                font-size: 22px;
                -webkit-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                user-select: none;
            }

            /* Hide the browser's default checkbox */
            .yrcontainer input {
                position: absolute;
                opacity: 0;
                cursor: pointer;
                height: 0;
                width: 0;
            }
            
            /* Create a custom checkbox */
            .yrcheckmark {
                position: absolute;
                top: 0;
                left: 0;
                height: 25px;
                width:  25px;
                background-color: #eee;
                border: 1px solid var(--main-text-color);
            }

            /* On mouse-over, add a grey background color */
            .yrcontainer:hover input ~ .yrcheckmark {
                background-color: #ccc;
            }

            /* When the checkbox is checked, add a blue background */
            .yrcontainer input:checked ~ .yrcheckmark {
                background-color: #2196F3;
            }


            /* Create the checkmark/indicator (hidden when not checked) */
            .yrcheckmark:after {
                content: "";
                position: absolute;
                display: none;
            }

            /* Show the checkmark when checked */
            .yrcontainer input:checked ~ .yrcheckmark:after {
                display: block;
            }

            /* Style the checkmark/indicator */
            .yrcontainer .yrcheckmark:after {
                left: 9px;
                top: 5px;
                width: 5px;
                height: 10px;
                border: solid white;
                border-width: 0 3px 3px 0;
                -webkit-transform: rotate(45deg);
                -ms-transform: rotate(45deg);
                transform: rotate(45deg);
            }

            .wrapper {
                display: grid;
                gap: 10px;
                padding: 20px;
                width: 750px;
            }

            .header, .menu, .submit, .details, .footer, .jsonout, .rdystat, .response, .respcode  {
                border: 2px solid red;
                text-align: center;  
            }

            .header {
                grid-column: 1/4;
                grid-row: 1/2;
            } 

            .menu {
                grid-column: 1/2;
                grid-row: 2/3;
                text-align: left;
            }

            .details {
                grid-column: 2/4;
                grid-row: 2/3;
                text-align: left; 
            }

            .submit {
                grid-column: 2/3;
                grid-row: 3/4;
            }

            .jsonout{
                grid-column: 1/4;
                grid-row: 4/5;
            }

            .rdystat{
                grid-column: 1/2;
                grid-row: 5/6;  
            }

            .response {
                grid-column: 2/3;
                grid-row: 5/6; 
            }

            .respcode {
                grid-column: 3/4;
                grid-row: 5/6;  
            }

            .footer {
                grid-column: 1/4;
                grid-row: 6/7;
            }

            .spacer {
                width: 1.75in;
                margin: 0.75in;
            }

            .h3 {
                align: center;
            }
        </style>

    </head>

    <body class="wrapper" onLoad = "initializePage()"> 

        <div class = "header">
            <?php include '../includes/CommonHeader.php' ?>
            <img class="center" src="../images/PayPalOptions_bnr.gif" height="60" alt="PayPalOptions">
        </div> <!-- header ends -->

        <div class="menu">
            <?php include '../includes/CommonMenu.php' ?>
        </div> <!-- menu End -->

        <div class="details">
            <h3>Dues Renewal form for the Coastside Amateur Radio Club</h3>
            <p style="align:left">
                Currently, the basic membership fee is $20.00/year for the primary 
                membership in a household. Additional members in a household 
                are $3.00/year each.</p>

            <p style="align-left"> 
                For Associate (unlicensed) members, enter 
                the first initial and last name of the Associate as a simple 
                text string (e.g. J_SMITH) with no space.</p>
                
            <p style="align-left"> 
                If you are a new member, your membership fee for the current year 
                will be pro-rated. The month you are joining will be determined 
                from the form submission date. Please check the box below if you 
                are a new member.</p>

            <table id="yeartab">
                <tr>
                    <td class="spacer"></td>
                    <td>
                        <label class="yrcontainer">2024
                            <input  type="checkbox" name="yrchecked" onclick="years_change()">
                            <span class="yrcheckmark"></span>
                        </label>
                    </td>
                    <td class="spacer"></td>
                    <td>
                        <label class="yrcontainer">2025
                            <input  type="checkbox" name="yrchecked" onclick="years_change()">
                            <span class="yrcheckmark"></span>
                        </label>
                    </td>
                </tr>
                <tr>
                    <td class="spacer"></td>
                    <td>
                        <label class="yrcontainer">2026
                            <input  type="checkbox" name="yrchecked" onclick="years_change()">
                            <span class="yrcheckmark"></span>
                        </label>
                    </td>
                    <td class="spacer"></td>
                    <td>
                        <label class="yrcontainer">2027
                            <input  type="checkbox" name="yrchecked" onclick="years_change()">
                            <span class="yrcheckmark"></span>
                        </label>
                    </td>
                </tr>

                <tr>
                <td class = "spacer"><td>
                <td>
                    <label for="checked">New Member?</label></td>
                    <td>
                        <label class="yrcontainer">
                            <input  type="checkbox"
                                    name="newmember"
                                    id = "newmember"
                                    width = "150%"
                                    height = "150%"
                                    value = "on";
                                    oninput="amount_change()">
                            <span class="yrcheckmark"></span>
                        </label>
                    </td>
                </tr>

                <!-- Years Count-->
                <tr>
                    <td><div><p id ="numChecked"></p></div></td>
                </tr>

                <!-- For the following callsigns -->
                <tr>
                    <td><label for="callsigns">Callsigns (Primary & Family): </label>
                    <td>
                        <input type="text" 
                            name="callsigns" 
                            id="callsigns" 
                            style="width: 300px; font-size: 12pt; text-transform: uppercase;"
                            value = ""
                            oninput="callsign_change()">
                    </td>
                </tr>

                <!-- Now Time -->
                <tr>
                    <td><div><p id ="NowTime"></p></div></td>
                    <td><label for="NowTime">Server Time:</label></td>

                </tr>

                <!-- ProRata -->
                <tr>
                    <td><label for="ProRata">Pro Rata Factor: </label></td>
                    <td><div><p id="ProRata"></p></div></td>
                </tr>

                <!-- Primary -->
                <tr> 
                    <td><label for="primary">Primary:</label></td>
                    <td><div><p id ="primary"></p></div></td>
                </tr>

                <!-- Family -->
                <tr>
                    <td><label for="family">Family:</label></td>
                    <td><div><p id="family"></p></div></td>
                </tr>
            
                <!-- Repeater Fund Donation -->
                <tr>
                    <td><label for="repeater">Repeater Fund: </label></td>
                    <td>
                        <input type="text" 
                            name="repeater" 
                            id="repeater" 
                            checked
                            style="width: 45px; font-size: 12pt;"
                            value = "0.00";
                            oninput="repeater_change()">
                    </td>
                </tr>

                <!-- Digipeater Fund Donation -->
                <tr>
                    <td><label for="digipeater">Digipeater/APRS Fund: </label>
                    <td>
                        <input type="text" 
                            name="digipeater" 
                            id="digipeater" 
                            checked
                            style="width: 45px; font-size: 12pt;"
                            value = "0.00";
                            oninput="digipeater_change()">
                    </td>
                </tr>     

                <!-- Subtotal -->
                <tr>
                    <td><label for="subtotal">Subtotal:</label></td>
                    <td><div><p id="subtotal"></p></div></td>
                </tr>

                <!-- Paypal fee checkbox -->
            
                <tr>
                    <td><label for="checked">Include paypal fee? :</label></td>
                    <td>
                        <label class="yrcontainer">
                            <input  type="checkbox"
                                    name="checked"
                                    id = "ppfeechecked"
                                    width = "150%"
                                    height = "150%"
                                    value = "on";
                                    oninput="amount_change()">
                            <span class="yrcheckmark"></span>
                        </label>
                    </td>
                </tr>
            

                <!-- Optional -->
                <tr>
                    <td><label for="optional">Optional Paypal Fee:</label></td>
                    <td><div><p id="optional"></p></div></td>
                </tr>

                <!-- Paypal Receives -->
                <tr>
                    <td><label for="paypal">Paypal Receives:</label></td>
                    <td><div><p id="paypal"></p></div></td>
                </tr>

                <!-- Club Receives -->
                <tr>
                    <td><label for="club">Club Receives:</label></td>
                    <td><div><p id="club"></p></div></td>
                </tr>

                <!-- Total -->
                <tr>
                    <td><label for="total">Total Charges:</label></td>
                    <td><div><p id="total"></p></div></td>
                </tr>
            </table>
        </div> <!-- details End -->

        <div class="submit">
            Submit Goes Here<br>
            <button type="submit">Submit</button>
        </div>

        <div class="jsonout">
            JsonOut goes here<br>
            <div id="jsonout"></div>
        </div>

        <div class="rdystat">
            rdystat Goes Here
        </div>

        <div class="response">
            response Goes Here
        </div>

        <div class="respcode">
            respcode Goes Here 
        </div>

        <div class="footer">
            <?php include '../includes/CommonFooter.php'; ?>
        </div> <!-- bottom end -->
    </body>
</html>


