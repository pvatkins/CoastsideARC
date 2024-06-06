<!DOCTYPE html>
<html lang="en">

<head>
  <title>CARC_Net_Control_Roster.html</title>
  <link href="./css/Layout.css" media="all" rel="stylesheet">
  <link href="./css/CARC_Net_Control_Roster.css" media="all" rel="stylesheet">

  <!--
  <style>
  table {
    font-family: arial, sans-serif;
    border-collapse: separate;
    empty-cells: hide;
    width: 100%;
  }

  td, th {
    border: 1px solid black;
    text-align: left;
    padding: 4px;
  }
  </style>
-->

<!--
  <style>
  .c1, .c5 { text-align: center; width: 75px; }
  .c2, .c6 { text-align: center; width: 50px; }
  .c3, .c7 { text-align: left;   width: 180px; }
  .c4 { width: 50px; }
  </style>
-->
<script>
  months = ['January', 'February', 'March',     'April',   'May',      'June',
            'July',    'August',   'September', 'October', 'November', 'December'];
  // This table encodes the date of the first wednesday based on the 
  // day of the first of the month. 
  firstWed = [4, 3, 2, 1, 7, 6, 5];
  // this table gives the number of days in the month for a normal year.
  // february is extended by 1 day in leap years. The rule is that if the 
  // year is divisible by 100 and not divisible by 400, leap year is skipped. The year 2000 was a leap year, for example, but the years 1700, 1800, and 1900 were not.  The next time a leap year will be skipped is the year 2100.  
  daysInMo = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  
  function getListOfWednesdays(year,month) {
    let TheYear = year.toString();
    wedList = [];
    moString = (months[month-1]).toString();
    const refDate = new Date(moString + ' 1, ' + TheYear);
    firstWednesday = firstWed[refDate.getUTCDay()];
    if ((TheYear % 4) === 0) daysInMo[1] = 29;
      wedList = [];
    for (let iy = 0; iy < 5; iy++) {
      let putativeDate = iy*7 + firstWednesday;
      let condition = (putativeDate <= daysInMo[month-1]);
      if ((putativeDate ===  1) && (month===  1)) { condition = false; } // New Years Day
      if ((putativeDate === 25) && (month=== 12)) { condition = false; } // Christmas
      if (condition) { wedList.push((" " + putativeDate).slice(-2))};
    }
    return wedList;
  }

  function analyzeTheYear(year) {
    console.log("For the year " + year.toString());
    let C = [];
    for (let ix = 0; ix < 6; ix++) {
      let A = getListOfWednesdays(year,ix+1);
      let B = getListOfWednesdays(year,ix+7);
      while (A.length < B.length) { A.push ("--"); }
      while (B.length < A.length) { B.push ("--"); }
      C.push (A,B);
    }
    console.log(C);
  }

  for (let ix=2024; ix < 2035; ix++){
    analyzeTheYear(ix);
  }


</script>


