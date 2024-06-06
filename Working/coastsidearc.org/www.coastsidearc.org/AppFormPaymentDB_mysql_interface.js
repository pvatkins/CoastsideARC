function send($con,$message) {
    // fwrite($script,$message . ';\n' );
    $result = mysqli_query($con,$message . ';');
    return $result;
}

function connect() {
    $servername = 'mysql.pauatk5.dreamhosters.com';
    $username   = 'carcuser';
    $password   = 'gobbledegook';  
    $dbname     = 'carcmbrlst_20231017';
    $conn =  $conn = new mysqli($servername, $username, $password, $dbname);
    if $conn->connect_error {
        return $conn;
    } else {
        return False;
    }
}

        // Create the table paymenthistory
function CreateHistoryDB() {
    send($conn, 'USE carcmbrlst_20231017');
    send($conn, 'DROP TABLE IF EXISTS paymenthistory');
    cmd = "".concatenate(
        'CREATE TABLE IF NOT EXISTS paymenthistory (',
            'record_id INT,',
            'date VARCHAR(50),',
            'years VARCHAR(50),',
            'callsigns VARCHAR(50),',
            'primary VARCHAR(12),',
            'family VARCHAR(12),',
            'repeater VARCHAR(12),',
            'digipeater VARCHAR(12),',
            'subtotal VARCHAR(12),',
            'paypalfee VARCHAR(12),',
            'clubreceives VARCHAR(12),',
            'Total VARCHAR(12),',
            'DonateChecked VARCHAR(6),',
            'Newchecked VARCHAR(6))')
    send($conn, cmd);
}