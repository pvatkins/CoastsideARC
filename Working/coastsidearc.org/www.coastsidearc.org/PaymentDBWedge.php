<DOCTYPE html>
<html lang="en">
    
    <head>
        <title>PaymentWedge</title>
        <meta charset="UTF-8">
        <meta name="description" content="Interface Between Payment Form and Paypal">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="author" content="Paul Atkins">
       

        <!-- The little php code in the links below force the css sheets to reload each time -->
        <link href="css/Layout.css?v1=<?php echo time();?>" media="all" rel="stylesheet"  type="text/css">
        <!-- <link href="css/PaymentDBWedge.css?v2=<?php echo time();?>" media="all" rel="stylesheet"  type="text/css"> -->
    </head>

    <body>
        <!--
        This function takes the following inputs from 'PaymentDBWedge.php', does its thing with MySQL, 
        database 'carcmbrlst_20231017' generating (if necessary) and then adding lines to the table payments.
        On completion, control is passed to CoastsideARC.org:5555, passing on the appropriate parameters.
        -->
        <h3>You have redirected to the PayPal integration Wedge!</h3>
        <p>The passed parameters are in the table below</p>

        <table>
            <thead>
                <th>Component</th> <th>Amount</th>
            </thead>
            <tbody>
                <tr> <td>Callsign</td>            <td id="tbl-callsign"></td></tr>
                <tr> <td>Primary Dues</td>        <td id="tbl-primary-dues"></td></tr>
                <tr> <td>Associate Dues</td>      <td id="tbl-associate-dues"></td></tr>
                <tr> <td>Repeater Donation</td>   <td id="tbl-repeater-donation"></td></tr>
                <tr> <td>Digipeater Donation</td> <td id="tbl-digipeater-donation"></td></tr>
                <tr> <td>Optional Fee</td>        <td id="tbl-optional-fee"></td></tr>
                <tr> <td>Total Transaction</td>   <td id="tbl-total-transaction"></td></tr>
            </tbody>
        </table>

        <script>
            const params = new URLSearchParams(document.location.search);
            let P1 = params.get("P1"); let N1 = parseFloat(P1,10);
            let P2 = params.get("P2"); let N2 = parseFloat(P2,10);
            let P3 = params.get("P3"); let N3 = parseFloat(P3,10);
            let P4 = params.get("P4"); let N4 = parseFloat(P4,10);
            let P5 = params.get("P5"); let N5 = parseFloat(P5,10);
            let P6 = params.get("P6");
            let Total = (N1+N2+N3+N4+N5).toFixed(2);
            
            document.getElementById("tbl-primary-dues").innerHTML = N1.toFixed(2);
            document.getElementById("tbl-associate-dues").innerHTML = P2;
            document.getElementById("tbl-repeater-donation").innerHTML = P3;
            document.getElementById("tbl-digipeater-donation").innerHTML = P4;
            document.getElementById("tbl-optional-fee").innerHTML = P5;
            document.getElementById("tbl-callsign").innerHTML = P6;
            document.getElementById("tbl-total-transaction").innerHTML = Total;
        </script>
        <?php
            include('connection.php');
            $con = connect();

            function send($con,$message) {
                $result = mysqli_query($con,$message . ';');
                echo $message . '; <br>';
                return $result;
            }
            
            // Create the payment data table if it does not yet exist
            $sql = 'CREATE TABLE IF NOT EXISTS payment (
                id INT auto_increment,
                primaryDues VARCHAR (10),
                familyDues VARCHAR(10),
                repeaterDonation VARCHAR(10),
                digipeaterDonation VARCHAR(10),
                paypalDonation VARCHAR(10),
                totalDonation VARCHAR(10),
                primary key (id)'
            ;

            send($con, $sql);
        
            
        ?>
    </body>

</html>



          