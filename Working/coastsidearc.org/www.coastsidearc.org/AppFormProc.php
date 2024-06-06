<!DOCTYPE html>
<html lang="en">
<!-- xmlns="http://www.w3.org/1999/xhtml" class="fa-events-icons-ready"> -->

<head>
	<title>AppFormProc.php</title>
	<meta charset="UTF-8">
	<link href="css/Layout.css" media="all" rel="stylesheet">
	<link href="css/AppFormProc.css" media="all" rel="stylesheet">

  <style>
	  .myPaypalDiv {
			width: 45%;
		}
	</style>

</head>

<body>
  <table>
		<tr>
			<td colspan = 2>
				<div class = "header">
					<?php include '../includes/CommonHeader.php' ?>
					<img class="center" src="../images/AppFormProc_bnr.gif" height="60" alt="Application Form Process">
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
					<h2>Welcome to the AppFormProc.php module at <?php echo date("m-d H:i"); ?>. </h2><br>
					<h3>The data you entered for the primary member is shown below.</h3>
					Name: <?php echo $_POST["firstname"];?> <?php echo $_POST["lastname"];?><br>
					Callsign:   			<?php echo $_POST["callsign"]; ?><br>
					Address:    			<?php echo $_POST["address"]; ?><br>
					City:       			<?php echo $_POST["city"]; ?><br>
	  				State:     			 	<?php echo $_POST["state"]; ?><br>
					Zip Code:  			  	<?php echo $_POST["zipcode"]; ?><br>
					Email:         	  		<?php echo $_POST["email"]; ?><br>
					Primary Phone:  		<?php echo $_POST["phone1"]; ?><br>
					Secondary Phone:		<?php echo $_POST["phone2"]; ?><br>
					License Class:    		<?php echo $_POST["license"]; ?><br>
					Year First Licensed: 	<?php echo $_POST["issue"]; ?><br>
					ARRL: <?php if(isset($_POST['arrlbox']) && $_POST['arrlbox'] != '1')
						{echo 'Checked';} else { echo 'Unchecked'; }  ?> <br>
					ARES: <?php if(isset($_POST['aresbox']) && $_POST['aresbox'] != '1')
						{echo 'Checked';} else { echo 'Unchecked'; }  ?> <br>
					RACES: <?php if(isset($_POST['racesbox']) && $_POST['racesbox'] != '1')
						{echo 'Checked';} else { echo 'Unchecked'; }  ?> <br>
					CERT: <?php if(isset($_POST['certbox']) && $_POST['certbox'] != '1')
						{echo 'Checked';} else { echo 'Unchecked'; }  ?> <br>
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
