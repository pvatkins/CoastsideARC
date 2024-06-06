<!DOCTYPE html>
<html lang="en">
<!-- xmlns="http://www.w3.org/1999/xhtml" class="fa-events-icons-ready"> -->
<!-- This form is dedicated to the PayPal payment process and is currently set up
    in a Sandbox account  as shown below:

    PayPal Sandbox Business Account
    sb-t9ga4322172945@business.example.com

    Client ID
    AbLxkYSsxq6S6f1l-C9Fpcywu8jbgdo3UhfYSXTs3QEhArTDgE3nV9S54bPNK_tK2_iLApQuthOkG2ps

    SECRET
    ELaFd9dPSo7Ro-hoxgpwYj7Yu6rTHyYkesoMzpSV74RJm1Kkm6cuNPpB--SnHjjd3ewU1b0VTXyUaoaD

    This form takes its input from AppFormQuick.php, and the following data is sent via the HTTP
    POST method, hiding the details of the transaction.

-->
<head>
	<title>AppFormPayment.php</title>
	<meta charset="UTF-8">

    <!-- The little php code in the links below force the css shhets to reload each time -->
    <link href="css/Layout.css?v=<?php echo time();?>"         media="all" rel="stylesheet" type="text/css">
    <link href="css/AppFormPayment.css?v=<?php echo time();?>" media="all" rel="stylesheet" type="text/css">

    <script src="https://www.paypal.com/sdk/js?client-id=sb&enable-funding=venmo&currency=USD" 
            data-sdk-integration-source="button-factory">
    </script>

    <script>
        function initPayPalButton() {
            paypal.Buttons({
                style: {
                    shape: 'pill',
                    color: 'gold',
                    layout: 'vertical',
                    label: 'paypal',
            },

        createOrder: function(data, actions) {
        return actions.order.create({
            purchase_units: [{"amount":{"currency_code":"USD","value":1}}]
        });
        },

        onApprove: function(data, actions) {
        return actions.order.capture().then(function(orderData) {
            
            // Full available details
            console.log('Capture result', orderData, JSON.stringify(orderData, null, 2));

            // Show a success message within this page, e.g.
            const element = document.getElementById('paypal-button-container');
            element.innerHTML = '';
            element.innerHTML = '<h3>Thank you for your payment!</h3>';

            // Or go to another URL:  actions.redirect('thank_you.html');
            
        });
        },

        onError: function(err) {
        console.log(err);
        }
    }).render('#paypal-button-container');
    }
    </script>
</head>

<body>
    <table>

        <!-- A test container -->
        
        <tr>
            <td colspan="2">
                <div id="smart-button-container">
                    <div style="text-align: center;">
                        <div id="paypal-button-container"></div>
                    </div>
                </div>
            </td>
        </tr>
    
        <!-- The footer -->
		<tr>
			<td colspan="2">
				<div class="bottom">
					<?php include '../includes/CommonFooter.php'; ?>
				</div> <!-- bottom end -->
			</td>
		</tr>

	</table>
    <script>initPayPalButton();</script>
</body>
</html>