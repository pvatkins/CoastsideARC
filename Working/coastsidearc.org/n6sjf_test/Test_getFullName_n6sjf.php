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

        table tr {
            background-color: "pink"
        }

        ;

        table thead caption p {
            font-size: 3.0px;
            color: red;
        }
    </style>

    <script>
        // Globals
        const defaultName = '*** Beats Me! ***';
        const callsigns = ['AI6BB', 'KN6PIV', 'WB6JKV', 'N6FG', 'KM6HYK', 'KM6UYM',
            'KN6ORM', 'W2OKB', 'W6LOG', 'KJ6OGL', 'KI6HIG', 'W1AW', 'WA6TOW', 'N6SJF'];

        const Expected = ['Paul Atkins', 'Jillian Aldersen', 'Michael S. Herbert',
            'Frank Erbacher', 'William J. Anderson', 'Fernel Andong',
            'Steve Austin', 'Bharat Bailer', 'Robert Barbitta', 'Thomas Oliver',
            'Gary Barnes', defaultName, defaultName, 'Jonathon Lancelle'];

        var Actual = [];
        var Pass = [];
        var gname = [];

        // End Globals
        document.addEventListener("DOMContentLoaded", function () {
            console.log("The DOM is now loaded");
            // doTest();
            const $table = document.getElementById('table');
            $table.insertAdjacentHTML('afterbegin', createTable());
            myTest(callsigns);
            console.log("I think the test results have been rendered.");
        });

        //====================================================================================

        async function myTest(callsigns) {
            var xhr = [];
            for (i = 0; i < callsigns.length; i++) {
                var obj = new Object();
                obj.callsign = callsigns[i];
                const jsonString = JSON.stringify(obj);
                xhr[i] = new XMLHttpRequest();
                xhr[i].onreadystatechange = function () {
                    if (this.status === 500) {
                    }
                    if ((this.status === 200) && (this.readyState === 4)) {
                        var m1, m2, m3, m4, m5;
                        const response = this.response;
                        if (response == '\r\n') {
                            m1 = "Success: failed";
                            m2 = "ErrorMsg: just \\r\\n";
                            m3 = "The SQL query never came down from the server";
                        } else {
                            let pdata = JSON.parse(response);
                            myTestCallback(pdata.callsign, pdata.result.FullName);
                        }
                    }
                }
                xhr[i].open("POST", "serv_getFullName_n6sjf.php", true);
                // xhr.setRequestHeader('Content-Type', 'application/json');
                await xhr[i].send(jsonString);
            };
        }

        //====================================================================================

        function myTestCallback(callsign, actualName) {
            // console.log(name);
            var expected = document.getElementById(`d_${callsign}_expected`).value;
            document.getElementById(`d_${callsign}_actual`).innerHTML = actualName;
            test = (expected = actualName && expected != defaultName ? "Passed" : "Fail");
            document.getElementById(`d_${callsign}_pass`).innerHTML = test;
        }
        //====================================================================================

        function createTableRow(callsign, expected) {
            return `<tr id="${callsign}">
                <td>${callsign}</td>
                <td id="d_${callsign}_expected">${expected}</td>
                <td id="d_${callsign}_actual"></td>
                <td id="d_${callsign}_pass"></td>
                </tr>`;
        }

        function createTable() {
            const tableRows = callsigns.map((callsign, i) => {
                // console.log(callsign, Expected[i], Actual[i], Pass[i]);
                return createTableRow(callsign, Expected[i]);
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

    </script>
</head>

<body>
    <H2>Table Lookup Test</h2>
    <div id="table" class="row clearfix"></div>
</body>

</html>