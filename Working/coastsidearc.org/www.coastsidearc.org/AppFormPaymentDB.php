<!DOCTYPE html>
<html lang="en">
    
    <head>
        <title>AppFormPaymentDB</title>
        <meta charset="UTF-8">
        <meta name="description" content="Page for Dues Renewal and PayPal interface">
        <meta name="viewport"    content="width=device-width, initial-scale=1.0">
        <link href="css/Layout.css"           media="all" rel="stylesheet"  type="text/css">
        <link href="css/AppFormPaymentDB.css" media="all" rel="stylesheet"  type="text/css">

        <?php
            /*
            function send($con,$message) {
                // fwrite($script,$message . ';\n' );
                $result = mysqli_query($con,$message . ';');
                return $result;
            }

            function connectDB() {
                $servername = 'mysql.pauatk5.dreamhosters.com';
                $username   = 'carcuser';
                $password   = 'gobbledegook';  
                $dbname     = 'carcmbrlst_20231017';
                $conn =  $conn = new mysqli($servername, $username, $password, $dbname);
                if $conn->connect_error {
                    return $conn;
                } else {
                    return False;
                }
            }

            // Create the table paymenthistory
            function CreateHistoryDB() {
                send($conn, 'USE carcmbrlst_20231017');
                send($conn, 'DROP TABLE IF EXISTS paymenthistory');
                cmd = "".concatenate(
                    'CREATE TABLE IF NOT EXISTS paymenthistory (',
                        'record_id INT,',
                        'date VARCHAR(50),',
                        'years VARCHAR(50),',
                        'callsigns VARCHAR(50),',
                        'primary VARCHAR(12),',
                        'family VARCHAR(12),',
                        'repeater VARCHAR(12),',
                        'digipeater VARCHAR(12),',
                        'subtotal VARCHAR(12),',
                        'paypalfee VARCHAR(12),',
                        'clubreceives VARCHAR(12),',
                        'Total VARCHAR(12),',
                        'DonateChecked VARCHAR(6),',
                        'Newchecked VARCHAR(6))')
                send($conn, cmd);
            }
            */
        ?>

        <!-- <script src="https://code.jquery.com/jquery-3.7.0.js"></script> -->
        
        <script type="text/javascript">

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
            

        function initializePage() {
            updateYearBoxes();
        }

        function getProRata() {
            const d = new Date();
            let month = d.getMonth();
            return (12-month);
        }

        // form.addEventListener("submit", onSubmit);

        function getDate() {
            const timeElapsed = Date.now();
            const today = new Date(timeElapsed);
            return today.toUTCString();
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
        function OnSubmit(event) {
            document.querySelector('form').addEventListener('submit', function(event) {
                event.preventDefault();
            
            const JSONstring = prepareReceipt();
            // Format the form data into a JSON object.
            //const formData = new FormData(this);
            //const jsonData = {};
            //for (const [name, value] of formData.entries()) {
            //    jsonData[name] = value;
            // }
            // const jsonString = JSON.stringify(jsonData);

            // Send the JSON data to the server.
            const xhr = new XMLHttpRequest();
            xhr.open('POST', '/AppFormPaymentDB_Receptor.php');
            xhr.setRequestHeader('Content-Type', 'application/json');
            xhr.send(JSONstring);
            });
        }
        
        function prepareReceipt() {
            var jsondict = {};
            var MyJSON;
            jsondict['date']            = getDate();
            jsondict['years']           = getYearsString();
            jsondict['callsigns']       = callsign_text;
            jsondict['primary']         = dollars(primary);
            jsondict['family']          = dollars(family);
            jsondict['repeater']        = dollars(repeater);
            jsondict['digipeater']      = dollars(digipeater);
            jsondict['subtotal']        = dollars(subtotal);
            jsondict['checkbox']        = cbstate;
            jsondict['newchecked']      = newmember_checked;
            jsondict['paypalfee']       = dollars(paypal);
            jsondict['clubreceives']    = dollars(club);
            jsondict['total']           = dollars(total);
            MyJSON = JSON.stringify(jsondict);
            document.getElementById("my-detail-container").innerHTML = MyJSON;
            return MyJSON;
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

            .spacer {
                width: 1.75in;
                margin: 0.75in;
            }

            .h3 {
                align: center;
            }
        </style>

    </head>

    <body onLoad = "initializePage()">


        <table style = "width: 723px;">
            <!-- The page header --> 
            <tr>
                <td colspan = 2>
                    <div class = "header">
                        <?php include '../includes/CommonHeader.php' ?>
                        <img class="center" src="../images/PayPalOptions_bnr.gif" height="60" alt="PayPalOptions">
                    </div> <!-- header ends -->
                </td>
            </tr>

            <tr>
                <td colspan=2>
                    <form action = "/AppFormPaymentDB_Receptor.php" method="GET">
                        <fieldset style="background: inherit;  width: 100%"; >
                            <legend style = "align-left">Paypal Details</legend>
                            <div id = "fieldShield">
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

                                <table>
                                    <tr>
                                        <table id="yeartab">
                                            <tr>
                                                <td><var class="spacer"></td>
                                                <td><var class="spacer"></td>
                                                <td>
                                                    <label class="yrcontainer">2024
                                                        <input  type="checkbox"
                                                                name="yrchecked" 
                                                                onclick="years_change()">
                                                        <span class="yrcheckmark"></span>
                                                    </label>
                                                </td>
                                                <td><var class="spacer"></td>
                                                <td>
                                                    <label class="yrcontainer">2025
                                                        <input  type="checkbox"
                                                                name="yrchecked" 
                                                                onclick="years_change()">
                                                        <span class="yrcheckmark"></span>
                                                    </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><var class="spacer"></td>
                                                <td><var class="spacer"></td>
                                                <td>
                                                    <label class="yrcontainer">2026
                                                    <input      type="checkbox"
                                                                name="yrchecked"
                                                                onclick="years_change()">
                                                        <span class="yrcheckmark"></span>
                                                    </label>
                                                </td>
                                                <td><var class="spacer"></td>
                                                <td>
                                                    <label class="yrcontainer">2027
                                                        <input  type="checkbox" 
                                                                name="yrchecked" 
                                                                onclick="years_change()">
                                                        <span class="yrcheckmark"></span>
                                                    </label>
                                                </td>
                                            <tr>
                                        </table>
                                    </tr>

                                    <!-- New Member?-->
                                    <tr>
                                        <td><label for="checked">New Member?</label></td>
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
                                        <td><label for="NowTime">Server Time:</label></td>
                                        <td><div><p id ="NowTime"></p></div></td>
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


                                    <!-- Submit Button -->
                                    <tr>
                                        <td colspan="2">
                                            <button type="submit" id = "gonow" value="Pay Now"></button>
                                        </td>
                                    </tr>



                                    <!-- MyOwn Temporary Container -->
                                    <tr>
                                        <td colspan="2">
                                            <div id="my-detail-container" 
                                                 style="margin-left: 20%; 
                                                        width:60%; 
                                                        text-align: center;">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </fieldset>
                    </form>
                </td>
            </tr>

            <!-- The page footer -->
            <tr>
                <td colspan="2">
                    <div class="bottom">
                        <?php include '../includes/CommonFooter.php'; ?>
                    </div> <!-- bottom end -->
                </td>
            </tr>
        </table>
    </body>
</html>


