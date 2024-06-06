<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8" />
    <title>Test getLastEntries.php</title>

    <style>
        html {
            font-family: sans-serif;
        }

        table {
            border-collapse: collapse;
            border: 2px solid rgb(200,200,200);
            letter-spacing: 0px;
            font-size: 8px;
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
        const numRecords = 10;  // The number of records to be displayed
        var breakpoint;
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
                if (response == '\r\n') {
                    m1 = "Success: failed";
                    m2 = "ErrorMsg: just \\r\\n";
                    m3 = "The SQL query never came down from the server";
                } else {
                    let pdata = JSON.parse(response);
                    // The code to place the response into an array
                    // of fields goes right here.
                    myarr = pdata.myarr;
                    const len = myarr.length;

                    tableHTML = createTableHeader();
                
                    breakpoint = 5;
                    for (ix=0; ix < len; ix++) {
                        tableHTML += createTableRow(myarr[ix]);
                        breakpoint = 6;  
                    }
                    tableHTML += createTableFooter();
                    
                    document.getElementById("table").innerHTML = tableHTML;

                }
            }
        }
        xhr.open("POST", "serv_getLastEntries.php", true);
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.send(jsonString);

        function createTableHeader() {
            return (`<table id="table"><thead><caption>This is a record 
            of the last 10 rows of the pp_tnx table.</caption>` +
            `<tr>` + 
            `<th>indx</th>` +
            `<th>name</th>` +
            `<th>date</th>` +
            `<th>yrs</th>` +
            `<th>cllsgns</th>` +
            `<th>prmry</th>` +
            `<th>fmly</th>` +
            `<th>rptr</th>` +
            `<th>dptr</th>` +
            `<th>sbttl</th>` +
            `<th>pyplfe</th>` +
            `<th>club</th>` +
            `<th>total</th>` +
            `</tr></thead><tbody>`);
        }

        function createTableRow(rowdata) {
            return (`<tr>` +
                `<td>` + rowdata['myindex']      + `</td>` +
                `<td>` + rowdata['fullname']     + `</td>` +
                `<td>` + rowdata['mydate']       + `</td>` +
                `<td>` + rowdata['years']        + `</td>` +
                `<td>` + rowdata['callsigns']    + `</td>` +
                `<td>` + rowdata[`primary`]      + `</td>` +
                `<td>` + rowdata['family']       + `</td>` +
                `<td>` + rowdata['repeater']     + `</td>` +
                `<td>` + rowdata['digipeater']   + `</td>` +
                `<td>` + rowdata['subtotal']     + `</td>` +
                `<td>` + rowdata['paypalfee']    + `</td>` +
                `<td>` + rowdata['clubreceives'] + `</td>` +
                `<td>` + rowdata['total']        + `</td>` + `</tr>`);
        }

        function createTableFooter() {
            return `</tbody></table>`;
        }
    </script>
</head>

<body>
    <H2>Table Lookup Test</h2>
    <div id="table"></div>
    <div>Test Complete</div>
</body>

</html>