<!DOCTYPE html>
<html lang="en">
<!-- xmlns="http://www.w3.org/1999/xhtml" class="fa-events-icons-ready"> -->

	<head>
		<title>Prep Loop</title>
		<meta charset="UTF-8">
	</head>

	<body>
        <?php
            function send($con,$message) {
                $result = mysqli_query($con,$message . ';');
                echo $message . '; <br>';
                return $result;
            }

            function setup($con) {
                $query = "UPDATE testing SET MyStatus = ? WHERE ID = ?";
                echo($query);
                echo("<br>");
                $stm = $con->prepare($query);
                return $stm;
            }

            function biex($stm, $arg1, $arg2) {
                $stm->bind_param("si", $arg1, $arg2);
                $stm->execute();
            }

            function setup1($con) {
                $query = "UPDATE testing SET anInt = ? WHERE ID = ?";
                echo($query);
                echo("<br>");
                $stm = $con->prepare($query);
                return $stm;
            }

            function biex1($stm, $arg1, $arg2) {
                $stm->bind_param("ii", $arg1, $arg2);
                $stm->execute();
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
            echo 'You have successfully connected to the ' . $dbname . ' ' . 'database<br>';
            echo 'Connection info: ' . $conn->host_info . '<br>';

            send($conn, 'DROP TABLE IF EXISTS testing');
            send($conn, 'CREATE TABLE testing (ID INT, MyStatus varchar(20), anInt INT)');
            send($conn, 'INSERT INTO testing (ID, MyStatus, anInt) Values (1, "Full",  4)' );
            send($conn, 'INSERT INTO testing (ID, MyStatus, anInt) Values (2, "Empty", 2)' );
            send($conn, 'INSERT INTO testing (ID, MyStatus, anInt) Values (3, "Half",  3)' );
            send($conn, 'INSERT INTO testing (ID, MyStatus, anInt) Values (4, "Third",  1)' );

        ?>

        <br><br>
        <h3>The table before updates applied</h3><br>
        <table>
            <thead>
                <th>id</th>
                <th>MyStatus</th>
                <th>anInt</th>
            </thead>

            <tbody>
                <?php
                    $result = send($conn, 'SELECT * FROM testing LIMIT 100');
                    echo('The testing table contains ' . strval($result->num_rows)) . ' rows <br>';
                    while ($row = $result->fetch_assoc()) { ?>
                        <tr>
                            <td> <?php echo $row['ID'] ?> </td>
                            <td> <?php echo $row['MyStatus'] ?></td>
                            <td> <?php echo $row['anInt']?> </td>
                        </tr>
                    <?php }
                ?>
            </tbody>
        </table>
        <br>
        <h3>Now we want to use the prepare table mechanism with help from PHP functions, the point of this test</h3>
        <?php
            $stmt = setup($conn);
            $stmt1 = setup1($conn);
            biex($stmt,"Weather",4);
            biex1($stmt1,1,1);
            biex($stmt,"Wonderful",3);
            biex1($stmt1,333,3);
            biex($stmt,"Pacifica",1);
            biex1($stmt1,22,2);
            biex($stmt,"Has",2);
            biex1($stmt1,444444,4);
        ?>

	    <br>
        <h3>The table after updates applied</h3><br>
        <table>
            <thead>
                <th>id</th><th>MyStatus</th><th>anInt</th>
            </thead>
            <tbody>
                <?php
                    $result = send($conn, 'SELECT * FROM testing LIMIT 100');
                    echo('The testing table contains ' . strval($result->num_rows)) . ' rows <br>';
                    while ($row = $result->fetch_assoc()) { ?>
                        <tr>
                            <td> <?php echo $row['ID'] ?> </td>
                            <td> <?php echo $row['MyStatus'] ?> </td>
                            <td> <?php echo $row['anInt'] ?></td>
                        </tr>
                    <?php   }
	            ?>
            </tbody>
        </table>
        <h3>Closing down the test</h3>
        <?php 
            send($conn, 'DROP TABLE IF EXISTS testing');
        ?>

    </body>
</html>
