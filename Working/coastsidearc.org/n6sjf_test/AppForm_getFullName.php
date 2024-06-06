<?php

function send($con, $message)
{
    $result = mysqli_query($con, $message . ';');
    return $result;
}

function quote($arg)
{
    return "'" . $arg . "'";
}

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

    // Extract primaryCall from the JSON object
    $primaryCall = quote($jsonData['primarycall']);

    // Create the Query
    $query = 'SELECT FullName FROM merged where merged.FullName = ' . $primaryCall;
    
    // send the query
    $FullName = send($conn, $query);

    // Send the response to the original page
    header('Content-Type: application/json');

    $arr = array('success' => $success, 'errorMessage' => $errorMessage, 'query' => $query);
    //echo json_encode($json_data);
    {
        $arr = array(
            'success' => $success,
            'errorMessage' => $errorMessage,
            'query' => $query,

        //echo json_encode($json_data);
        echo json_encode($arr); // wrap-around
    }
?>