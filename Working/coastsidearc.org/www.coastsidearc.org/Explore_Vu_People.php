<!DOCTYPE html>
<html lang="en">
<!-- xmlns="http://www.w3.org/1999/xhtml" class="fa-events-icons-ready"> -->

	<head>
		<title>Vu People Database</title>
		<meta charset="UTF-8">
		<link href="css/Layout.css" media="all" rel="stylesheet">
		<link href="css/AppFormProc.css" media="all" rel="stylesheet">
		
		<style>
			#customers, #notincarctb{
				font-family: Arial, Helvetica, sans-serif;
				font-size: 0.7em;
				border-collapse: collapse;
			}

			#customers  td, #notincarctb td, #customers #notincarctb th {
				border: 1.5px solid #ddd;
				padding: 4px;
			}

			#customers tr:nth-child(even){background-color: #f2f2f2;}

			#customers tr:hover {background-color: #ddd;}

			#customers th, #notincarctb th {
				padding-top: 12px;
				padding-bottom: 12px;
				text-align: left;
				background-color: #04AA6D;
				color: white;
			}

			.rightcol {width: 720px;}

		</style>
	</head>

	<body>
		<table>
			<tr> <!-- Common Header -->
				<div class = "header">
					<?php include '../includes/CommonHeader.php' ?>
					<img class="center" src="../images/VuPeople_bnr.gif" height="60" alt="Member Database">
				</div> <!-- header ends -->
			</tr>

			<tr> <!-- Common Menu -->
				<div class="leftcol">
						<?php include '../includes/CommonMenu.php' ?>
				</div> <!-- leftcol End -->
			</tr>
					
			<tr> <!-- Stuff 1: Table Showng merge table data -->
				<h2> This section establishes connection with the database carcmbrlst_20231017 </h2>
				<?php

					// $script = fopen("sql.txt","w");

					function send($con,$message) {
						// fwrite($script,$message . ';\n' );
						$result = mysqli_query($con,$message . ';');
						echo $message . '; <br>';
						return $result;
					}

					$servername = 'mysql.pauatk5.dreamhosters.com';
					$username   = 'carcuser';
					$password   = 'gobbledegook';  
					$dbname     = 'carcmbrlst_20231017';
				
					echo '$servername = ' . $servername  . '<br>';
					echo '$username   = ' . $username    . '<br>';
					echo '$password   = ' . 'its secret' . '<br>';
					echo '$dbname     = ' . $dbname      . '<br>';

					echo 'trying to connect<br>';
					$conn = new mysqli($servername, $username, $password, $dbname);
						
					// Checking the connection
					echo 'checking the connection <br>';
					if($conn->connect_error) {
						die('Connection Failed' . conn->connect_error) . '<br>';
					}
					echo 'You have successfully connected to the ' . $dbname . ' ' . 'database<br><br>';
				?>

				<h2>This section shows edits made to each of the databases</h2>

				<?php

					// everything is in database carcmbrlst_20231017
					send($conn, 'USE carcmbrlst_20231017');
					send($conn, 'SELECT * FROM CARCMBRLST_202310177 LIMIT 100');
					send($conn, 'SELECT * FROM vu_people_detail LIMIT 100');
					
					// Create the table vuppl
					send($conn, 'DROP TABLE IF EXISTS vuppl');
					send($conn, 'CREATE TABLE vuppl LIKE vu_people_detail');
					send($conn, 'INSERT INTO vuppl SELECT * FROM vu_people_detail');
					send($conn, 'ALTER TABLE vuppl CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci');
					send($conn, 'ALTER TABLE vuppl ADD COLUMN member_fullName varchar(50) AFTER dues_cy');
					
					// Edit any particular miscreant Entries in copied table vuppl

					send($conn, 'UPDATE vuppl SET member_firstName = "Jacquie"  where member_firstName LIKE "Jackie"');
					send($conn, 'UPDATE vuppl SET member_firstName = "John R."  where member_firstName = "John" and member_lastName = "Owens"');
					send($conn, 'UPDATE vuppl SET member_firstName = "Michael S."  where member_firstName = "Michael S"');
					send($conn, 'UPDATE vuppl SET member_firstName = "Chris"  where member_LastName = "Icide"');
					send($conn, 'UPDATE vuppl SET member_fullName = concat_ws(" ", member_firstName, member_lastName)');

					// Create the table carctb
					send($conn, 'DROP TABLE IF EXISTS carctb');
					send($conn, 'CREATE TABLE carctb LIKE CARCMBRLST_202310177');
					send($conn, 'INSERT INTO carctb SELECT * from CARCMBRLST_202310177');
					send($conn, 'ALTER TABLE carctb CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci');
					send($conn, 'ALTER TABLE carctb ADD COLUMN FullName varchar(50) AFTER CARCOfficer');

					// Edit particular Entries in copied table carctb
					send($conn, 'UPDATE carctb SET FirstName = "Jacquie" where FirstName LIKE "Jacqui"');
					send($conn, 'UPDATE carctb SET FirstName = "Walt" where LastName LIKE "Long"');
					send($conn, 'UPDATE carctb SET FirstName = "David G."  where FirstName LIKE "David G"');
					send($conn, 'UPDATE carctb SET LastName = "Hurlburt"  where LastName LIKE "Hulburt"');
					send($conn, 'UPDATE carctb SET FirstName = "Michael S."  where FirstName LIKE "Michael S"');
					send($conn, 'UPDATE carctb SET FullName = concat_ws(" ", FirstName, LastName)');

					//join the tables, eliminating any non-matches
					send($conn, 'DROP TABLE IF EXISTS merged');
					send($conn, 'CREATE TABLE merged AS SELECT ID, FullName, FirstName, LastName, Callsign, CARCMember, ' . 
								' as_of_date, dues_cy, DatePaid FROM carctb JOIN vuppl ON member_fullname=FullName ORDER BY LastName, FirstName LIMIT 100');
					send($conn, 'ALTER TABLE merged ADD COLUMN Membership varchar(50) AFTER LastName');

					echo '<br><br>';

					// Next we prepare a statement for later MySQL execution per MySQL 8.0 Reference Manual 13.5.1
					// and send it ahead to the database
					// send($conn, "prepare stmt1 FROM 'UPDATE merged SET Membership = ? WHERE ID = ? ' " );

					// echo 'The prepared statement got sent<br>';
					$result = send($conn, 'SELECT * FROM merged LIMIT 100');
					echo('The merge table contains ' . strval($result->num_rows)) . ' rows <br>';
					$fullcnt = 0;
					$associatecnt = 0;
					$inactivecnt = 0;
					$lifetimecnt = 0;
					$friendcnt = 0;
					$silentkeycnt = 0;
					while ($row = $result->fetch_assoc()) {
						
						$ID = $row['ID'];
						$callsign = $row['Callsign'];
						$membership = $row['CARCMember'];
						$DatePaid = $row['DatePaid'];
						$dues_cy = $row['dues_cy'];
						$special = False;

						// Handle the special cases
						if (strcmp($callsign,'N6FG')==0) {
							$special = True;
							$membership = 'Lifetime';
							$lifetimecnt++;
						}

						if (strcmp($callsign,'WB6AAJ')==0) {
							$special = True;
							$membership = 'Friend of Club';
							$friendcnt++;
						}

						if (strcmp($callsign,'KG6EDY  SK')==0) {
							$special = True;
							$membership = 'Silent Key';
							$silentkeycnt++;
						}

						if ( !$special) {
							if(strcmp($dues_cy,'')==0) {
								$membership = 'Inactive';
								$inactivecnt++;
							} else {
								if(strcmp($callsign,"") ==0) {
									$membership = 'Associate';
									$associatecnt++;
								} else {
									$membership = 'Full';
									$fullcnt++;
								}
							}
						}

						/*
						$uId = 2;
						$newStatus = "Wonderful";
						$query = "UPDATE testing SET MyStatus = '$newStatus' WHERE ID = $uId";
						echo($query);
						echo("<br>");
						$stmt = $conn->prepare($query);
						$stmt->execute();
						*/

						$query = "UPDATE merged SET Membership = (id, member) VALUES (?,?)"'$membersh
						echo($query);
						echo("<br>");
						$stmt = $conn->prepare($query);
						$stmt->execute();

						// send($conn, 'UPDATE merged SET Membership = $Mbr)
						// $message = "UPDATE merged SET Membership = 'Will_Try_Again_Later' WHERE ID = " . strval($ID);
						// send($conn, $message);
						
						// echo 'Preparing to execute<br>';
						// send ($conn, 'SET @a = ' . $membership );
						// send ($conn, 'SET @b = ' . strint($ID) );
						// echo 'Both sets were set<br>';
						// send ($conn, 'EXECUTE stmt1 USING @a, @b' );
						// echo 'An EXECUTE statement was sent';
					}
				?>
				<div class="rightcol">
					<h2>This section shows edits manually made to the 'merged' TABLE showing derived membership status</h2>
					<p> Although code exists to establish membership status based on callsign and membership status from TABLE 
						carcmbrlst_20231017 it was found difficult to enter this derived status back into the 'merged' TABLE. 
						In lieu of using results of the calculation, membership status was entered manually at this point.
					</p>
				</div>		

				<div class="rightcol">
					<h2>Snippets from the 'merged' TABLE showing membership data</h2>
					<p> The table below shows all of the people that are contained in the 'merged' TABLE.
					<p> Membership status was determined based on whether the member has paid in accordance
						with the column dues_cy. The CARC Member column is generally in agreement except
						This shows that there are some members haveing 'FULL' membership
						status not being shown as paid for 2023. I have noted these with an 
						asterisk (*). Also, there is one person, KK6PCC (Richard Lira ID=39), that is shown as 
						paid but listed False on membership.
					</p>
				</div>

				<br><br>		
				<table id="customers">
					<thead>
						<th>ID</th>
						<th>Name</th>
						<th>CallSign</th>
						<th>Membership</th>
						<th>dues_cy</th>
						<th>CARC Member</th>
						<th>Date Paid</th>
					</thead>
						
					<tbody>
						<?php
							$result = send($conn, 'SELECT * FROM merged LIMIT 100');
							while ($row = $result->fetch_assoc()) { ?>
								<tr>
									<td> <?php echo $row['ID']         ?> </td>
									<td> <?php echo $row['FullName']   ?> </td>
									<td> <?php echo $row['Callsign']   ?> </td>
									<td> <?php echo $row['Membership'] ?> </td>
									<td> <?php echo $row['dues_cy']    ?> </td>
									<td> <?php echo $row['CARCMember'] ?> </td>
									<td> <?php echo $row['DatePaid']   ?> </td>
								</tr>
							<?php } 
						?>
					<tbody>
				</table>
			</tr>
			<br><br>
			<tr> <!-- Stuff 2: Summary -->
				<table id="notincarctb">
					<thead>
						<th> Membership Class</th> <th>Count</th>
					</thead>
					<tbody>
						<tr>  <td> Full Members:       </td>  <td> <?php echo strval($fullcnt)      ?>  </td></tr>   
						<tr>  <td> Associate Members:  </td>  <td> <?php echo strval($associatecnt) ?>  </td></tr>     
						<tr>  <td> Lifetime Members:   </td>  <td> <?php echo strval($lifetimecnt)  ?>  </td></tr>
						<tr>  <td> Silent Key Members: </td>  <td> <?php echo strval($silentkeycnt) ?>  </td></tr>   
						<tr>  <td> Inactive:           </td>  <td> <?php echo strval($inactivecnt)  ?>  </td></tr>     
						<tr>  <td> Friend of Club:     </td>  <td> <?php echo strval($friendcnt)    ?>  </td></tr>  

					</tbody>
				</table>
			</tr>

			<tr> <!-- Not In Section --> 
			    <?php
					// Checking the connection
					echo 're-checking the connection <br>';
					if($conn->connect_error) {
						die('Connection Failed' . $conn->connect_error) . '<br>';
					}
					echo 'You are still successfully connected to the ' . $dbname . ' ' . 'database<br><br>';
					// fclose($script);
					
					// Find in_vuppl_not_carctb
					send($conn, 'USE carcmbrlst_20231017');
					send($conn, 'DROP TABLE IF EXISTS in_vuppl_not_carctb');
					send($conn, 'CREATE TABLE in_vuppl_not_carctb 
									SELECT member_fullName, member_firstName, member_lastName 
									FROM vuppl WHERE NOT EXISTS 
										(SELECT FullName from carctb where carctb.FullName = vuppl.member_fullName) 
										ORDER BY member_LastName, member_firstName LIMIT 100;');
				?>
				<br><br>
				<table>
					<thead>
						<td>FullName</td>
					</thead>
					<tbody>
						<?php
							$result = send($conn, 'SELECT * FROM in_vuppl_not_carctb LIMIT 100');
							echo('The in_vuppl_not_carctb table contains ' . strval($result->num_rows)) . ' rows <br>';
							while ($row = $result->fetch_assoc()) { ?>
								<tr>
									<td> <?php echo $row['member_fullName'] ?> </td>
								</tr>
							<?php }
						?>
					</tbody>
				</table>
			</tr>
					

			<tr> <!-- Footer Section -->
				<td colspan="2">
					<div class="bottom">
						<?php include '../includes/CommonFooter.php' ?>
					</div> <!-- bottom end -->
				</td>
			</tr>

		</table>
	</body>
</html>

