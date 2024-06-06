
<?php

    function send($con,$message) {
        $result = mysqli_query($con,$message . ';');
        return $result;
    }

	function quote($arg)  { return "'" . $arg . "'"; }
    
    $success = true;
    $errorMessage = "none";
    
    // Connect to the database
    $conn = new mysqli('mysql.pauatk5.dreamhosters.com', 'carcuser', 'gobbledegook', 'carcmbrlst_20231017');
    

    // Check connection
    if (!$conn) {
        $errorMessage = "Database connection failed: " . mysqli_connect_error();
        $success = false;
    } else {
        // Get the JSON data from the request body
        $jsonString = file_get_contents('php://input');

        // Decode the JSON data
        $jsonData = json_decode($jsonString, true);

        // Extract data from the JSON object
        $date         = quote(date("Y-m-d H:i:s")); //The MySQL DATETIME format is already quoted
        $years        = quote($jsonData['years']);
        $callsigns    = quote($jsonData['callsigns']);
        $primary      = quote($jsonData['primary']);
        $family       = quote($jsonData['family']);
        $repeater     = quote($jsonData['repeater']);
        $digipeater   = quote($jsonData['digipeater']);
        $subtotal     = quote($jsonData['subtotal']);
        $checkbox     =       $jsonData['checkbox'];
        $newchecked   =       $jsonData['newchecked'];
        $paypalfee    = quote($jsonData['paypalfee']);
        $clubreceives = quote($jsonData['clubreceives']);
        $total        = quote($jsonData['total']);
    
        // Prepare & execute the SQL query
        
        $sql =  "INSERT INTO pay12 (`myindex`, `mydate`, `years`, `callsigns`, `primary`, `family`, " . 
                " `repeater`, `digipeater`,`subtotal`, `paypalfee`, `clubreceives`, `total` ) VALUES ( " . 
                " NULL, $date, $years, $callsigns, $primary, $family, $repeater, $digipeater, " . 
                " $subtotal, $paypalfee, $clubreceives, $total)" ;
        
        $result = send($conn, $sql);

        if (!$result) {
            "Database INSERT failed: " . mysqli_error();
            $success = false;
        }
    }
    // Send the response to the original page
    header('Content-Type: application/json');
    $arr = array('success' => $success, 'errorMessage' => $errorMessage, 'query' => $sql);
    //echo json_encode($json_data);
    {
        $arr = array( 'success' => $success, 
                      'errorMessage' => $errorMessage, 
                      'query' => $sql,
                      'date'=>date("Y-m-d H:i:s"));
        //echo json_encode($json_data);

        echo json_encode($arr); // wrap-around
    }
?>
