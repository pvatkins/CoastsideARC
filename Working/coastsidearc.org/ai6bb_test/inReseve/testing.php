<!DOCTYPE html>
<html lang="en">
<script>

/* Some notes

   The first event to be concerned with is when is the document loaded.

   When the `submit` button is pressed it will cause an event, `getName`, 
   to be fired by the user's browser. The first event will be for the lookup
   of the user's FullName from the `merge` table of the database. The remote 
   php file to assist in thes operation is `AppForm_getFullName.php`. 
   
   Upon completion of the lookup operation, meaning that the `FullName` 
   has been entered into the `jsondict`, a synthetic event, "dbinsert" 
   is triggered to cause all of the data in `jsondict` to be inserted 
   into the pp_tnx' table. The remote php file to assist in this operation
   is `AppFormDB_Receptor_n6sjf_B.php`.
 
   Upon entering the data into the 'pp_tnx` table, another synthetic 
   event is triggered to display the last 5 lines of the `pp_tnx` table. 
   which is displayed in the `verification` section of the webpage. The
   routine to do this is ``.
*/

if (document.readySytate === "loading") {
    // loading hasn't finished yet
    document.addEventListener('DOMContentLoaded', doSomething());
} else {
    // DomContentLoaded has already fired
    doSomething();
}



