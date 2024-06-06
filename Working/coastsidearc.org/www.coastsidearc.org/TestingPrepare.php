<!DOCTYPE html>
<html lang="en">
<!-- xmlns="http://www.w3.org/1999/xhtml" class="fa-events-icons-ready"> -->

	<head>
		<title>Testing Prepare</title>
		<meta charset="UTF-8">
	</head>

	<body>
        <?php
            function send($con,$message) {
                $result = mysqli_query($con,$message . ';');
                echo $message . '; <br>';
                return $result;
            }

            $servername = 'mysql.pauatk5.dreamhosters.com';
            $username   = 'carcuser';
            $password   = 'gobbledegook';  
            $dbname     = 'carcmbrlst_20231017';

            echo 'trying to connect<br>';
            $conn = new mysqli($servername, $username, $password, $dbname);
                
            // Checking the connection
            echo 'checking the connection <br>';
            if($conn->connect_error) {
                die('Connection Failed' . conn->connect_error) . '<br>';
            }
            echo 'You have successfully connected to the ' . $dbname . ' ' . 'database<br><br>';

            send($conn, 'DROP TABLE IF EXISTS testing');
            send($conn, 'CREATE TABLE testing (ID INT, MyStatus varchar(20))');
            send($conn, 'INSERT INTO testing (ID, MyStatus) Values (1, "Full")');
            send($conn, 'INSERT INTO testing (ID, MyStatus) Values (2, "Empty")');
            send($conn, 'INSERT INTO testing (ID, MyStatus) Values (3, "Half")');
        ?>
        <br><br>
        <table>
            <thead>
                <td>id</td><TD>MyStatus</td>
            </thead>
            <tbody>
                <?php
                    $result = send($conn, 'SELECT * FROM testing LIMIT 100');
                    echo('The testing table contains ' . strval($result->num_rows)) . ' rows <br>';
                    while ($row = $result->fetch_assoc()) { ?>
                        <tr>
                            <td> <?php echo $row['ID'] ?> </td><td> <?php echo $row['MyStatus'] ?> </td>
                        </tr>
                    <?php }
                ?>
            </tbody>
        </table>
        <br>
        <?php
            echo 'Now we want to Use the prepare table mechanism, the point of this test<br><br>';
            echo ' we prepare a statement for later MySQL execution per MySQL 8.0 Reference Manual 13.5 and 13.5.1<br>';

			send($conn, "PREPARE STMT1 FROM 'UPDATE testing SET MyStatus = ? WHERE ID = ? ' " );
             $TheStatus = 'Wonderful';
             $ID = 2;
            send ($conn, 'SET @a = ' . $TheStatus );
            echo 'The First SET statement was sent<br>';
            send ($conn, 'SET @b = ' . strint($ID));
            echo 'The Second SET statement was sent<br>';
            send ($conn, 'EXECUTE stmt1 USING @a, @b' );
        ?>
    </body>
</html>
