<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<link href="/www.coastsidearc.org/css/Layout.css" media="all" rel="stylesheet">
	<link href="/www.coastsidearc.org/css/Coastside_Communicator.css" media="all" rel="stylesheet">
</head>

<body>
	<table>
		<tr>
			<td colspan="2">
				<div class="header">
					<?php include '../../../includes/CommonHeader.php'; ?>
				<img class="center" src="/images/Communicator_blitz110_bnr.gif" height="60" alt="AboutCARC">
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
					<hr>
					These "pdf" files can be read with Adobe Acrobat Reader.
					<hr><br>
					<a href="CARC%20Newsletter%2001%20January%202022.pdf">January 2022</a><br>

					<!--
					<a href="CARC%20Newsletter%2002%20February%202022.pdf">February 2019</a><br>
					<a href="CARC%20Newsletter%2003%20March%202022.pdf">March 2019</a><br>
					<a href="CARC%20Newsletter%2004%20April%202022.pdf">April 2019</a><br>
					<a href="CARC%20Newsletter%2005%20May%202022.pdf">May 2019</a><br>
					<a href="CARC%20Newsletter%2006%20June%202022.pdf">June 2019</a><br>
					<a href="CARC%20Newsletter%2007%20July%202022.pdf">July 2019</a><br>
					<a href="CARC%20Newsletter%2008%20August%202022.pdf">August 2019</a><br>
					<a href="CARC%20Newsletter%2009%20September%202022.pdf">September 2019</a><br>
					<a href="CARC%20Newsletter%2010%20October%202022.pdf">October 2019</a><br>
					<a href="CARC%20Newsletter%2011%20November%202022.pdf">November 2019</a><br>
					<a href="CARC%20Newsletter%2012%20December%202022.pdf">December 2019</a><br><br> -->
					<hr>
					&nbsp;
					<a href="../previous_years.php"">Previous Years</a><br>
					<p><a href="http://get.adobe.com/reader/">
							<img src="../../../www.adobe.com/get_adobe_reader.png" alt="Get Adobe Reader" border="0"></a></p>
				</div> <!-- rightcol end -->
			</td>
		</tr>
		<p>Join CARC</p>

		<p> CARC membership dues are $20 per year for the first member
		    in a family that signs up, and $3 per year for additional
		    family members. Payment may be made using PayPal, any major
		    credit card, or by personal check.
		  <div>
		    <ul>
		      <li> Pay Online: Scroll down and enter your membrship Information
		           on the form provided for our membership records. Onde you click
		           on the "Submit and Continue" button, we will collect your payment.
		      </li>

		      <li> SnailMail option: Download your membership application (PDF fill-in
		           form). Fill it out, print it, and mail to us with your personal check
		           the instructions in the document.
		      </li>
		    </ul>
		  </div>
		</p>
		<p>
		  <div>
		    Name: <input type="text" name="name" value="<?php echo $name;?>">

		    E-mail: <input type="text" name="email" value="<?php echo $email;?>">

		    Website: <input type="text" name="website" value="<?php echo $website;?>">

		    Comment: <textarea name="comment" rows="5" cols="40"><?php echo $comment;?></textarea>

		    Gender:
		      <input type="radio" name="gender"
		      <?php if (isset($gender) && $gender=="female") echo "checked";?>
		      value="female">Female
		     <input type="radio" name="gender"
		     <?php if (isset($gender) && $gender=="male") echo "checked";?>
		     value="male">Male
		     <input type="radio" name="gender"
		     <?php if (isset($gender) && $gender=="other") echo "checked";?>
		     value="other">Other
		  </div>
		</p>
		<tr>
			<td colspan="3">
				<div class="bottom">
	        <?php include '../includes/CommonFooter.php'; ?>
	      </div> <!-- bottom end -->
			</td>
		</tr>
	</table>
</body>

</html>
