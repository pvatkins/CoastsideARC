<!-- **** This fragment is: /includes/CommonHeader.php -->
<!-- Introduce header images and label 'logo' used to detect mouse-click -->
<img class="center" src="/images/shim.gif" alt="" height="10" width="780">
<img class="center" id="logo" src="/logo/wa6tow-logo.gif" alt="" width="135" height="135">
<img class="center" src="/images/shim.gif" alt="" height="10">

<script>
  window.onload = addListeners;

  function addListeners(){
    document.getElementById('logo').addEventListener("click",GoToHomePage,false);
    var img = document.createElement('img');
    img.setAttribute('src', '../logo/wa6tow-logo.gif');
  }

  // Functions associated with return to home page
  hostname = window.location.origin; // can be deleted, for debug

  function GoToHomePage() {
    window.location.href = window.location.origin;
  }
</script>
<!-- **** End of fragment: /includes/CommonHeader.php -->
