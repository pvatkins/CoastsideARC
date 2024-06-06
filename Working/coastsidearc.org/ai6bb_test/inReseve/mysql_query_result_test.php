<?php

function guidv4($data = null) {
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

function send($con,$message) {
    $result = mysqli_query($con,$message . ';');
    return $result;
}

function quote($arg)  { return "'" . $arg . "'"; }

function new_uuid($con, $tbl, $key) {
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

// setup database
$con = new mysqli('mysql.pauatk5.dreamhosters.com', 'carcuser', 'gobbledegook', 'carcmbrlst_20231017');

// Check connection
if (mysqli_connect_errno()) {
    echo "Failed to connect to MySQL: " . mysqli_connect_error();
    die();
}

$new_id = new_uuid($con, "n6sjf_person", "id");
echo($new_id);
if ($new_id <> null) {
    $q_id = quote($new_id);
    $sql = "INSERT INTO n6sjf_person (`id`, `name`) VALUES ($q_id, NULL)";
    $result = send($con, $sql);
    echo($result);
}

// $sql = "SELECT * FROM n6sjf_person";
// $sql = "SELECT * FROM n6sjf_person WHERE id = 5";
// $result = mysqli_query($con, $sql);

// // fetch a single result set
// // $row = mysqli_fetch_all($result);
// $row = mysqli_fetch_row($result);

// // print row data
// if (!$row) {
//     echo "key does not exist";
// } else {
//     print_r($row);
// }


// print_r(guidv4());

mysqli_close($con);
?>
