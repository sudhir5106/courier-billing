<?php 
include('../../config.php'); 

require_once(PATH_LIBRARIES.'/classes/rate.php');
$rateClass = new rate();

/////////////***********  Total Amount Get For Bank     ************/////////////
if($_REQUEST['type']=='total_amount_get')
{
	
$bank_name=$_REQUEST['bank_name'];
$form_date=$_REQUEST['from_date'];
echo $sql="SELECT sum(`Payment_Received`) FROM `tbl_received_amt` WHERE `Payment_Mode`='cash' and `Payment_Date`<='2017-12-25' ";


}


/////////////***********  Total Amount Get For Bank End  ************////////////
?>