<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8" />
    <title>Success!</title>

    <style>
        html {
            font-family: sans-serif;
        }

        table {
            border-collapse: collapse;
            border: 2px solid rgb(200,200,200);
            letter-spacing: 0px;
            font-size: 10px;
        }

        td, th {
            border: 1px solid rgb(150,150,150);
            padding: 2px;
        }

        th {
            background-color: rgb(235,235,235);
        }

        td {
            text-align: center;
        }

        tr:nth-child(even) td {
            background-color: rgb(250,250,250);
        }

        tr:nth-child(odd) td {
            background-color: rgb(245,245,245);
        }

        caption {
            padding: 10px;
            font-size: 12px;
        }
    </style>

    <script>
        // Globals
        const numRecords = 1;  // The number of records to be displayed
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
                    const reclLen = myarr.length;
                    tableHTML = createTableHeader(numRecords);
                    for (ix=0; ix < numRecords; ix++) {
                        tableHTML += createTableRow(myarr[ix]);
                    }
                    tableHTML += createTableFooter();
                    document.getElementById("table").innerHTML = tableHTML;
                }
            }
        }
        xhr.open("POST", "serv_getLastEntries.php", true);
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.send(jsonString);

        function createTableHeader(recLen) {
                return (
                    `<table id="table1">
                        <thead>
                            <caption>
                                Your CoastsideARC membership renewal has been successfully 
                                processed. Below, please find a record of your transaction.
                                If you have any questions, please notify the club officers 
                                with an email addressed to <b>info@CoastsideARC.org</b>.
                            </caption>
                            <tr>
                                <th>indx</th>
                                <th>pp_id</th>
                                <th>date</th>
                                <th>call</th>  
                                <th>name</th>
                                <th>years</th>
                                <th>prmry</th>
                                <th>famly</th>
                                <th>rptr</th>
                                <th>dptr</th>
                                <th>sbttl</th>
                                <th>pyplfe</th>
                                <th>club</th>
                                <th>total</th>
                                <th>status</th>
                            </tr>
                        </thead>
                        <tbody>`
                );
            }

            function createTableRow(rowdata) {
                const ppidhead = rowdata['pp_id'].substring(0,8);
                return (
                    `<tr>` + 
                        `<td>` + rowdata['myindex']            + `</td>` +
                        `<td>` + ppidhead                      + `</td>` +
                        `<td>` + rowdata['mydate']             + `</td>` +
                        `<td>` + rowdata['callsigns']          + `</td>` +
                        `<td>` + rowdata['FullName']           + `</td>` +
                        `<td>` + rowdata['years']              + `</td>` +
                        `<td>` + rowdata["primary"]            + `</td>` +
                        `<td>` + rowdata['family']             + `</td>` +
                        `<td>` + rowdata['repeater']           + `</td>` +
                        `<td>` + rowdata['digipeater']         + `</td>` +
                        `<td>` + rowdata['subtotal']           + `</td>` +
                        `<td>` + rowdata['paypalfee']          + `</td>` +
                        `<td>` + rowdata['clubreceives']       + `</td>` +
                        `<td>` + rowdata['total']              + `</td>` +
                        `<td>` + rowdata['transaction_status'] + `</td>` +
                    `</tr>` );
                }

            function createTableFooter() {
                return "</tbody></table>";
            }
    </script>
</head>

<body>
    <H3>Success!</h3>
    <div id="table"></div>
    <h3>Thank You</h3>
</body>

</html>