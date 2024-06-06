<!DOCTYPE html>
<html lang="en">

<head>
  <title>Repeater Calendar.php</title>
  <meta charset="UTF-8">
  <link href="./css/Layout.css" media="all" rel="stylesheet">
  <link href="./css/Repeater_Calendar.css" media="all" rel="stylesheet">
</head>

<body>
  <table>
    <tr>
      <td colspan="2">
        <div class="header">
          <?php include '../includes/CommonHeader.php'; ?>
          <img class="center" src="../images/Calendar_blitz110_bnr.gif" height="60" alt="AboutCARC">
        </div> <!-- header end -->
      </td>
    </tr>

    <tr>
      <td class="col1">
        <div class="leftcol">
          <?php include '../includes/CommonMenu.php'; ?>
        </div> <!-- leftcol end -->
      </td>
      <td class="col2">
        <!-- <div class="rightcol"> -->
          <iframe width="522px" height="392px"
                  src="https://calendar.google.com/calendar/embed?src=coastsidearc%40gmail.com&amp;ctz=America/Los_Angeles">
          </iframe>
        <!-- </div><!-- rightcol end -->
      </td>
    </tr>
    <tr>
      <td colspan="2">
        <div class="bottom">
          <?php include "../includes/CommonFooter.php"; ?>
				</div> <!-- bottom end -->
      </td>
    </tr>
  </table><!-- contdex_4 end -->
</body>

</html>
