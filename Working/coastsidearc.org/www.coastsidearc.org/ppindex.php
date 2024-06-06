<!DOCTYPE html>
<html lang = "en">
    <head>
        <title>Paypal Integration</title>

        <meta name="author" content="Brad Traversy">
        <!--See: https://github.com/bradtraversy/node_paypal_sdk_sample/blob/master/app.js -->
        <!-- See also: https://www.section.io/engineering-education/nodejs-paypal-checkout/ -->

        <!-- cache directives suggested by Jon Lancelle 9/14/2023 -->
        <!--
        <meta http-equiv="refresh" content="0" />
        -->

        <!--
        <meta http-equiv="cache-control" content="no-cache, must-revalidate, post-check=0, pre-check=0" />
        <meta http-equiv="cache-control" content="max-age=0" />
        <meta http-equiv="expires" content="0" />
        <meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
        <meta http-equiv="pragma" content="no-cache" />
        -->
        <!-- END cache directives suggestions-->

        <head>
            <title> PayPal Node App</title>
            <meta charset = "UTF-8">
            <meta name = "viewport"
                  content = "width=device-width, initial-scale=1.0">
            <meta http-equiv = "X-UA-Compatible"
                  content = "ie=edge">

            <!-- The little php code in the links below force the css sheets to reload each time -->
            <link href="css/Layout.css?v1=<?php echo time();?>"       media="all" rel="stylesheet"  type="text/css">
            <link href="css/AppFormQuick.css?v2=<?php echo time();?>" media="all" rel="stylesheet"  type="text/css">
            <!-- Email Javascript code fragment -->
            
            <!-- This styling is for the custom checkbox rebndering -->
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

        <body>
        <!-- The page header --> 
        <table width=723px>
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
                    <fieldset style="background: inherit;  width: 100%"; >
                        <legend style = "align-left">Paypal Details</legend>
                        <div id = "fieldShield">
                            <h3>Dues Renewal form for the Coastside Amateur Radio Club</h3>
                            <p style="align:left">
                                Currently, the basic membership fee is $20.00/year for the primary 
                                membership in a household. Additional members in a household 
                                are $3.00/year each.

                            <p style="align-left"> 
                                For Associate (unlicensed) members, enter 
                                the first initial and last name of the Associate as a simple 
                                text string (e.g. J_SMITH) with no space.
                                
                            <p style="align-left"> 
                                If you are a new member, your membership fee for the current year 
                                will be pro-rated. The month you are joining will be determined 
                                from the form submission date. Please check the box below if you 
                                are a new member.

                            
                            <p style="align-left"> 
                                <label for = "NewMember">NewMember?
                                <input  type="checkbox" 
                                        id="newchecked"
                                        onclick="newmember_change()">
                                </label>

                            <p style="align-left">   
                                Paypal charges a transaction fee of 3.49% plus a base of 49¢ 
                                for the use of their service. This form calculates that fee and 
                                allows members to offset this fee when they are paying their dues.
                                For each transaction, the form calculates the amount estimated to
                                be received by the club and the amount estimated to be received
                                by PayPal, as well as the total amount of the transaction.</p>

                            <p style="align-left">
                                Please Check Below to select which year(s) you wish to renew for. 
                                Each checked box adds one annual fee when they are paying their dues.</p>

                            <table id="formtable">
                                <tr>
                                    <table id="yeartab">
                                        <tr>
                                            <td><var class="spacer"></td></td>
                                            <td><var class="spacer"></td></td>
                                            <td>
                                                <label class="yrcontainer">2023
                                                    <input  type="checkbox"
                                                            name="yrchecked" 
                                                            onclick="years_change()">
                                                    <span class="yrcheckmark"></span>
                                                </label>
                                            </td>
                                            <td><var class="spacer"></td></td>
                                            <td>
                                                <label class="yrcontainer">2024
                                                    <input  type="checkbox" checked
                                                            name="yrchecked" 
                                                            onclick="years_change()">
                                                    <span class="yrcheckmark"></span>
                                                </label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><var class="spacer"></td></td>
                                            <td><var class="spacer"></td></td>
                                            <td>
                                                <label class="yrcontainer">2025
                                                <input  type="checkbox" checked
                                                            name="yrchecked"
                                                            onclick="years_change()">
                                                    <span class="yrcheckmark"></span>
                                                </label>
                                            </td>
                                            <td><var class="spacer"></td></td>
                                            <td>
                                                <label class="yrcontainer">2026
                                                    <input  type="checkbox" 
                                                            name="yrchecked" 
                                                            onclick="years_change()">
                                                    <span class="yrcheckmark"></span>
                                                </label>
                                            </td>
                                        <tr>
                                    </table>
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
                                            value = "MEMBER1  MEMBER2"
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
                                    <td><label for="repeater">Repeater Fund: </label>
                                    <td>
                                        <input type="text" 
                                            name="repeater" 
                                            id="repeater" 
                                            checked
                                            style="width: 45px; font-size: 12pt;"
                                            value = "47.95";
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
                                            value = "24.70";
                                            oninput="digipeater_change()">
                                    </td>
                                </tr>     

                                <!-- Subtotal Donation -->
                                <tr>
                                    <td><label for="subtotal">Subtotal:</label></td>
                                    <td><div><p id="subtotal"></p></div></td>
                                </tr>

                                <!-- Paypal fee checkbox -->
                                <tr>
                                    <td><label for="checked">Include paypal fee? :</label></td>
                                    <td>
                                        <input  type="checkbox"
                                                name="checked" checked
                                                id = "checked"
                                                width = "150%"
                                                height = "150%"
                                                value = "on";
                                                oninput="amount_change()">
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
                              
                                <!-- MyOwn Temporary Container -->
                                <tr>
                                    <td colspan="2">
                                        <div id="my-detail-container" 
                                            style="margin-left: 20%; 
                                                    width:60%; 
                                                    text-align: center;" >
                                        </div>
                                    </td>
                                </tr>

                                <!-- The PayPal Container -->                                 
                                <tr>
                                    <td colspan="2">
                                        <div id="paypal-button-container" style="margin-left: 35%; width:30%;" >
                                            <div style="text-align: center;">
                                                <div id="smart-button-container" ></div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </div>
                    </fieldset>

                            <!-- The footer -->
                            <tr>
                                <td colspan="2">
                                    <div class="bottom">
                                        <?php include '../includes/CommonFooter.php'; ?>
                                    </div> <!-- bottom end -->
                                </td>
                            </tr>
                        </table>
                </td>
            </tr>
        </table>

        <script>
            my_client_id = "AeCsscwxPGlGu-9UtOzb7UDOPdIWe-wn3zybK9Zc5f7nsCH0R0es93zxDi97s1dDGYa93S6zWJU81G5-" ;
            src="https://www.paypal.com/sdk/js?client-id=" & my_client_id & "components=buttons"
        </script>
        
        <h1>CARC Dues Renewal</h1>
        <script src="https://www.paypal.com/sdk/js?client-id="AeCsscwxPGlGu-9UtOzb7UDOPdIWe-wn3zybK9Zc5f7nsCH0R0es93zxDi97s1dDGYa93S6zWJU81G5-"&components=buttons"></script>
        <h2><label for="ppamt">Buy For <span id="ppamt"></span></label></h2>

        <form action = "/pay" method="post">
            <input type = "submit" value="Buy">
        </form>

    </body>

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
        let newmember_checked = document.getElementById("newchecked").checked;
        let cbstate = "";
        let numberChecked = 0; /* global variable */
        let Ncallsigns = 0;
        let prorata = 0;
        let monthfactor = 0;
        let fullyear = 0;
        let jon_cred = false;
        callsign_change();

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
            checkbox_checked = document.getElementById("checked").checked;

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
            document.getElementById("ppamt").innerHTML    = dollars(total);
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
    </script>
<html>