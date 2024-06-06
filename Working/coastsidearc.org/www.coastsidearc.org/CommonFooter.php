<!-- **** This fragment is: /includes/CommonFooter.php -->
<?php
  $filename = $_SERVER['SCRIPT_FILENAME'];
  $filemtime = filemtime($filename);

  $footertext = "For questions or comments about this website:
      Contact webmaster at: <a href='mailto:info@CoastsideARC,org'>info@CoastsideARC.ORG</a>
      <br>Copyright &copy; 2000-" . date("Y",$filemtime) . ", Coastside Amateur Radio Club,
      All Rights Reserved";

  echo "Last modified: " . date("F d, Y H:i:s",$filemtime) . "<br>";
  // echo "Pre-Filename" . "<br>";
  // echo "Filename: " . $filename . "<br>";
  echo $footertext;
?>
<!-- **** End of fragment: /includes/CommonFooter.php -->
