<!DOCTYPE html>
<html lang="en">
    
    <head>
        <title>Dec 15 2023 07:56 pm pp</title>
        <meta charset="UTF-8">
        <meta name="description" content="Simple Tesr">
        <meta name="viewport"    content="width=device-width, initial-scale=1.0">
        <link href="../../www.coastsidearc.org/css/Layout.css" media="all" rel="stylesheet"  type="text/css">
        <link href="AppFormPostExample_n6sjf_B.css" media="all" rel="stylesheet"  type="text/css">
        
        <!-- Note: This webpage also refers to the following external php files for server actions
            AppForm_getFullName.php           -- looks up a FullName from `merged` database given callsign
            AppFormDB_Receptor_n6sjf.php      -- inserts transaction data into `pp_tnx` table

        -->
        <script>
            // Global Variables
            var jsondict = {};
            const receptorUrl = "AppFormDB_Receptor_n6sjf_B.php";
            var goodToGo = true;
            // End global Variables

            function urlExists(url) {
                var xhr = new XMLHttpRequest();
                xhr.open('HEAD', url, false);
                xhr.send();
                return (xhr.status != 404);
            }

            function myTest() {
                goodToGo = urlExists(receptorUrl);

                if(goodToGo) {
                    document.getElementById("Result").innerHTML = "The document exists";
                } else {
                    document.getElementById("Result").innerHTML = "The document does not exist";
                }
                
                if (goodToGo) {
                    // See if the url passes CORS preflight conditions
                    var xhrOptions = new XMLHttpRequest();
                    xhrOptions.open("OPTIONS", receptorUrl, true);
                    xhrOptions.setRequestHeader('Content-Type', 'application/json');
                    xhrOptions.onreadystatechange = function() {
                        if (this.readyState === 4) {
                            if (this.status === 200) {
                                // CORS preflight successful, proceed with your POST request
                                document.getElementById("Preflight").innerHTML = "Passed CORS preflight";
                            } else {
                                // Handle CORS error here
                                document.getElementById("Preflight").innerHTML = "Failed CORS preflight";
                                goodToGo = false;
                            }
                        }
                    };
                    xhrOptions.send();
                }
            }

            document.addEventListener("DOMContentLoaded", (event) => {
                myTest();
            });

        </script>
    </head>

    <body>
        <H3>The document status is given below</h3>
        <p>Click to trigger the test</p>
        <p id="Result"></p>
        <p id="Preflight"></p>
    </body>
</html>



