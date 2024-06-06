<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Test getFullName</title>
        
        <style>
            table,
            table tr,
            table td {
                border: 1px solid;
                border-collapse: collapse;
                text-align: center;
            }
            table tr {background-color: "pink"};
            table thead caption p {
                font-size: 3.0px;
                color: red;
            }
        </style>

        <script>
            // Globals
            const defaultName = '*** Beats Me! ***';
            const callsigns = ['AI6BB', 'KN6PIV', 'WB6JKV', 'N6FG',   'KM6HYK', 'KM6UYM',
                'KN6ORM', 'W2OKB', 'W6LOG', 'KJ6OGL', 'KI6HIG', 'W1AW', 'WA6TOW', 'N6SJF'];

            const Expected = ['Paul Atkins', 'Jillian Aldersen', 'Michael S. Herbert', 
                'Frank Erbacher', 'William J. Anderson', 'Fernel Andong',
                'Steve Austin', 'Bharat Bailer', 'Robert Barbitta', 'Thomas Oliver', 
                'Gary Barnes', defaultName, defaultName, 'Jonathon Lancelle'];

            var Actual = [];
            var Pass = [];
            // End Globals
            document.addEventListener("DOMContentLoaded", function() {
                console.log("The DOM is now loaded");
                doTest();
                const $table = document.getElementById('table');
                $table.insertAdjacentHTML('afterbegin', createTable());
                console.log("I think the test results have been rendered.");
            });

            function getFullName(callsign) {
                var obj = new Object();
                obj.callsign = callsign;
                const jsonString = JSON.stringify(obj);

                // Send the JSON data to the server.
                const xhr = new XMLHttpRequest(); 
                xhr.onreadystatechange = function() {
                    // document.getElementById("rdystat").innerHTML = 
                    //"".concat(this.readyState, " - ", this.status);

                    
                    if (this.status === 500) {
                        /*
                        document.getElementById("response").innerHTML =
                        "".concat(
                        "Failed to load resource: the server ",
                        "responded with a status of 500(), known as an internal ",
                        "server error. See your local system administrator.",
                        "  Better yet, rewrite your server code so it works!" );
                        */
                        var breakhere = 7;
                    }

                    if ((this.status === 200) && (this.readyState === 4)){
                        var m1, m2, m3, m4, m5;
                        const response=this.response;

                        if (response == '\r\n') {
                            m1 = "Success: failed";
                            m2 = "ErrorMsg: just \\r\\n";
                            m3 = "The SQL query never came down from the server";
                        } else {
                            let pdata = JSON.parse(response);
                            m1 = "Success: ".concat(pdata.success);
                            m2 = "ErrorMsg: ".concat(pdata.errorMessage);
                            m3 = "Query: ".concat(pdata.query);
                            if (pdata.result === null) {
                                returnValue = defaultName;
                            } else {
                                returnValue = pdata.result.FullName;
                            }
                            m4 = "FullName: ".concat(returnValue);
                            console.log(response);
                            var dummy = returnValue;
                            return returnValue;
                        }
                        // document.getElementById("respcode").innerHTML = m1.concat(",<br>", m2);   
                        // document.getElementById("response").innerHTML = m4;
                        // document.getElementById("new_pp_id").innerHTML = m3;

                        // send client to paypal page. put new_pp_id in url. gather 
                        // data using mysql in node app.
                    }
                }
                // xhr.responseType = 'json';    
                xhr.open("POST", "serv_getFullName_ai6bb.php", true);
                xhr.setRequestHeader('Content-Type', 'application/json');
                xhr.send(jsonString);
            } // end getFullName(callsign)

            //====================================================================================

            function createTableRow(data) {
                const arr = data.map(e => {
                    return `<td>${e}</td>`;
                });

                return `<tr>${arr.join('')}</tr>`;
            }

                function createTable() {
                    const tableRows = callsigns.map((callsign, i) => {
                        return createTableRow([callsign, Expected[i], Actual[i], Pass[i]]);
                    });
                
                    return `
                        <table>
                            <thead>
                                <caption><p>
                                    This is how the final table should appear
                                    when the <i>serv_getFullName</i> lookup has
                                    been <b>successfully</b> checked out. The 
                                    test here is whether the actual results 
                                    match the expected results. N6FG is expected 
                                    to Fail.
                                </p></caption>

                                <tr>
                                    <th>Callsign</th>
                                    <th>Expected</th>
                                    <th>Actual</th>
                                    <th>Pass/Fail</th>
                                </tr>
                            </thead>
                            <tbody>
                                ${tableRows.join('')}
                            </tbody>
                        </table>
                    `;  
                }

                //====================================================================================

                function doTest() {
                    Actual = []; // Ensure empty to start
                    Pass = [];// Ensure empty to start
                    // Initialize Actuals with something dumb
                    for (let ix=0; ix < callsigns.length; ix++ ) {
                        Actual.push(defaultName);
                        Pass.push(defaultName);
                    }
                    // See if `dumb` can be replaced with good stuff
                    for (ix=0; ix < callsigns.length; ix++ ) {
                        name = getFullName(callsigns[ix]);
                        Actual[ix] = name;

                        if (Actual[ix] === Expected[ix]) {
                            Pass[ix] = 'Pass';
                        } else {
                            Pass[ix] = '** Fail **';
                        }
                    }
                }

                //====================================================================================

        </script>
    </head>

    <body>
        <H2>Table Lookup Test</h2>
        <div id="table" class="row clearfix"></div>
    </body>
</html>