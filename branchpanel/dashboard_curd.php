<?php
require('../config.php');
require_once(PATH_LIBRARIES.'/classes/rate.php');
$rateClass = new rate();
require_once(PATH_LIBRARIES.'/classes/ps_pagination.php');

///*******************************************************
/// for Pending Amount To Generate Invoice  ///////////////////////////////////
///*******************************************************



?>

<?php
if($_REQUEST['type']=="Pending_amount")
{
 ?>

<form name="planresult" id="planresult">

   <?php 
        $date=date("Y-m-d");
    
 $sql="select a.`Client_id`, a.Client_Name,a. Address,a.Client_Code,( select max(Date_To) from `tbl_invoices` as c where a.`Client_id` = c.`Client_id` group by c.`Client_id` ) as Date_To,( select SUM(Total_Amount)  from `tbl_consignments` as b where a.`Client_id` = b.`Client_id` group by b.`Client_id` )as max_total_amount from tbl_clients as a   where a.Branch_Id='".$_SESSION['buser']."' group by a.`Client_id` ";

 $getUser=$rateClass->ExecuteQuery($sql);
 
		if($getUser){

   ?>       
        <table class="table table-hover table-bordered" id="addedProducts">
          <thead>
            <tr class="success">
              <th>Sno.</th>
              <th>Client Name </th>
              <th>Last Invoice Date</th>
              <th>Amount</th>
            </tr>
          </thead>
          <tbody>
            <?php 
			      $i=1;
     
		foreach($getUser as $val){  
                   
                      $date_to=$val['Date_To'];
                       $sqler= "SELECT Client_Id, SUM(Total_Amount) as amount FROM `tbl_consignments` WHERE Date_Of_Submit >
                       '$date_to' AND Date_Of_Submit <='".$date."' GROUP BY `Client_id` HAVING `Client_id`='".$val['Client_id']."'"; 
                 $resut=$rateClass->ExecuteQuery($sqler);
                 if(count($resut)>0){ 
                  
	               ?>
            <tr>
              <td ><?php echo $i;?></td>
              <td><?php echo '<strong>'.$val['Client_Name'].'</strong>-'.$val['Client_Code'].'<br>'.$val['Address']; ?></td>
              <td><?php echo $val['Date_To'];?></td>
              <td><?php echo $resut[1]['amount']; ?></td>
            </tr>
            <?php 
                         $i++;         }
                 
           }          
                 
            

          ?>
        
          </tbody>
        </table>
<?php 
         
}?>
</form>
<?php } ?>
<?php
       //////////////////////////////************FOR INVOICE NOT PAID******************////////////////////////////

if($_REQUEST['type']=="invoice_not_paid")
{
$con  = mysql_connect(SERVER, DBUSER, DBPASSWORD);
     $rows_per_page=23;
     $totpagelink=PAGELINK_PER_PAGE;
?>

<form name="planresult_new" id="planresult_new">
   <?php
    $sql_select_invoice="SELECT Client_Name, Client_Code,Client_Id  FROM tbl_clients  WHERE Branch_Id='".$_SESSION['buser']."'";
    $resultsql_select_invoice=$rateClass->ExecuteQuery($sql_select_invoice);

 if(isset($_REQUEST['page']) && $_REQUEST['page']>1)
    {
      
        $i=($_REQUEST['page']-1)*$rows_per_page+1;
    }
    else
    {
        $i=1;
    }
    $pager = new PS_Pagination($con,$sql_select_invoice,$rows_per_page,$totpagelink);
    $rs=$pager->paginate(); 

      if($resultsql_select_invoice){

       if(empty($rs)==false)
    {
   ?>
   <table class="table table-hover table-bordered" id="addedProducts">
          <thead>
            <tr class="success">
              <th>Sno.</th>
              <th>Client Name </th>
              <th> Invoice Number</th>
              <th>Amount</th>
            </tr>
          </thead>
          <tbody>
            <?php $Final_Total_Amt=0;
            $invoice_id="";
            // $j=1;
     //foreach($resultsql_select_invoice as $val)
              while($val=mysql_fetch_array($rs))
             {   $query="SELECT Invoice_Id,Invoice_No,Final_Total_Amt FROM tbl_invoices WHERE  Client_Id=".$val['Client_Id']." AND Payment_Status='0'"; 
                      $select_invoice=$rateClass->ExecuteQuery($query);
                      foreach($select_invoice as $invoice_select)
                      {
                        $tbl_pid_amount="SELECT  sum(Received_Amt) as amount FROM  
                         tbl_received_amt_details  WHERE  Invoice_Id=".$invoice_select['Invoice_Id'];
                        $select_invoice_paid=$rateClass->ExecuteQuery($tbl_pid_amount); 
                        $invoice_id.=$invoice_select['Invoice_No'].", ";
                        $Final_Total_Amt+=$invoice_select['Final_Total_Amt'];
                      if($select_invoice_paid[1]['amount'])
                        {
                          $Final_Total_Amt=$Final_Total_Amt-$select_invoice_paid[1]['amount'];
                        }
                       
                       }
                                                                  
                 ?>
            <tr>
              <td ><?php echo $i;?></td>
              <td><?php echo '<strong>'.$val['Client_Name'].'</strong>-'.$val['Client_Code'];?></td>
              <td><?php echo substr($invoice_id,0,-1) ;?></td>
              <td><?php echo $Final_Total_Amt; ?></td>
              
            </tr>
            <?php 
                   $i++;            
                               
             $invoice_id="";
             $Final_Total_Amt=0;
             $amount="";
             }    ?>                  
                                   
        </tbody>
        </table>
          <div class="text-center "> </div>  
         </form>

         <?php } //if(empty($rs)==false)?>
                      <div class="text-center">
      <?php echo  $pager->renderFullNav(); ?>
      </div> 
 <?php  }?>
 <input type="hidden" name="page" id="page" value="1"/>
 
 </form>



 <?php } ?>