function doSomething() {
    var form = document.querySelector('form');
    form.addEventListener('getName', function(nameevent) {
        // Do something with the form element.
        nameevent.preventDefault();
        var jsonString = JSON.stringify(jsondict['primarycall']);
        // display the jsonString
        document.getElementById("fnjsonout").innerHTML = jsonString;
        // Send the JSON data to the server.
        var xhr = new XMLHttpRequest(); 
        xhr.onreadystatechange = function() {
            document.getElementById("fnrdystat").innerHTML=this.readyState.concat(" - ", this.status);
            document.getElementById("fnrespcode").innerHTML = jsonString;
            if (this.readyState ==  4 && this.status == 200) {
                jsondict['FullName'] = this.result;
                var m1, m2, m3, m4; 
                var response=this.response;
                if (response == '\r\n') {
                    m1 = "Success: failed";
                    m2 = "ErrorMsg: just \\r\\n";
                    m3 = "The SQL query never came down from the server";
                } else {
                    var pdata = JSON.parse(response);
                    m1 = "Success: ".concat(pdata.success);
                    m2 = "ErrorMsg: ".concat(pdata.errorMessage);
                    m4 = response; 
                }  
                document.getElementById("fnrespcode").innerHTML = m1.concat(",<br>", m2);   
                document.getElementById("fnresponse").innerHTML = m4;
                const event = new Event("dbinsert"); // Trigger the next event
            }
        }
        xhr.open("POST", "AppForm_getFullName.php", true,)
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.send(jsonString);
    }); // end form.addEventListener('getName', function(nameevent))


    form.addEventListener('dbinsert', function(dbinsert){
        // Do something with the form element.
        dbinsert.preventDefault();
        jsonString = JSON.stringify(jsondict); // now the whole dict
        // display the jsonString
        document.getElementById("jsonout").innerHTML = jsonString;
        // Send the JSON data to the server.
        xhr = new XMLHttpRequest(); 
        xhr.onreadystatechange = function() {  // a new instance
            document.getElementById("rdystat").innerHTML=this.readyState.concat(" - ", this.status);
            document.getElementById("respcode").innerHTML = jsonString;
            if (this.readyState ==  4 && this.status == 200) {
                jsondict['FullName'] = this.result;
                var m1, m2, m3, m4;
                response=this.response;
                if (response == '\r\n') {
                    m1 = "Success: failed";
                    m2 = "ErrorMsg: just \\r\\n";
                    m3 = "The SQL query never came down from the server";
                } else {
                    var pdata = JSON.parse(response);
                    m1 = "Success: ".concat(pdata.success);
                    m2 = "ErrorMsg: ".concat(pdata.errorMessage);
                    m4 = response; 
                }  
                document.getElementById("fnrespcode").innerHTML = m1.concat(",<br>", m2);   
                document.getElementById("fnresponse").innerHTML = m4;
                const event = new Event("validate"); // Trigger the next event
            }
        }
        xhr.open("POST", "AppForm_getFullName.php", true,)
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.send(jsonString);
    }); //end form.addEventListener('dbinsert', function(dbinsert))

    form.addEventListener('validte', function(validate) {
        validate.preventDefaut();
        var table = document.getElementById('tab1');
        if (table != null) {
            var parentEl = table.parentElement;
            parentEl.removeChild(removeTab);
        }

        table = document.createElement('table');
        table.setAttribute('id','tab1')
        var tr = document.createElement('tr');

        var header = table.createTHead();
        var th01 = document.createElement('th');
        var th02 = document.createElement('th');
        var th03 = document.createElement('th');
        var th04 = document.createElement('th');
        var th05 = document.createElement('th');
        var th06 = document.createElement('th');
        var th07 = document.createElement('th');
        var th08 = document.createElement('th');
        var th09 = document.createElement('th');
        var th10 = document.createElement('th');
        var th11 = document.createElement('th');
        var th12 = document.createElement('th');
        var th13 = document.createElement('th');

        th01.appendChild('indx');
        th02.appendChild('name');
        th03.appendChild('date');
        th04.appendChild('yrs');
        th05.appendChild('clsgns');
        th06.appendChild('prmry');
        th07.appendChild('fmly');
        th08.appendChild('rptr');
        th09.appendChild('dgptr');
        th10.appendChild('sbttl');
        th11.appendChild('pyplfe');
        th12.appendChild('clbrcvs');
        th13.appendChild('ttl');
        <?php            
            $query = '(SELECT * FROM pp_tnx ORDER BY myindex DESC LIMIT 5) ORDER BY myindex ASC';
            $result = send($conn, $query);
            while ($row = $result->fetch_assoc) { ?> 

                var tr = document.createElement('tr');

                var td01 = document.createElement('td');
                var td02 = document.createElement('td');
                var td03 = document.createElement('td');
                var td04 = document.createElement('td');
                var td05 = document.createElement('td');
                var td06 = document.createElement('td');
                var td07 = document.createElement('td');
                var td08 = document.createElement('td'); 
                var td09 = document.createElement('td');
                var td10 = document.createElement('td');
                var td11 = document.createElement('td');
                var td12 = document.createElement('td');
                var td13 = document.createElement('td');

                var txt01 = document.createTextNode('<?php echo $row['myindex']      ?>');
                var txt02 = document.createTextNode('<?php echo $row['fullname']     ?>');
                var txt03 = document.createTextNode('<?php echo $row['mydate']       ?>');
                var txt04 = document.createTextNode('<?php echo $row['years']        ?>');
                var txt05 = document.createTextNode('<?php echo $row['callsigns']    ?>');
                var txt06 = document.createTextNode('<?php echo $row['primary']      ?>');
                var txt07 = document.createTextNode('<?php echo $row['family']       ?>');
                var txt08 = document.createTextNode('<?php echo $row['repeater']     ?>');
                var txt09 = document.createTextNode('<?php echo $row['digipeater']   ?>');
                var txt10 = document.createTextNode('<?php echo $row['subtotal']     ?>');
                var txt11 = document.createTextNode('<?php echo $row['paypalfee']    ?>');
                var txt12 = document.createTextNode('<?php echo $row['clubreceives'] ?>');
                var txt13 = document.createTextNode('<?php echo $row['total']        ?>');

                td01.appendChild(txt01);
                td02.appendChild(txt02);
                td03.appendChild(txt03);
                td04.appendChild(txt04);
                td05.appendChild(txt05);
                td06.appendChild(txt06);
                td07.appendChild(txt07);
                td08.appendChild(txt08);
                td09.appendChild(txt09);
                td10.appendChild(txt10);
                td11.appendChild(txt11);
                td12.appendChild(txt12);
                td13.appendChild(txt13);

                tr.appendChild(td01);
                tr.appendChild(td02);
                tr.appendChild(td03); 
                tr.appendChild(td04);
                tr.appendChild(td05);
                tr.appendChild(td06);   
                tr.appendChild(td07);
                tr.appendChild(td08);
                tr.appendChild(td09);   
                tr.appendChild(td10);
                tr.appendChild(td11);
                tr.appendChild(td12);  
                tr.appendChild(td13);
                table.appendChild(tr);
            <?php }
        ?>
        document.body.appendChild(table);
    }); //end form.addEventListener('validate', function(validate))
} // end doSomething()












