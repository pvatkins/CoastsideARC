<head>
        <title>AppFormPaymentDB</title>
        <meta charset="UTF-8">
        <meta name="description" content="Page for Dues Renewal and PayPal interface">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/Layout.css"           media="all" rel="stylesheet"  type="text/css">
        <link href="css/AppFormPaymentDB.css" media="all" rel="stylesheet"  type="text/css">
</head>
<body>
    <?php
        $data = json_decode(file_get_contents('php://input') true);
        $date         = $data->date;
        $years        = $data->years;
        $callsigns    = $data->callsigns;
        $primary      = $data->primary;
        $family       = $data->family;
        $repeater     = $data->repeater;
        $digipeater   = $data->digipeater;
        $subtotal     = $data-> subtotal;
        $checkbox     = $data->checkbox;
        $newchecked   = $DATA->newchecked;
        $paypalfee    = $DATA->paypalfee;
        $clubreceives = $DATA->clubreceives;
        $total        = $DATA->total;
    ?>
    <p>Years: <?php echo $years; ?></p>
</body>

