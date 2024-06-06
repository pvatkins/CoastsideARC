<!DOCTYPE html>
<html lang="en">

<head>
	<title>Repeater_Usage.php</title>
	<meta charset="UTF-8">
	<link href="css/Layout.css" media="all" rel="stylesheet">
	<link href="css/Repeater_Usage.css" media="all" rel="stylesheet">
</head>

<body>
	<table>
		<tr>
			<td colspan="2">
				<div class="header">
					<?php include '../includes/CommonHeader.php' ?>
					<img class="center" src="../images/Repeater_Usage_blitz110_bnr.gif" height="60" alt="AboutCARC">
				</div> <!-- header end -->
			</td>
		</tr>
		<tr>
			<td>
				<div class="leftcol">
					<?php include '../includes/CommonMenu.php' ?>
				</div> <!-- leftcol End -->
			</td>
			<td>
				<div class="rightcol">
					WA6TOW REPEATER - Copyright 2017-2019<br>
					This page, and data, are provided as-is with no warranties either expressed or implied.
					This data is for informational and non-commercial use only. Copyright 2010-2019.
					Coastside Amateur Radio Club<br><br>
					<pre>
						<script>
							document.write('<div class="scriptex">');
							var Months = ["January","February","March","April","May","June",
										"July","August","September","October","November","December"];
							var dt = new Date(); //Date constructor
							var month = dt.getMonth();
							var year  = dt.getFullYear();
							var ix;
							document.writeln('Select month from list below:');
							for (ix=0; ix <= month; ix++) {
									s1 = "https://audio.stickerburr.net/files/"+(ix+1) + "_"+year+"/index.html";
									s2 = "WA6TOW Repeater activity report for " + Months[ix] + ", " + year + "</a>";
									document.writeln('<a href=' + s1 + '>' + s2 );
							}
							document.writeln('</div>');
						</script>
					</pre>
				</div> <!-- rightcol ends -->
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<div class="bottom">
	        <?php include '../includes/CommonFooter.php'; ?>
	      </div> <!-- bottom end -->
			</td>
		</tr>
	</table>
</body>
</html>
