<!DOCTYPE html>
<html lang="en">
    
    <head>
        <title>Nov 14 Pay12</title>
        <meta charset="UTF-8">
        <meta name="description" content="Example Interface">
        <meta name="viewport"    content="width=device-width, initial-scale=1.0">
        <link href="css/Layout.css"           media="all" rel="stylesheet"  type="text/css">
        <!-- <link href="css/AppFormPaymentDB.css" media="all" rel="stylesheet"  type="text/css"> -->

        <style>
            table, th, td {
                border: 1px dashed green;
                border-collapse: collapse;
                padding: 5px;
                spacing: 6px;
				font-family: Arial, Helvetica, sans-serif;
				font-size: 0.82em;
            }

            #tabl {
				font-family: Arial, Helvetica, sans-serif;
				font-size: 0.5em;
				border-collapse: collapse;
			}

			#tabl  tbody td {
				border: 1.5px solid #ddd;
				padding: 4px;
			}

			#tabl tbody tr:nth-child(even){background-color: #f2f2f2;}

			#tabl tbody tr:hover {background-color: #ddd;}

			#tabl thead th {
				padding-top: 12px;
				padding-bottom: 12px;
				text-align: left;
				background-color: #04AA6D;
				color: white;
			}

            .btn {
                background-color: RGB(255,196,58); /* paypal yellow */
                color: blue;
                border: 2px solid red;
                padding: 10px;
                text-align: center;
                font-size: 20px;
            }
            .wrapper {
                display: grid;
                gap: 10px;
                padding: 20px;
                width: 723px;
            }

            .header, .leftcol, .submit, .rdystat, .respcode, 
            .jsonout, .response, .footer, .verify {
                border: 1px dotted green;
                text-align: center;  
            }
            /* Row 1 */
            .header {
                grid-column: 1/5;
                grid-row: 1/2;
            } 

            .leftcol {
                grid-column: 1/2;
                grid-row: 2/5;
                text-align: left;
            }

            /* Row 2 */
            .submit {
                grid-column: 2/3;
                grid-row: 2/3;
            }

            .rdystat {
                grid-column: 3/4;
                grid-row: 2/3;
            }

            .respcode {
                grid-column: 4/5;
                grid-row: 2/3;
            }

            /* Row 4 */
            .jsonout {
                grid-column: 2/5;
                grid-row: 3/4;
            }

            /* Row 4 */
            .response {
                grid-column: 2/5;
                grid-row: 4/5;
            }   

            /* Row 5 */
            .verify {
                grid-column: 1/5;
                grid-row: 5/6;
            }

            /* Row 6 */
            .footer {
                grid-column: 1/5;
                grid-row: 6/7;
            }

            #tcontain, #tab1 {
                padding: 10px;
            }
        </style>

<script>

function dollars(amount) {
    var myStr = "$" + Number(amount).toFixed(2).padStart(7," ");
    return myStr;
}

function getDate() {
    const timeElapsed = Date.now();
    const today = new Date(timeElapsed);
    return today.toUTCString();
}

document.addEventListener('DOMContentLoaded', function() {
  const form = document.querySelector('form');
  // Do something with the form element.

  form.addEventListener('submit', function(event) {
    event.preventDefault();

    // Format the form data into a JSON object.
    var jsondict = {};
    var MyJSON = "";

    // we get the date from the server to eliminate any client bias
    jsondict['years']           = "2024 2025";
    jsondict['callsigns']       = "AI6BB KE6KRT W1AW WA6TOW";
    jsondict['primary']         = dollars(40);
    jsondict['family']          = dollars(18);
    jsondict['repeater']        = dollars(20);
    jsondict['digipeater']      = dollars(18.02);
    jsondict['subtotal']        = dollars(96.02);
    jsondict['checkbox']        = true;
    jsondict['newchecked']      = false;
    jsondict['paypalfee']       = dollars(3.98);
    jsondict['clubreceives']    = dollars(96.02);
    jsondict['total']           = dollars(100);
    jsondict['success']         = true;
    jsondict['errorMessage']    = "none";


    const jsonString = JSON.stringify(jsondict);
    document.getElementById("jsonout").innerHTML = jsonString;
    

    // Send the JSON data to the server.
    const xhr = new XMLHttpRequest(); 
    xhr.onreadystatechange = function() {

        document.getElementById("rdystat").innerHTML = 
            "".concat(this.readyState, " - ", this.status);

        if (this.status == 500) {
            document.getElementById("response").innerHTML =
                "".concat(
                    "Failed to load resource: the server ",
                    "responded with a status of 500(), known as an internal ",
                    "server error. See your local system administrator.",
                    "  Better yet, rewrite your server code so it works!" );
        }

        if (this.readyState ==  4 && this.status == 200) {
            var m1; 
            var m2;
            var m3;
            var m4;
            var new_pp_id;
            const response=this.response;
            if (response == '\r\n') {
                m1 = "Success: failed";
                m2 = "ErrorMsg: just \\r\\n";
                m3 = "The SQL query never came down from the server";
            } else {
                let pdata = JSON.parse(response);
                m1 = "Success: ".concat(pdata.success);
                m2 = "ErrorMsg: ".concat(pdata.errorMessage);
                new_pp_id = pdata.new_pp_id;
                m4 = response;
            }
            document.getElementById("respcode").innerHTML = m1.concat(",<br>", m2);   
            document.getElementById("response").innerHTML = m4;
            // document.getElementById("new_pp_id").innerHTML = m3;
  
            // send client to paypal page. put new_pp_id in url. gather data using mysql in node app.
        }
    }
    // xhr.responseType = 'json';    
    xhr.open("POST", "AppFormDB_Receptor_n6sjf.php", true);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.send(jsonString);
    });

});

</script>

<?php
    // $new_pp_id = "something";
    // $new_pp_id = echo "<script>document.writeln(response['new_pp_id']);</script>" ;
?>

    </head>

    <body class="wrapper">

        <div class="header">
            <?php include '../includes/CommonHeader.php' ?>
            <img class="center" src="../images/PostExample_bnr.gif" height="60" alt="Post Example">
        </div> <!-- header end -->

        <div class="leftcol">
            <?php include '../includes/CommonMenu.php' ?>
        </div> <!-- leftcol End -->

        <div class="submit">
            <div>Buttons</div>
            <form method="post" id="myForm">
                <p><button type="submit" class="btn" >Submit</button></p>
                <p><button type="show" class="btn" >Show Data</button></p>
            </form>
        </div> <!-- content1 End -->

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
        
        <?php 

            $conn = new mysqli(
                'mysql.pauatk5.dreamhosters.com', 'carcuser', 
                'gobbledegook', 'carcmbrlst_20231017');

            function send($conn,$message) {
                $result = mysqli_query($conn,$message . ';');
                echo $message . '; <br>';
                return $result;
            }
        ?>

        <!-- Hide stuff from (5) in https://www.sitepoint.com/hide-elements-in-css/ -->
        <!-- or https://stackoverflow.com/questions/19074171/how-to-toggle-a-divs-visibility-by-using-a-button-click -->
        <div class = "verify">
            <div>Verification</div>
                <div class = tcontain>
                    <table id=tab1>
                        <thead>
                            <th>indx</th>
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
                                $result = send($conn, '(SELECT * FROM pp_tnx ORDER BY mydate DESC LIMIT 5)');
                                
                                while ($row = $result->fetch_assoc()) { ?>
                                    <tr>
                                        <td> <?php echo $row['pp_id'] ?> </td>
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


