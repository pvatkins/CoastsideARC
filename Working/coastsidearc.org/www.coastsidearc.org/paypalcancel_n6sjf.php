<!DOCTYPE html>
<html lang="en">

<head>
	<title>PayPal Cancel</title>
	<meta charset="UTF-8">
	<link href="css/Layout.css" media="all" rel="stylesheet">
	<link href="css/CoastsideARCNews.css" media="all" rel="stylesheet">
</head>

<?php
function send($conn, $message)
{
	$result = mysqli_query($conn, $message . ';');
	return $result;
}

function set_tnx_status($conn, $pp_id, $status)
{
	$sql = <<<GETDATA
	UPDATE `pp_tnx` SET `transaction_status` = '$status' WHERE `pp_id` = '$pp_id'
	GETDATA;
	return send($conn, $sql);
}

$conn = new mysqli('mysql.pauatk5.dreamhosters.com', 'carcuser', 'gobbledegook', 'carcmbrlst_20231017');
// $conn = new mysqli('db', 'root', 'qzpm1010_root', 'sandbox');
if (!$conn) {
	$errorMessage = "Database connection failed: " . mysqli_connect_error();
	$success = false;
} else {
	if (array_key_exists('pp_id', $_GET)) {
		$result = set_tnx_status($conn, $_GET['pp_id'], 'cancelled');
	}
}

?>

<body>
	<table>

		<tr> <!-- Top Row -->
			<td colspan="2">
				<div class="header">
					<?php include '../includes/CommonHeader.php' ?>
					<img class="center" src="../images/PayPalCancel_bnr.gif" height="60" alt="PayPal Canceled">
				</div> <!-- header end -->
			</td>
		</tr>

		<tr><!-- Center Row -->

			<td>
				<div class="leftcol">
					<?php include '../includes/CommonMenu.php' ?>
				</div> <!-- leftcol End -->
			</td>

			<td class="col2">
				<div class="rightcol">
					<table>

						<tr>
							<td>
								<h1>Cancelled!</h1>
							</td>
						</tr>

						<tr>
							<td>Your Paypal Dues & Donation Payment was Cancelled.</td>
						</tr>

					</table>
				</div>
			</td>
		</tr>

		<tr> <!-- Bottom Row -->
			<td colspan="2">
				<div class="bottom">
					<?php include '../includes/CommonFooter.php'; ?>
				</div> <!-- bottom end -->
			</td>
		</tr> <!-- end Bottom Row -->

	</table>
</body>

</html>