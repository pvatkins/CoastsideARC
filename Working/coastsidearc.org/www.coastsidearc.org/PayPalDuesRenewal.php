<!DOCTYPE html>
<html lang="en">
    
    <head>
        <title>CARC Dues Renewal</title>
        <meta charset="UTF-8">
        <meta name="description" content="PayPal Interface">
        <meta name="viewport"    content="width=device-width, initial-scale=1.0">
        <link href="css/Layout.css" media="all" rel="stylesheet"  type="text/css">
        <link href="css/PayPalDuesRenewal.css" media="all" rel="stylesheet"  type="text/css">
       
        <script>
            // Global Variables
            var jsondict = {};
            var newmember_checked = false;
            var goodToGo = true;
            // after the submit button pressed
            const receptorUrl    = "AppFormDB_Receptor.php";
            const fullNameUrl    = "serv_getFullName.php";
            const numRecords = 7;  // The number of records to be displayed
            // End global Variables

            //===========================================================================

            function yearsChange(){
                var yeartext = '';
                var yearbox = document.getElementsByName("yrchecked");
                var ybl = yearbox.length;
                var numberChecked = 0;
                for (var ix=0; ix<ybl; ix++) {
                    if (yearbox[ix].checked) {
                        numberChecked++;
                        yeartext = yeartext.concat(" ", yearbox[ix].parentElement.innerText);
                    }
                }
                jsondict['years'] = yeartext.trim();

                if (numberChecked === 0) {
                    document.getElementById("numChecked").innerHTML= "At least one Year must be selected"; 
                } else {
                    document.getElementById("numChecked").innerHTML= "Number of Years checked = " +
                        roundoff(numberChecked,0);
                }
                amount_change();
                return;
            }

            //===========================================================================

            function newMemberChange() {
                newmember_checked = document.getElementById("newmember").checked;
                amount_change();
                return;
            }

            //===========================================================================
            
            function callsignChange(){
                /* using regular expressions, replace  each instance ofconsecutive 
                   whitespace and commas with a single space and eliminate 
                   leading/trailing spaces  
                */
                const callsignText = callsigns.value.replace(/[,\s]+/g, " ").trim().toUpperCase();
                jsondict['callsigns'] = callsignText;
                const arrCallsigns = callsignText.split(' ');
                /* count the number of callsigns */
                jsondict["ncallsigns"] = arrCallsigns.length;
                jsondict["callsign"] = arrCallsigns[0];
                amount_change();
                return;
            }

            //===========================================================================

            function getDate() {

                // num2 takes an integer as input and
                // returns a 2-digit string
                function num2(x) {
                    return ("0"+ Number(x)).slice(-2);
                }

                var currentdate = new Date(); 
                var datetime = 
                    currentdate.getFullYear()        + "-" +
                    num2((currentdate.getMonth()+1)) + "-" +
                    num2(currentdate.getDate())      +  " "+                   
                    num2(currentdate.getHours())     + ":" +
                    num2(currentdate.getMinutes())   + ":" +
                    num2(currentdate.getSeconds());
                return datetime;
            }

            //===========================================================================

            function getProRata() {
                var d = new Date();
                var month = d.getMonth();
                return (12-month);
            }

            //===========================================================================

            function repeater_change() {
                repeater = document.getElementById("repeater").value;
                jsondict['repeater'] = repeater;
                amount_change();
                return;
            }

            //===========================================================================

            function digipeater_change() {
                digipeater = document.getElementById("digipeater").value;
                jsondict['digipeater'] = digipeater;
                amount_change();
                return;   
            }

            //===========================================================================

            //function initializePage() {
            //   updateYearBoxes();
            //}

            //===========================================================================

            function dollars(amount) {
                var myStr = "$" + Number(amount).toFixed(2).padStart(7," ");
                return myStr;
            }

            //===========================================================================
                 
            function getYear() {
                var timeElapsed = Date.now();
                var today = new Date(timeElapsed); 
                return today.getFullYear();
            }

            //===========================================================================

            function dolltxt(amount) {
                var myStr = Number(amount).toFixed(2).padStart(7," ");
                return myStr;
            }

            //===========================================================================

            function roundoff(mynum,places) {
                var x = Math.pow(10,places)
                return Math.round(mynum * x)/x;
            }

            //===========================================================================

            function countYears() {
                var yearbox = document.getElementsByName("yrchecked");
                var ybl = yearbox.length;
                var numYears = 0;
                for (var ix=0; ix<ybl; ix++){
                    if (yearbox[ix].checked) {
                        numYears++;
                    }
                }
                return numYears;
            }

            //===========================================================================

            function getYearsString(){
                var yearbox = document.getElementsByName("yrchecked");
                var yearArr = Array.from(yearbox);
                var ybl = yearbox.length;
                var yearsString = '';
                for (var ix=0; ix<ybl; ix++){
                    if (yearbox[ix].checked) {
                        yearsString = yearsString.concat( " ", yearbox[ix].parentElement.innerText);
                    }
                }
                yearsString.trim();
                return yearsString;
            }

            //===========================================================================            

            function updateYearBoxes() {
                var yearbox = document.getElementsByName("yrChecked");
                var vbl = yearbox.length;
                var ThisYear = parseFloat(getYear());
                for (var ix=0; ix<ybl; ix++) {
                    yearbox[ix].parentElement.innerHTML = Number(ThisYear + ix).toFixed(0);
                }
            }

            //===========================================================================            
            
            function amount_change() 
            {
                var paypal_fixedfee   = 0.49;
                var paypal_percentage = 0.0349;
                var yearly_dues       = 20.00;

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

                jsondict['newmember'] = (newmember_checked) ? ('yes') : ('no');
                primary = (fullyear + prorata) * yearly_dues;
                jsondict['primary'] = dollars(primary);
                document.getElementById("primary").innerHTML  = jsondict['primary'];

                //=======================================================================

                /* Add $3 for each additional family member in the same application */
                const Ncallsigns = jsondict['ncallsigns'];
                let family = 0;
                if (Ncallsigns > 1) {
                    family = (Ncallsigns-1) * 3.00 * numberChecked;
                }
                jsondict['family'] = dollars(family);
                document.getElementById("family").innerHTML = jsondict['family'];

                //=======================================================================

                repeater   = parseFloat(document.getElementById("repeater").value);
                jsondict['repeater']        = dollars(repeater);

                //=======================================================================

                digipeater = parseFloat(document.getElementById("digipeater").value);
                jsondict['digipeater']      = dollars(digipeater);

                //===========================================================================

                subtotal = primary + family + repeater + digipeater;
                jsondict['subtotal']        = dollars(subtotal);
                document.getElementById("subtotal").innerHTML = jsondict['subtotal'];

                //===========================================================================

                /* Unique */
                checkbox_checked = document.getElementById("ppfeechecked").checked;
                jsondict['pay_paypal'] = (checkbox_checked) ? ('yes')  :('no');

                //===========================================================================

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

                //===========================================================================

                jsondict['paypalfee'] = dollars(paypal);
                jsondict['clubreceives'] = dollars(club);
                jsondict['total'] = dollars(total);
                jsondict['pp_total']= total;  // for passage to PayPal code

                document.getElementById("paypal").innerHTML   = jsondict['paypalfee'];
                document.getElementById("optional").innerHTML = dollars(optional);
                document.getElementById("club").innerHTML     = jsondict['clubreceives'];
                document.getElementById("total").innerHTML    = jsondict['total'];

                //===========================================================================

                jsondict['date'] = getDate();
                document.getElementById("NowTime").innerHTML  = jsondict['date']

                //===========================================================================

                jsondict['transaction_status'] = 'pending';

                //===========================================================================

                document.getElementById("ProRata").innerHTML  = getProRata();

                jsonString = JSON.stringify(jsondict);

                return;
            }

            //=========================  End amount_change()   ==========================


            /* my question to Google Bard

            So, I do wish to do three tasks in sequence and to completion instigated by a
            button push. Task uses the MySQL table `merged` to determine the `FullName` 
            of a member given the member`callsign`. Task 2 inserts various data items into 
            the mysql table 'pp_tnx'. Task 3 requests a set of specific fields from the 
            last 'N' entries of that same table 'pp_tnx' for display. This is to be 
            implemented in javascript. I have actually implemented these 3 tasks using 
            xhr but I have encountered a timing issue associated between tasks 2 and 3. 
            Although all the data gets stored in the pp_tnx table correctly, sometimes I
            get the N records preceding the last from myquery which means to me that that
            query gets to the mySQL before the insertion of the data. How would you 
            implement these 3 tasks in an orderly process using 'promises', async and 
            await mechanisms?

            Google Bard's answer: (as tailored) */

            function sleep(ms) {
                return new Promise(resolve => setTimeout(resolve, ms));
            }
 
            document.addEventListener("DOMContentLoaded", (event) => {
                const altButton = document.getElementById('altButton');
                altButton.addEventListener('click', () => {
                    // Task 1: Get FullName from merged table
                    callsign = jsondict['callsign'];
                    getFullNameFromMergeTable(callsign).then((fullName) => {
                        console.log(callsign, fullName);
                        // Task 2: Insert data into pp_tnx table
                        insertDataIntoPPTnxTable(jsondict).then(() => {
                            console.log("Inserted Data into pp_tnx table");
                            // Task 3: Retrieve last N entries from pp_tnx table
                            /* getLastNEntriesFromPPTnxTable(numRecords).then((lastEntries) => {
                                // Display lastEntries or use them as needed
                                console.log("got all xhr tasks completed");
                            }); */
                            /* Transfer control to https://coastsidearc.org:5556/make_payment/[whatever the new pp_id is] */
                            const transferBase = "https://coastsideARC.org:5556/make_payment/"
                            const uniqueID = jsondict['pp_id'];
                            const fullTransferAddress = transferBase + uniqueID;
                            window.location.replace(fullTransferAddress);
                        });
                    });
                });
            });


            /*===========================================================================
            Remember these constants were defined at top of script. Here we are closer
            to the bottom
            const fullNameUrl    = "serv_getFullName.php";
            const receptorUrl    = "AppFormDB_Receptor.php";
            =========================================================================*/

            defaultName = "U N D E F I N E D";

            function getFullNameFromMergeTable(callsign) {
            return new Promise((resolve, reject) => {

                var obj = new Object();
                obj.callsign = callsign;
                const jsonString = JSON.stringify(obj);
                console.log(jsonString);

                const xhr = new XMLHttpRequest();
                xhr.open("POST", fullNameUrl, true);
                xhr.setRequestHeader('Content-Type', 'application/json');
                xhr.onload = () => {
                if (xhr.status === 200) {
                    let pdata = JSON.parse(xhr.response);
                        if (pdata.result === null) {
                            jsondict['fullname'] = defaultName;
                        } else {
                            jsondict['fullname'] = pdata.result.FullName;
                        }
                    resolve(jsondict['fullname']);
                } else {
                    reject(new Error(`Error fetching FullName: ${xhr.statusText}`));
                }
                };
                xhr.onerror = (error) => reject(new Error(`Error fetching FullName: ${error}`));
                xhr.send(jsonString);
            });
            }

            //===========================================================================

            function insertDataIntoPPTnxTable() {
                return new Promise((resolve, reject) => {

                    const xhr = new XMLHttpRequest();
                    xhr.open('POST', receptorUrl);
                    xhr.setRequestHeader('Content-Type', 'application/json');
                    xhr.onload = () => {
                    if (xhr.status === 200) {
                        let pdata = JSON.parse(xhr.response);
                        jsondict['pp_id'] = pdata.new_pp_id;
                        resolve();
                    } else {
                        reject(new Error(`Error inserting data: ${xhr.statusText}`));
                    }
                    };
                    xhr.onerror = (error) => reject(new Error(`Error inserting data: ${error}`));
                    xhr.send(JSON.stringify(jsondict));
            });
            }

            //===========================================================================
            //'mysql.pauatk5.dreamhosters.com', 'carcuser', 
            //        'gobbledegook', 'carcmbrlst_20231017');

            <?php 
                $conn = new mysqli(
                    'mysql.pauatk5.dreamhosters.com', //'localhost', 
                    'carcuser', 
                    'gobbledegook', 
                    'carcmbrlst_20231017');

                function send($conn,$message) {
                    $result = mysqli_query($conn,$message . ';');
                    // echo $message . '; <br>';
                    return $result;
                }
            ?>

         </script>
    </head>

    <!-------------------------------------------------------------------------->
    
    <body class="wrapper">
        <div class="details">
            <h3>Dues Renewal form for the Coastside Amateur Radio Club</h3>
            
            <p class="alignleft">
                Currently, the basic membership fee is $20.00/year for the primary 
                membership in a household. Additional members in a household 
                are $3.00/year each.
            </p>

            <p class="alignleft">
                Note: The IRS rules for CARC as a 501(c)(7) organization do <em>not</em> allow
                membership dues or donations to be deductible for income tax purposes by 
                the donor.
            </p>

            <p class="alignleft">
                For Associate (unlicensed) members, enter 
                the first initial and last name of the Associate as a simple 
                text string (e.g. J_SMITH) with no space.
            </p>
                
            <p class="alignleft">
                If you are a new member, your membership fee for the current year 
                will be pro-rated. The month you are joining will be determined 
                from the form submission date. Please check the New Member checkbox 
                below if you are a new member.
            </p>

            <form class="formdata">
                <table id="yeartab">
                    <tr>
                        <td>
                            <label class="yrcontainer">2024
                                <input  type="checkbox" name="yrchecked" onclick="yearsChange()">
                                <span class="yrcheckmark"></span>
                            </label>
                        </td>
                        <td>
                            <label class="yrcontainer">2025
                                <input  type="checkbox" name="yrchecked" onclick="yearsChange()">
                                <span class="yrcheckmark"></span>
                            </label>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <label class="yrcontainer">2026
                                <input  type="checkbox" name="yrchecked" onclick="yearsChange()">
                                <span class="yrcheckmark"></span>
                            </label>
                        </td>
                        <td>
                            <label class="yrcontainer">2027
                                <input  type="checkbox" name="yrchecked" onclick="yearsChange()">
                                <span class="yrcheckmark"></span>
                            </label>
                        </td>
                    </tr>

                    <tr><td class="alignleft">
                        <label for="newmember">New Member?</label></td>
                        <td>
                            <label class="yrcontainer">
                                <input  type="checkbox"
                                        name="newmember"
                                        id = "newmember"
                                        width = "150%"
                                        height = "150%"
                                        value = "on";
                                        oninput="newMemberChange()">
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
                                style="width: 330px; font-size: 10pt; text-transform: uppercase;"
                                value = ""
                                oninput="callsignChange()">
                        </td>
                    </tr>

                    <!-- Now Time -->
                    <tr>
                        <td class="alignleft">Server Time:</td>
                        <td><div><p id ="NowTime"></p></div></td>
                    </tr>

                    <!-- ProRata -->
                    <tr>
                        <td class="alignleft">Pro Rata Factor:</td>
                        <td><div><p id="ProRata"></p></div></td>
                    </tr>

                    <!-- Primary -->
                    <tr> 
                        <td class="alignleft">Primary:</td>
                        <td><div><p id ="primary"></p></div></td>
                    </tr>

                    <!-- Family -->
                    <tr>
                        <td class="alignleft">Family:</td>
                        <td><div><p id="family"></p></div></td>
                    </tr>
                
                    <!-- Repeater Fund Donation -->
                    <tr>
                        <td class="alignleft">Repeater Fund:</td>
                        <td class="alignright">
                            <input type="text" 
                                name="repeater" 
                                id="repeater" 
                                checked
                                style="width: 45px; font-size: 10pt;"
                                value = "0.00";
                                oninput="repeater_change()">
                        </td>
                    </tr>

                    <!-- Digipeater Fund Donation -->
                    <tr>
                        <td class="alignleft">Digipeater/APRS Fund:</td>
                        <td class="alignright">
                            <input type="text" 
                                name="digipeater" 
                                id="digipeater" 
                                checked
                                style="width: 45px; font-size: 10pt;"
                                value = "0.00";
                                oninput="digipeater_change()">
                        </td>
                    </tr>     

                    <!-- Subtotal -->
                    <tr>
                        <td class="alignleft">Subtotal:</td>
                        <td><div><p id="subtotal"></p></div></td>
                    </tr>

                    <!-- Paypal fee checkbox -->
                
                    <tr>
                        <td class="alignleft">Include paypal fee?</td>
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
                        <td class="alignleft">Optional Paypal Fee:</td>
                        <td><div><p id="optional"></p></div></td>
                    </tr>

                    <!-- Paypal Receives -->
                    <tr>
                        <td class="alignleft">Paypal Receives:</td>
                        <td><div><p id="paypal"></p></div></td>
                    </tr>

                    <!-- Club Receives -->
                    <tr>
                        <td class="alignleft">Club Receives:</td>
                        <td><div><p id="club"></p></div></td>
                    </tr>

                    <!-- Total -->
                    <tr>
                        <td class="alignleft">Total Charges:</td>
                        <td><div><p id="total"></p></div></td>
                    </tr>

                </table>
            </form>
        </div>

        <div class="header">
            <?php include '../includes/CommonHeader.php' ?>
            <img class="center" src="../images/PayPalDuesRenewal_bnr.gif" height="60" alt="PayPal Dues Renewal">
        </div> <!-- header end -->

        <div class="leftcol">
            <?php include '../includes/CommonMenu.php' ?>
        </div> <!-- leftcol End -->

        <div class="submit">
            <button id="altButton">Submit to Paypal</button>
        </div> <!-- div Buttons End -->

        <div class="footer">
            <?php include '../includes/CommonFooter.php'; ?>
        </div> <!-- footer end -->

    </body>
</html>
