<!DOCTYPE html>
<html lang="en">
<!-- xmlns="http://www.w3.org/1999/xhtml" class="fa-events-icons-ready"> -->

	<head>
		<title>Member Database</title>
		<meta charset="UTF-8">
		<link href="css/Layout.css" media="all" rel="stylesheet">
		<link href="css/AppFormProc.css" media="all" rel="stylesheet">
	</head>

	<body>
		<table>
				<tr>
					<td colspan = 2>
						<div class = "header">
							<?php include '../includes/CommonHeader.php' ?>
							<img class="center" src="../images/Database_bnr.gif" height="60" alt="Member Database">
						</div> <!-- header ends -->
					</td>
				</tr>

				<tr>
					<td>
						<div class="leftcol">
								<?php include '../includes/CommonMenu.php' ?>
						</div> <!-- leftcol End -->
					</td>
					
					<td>
						<div class= "rightcol" >

							<h2>Welcome to the Explore_SQL_Data.php module on <?php echo date("m-d H:i"); ?>. </h2><br>
							<?php 

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
								echo 'checking the connection' . '<br>';
								// Checking the connection
								if($conn->connect_error) {
									die('Connection Failed' . conn->connect_error) . '<br>';;
								}
								echo 'You have successfully connected to the ' . $dbname . ' ' . 'database.' . '<br><br>';

								$qry_01 = 'SELECT ID, FirstName, LastName, Callsign, LicenseClass, CARCMember FROM CARCMBRLST_202310177 ORDER BY LastName, FirstName' ;
								$result = mysqli_query($conn,$qry_01);
								if ($result->num_rows > 0) { ?>
									<table>
										<thead>
											<td>ID</td>
											<td>Name</td>
											<td>CallSign</td>
											<td>License</td>
											<td>Membership</td>
										</thead>

										<tbody>
											<?php
												$fullcnt = 0;
												$associatecnt = 0;
												$inactivecnt = 0;
												$lifetimecnt = 0;
												$friendcnt = 0;

											 	while ($row = $result->fetch_assoc()) { ?>
												<tr>
													<?php 
														$callsign = $row['Callsign'];
														$membership = $row['CARCMember'];
														$special = False;

														// Handle the 2 special cases
														if (strcmp($callsign,'N6FG')==0) {
															$special = True;
															$membership = 'Lifetime';
															$lifetimecnt++;
														}

														if (strcmp($callsign,'WB6AAJ')==0) {
															$special = True;
															$membership = 'Friend';
															$friendcnt++;
														}

														if ( !$special) {
															if(strcmp($membership,'False')==0) {
																$membership = 'Inactive';
																$inactivecnt++;
															} else {
																if(strcmp($callsign,"") ==0) {
																	$membership = 'Associate';
																	$associatecnt++;
																} else {
																	$membership = "FULL";
																	$fullcnt++;
																}
															}
														}
													?>
													<td> <?php echo $row['ID'] ?>           </td>
													<td> <?php echo $row['FirstName'] . ' ' . $row['LastName'] ?></td>
													<td> <?php echo $callsign ?>     </td>
													<td> <?php echo $row['LicenseClass'] ?> </td>
													<td> <?php echo $membership ?></td>
												</tr>
											<?php } ?>
										</tbody>
									</table>
									
									<?php
										echo '<br>';
										echo 'Full Members: ' . strval($fullcnt) . '<br>';
										echo 'Associate Members: ' . strval($associatecnt) . '<br>';
										echo 'Inactive Members: ' . strval($inactivecnt) . '<br>';
										echo 'Lifetime Members: ' . strval($lifetimecnt) . '<br>';
										echo 'Friend Members: ' . strval($friendcnt) . '<br>';
									?>

								<?php } else {
										echo "No results reported" . '<br>';
									}
								$conn->close();
							?>
						</div>
					</td>
				</tr>

				<tr>
					<td colspan="2">
						<div class="bottom">
							<?php include '../includes/CommonFooter.php' ?>
						</div> <!-- bottom end -->
					</td>
				</tr>

			</table>
		<br><br>
	</body>
</html>
