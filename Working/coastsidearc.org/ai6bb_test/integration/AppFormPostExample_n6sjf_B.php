<!DOCTYPE html>
<html lang="en">
    
    <head>
        <title>Dec 20 2023 15:38 pp</title>
        <meta charset="UTF-8">
        <meta name="description" content="PayPal Interface">
        <meta name="viewport"    content="width=device-width, initial-scale=1.0">
        <link href="css/Layout.css" media="all" rel="stylesheet"  type="text/css">
        <link href="css/AppFormPostExample_n6sjf_B.css" media="all" 
                rel="stylesheet"  type="text/css">
        
        <!-- Note: This webpage also refers to the following external php files for server actions
            AppForm_getFullName.php           -- looks up a FullName from `merged` database given callsign
            AppFormDB_Receptor_n6sjf.php      -- inserts transaction data into `pp_tnx` table
            serv_getLastEntries.php           -- gets the last 10entries
        -->
        <script>
            // Global Variables
            var jsondict = {};
            var newmember_checked = false;
            var goodToGo = true;
            // after the submit button pressed
            const receptorUrl    = "AppFormDB_Receptor_n6sjf_B.php";
            const fullNameUrl    = "serv_getFullName_n6sjf.php";
            const lastEntriesUrl = "serveGetLastEntries.php";
            const mode = 'sim'; // vs 'liv'
            const numRecords = 10;  // The number of records to be displayed
            // End global Variables

            //===========================================================================

            function yearsChange(){
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

            function initializePage() {
                updateYearBoxes();
            }

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
                document.getElementById("jsonout").innerHTML = jsonString;
                return;
            }

            //=========================  End amount_change()   ==========================

            //===========================================================================
            // Remember these constants defined at top of script. We are closer to the bottom
            /*
            const receptorUrl    = "AppFormDB_Receptor_n6sjf_B.php";
            const fullNameUrl    = "serv_getFullName_n6sjf.php";
            const lastEntriesUrl = "serv_GetLastEntries.php";
            const mode = 'sim';
            */
            //===========================================================================

            mySubmit() {
                // Perform code associated with 'submit' button push
                // begin by faking getFullName(callsign with a table lookup in lieu
                // of an inquiry to the database
                callsign = jsondict['callsign'];
                FullName(callsign, mode);
                jsondict['fullname'] = FullName;
                InsertData();
                LastEntries(5);
            };


            let FullName = callsign => {
        
                const xhr = new XMLHttpRequest(); 
                xhr.open("POST", fullNameUrl, true,)
                xhr.setRequestHeader('Content-Type', 'application/json');
                
                // success branch
                xhr.onload = function() {
                    done(null, xhr.response);
                }
                
                // error branch
                xhr.onerror = function() {
                    done(xhr.response);
                }

                let object = new Object();
                object.callsign = callsign;
                jsonString = JSON.stringify(object);
                xhr.send(jsonString);
            }

            jsondict['fullname'] = FullName;

            InsertData = () => {
                myUrl = receptorUrl;
                jsonString = JSON.stringify(jsondict);

                const xhr = new XMLHttpRequest(); 
                xhr.onreadystatechange = function() {
                    if (xhr.readyState !== 4) return;
                    if (xhr.status != 200)  { 
                        //  something went wrong, tell the user
                        return 'fail';
                    }
                    // if we get here, the request was successful
                    return 'ok';
                }

                xhr.open("POST", myUrl, true,)
                xhr.setRequestHeader('Content-Type', 'application/json');
                xhr.send(jsonString);

            }

            let LastEntries = numRec => {
                myUrl = lastEntriesUrl;

                let object = new Object();
                object.numRec = numRec;
                jsonString = JSON.stringify(object);

                const xhr = new XMLHttpRequest(); 
                xhr.onreadystatechange = function() {
                    if (xhr.readyState !== 4) return;
                    if (xhr.status != 200)  { 
                        //  something went wrong, tell the user
                        return pdata;
                    }
                    // if we get here, the request was successful
                    let pdata = JSON.parse(response);
                    myarr = pdata.myarr;
                    const len = myarr.length;
                    tableHTML = createTableHeader();
                    for (ix=0; ix < len; ix++) {
                        tableHTML += createTableRow(myarr[ix]);
                    }
                    tableHTML += createTableFooter();
                    document.getElementById("table").innerHTML = tableHTML;
                }

                xhr.open("POST", myUrl, true,)
                xhr.setRequestHeader('Content-Type', 'application/json');
                xhr.send(jsonString);
            }

            function createTableHeader() {
                return (
                    `<table id="table1">
                        <thead>
                            <caption>This is a record of the last 
                                     N rows of the pp_tnx table.
                            </caption>
                            <tr>
                                <th>indx</th>
                                <th>name</th>
                                <th>date</th>
                                <th>yrs</th>
                                <th>cllsgns</th>
                                <th>prmry</th>
                                <th>fmly</th>
                                <th>rptr</th>
                                <th>dptr</th>
                                <th>sbttl</th>
                                <th>pyplfe</th>
                                <th>club</th>
                                <th>total</th>
                            </tr>
                        </thead>
                        <tbody>`
                    );
            }

            function createTableRow(rowdata) {
                return (`<tr>
                    <td>rowdata['myindex']<td>
                    <td>rowdata['fullname']<td>
                    <td>rowdata['mydate']<td>
                    <td>rowdata['years']<td>
                    <td>rowdata['callsigns']<td>
                    <td>rowdata["primary"]<td>
                    <td>rowdata['family']<td>
                    <td>rowdata['repeater']<td>
                    <td>rowdata['digipeater']<td>
                    <td>rowdata['subtotal']<td>
                    <td>rowdata['paypalfee']<td>
                    <td>rowdata['clubreceives']<td>
                    <td>rowdata['total']<td>`
            )};

            function createTableFooter() {
                return "</tbody></table>";
            }
            
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
            
            function getFullName(callsign,mode) {
                //===========================================================================
                // getFullName is a query to retrieve the FullName from the merged table
                // based on callsign of the client. 
                //===========================================================================
                // When mode == 'sim' the lookup is based on static data.
                // When mode == 'liv' the lookup is based on the current `merge` database
                if (mode === 'sim') {
                    // Workaround -- getFullName
                    const defaultName = 'unknown';
                    const lookupJson = [
                        {"Callsign":"KN6PIV","FullName":"Jillian Aldersen"},
                        {"Callsign":"KM6HYK","FullName":"William J. Anderson"},
                        {"Callsign":"KM6UYM","FullName":"Fernel Andong"},
                        {"Callsign":"AI6BB","FullName":"Paul Atkins"},
                        {"Callsign":"KN6ORM","FullName":"Steve Austin"},
                        {"Callsign":"W2OKB","FullName":"Bharat Bailur"},
                        {"Callsign":"W6LOG","FullName":"Robert Barbitta"},
                        {"Callsign":"KI6HIG","FullName":"Gary Barnes"},
                        {"Callsign":"KJ6FHQ","FullName":"Anna Bernstein"},
                        {"Callsign":"N6ZEN","FullName":"Dan Bernstein"},
                        {"Callsign":"KK6FOI","FullName":"Emily Bernstein"},
                        {"Callsign":"AA6XL","FullName":"Michael G. Bevington"},
                        {"Callsign":"AB7ZX","FullName":"Miles E. Bond"},
                        {"Callsign":"KE6MNJ","FullName":"Roy Brixen"},
                        {"Callsign":"K6ZP","FullName":"Andy Calman"},
                        {"Callsign":"KN6FUT","FullName":"Ben Calvert"},
                        {"Callsign":"AE6DC","FullName":"David Chamberlin"},
                        {"Callsign":"K6NIA","FullName":"David Conroy"},
                        {"Callsign":"KK6JJX","FullName":"Don R. Corral"},
                        {"Callsign":"AF6BT","FullName":"Derek Dang"},
                        {"Callsign":"KC6LCA","FullName":"Tricia Dell"},
                        {"Callsign":"W6AWD","FullName":"Alan W. Dye"},
                        {"Callsign":"K6IIP","FullName":"Barbara Erbacher"},
                        {"Callsign":"N6FG","FullName":"Frank C. Erbacher"},
                        {"Callsign":"N6GYR","FullName":"George Fenisey"},
                        {"Callsign":"KJ6ERS","FullName":"Carmel Gallagher"},
                        {"Callsign":"K6RYL","FullName":"Ariel Gallega"},
                        {"Callsign":"N6DOZ","FullName":"Rudy Gaoay"},
                        {"Callsign":"KN6GQZ","FullName":"Scott C. Gillette"},
                        {"Callsign":"KE6KRT","FullName":"Georgia Grant"},
                        {"Callsign":"N1HEL","FullName":"Paul Grigorieff"},
                        {"Callsign":"N6QGZ","FullName":"Kris Herbert"},
                        {"Callsign":"WB6JKV","FullName":"Michael S. Herbert"},
                        {"Callsign":"W6CBH","FullName":"Breck Hitz"},
                        {"Callsign":"WB6FEK","FullName":"David G. Hurlburt"},
                        {"Callsign":"KF6ACH","FullName":"Jane Hurlburt"},
                        {"Callsign":"WY7W","FullName":"Chris Icide"},
                        {"Callsign":"KN6QER","FullName":"Dennis Kafka"},
                        {"Callsign":"KI6DRM","FullName":"Zoe Kersteen-Tucker"},
                        {"Callsign":"KC6YDH","FullName":"Ralph Kugler"},
                        {"Callsign":"N6SJF","FullName":"Jonathan Lancelle"},
                        {"Callsign":"KF6TWW","FullName":"David L. Lawrence"},
                        {"Callsign":"N6BCT","FullName":"William A. Lillie"},
                        {"Callsign":"KK6PCC","FullName":"Richard T. Lira"},
                        {"Callsign":"KG6EDY  SK","FullName":"Walt Long"},
                        {"Callsign":"KB6VT","FullName":"Richard D. Markel"},
                        {"Callsign":"KB6LGZ","FullName":"Victor M. Munoz"},
                        {"Callsign":"W6SY","FullName":"Ted Niemira"},
                        {"Callsign":"KJ6OGL","FullName":"Tom Oliver"},
                        {"Callsign":"NN6U","FullName":"John R. Owens"},
                        {"Callsign":"K6YUA","FullName":"Steve Paganelli"},
                        {"Callsign":"W6VJJ","FullName":"Vernon Patterson"},
                        {"Callsign":"KN6UNF","FullName":"Ellen Price"},
                        {"Callsign":"WB9EGG","FullName":"Ron Purser"},
                        {"Callsign":"KM6HZR","FullName":"Michael S. Ransom"},
                        {"Callsign":"N6DBR","FullName":"Dan Reid"},
                        {"Callsign":"K6DMR","FullName":"David M. Rinck"},
                        {"Callsign":"KJ6TSX","FullName":"George Salet"},
                        {"Callsign":"KB6OIZ","FullName":"Linda C. Sanders"},
                        {"Callsign":"AJ6J","FullName":"Mary Ellen Scherer"},
                        {"Callsign":"KM6SCD","FullName":"R. Scott Sutor"},
                        {"Callsign":"KC6CTT","FullName":"Charles Tillman"},
                        {"Callsign":"W6HAF","FullName":"George H. Tucker"},
                        {"Callsign":"WB6AAJ","FullName":"Kelly Tuttle"},
                        {"Callsign":"WA2KPS","FullName":"Audrey J. Villyard"},
                        {"Callsign":"N6TZE","FullName":"Casey Villyard"},
                        {"Callsign":"N6TZF","FullName":"Joshua Villyard"},
                        {"Callsign":"KI6VRA","FullName":"Nikki Villyard"},
                        {"Callsign":"WA6ECH","FullName":"Pete Wanger"},
                        {"Callsign":"N6BHS","FullName":"Harry Ysselstein"}
                        ];

                    let FullName = defaultName;  // The default
                    for (var ix = 0; ix < lookupJson.length; ix++) {
                        var jsonEntry = lookupJson[ix];
                        if (jsonEntry.Callsign === callsign) {
                            return jsonEntry.FullName;
                        }
                    }
                }
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

        <form class="formdata">
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
                                style="width: 300px; font-size: 10pt; text-transform: uppercase;"
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
                        json
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
                </table> <!-- yeartab ends -->
            </div> <!-- details End -->
        </form>

        <div class="Submit">
            <button onClick="mySubmit()">Submit 822</button>
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
            <?php include '../../includes/CommonFooter.php'; ?>
        </div> <!-- footer end -->	
        
        <div id="table"></div>

    </body>
</html>
