<!DOCTYPE html>
<html lang="en">

<head>
	<title>PayPal Success</title>
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

function get_tnx_response($conn, $pp_id)
{
	$sql = <<<GETDATA
	select pp_response FROM `pp_tnx` WHERE `pp_id` = '$pp_id'
	GETDATA;
	return send($conn, $sql);
}

$pp_resp="init";
$conn = new mysqli('mysql.pauatk5.dreamhosters.com', 'carcuser', 'gobbledegook', 'carcmbrlst_20231017');
// $conn = new mysqli('db', 'root', 'qzpm1010_root', 'sandbox');
if (!$conn) {
	$errorMessage = "Database connection failed: " . mysqli_connect_error();
	$success = false;
} else {
	if (array_key_exists('pp_id', $_GET)) {
		$pp_resp = get_tnx_response($conn, $_GET['pp_id'])->fetch_assoc()['pp_response'];
	}
}

?>

<body>
	<table>

		<tr> <!-- Top Row -->
			<td colspan="2">
				<div class="header">
					<?php include '../includes/CommonHeader.php' ?>
					<img class="center" src="../images/PayPalSuccess_bnr.gif" height="60" alt="PayPal Success">
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
								<h1>Success!</h1>
							</td>
						</tr>

						<tr>
							<td>Your Paypal Dues & Donation Payment was Successful!</td>
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