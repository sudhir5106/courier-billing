<?php
require('../config.php');
require_once(PATH_LIBRARIES.'/classes/rate.php');
$rateClass = new rate();
include_once(BRANCH_PATH_ADMIN_INCLUDE.'/header.php');


$con  = mysql_connect(SERVER, DBUSER, DBPASSWORD);
     $rows_per_page=ROWS_PER_PAGE;
     $totpagelink=PAGELINK_PER_PAGE;


$date=date("Y-m-d");
?>
<script type="text/javascript"  src="dashborad.js"></script>


<script>
  $( document ).ready(function() {
     var x;
      $.ajax({
         type: "GET",
         url: "dashboard_curd.php",
         data: {type:"Pending_amount"},
         async: false,
         success: function(data){ //alert(data);
           x=data;
         $('#detail').html(data);
         }
         });


     $.ajax({
         type: "GET",
         url: "dashboard_curd.php",
          data: {type:"invoice_not_paid"},
         async: false,
         success: function(data){ //alert(data);
           x=data;
           $('#full_amount_not_paid').html(data);
         }
         });





  });


</script>

<style>
#detail {
    
   
    border: 1px dotted black;
    overflow: scroll;
}
</style>




 <div id="loader">
    <div class="loader-block"><i class="fa-li fa fa-spinner fa-spin spinloader"></i></div>
</div>


<div class="pageTitle">	
	<h1 class="pull-left">Dashboard</h1>
    <div class="clearfix"></div>
</div>

<div class="main">
    <div class="col-sm-6">
      <div>
        <h5>Pending amount to generate invoice</h5>
      </div>
    	<div id="detail"></div>
    </div>

    <div class="col-sm-6">
      <div>
        <h5>Pending Amount To Receive</h5>
      </div>
  	  <div id="full_amount_not_paid"></div>
    </div>
    
    <div class="clearfix"></div>
	
</div>