<body class="relative">
  <div class="rost_grid">
    <div class="header">
      <?php
        include "../includes/CommonHeader.php";
      ?>
      <img class="center" src="../images/NetControlRoster_bnr.png" height="60" alt="2021 Net Control Roster" >
    </div> <!-- Header End -->


    <div class="middle">
      <table>

        <thead>
          <tr>
            <th class="c1">Month</th>
            <th class="c2">Day</th>
            <th class="c3">Net Control</th>
            <th class="c4"></th>
            <th class="c5">Month</th>
            <th class="c6">Day</th>
            <th class="c7">Net Control</th>
            </tr>
        </thead>

        <tbody>
          <!-- January/July 2024 -->
          <tr><td class="c1" rowspan="5">JAN</td> <td class="c2"> 3</td><td class="c3">Tom, KJ6OGL     </td><td></td>
              <td class="c5" rowspan="5">JUL</td> <td class="c6"> 3</td><td class="c7">Tom, KJ6OGL     </td></tr>

              <tr>                                <td class="c2">10</td><td class="c3">-- Meeting --   </td><td></td>
                                                  <td class="c6">10</td><td class="c7">-- Meeting --   </td></tr>

              <tr>                                <td class="c2">17</td><td class="c3">Tom, KJ6OGL     </td><td></td>
                                                  <td class="c6">17</td><td class="c7">Tom, KJ6OGL     </td></tr>

              <tr>                                <td class="c2">24</td><td class="c3">Ralph, KC6YDH   </td><td></td>
                                                  <td class="c6">24</td><td class="c7">Ralph, KC6YDH   </td></tr>

              <tr>                                <td class="c2">31</td><td class="c3">Tom, KJ6OGL     </td><td></td>
                                                  <td class="c6">31</td><td class="c7">Tom, KJ6OGL     </td></tr>


          <!-- February/August 2024 -->
          <tr><td class="c1" rowspan="4">FEB</td> <td class="c2"> 7</td><td class="c3">Steve, KN6ORM   </td> <td></td>
              <td class="c5" rowspan="4">AUG</td> <td class="c6"> 7</td><td class="c7">Steve, KN6ORM   </td> </tr>

              <tr>                                <td class="c2">14</td><td class="c3">-- Meeting --   </td><td></td>
                                                  <td class="c6">14</td><td class="c7">-- Meeting --   </td></tr>

              <tr>                                <td class="c2">21</td><td class="c3">Tom, KJ6OGL     </td><td></td>
                                                  <td class="c6">21</td><td class="c7">Tom, KJ6OGL     </td></tr>

             <tr>                                 <td class="c2">28</td><td class="c3">Ralph, KC6YDH   </td><td></td>
                                                  <td class="c6">28</td><td class="c7">Ralph, KC6YDH   </td></tr>

          <!-- March/September 2024 -->
          <tr><td class="c1" rowspan="4">MAR</td> <td class="c2"> 6</td><td class="c3">Tom, KJ6OGL     </td> <td></td>
              <td class="c5" rowspan="4">SEP</td> <td class="c6"> 4</td><td class="c7">Tom, KJ6OGL     </td></tr>

              <tr>                                <td class="c2">13</td><td class="c3">-- Meeting --   </td><td></td>
                                                  <td class="c6">11</td><td class="c7">-- Meeting --   </td></tr>

              <tr>                                <td class="c2">20</td><td class="c3">Tom, KJ6OGL     </td><td></td>
                                                  <td class="c6">18</td><td class="c7">Tom, KJ6OGL     </td></tr>

              <tr>                                <td class="c2">27</td><td class="c3">Ralph, KC6YDH   </td><td></td>
                                                  <td class="c6">25</td><td class="c7">Ralph, KC6YDH   </td></tr>

          <!-- April/October 2024 -->                                       
          <tr><td class="c1" rowspan="4">APR</td> <td class="c2"> 3</td><td class="c3">Steve, KN6ORM   </td> <td></td>
              <td class="c5" rowspan="5">OCT</td> <td class="c6"> 2</td><td class="c7">Steve, KN6ORM   </td> </tr>

              <tr>                                <td class="c2">10</td><td class="c3">-- Meeting --   </td><td></td>
                                                  <td class="c6"> 9</td><td class="c7">-- Meeting --   </td></tr>

              <tr>                                <td class="c2">17</td><td class="c3">Tom, KJ6OGL     </td><td></td>
                                                  <td class="c6">16</td><td class="c7">Tom, KJ6OGL     </td></tr>

              <tr>                                <td class="c2">24</td><td class="c3">Ralph, KC6YDH   </td><td></td>
                                                  <td class="c6">23</td><td class="c7">Ralph, KC6YDH   </td></tr>

              <tr>                                <td class="c2">  </td><td class="c3">                </td><td></td><td></td>
                                                  <td class="c6">30</td><td class="c7">Tom, KJ6OGL     </td></tr>
          <!-- May/November 2024 -->
          <tr><td class="c1" rowspan="5">MAY</td> <td class="c2"> 1</td><td class="c3">Tom, KJ6OGL     </td><td></td>
              <td class="c5" rowspan="4">NOV</td> <td class="c6"> 6</td><td class="c7">Tom, KJ6OGL     </td></tr>

              <tr>                                <td class="c2"> 8</td><td class="c3">-- Meeting --   </td><td></td>
                                                  <td class="c6">13</td><td class="c7">-- Meeting --   </td></tr>

              <tr>                                <td class="c2">15</td><td class="c3">Tom, KJ6OGL     </td><td></td>
                                                  <td class="c6">20</td><td class="c7">Tom, KJ6OGL     </td></tr>

              <tr>                                <td class="c2">22</td><td class="c3">Ralph, KC6YDH   </td><td></td>
                                                  <td class="c6">27</td><td class="c7">Ralph, KC6YDH   </td></tr>

              <tr>                                <td class="c2">29</td><td class="c3">Tom, KJ6OGL     </td></tr>
            
          <!-- June/December 2024 -->
          <tr><td class="c1" rowspan="4">JUN</td> <td class="c2"> 5</td><td class="c3">Steve, KN6ORM   </td><td></td>
              <td class="c5" rowspan="3">DEC</td> <td class="c6"> 4</td><td class="c7">Steve, KN6ORM   </td></tr>

              <tr>                                <td class="c2">12</td><td class="c3">-- Meeting --   </td><td></td>
                                                  <td class="c6">11</td><td class="c7">-- Meeting --   </td></tr>

              <tr>                                <td class="c2">19</td><td class="c3">Tom, KJ6OGL     </td><td></td>
                                                  <td class="c6">18</td><td class="c7">Tom, KJ6OGL     </td></tr>

              <tr>                                <td class="c2">26</td><td class="c3">Ralph, KC6YDH   </td><tr>
        </tbody>
      </table>
    </div> <!-- end middle -->

    <div class="bottom">
      <?php include '../includes/CommonFooter.php'; ?>
    </div> <!-- bottom end -->
  </div><!-- end contdex_3 -->
<br><br><br>
</body>
</html>
