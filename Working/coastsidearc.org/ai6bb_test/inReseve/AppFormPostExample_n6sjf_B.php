<!DOCTYPE html>
<html lang="en">
    
    <head>
        <title>Dec 02 2023 pp</title>
        <meta charset="UTF-8">
        <meta name="description" content="Example PayPal Interface">
        <meta name="viewport"    content="width=device-width, initial-scale=1.0">
        <link href="../www.coastsidearc.org/css/Layout.css" media="all" rel="stylesheet"  type="text/css">
        <link href="../www.coastsidearc.org/css/AppFormPostExample_n6sjf_B.css" media="all" rel="stylesheet"  type="text/css">
        <!-- Note: This webpage also refers to the following external php files for server actions
            AppForm_getFullName.php      -- looks up a FullName from `merged` database given callsign
            AppFormDB_Receptor_n6sjf.php -- inserts transaction data into `pp_tnx` table
        -->
        <script>

            // Global Variables
            var jsondict = {};
            // End global Variables
            
            <?php 
                $conn = new mysqli(
                    'mysql.pauatk5.dreamhosters.com', 'carcuser', 
                    'gobbledegook', 'carcmbrlst_20231017');

                function send($conn,$message) {
                    $result = mysqli_query($conn,$message . ';');
                    // echo $message . '; <br>';
                    return $result;
                }
            ?>

            function altButton() {
                const ButtonText = document.getElementById("myButton").innerHTML;
                if (ButtonText === "Alt1") {
                    document.getElementById("myButton").innerHTML = "Alt2";
                } else {
                    document.getElementById("myButton").innerHTML = "Alt1";
                }
            }

            /* Some notes

            The first event to be concerned with is when is the document loaded.

            When the `submit` button is pressed it will cause an event, `getName`, 
            to be fired by the user's browser. The first event will be for the lookup
            of the user's FullName from the `merge` table of the database. The remote 
            php file to assist in thes operation is `AppForm_getFullName.php`. 
            
            Upon completion of the lookup operation, meaning that the `FullName` 
            has been entered into the `jsondict`, a synthetic event, "dbinsert" 
            is triggered to cause all of the data in `jsondict` to be inserted 
            into the pp_tnx' table. The remote php file to assist in this operation
            is `AppFormDB_Receptor_n6sjf_B.php`.
            
            Upon entering the data into the 'pp_tnx` table, another synthetic 
            event is triggered to display the last 5 lines of the `pp_tnx` table. 
            which is displayed in the `verification` section of the webpage. The
            routine to do this is ``.
            */

            // Surely the document will have been loaded by the time user presses submit, so we
            // will surely just doSomething
            
            function OnSubmit(event) {
                if (document.readySytate === "loading") {
                    // loading hasn't finished yet
                    document.addEventListener('DOMContentLoaded', doSomething());
                } else {
                    // DomContentLoaded has already fired
                    doSomething();
                }
            }
            /* Sure, here is a simple example of how to implement a function called 
               getFullName(callsign) that retrieves the FullName from a MySQL table 
               merged on a remote server given a callsign: */
            const mysql = require('mysql');

            function getFullName(callsign) {
            // Connect to the remote MySQL server
            const connection = mysql.createConnection({
                host: 'remote_server_address',
                user: 'username',
                password: 'password',
                database: 'database_name'
            });

            // Create a query to retrieve the FullName from the merged table
            const query = `SELECT FullName FROM merged WHERE callsign = '${callsign}'`;

            // Execute the query and return the FullName
            return new Promise((resolve, reject) => {
                connection.connect(err => {
                    if (err) {
                        reject(err);
                        return;
                    }

                        connection.query(query, (err, results) => {
                            if (err) {
                            reject(err);
                            return;
                            }

                            const fullName = results[0].FullName;
                            connection.end();
                            resolve(fullName);
                        });
                    });
                });
            }

            function doSomething() {
                var form = document.querySelector('form');
                form.addEventListener('getName', function(nameevent) {
                    // Do something with the form element.
                    nameevent.preventDefault();
                    var jsonString = JSON.stringify(jsondict['primarycall']);
                    // display the jsonString
                    document.getElementById("fnjsonout").innerHTML = jsonString;
                    // Send the JSON data to the server.
                    var xhr = new XMLHttpRequest(); 
                    xhr.onreadystatechange = function() {
                        document.getElementById("fnrdystat").innerHTML=this.readyState.concat(" - ", this.status);
                        document.getElementById("fnrespcode").innerHTML = jsonString;
                        if (this.readyState ==  4 && this.status == 200) {
                            jsondict['FullName'] = this.result;
                            var m1, m2, m3, m4; 
                            var response=this.response;
                            if (response == '\r\n') {
                                m1 = "Success: failed";
                                m2 = "ErrorMsg: just \\r\\n";
                                m3 = "The SQL query never came down from the server";
                            } else {
                                var pdata = JSON.parse(response);
                                m1 = "Success: ".concat(pdata.success);
                                m2 = "ErrorMsg: ".concat(pdata.errorMessage);
                                m4 = response; 
                            }  
                            document.getElementById("fnrespcode").innerHTML = m1.concat(",<br>", m2);   
                            document.getElementById("fnresponse").innerHTML = m4;
                            const event = new Event("dbinsert"); // Trigger the next event
                        }
                    }
                    xhr.open("POST", "AppForm_getFullName.php", true,)
                    xhr.setRequestHeader('Content-Type', 'application/json');
                    xhr.send(jsonString);
                }); // end form.addEventListener('getName', function(nameevent))


                form.addEventListener('dbinsert', function(dbinsert){
                    // Do something with the form element.
                    dbinsert.preventDefault();
                    jsonString = JSON.stringify(jsondict); // now the whole dict
                    // display the jsonString
                    document.getElementById("jsonout").innerHTML = jsonString;
                    // Send the JSON data to the server.
                    xhr = new XMLHttpRequest(); 
                    xhr.onreadystatechange = function() {  // a new instance
                        document.getElementById("rdystat").innerHTML=this.readyState.concat(" - ", this.status);
                        document.getElementById("respcode").innerHTML = jsonString;
                        if (this.readyState ==  4 && this.status == 200) {
                            jsondict['FullName'] = this.result;
                            var m1, m2, m3, m4;
                            response=this.response;
                            if (response == '\r\n') {
                                m1 = "Success: failed";
                                m2 = "ErrorMsg: just \\r\\n";
                                m3 = "The SQL query never came down from the server";
                            } else {
                                var pdata = JSON.parse(response);
                                m1 = "Success: ".concat(pdata.success);
                                m2 = "ErrorMsg: ".concat(pdata.errorMessage);
                                m4 = response; 
                            }  
                            document.getElementById("fnrespcode").innerHTML = m1.concat(",<br>", m2);   
                            document.getElementById("fnresponse").innerHTML = m4;
                            // const event = new Event("validate"); // Trigger the next event
                        }
                    }
                    xhr.open("POST", "AppFormDB_Receptor_n6sjf.php", true,)
                    xhr.setRequestHeader('Content-Type', 'application/json');
                    xhr.send(jsonString);
                }); //end form.addEventListener('dbinsert', function(dbinsert))

                form.addEventListener('validte', function(validate) {
                    validate.preventDefaut();
                    var table = document.getElementById('tab1');
                    if (table != null) {
                        var parentEl = table.parentElement;
                        parentEl.removeChild(removeTab);
                    }
                    
                    table = document.createElement('table');
                    table.setAttribute('id','tab1')
                    var tr = document.createElement('tr');

                    var header = table.createTHead();
                    var th01 = document.createElement('th');
                    var th02 = document.createElement('th');
                    var th03 = document.createElement('th');
                    var th04 = document.createElement('th');
                    var th05 = document.createElement('th');
                    var th06 = document.createElement('th');
                    var th07 = document.createElement('th');
                    var th08 = document.createElement('th');
                    var th09 = document.createElement('th');
                    var th10 = document.createElement('th');
                    var th11 = document.createElement('th');
                    var th12 = document.createElement('th');
                    var th13 = document.createElement('th');

                    th01.appendChild('indx');
                    th02.appendChild('name');
                    th03.appendChild('date');
                    th04.appendChild('yrs');
                    th05.appendChild('clsgns');
                    th06.appendChild('prmry');
                    th07.appendChild('fmly');
                    th08.appendChild('rptr');
                    th09.appendChild('dgptr');
                    th10.appendChild('sbttl');
                    th11.appendChild('pyplfe');
                    th12.appendChild('clbrcvs');
                    th13.appendChild('ttl');
                    <?php            
                        $query = '(SELECT * FROM pp_tnx ORDER BY myindex DESC LIMIT 5) ORDER BY myindex ASC';
                        $result = send($conn, $query);
                        while ($row = $result->fetch_assoc) { ?> 

                            var tr = document.createElement('tr');

                            var td01 = document.createElement('td');
                            var td02 = document.createElement('td');
                            var td03 = document.createElement('td');
                            var td04 = document.createElement('td');
                            var td05 = document.createElement('td');
                            var td06 = document.createElement('td');
                            var td07 = document.createElement('td');
                            var td08 = document.createElement('td'); 
                            var td09 = document.createElement('td');
                            var td10 = document.createElement('td');
                            var td11 = document.createElement('td');
                            var td12 = document.createElement('td');
                            var td13 = document.createElement('td');

                            var txt01 = document.createTextNode('<?php echo $row['myindex']      ?>');
                            var txt02 = document.createTextNode('<?php echo $row['fullname']     ?>');
                            var txt03 = document.createTextNode('<?php echo $row['mydate']       ?>');
                            var txt04 = document.createTextNode('<?php echo $row['years']        ?>');
                            var txt05 = document.createTextNode('<?php echo $row['callsigns']    ?>');
                            var txt06 = document.createTextNode('<?php echo $row['primary']      ?>');
                            var txt07 = document.createTextNode('<?php echo $row['family']       ?>');
                            var txt08 = document.createTextNode('<?php echo $row['repeater']     ?>');
                            var txt09 = document.createTextNode('<?php echo $row['digipeater']   ?>');
                            var txt10 = document.createTextNode('<?php echo $row['subtotal']     ?>');
                            var txt11 = document.createTextNode('<?php echo $row['paypalfee']    ?>');
                            var txt12 = document.createTextNode('<?php echo $row['clubreceives'] ?>');
                            var txt13 = document.createTextNode('<?php echo $row['total']        ?>');

                            td01.appendChild(txt01);
                            td02.appendChild(txt02);
                            td03.appendChild(txt03);
                            td04.appendChild(txt04);
                            td05.appendChild(txt05);
                            td06.appendChild(txt06);
                            td07.appendChild(txt07);
                            td08.appendChild(txt08);
                            td09.appendChild(txt09);
                            td10.appendChild(txt10);
                            td11.appendChild(txt11);
                            td12.appendChild(txt12);
                            td13.appendChild(txt13);

                            tr.appendChild(td01);
                            tr.appendChild(td02);
                            tr.appendChild(td03); 
                            tr.appendChild(td04);
                            tr.appendChild(td05);
                            tr.appendChild(td06);   
                            tr.appendChild(td07);
                            tr.appendChild(td08);
                            tr.appendChild(td09);   
                            tr.appendChild(td10);
                            tr.appendChild(td11);
                            tr.appendChild(td12);  
                            tr.appendChild(td13);
                            table.appendChild(tr);
                        <?php }
                    ?>
                    document.body.appendChild(table);
                }); //end form.addEventListener('validate', function(validate))
            } // end doSomething()

            var newmember_checked = document.getElementById("newchecked");
            var Ncallsigns = 0;

            function initializePage() {
                updateYearBoxes();
            }

            function dollars(amount) {
                var myStr = "$" + Number(amount).toFixed(2).padStart(7," ");
                return myStr;
            }

            function getProRata() {
                var d = new Date();
                var month = d.getMonth();
                return (12-month);
            }
            
            function getDate() {
                var currentdate = new Date(); 
                var datetime = 
                    currentdate.getFullYear()  + "-" +
                    (currentdate.getMonth()+1) + "-" +
                    currentdate.getDate()      +  " "+                   
                    currentdate.getHours()     + ":" +
                    currentdate.getMinutes()   + ":" +
                    currentdate.getSeconds();
                return datetime;
            }
            
            function getYear() {
                var timeElapsed = Date.now();
                var today = new Date(timeElapsed); 
                return today.getFullYear();
            }

            function dolltxt(amount) {
                var myStr = Number(amount).toFixed(2).padStart(7," ");
                return myStr;
            }

            function roundoff(mynum,places) {
                var x = Math.pow(10,places)
                return Math.round(mynum * x)/x;
            }

            function newmember_change() {
                newmember_checked = document.getElementById("newchecked").checked;
                amount_change();
                return;
            }

            function callsignChange(){
                /* using regular expressions, replace  each instance ofconsecutive 
                   whitespace and commas with a single space and eliminate 
                   leading/trailing spaces  
                */
                callsignText = callsigns.value.replace(/[,\s]+/g, " ").trim().toUpperCase();
                jsondict['callsigns'] = callsignText;
                /* count the number of callsigns */
                Ncallsigns = callsignText.split(" ").length;
                if (Ncallsigns===undefined){Ncallsigns=0;}
                amount_change();
                return;
            }

            function repeater_change() {
                repeater = document.getElementById("repeater").value;
                jsondict['repeater'] = repeater;
                amount_change();
                return;
            }

            function digipeater_change() {
                digipeater = document.getElementById("digipeater").value;
                jsondict['digipeater'] = digipeater;
                amount_change();
                return;   
            }

            function years_change(){
                var yeartext = '';
                var yearbox = document.getElementsByName("yrchecked");
                var ybl = yearbox.length;
                var numberChecked = 0;
                for (var ix=0; ix<ybl; ix++) {
                    if (yearbox[ix].checked) {
                        numberChecked = numberChecked++;
                        yeartext = yeartext.concat(" ", yearbox[ix].parentElement.innerText);
                    }
                }
                jsondict['years'] = yeartext.trim();
                if (numberChecked > 0) {
                    document.getElementById("numChecked").innerHTML= "Number of Years checked = " +
                        roundoff(numberChecked,0);
                } else {
                    document.getElementById("numChecked").innerHTML= "At least one Year must be selected"; 
                }
                amount_change();
                return;
            }

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
                var paypal_fixedfee   = 0.49;
                var paypal_percentage = 0.0349;
                var yearly_dues = 20.00;

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

         </script>
    </head>

    <body class="wrapper">
        <div class="header">
            <?php include '../includes/CommonHeader.php' ?>
            <img class="center" src="../images/PostExample_bnr.gif" height="60" alt="Post Example">
        </div> <!-- header end -->

        <div class="leftcol">
            <?php include '../includes/CommonMenu.php' ?>
        </div> <!-- leftcol End -->

        <form onsubmit="doSomething()">
            <div class="details">
                <h3>Dues Renewal form for the Coastside Amateur Radio Club</h3>
                <p class="alignleft">
                    Currently, the basic membership fee is $20.00/year for the primary 
                    membership in a household. Additional members in a household 
                    are $3.00/year each.
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
                    
                <table id="yeartab">
                    <tr>
                        <td>
                            <label class="yrcontainer">2024
                                <input  type="checkbox" name="yrchecked" onclick="years_change()">
                                <span class="yrcheckmark"></span>
                            </label>
                        </td>
                        <td>
                            <label class="yrcontainer">2025
                                <input  type="checkbox" name="yrchecked" onclick="years_change()">
                                <span class="yrcheckmark"></span>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="yrcontainer">2026
                                <input  type="checkbox" name="yrchecked" onclick="years_change()">
                                <span class="yrcheckmark"></span>
                            </label>
                        </td>
                        <td>
                            <label class="yrcontainer">2027
                                <input  type="checkbox" name="yrchecked" onclick="years_change()">
                                <span class="yrcheckmark"></span>
                            </label>
                        </td>
                    </tr>
                    <tr><td>
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
                                style="width: 300px; font-size: 10pt; text-transform: uppercase;"
                                value = ""
                                oninput="callsignChange()">
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
                        json
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
                                style="width: 45px; font-size: 10pt;"
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
                                style="width: 45px; font-size: 10pt;"
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
                </table> <!-- yeartab ends -->
            </div> <!-- details End -->
        </form>

        <div class="submit">
            <div>Buttons</div>
            <form method="POST" id="myForm">
                <p><button type="submit" class="btn" >Submit</button></p>
            </form>
            <button type='button' class='btn' id='myButton' onclick="altButton">Alternate</buttom>
        </div> <!-- div Buttons End -->

        <div class = "redline"></div>

        <div class = "fnrdystat">
            <div>FN ready - status</div>
            <p id = "fnrdystat"></p>
        </div> <!-- fnrdystat end -->

        <div class = "fnrespcode">
            <div>FN resp code</div>
            <p id = "fnrespcode"></p>
        </div> <!-- fnrespcode end -->

        <div class = "fnjsonout">
            <div>FN JSON out</div>
            <p id = "fnjsonout"></p>
        </div> <!-- fnjsonout end -->

        <div class = "fnresponse">
            <div>FN response or SQL query</div>
            <p id = "fnresponse"></p>
        </div> <!-- fnresponse end -->

        <div class="jsonout">
            <div>JSON out</div>
            <p id ="jsonout" ></p>
        </div> <!-- jsonout end -->

        <div class = "rdystat">
            <div>ready - status</div>
            <p id = "rdystat"></p>
        </div> <!-- content3 end --> 
        
        <div class = "respcode">
            <div>resp code</div>
            <p id = "respcode"></p>
        </div> <!-- respcode end -->

        <div class = "response">
            <div>The response or SQL query</div>
            <p id = "response"></p>
        </div> <!-- content3 end -->

        <div class="footer">
            <?php include '../includes/CommonFooter.php'; ?>
        </div> <!-- footer end -->	
        
        <!-- Hide stuff from (5) in https://www.sitepoint.com/hide-elements-in-css/ -->
        <!-- or https://stackoverflow.com/questions/19074171/how-to-toggle-a-divs-visibility-by-using-a-button-click -->
        <div class = "verify">
            <div>Verification</div>
                <div class = tcontain>
                    <table id=tab1>
                        <thead>
                            <th>indx</th>
                            <th>name</th>
                            <th>date</th>  
                            <th>yrs</th>
                            <th>clsgns</th>
                            <th>prmry</th>  
                            <th>fmly</th>   
                            <th>rptr</th>
                            <th>dgptr</th>  
                            <th>sbttl</th>
                            <th>pyplfe</th>
                            <th>clbrcvs</th>  
                            <th>ttl</th>  
                        </thead>
                        
                        <tbody>
                            <?php
                                $query = '(SELECT * FROM pp_tnx ORDER BY myindex DESC LIMIT 5) ORDER BY myindex ASC';
                                $result = send($conn, $query);
                                
                                while ($row = $result->fetch_assoc()) { ?>
                                    <tr>
                                        <td> <?php echo $row['myindex'] ?> </td>
                                        <td> <?php echo $row['fullname'] ?> </td>
                                        <td> <?php echo $row['mydate'] ?> </td>                                
                                        <td> <?php echo $row['years'] ?> </td>    
                                        <td> <?php echo $row['callsigns'] ?> </td>
                                        <td> <?php echo $row['primary'] ?> </td>                                
                                        <td> <?php echo $row['family'] ?> </td>
                                        <td> <?php echo $row['repeater'] ?> </td>
                                        <td> <?php echo $row['digipeater'] ?> </td>                                
                                        <td> <?php echo $row['subtotal'] ?> </td>    
                                        <td> <?php echo $row['paypalfee'] ?> </td>
                                        <td> <?php echo $row['clubreceives'] ?> </td>                                
                                        <td> <?php echo $row['total'] ?> </td>                                                          
                                    </tr>
                                <?php }
                            ?>
                        </tbody>
                    </table>
                </div> <!-- tcontain end -->
            </div> <!-- verification end  -->
         </div>
    </body>
</html>
