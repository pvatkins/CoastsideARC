<?php
    header ('Access-Control-Allow-Origin: *');
    header ('Access-Control-Allow-Methods: *');

function guidv4($data = null)
{
    // Generate 16 bytes (128 bits) of random data or use the data passed into the function.
    $data = $data ?? random_bytes(16);
    assert(strlen($data) == 16);

    // Set version to 0100
    $data[6] = chr(ord($data[6]) & 0x0f | 0x40);
    // Set bits 6-7 to 10
    $data[8] = chr(ord($data[8]) & 0x3f | 0x80);

    // Output the 36 character UUID.
    return vsprintf('%s%s-%s-%s-%s-%s%s%s', str_split(bin2hex($data), 4));
}

function new_uuid($con, $tbl, $key)
{
    $x = 1;
    do {
        $new_id = guidv4();
        $sql = "SELECT * FROM $tbl WHERE $key = '$new_id'";
        $result = send($con, $sql);
        $row = mysqli_fetch_row($result);
        if (!$row) {
            return $new_id;
        }
        $x++;
    } while ($x <= 3);

    return null; // incredibly rare instance of finding three existing random uuid's. Try again from calling code.
}

function send($con, $message)
{
    $result = mysqli_query($con, $message . ';');
    return $result;
}

function quote($arg)
{
    return "'" . $arg . "'";
}

$success = true;
$errorMessage = "none";
$result = null;
$new_id = null;

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
    $date = quote(date("Y-m-d H:i:s")); //The MySQL DATETIME format is already quoted
    $years = quote($jsonData['years']);
    $callsigns = quote($jsonData['callsigns']);
    $primary = quote($jsonData['primary']);
    $family = quote($jsonData['family']);
    $repeater = quote($jsonData['repeater']);
    $digipeater = quote($jsonData['digipeater']);
    $subtotal = quote($jsonData['subtotal']);
    $checkbox = $jsonData['checkbox'];
    $newchecked = $jsonData['newchecked'];
    $paypalfee = quote($jsonData['paypalfee']);
    $clubreceives = quote($jsonData['clubreceives']);
    $total = quote($jsonData['total']);

    // Prepare & execute the SQL query
    $new_id = new_uuid($conn, "pp_tnx", "pp_id");
    // echo ($new_id);
    if ($new_id <> null) {
        $q_id = quote($new_id);
        $sql = "INSERT INTO pp_tnx ( `pp_id`, `mydate`, `years`, `callsigns`, `primary`, `family`, " .
        " `repeater`, `digipeater`,`subtotal`, `paypalfee`, `clubreceives`, `total` ) VALUES ( " .
        " $q_id, $date, $years, $callsigns, $primary, $family, $repeater, $digipeater, " .
        " $subtotal, $paypalfee, $clubreceives, $total)";

        $result = send($conn, $sql);
        // echo ($result);

        if (!$result) {
            "Database INSERT failed: " . mysqli_error($conn);
            $success = false;
        }
    } else {
        $success = false; //system failed to create an unique pp_id uuid primary key. Client should get $1,000,000! Try again??
    }
}

// Send the response to the original page
header('Content-Type: application/json');
$arr = array('success' => $success, 'errorMessage' => $errorMessage, 'query' => $sql);
//echo json_encode($json_data);
{
    $arr = array(
        'Incoming' => $jsonString,
        'inyear' => $years,
        'success' => $success,
        'errorMessage' => $errorMessage,
        'query' => $sql,
        'new_pp_id' => $new_id,
        'date' => date("Y-m-d H:i:s")
    );
    //echo json_encode($json_data);

    echo json_encode($arr); // wrap-around
}
?>
