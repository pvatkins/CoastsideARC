<!DOCTYPE html>
<html lang="en">

<head>
	<title>AboutCARC.php</title>
	<meta charset="UTF-8">
	<link href="css/Layout.css" media="all" rel="stylesheet">
	<link href="css/aboutcarc.css" media="all" rel="stylesheet">
</head>

<body>
	<table id="Table1">
		<table>
			<tr>
				<!-- Top Row -->
				<td colspan="2">
					<div class="header">
						<?php include '../includes/CommonHeader.php'; ?>
						<img class="center" src="../images/AboutCARC_2021_bnr.png" height="60" alt="About CARC">
					</div> <!-- header end -->
				</td>
			</tr>

			<tr>
				<!-- Center Row -->
				<td>
					<div class="leftcol">
						<?php include '../includes/CommonMenu.php' ?>
					</div> <!-- leftcol End -->
				</td>

				<td class="col2">
					<div class="rightcol">
						<p><b>
								The Coastside Amateur Radio Club (CARC) is affiliated with
								the <a href="http://www.arrl.org/">ARRL</a> and normally meets on
								the second Wednesday of each month at 1930 hours in the Linda Mar Fire
								Station Community Room on Linda Mar Boulevard in Pacifica.
								Please check the <a href="./Coming%20Events.php">Coming Events</a>
								page for any exceptions.
								Visitors are welcome.<br><br>

								The CARC has been organized since 1959, serving Bay Area amateurs
								and providing emergency communication services to the City of
								Pacifica. Membership dues are $20.00 per year for the administration
								of the Club and publication of the Communicator.
								<br><br>

								The CARC supports two repeaters and a Packet digipeater on the North
								Peak of Montara Mountain altitude 1900 feet located on the border
								of Pacifica and Montara:<br><br>

								2 meter repeater WA6TOW/R on 146.925 minus offset 600kHz<br><br>

								70cm repeater WA6TOW/R on 441.075 positive offset 5MHz<br><br>

								PL Tone of 114.8Hz used on both repeaters as needed for noise
								suppression<br><br>

								Packet Digipeater WA6TOW-1 on 145.05. Packet Node PAC.
							</b></p>
						<hr>
					</div> <!-- rightcol end -->
				</td>
			</tr> <!-- Middle row end -->
		</table>
		<table id="Table2">
			<caption>
				COASTSIDE VHF NETS
			</caption>
			<tr>
				<th class="ca1">Day</th>
				<th class="ca2">Time</th>
				<th class="ca3">Repeater/Frequency</th>
				<th class="ca4">Group/Contact</th>
			</tr>
			<tr>
				<td class="ca1">SUN</td>
				<td class="ca2">7:00AM</td>
				<td class="ca3">WA6TOW(146.925 PL114.8)</td>
				<td class="ca4">Knights of the Megahertz Net<br>
					Kelly Tuttle: wb6aaj626@gmail.com</td>
			</tr>
			<tr>
				<td class="ca1">MON</td>
				<td class="ca2">7:00PM</td>
				<td class="ca3">WA6TOW(146.925 PL114.8)</td>
				<td class="ca4">Pacifica CERT Net</td>
			</tr>
	
			<tr>
				<td class="ca1" rowspan="2">TUE</td>
				<td class="ca2">7:30PM</td>
				<td class="ca3">WA6TOW(146.925 PL114.8)</td>
				<td class="ca4">Daly City Net<br>
								Tom Oliver, KJ6OGL:<br>
								toliver0557@gmail.com</td>
			</tr>
			<tr>
				<td class="ca2">8:00PM</td>
				<td class="ca3">WA6TOW(146.925 PL114.8)<br>
					KC6ULT(146.865 PL114.8)</td>
				<td class="ca4">San Mateo County OES Net<br>
					Dan Bennett:dgbennett@smcgov.org</td>
			</tr>
			<tr>
				<td class="ca1">WED</td>
				<td class="ca2">8:00PM</td>
				<td class="ca3">WA6TOW(146.925 PL114.8)</td>
				<td class="ca4">CARC Wednesday Night Checkin<br>
								Tom Oliver, KJ6OGL:<br>
								toliver0557@gmail.com</td>
			</tr>
			<tr>
				<td class="ca1">SAT</td>
				<td class="ca2">10:00AM</td>
				<td class="ca3">WA6TOW(146.925 PL114.8)</td>
				<td class="ca4">QCWA-11 Saturday Morning Group<br>
					Al Montoya: ferel@att.net</td>
			</tr>
		</table>
		<table id="Table2A">
			<caption>
				COASTSIDE HF NETS
			</caption>
			<tr>
				<th class="ca1">Day</th>
				<th class="ca2">Time</th>
				<th class="ca3">Repeater/Frequency</th>
				<th class="ca4">Group/Contact</th>
			</tr>
			<tr>
				<td class="ca1">MON</td>
				<td class="ca2">8:30PM</td>
				<td class="ca3">HF: 1908&#x00B1;kHz</td>
				<td class="ca4">160 Meter Net</td>
			</tr>
			<tr>
				<td class="ca1">WED</td>
				<td class="ca2">8:30PM</td>
				<td class="ca3">HF: 1908&#x00B1;kHz</td>
				<td class="ca4">160 Meter Net</td>
			</tr>
			<tr>
				<td class="ca1">FRI</td>
				<td class="ca2">8:30PM</td>
				<td class="ca3">HF: 1908&#x00B1;kHz</td>
				<td class="ca4">160 Meter Net</td>
			</tr>
			<tr>
				<td class="ca1">SAT</td>
				<td class="ca2">9:00AM</td>
				<td class="ca3">HF: 3.852MHz or up<br>
					Alt: 7227.5kHz</td>
				<td class="ca4">QCWA-11 Saturday Morning Group<br>
					Bill Lillie:N6BCT@ARRL.NET</td>
			</tr>
		</table>

		<table id="Table3">
			<tr>
				<td>
					<div class="bottom">
		        <?php include '../includes/CommonFooter.php'; ?>
		      </div> <!-- bottom end -->
				</td>
			</tr>
		</table>
</body>

</html>
