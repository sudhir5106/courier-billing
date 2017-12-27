<?php
require('../config.php');
require_once(PATH_LIBRARIES.'/classes/rate.php');
$rateClass = new rate();
require_once(PATH_LIBRARIES.'/classes/ps_pagination.php');

$con  = mysql_connect(SERVER, DBUSER, DBPASSWORD);
     $rows_per_page=23;
     $totpagelink=PAGELINK_PER_PAGE;



?>

<form name="planresult_new" id="planresult_new">

 
  <?php
      
  
  
    echo $sql_select_invoice="SELECT Client_Name, Client_Code,newtable.mysum,cus.amount_paid,latest_invoice.invoice_number,FORMAT((newtable.mysum-ifnull(cus.amount_paid, 0)),3) as final_amount from tbl_clients left JOIN ( SELECT Client_Id, SUM(Final_Total_Amt) AS mysum FROM tbl_invoices where Client_Id in (SELECT Client_Id from tbl_clients ) GROUP BY Client_Id ) newtable on tbl_clients.Client_Id=newtable.Client_Id left JOIN ( SELECT Client_Id,GROUP_CONCAT(Invoice_No) as invoice_number FROM tbl_invoices where Client_Id in (SELECT Client_Id from tbl_clients )GROUP BY Client_Id ) latest_invoice on tbl_clients.Client_Id=latest_invoice.Client_Id left JOIN ( SELECT Invoice_Id,Client_Id, SUM(Paid_Amount) AS amount_paid FROM tbl_invoice_paid_amount where Invoice_Id in (SELECT Invoice_Id from tbl_invoices ) GROUP BY Invoice_Id) cus on cus.Client_Id = tbl_clients.Client_Id where Branch_Id='".$_SESSION['buser']."'";

  $resultsql_select_invoice=$rateClass->ExecuteQuery($sql_select_invoice);

 //$getUser=$rateClass->ExecuteQuery($sql);
   if(isset($_REQUEST['page']) && $_REQUEST['page']>1)
		{
			$i=($_REQUEST['page']-1)*$rows_per_page+1;
			
		}
		else
		{
			$i=1;
			
		}
		$pager2 = new PS_Pagination($con,$sql_select_invoice,$rows_per_page,$totpagelink);
		$rs=$pager2->paginate();
		if($resultsql_select_invoice){

   ?>

<div><h5> Full Amount Not Paid To  Generate Invoice</h5></div>

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
            <?php 
             $i=1;
     
				 if(empty($rs)==false)
		    {
		while($val=mysql_fetch_array($rs))  {  
                           if(!empty($val['invoice_number']))
                                { 
                                              
                 ?>
            <tr>
              <td ><?php echo $i;?></td>
              <td><?php echo '<strong>'.$val['Client_Name'].'</strong>-'.$val['Client_Code'];?></td>
              <td><?php echo $val['invoice_number'];?></td>
              <td><?php echo $val['final_amount']; ?></td>
            </tr>
            <?php 
                   $i++;       }      
                                     }     
      }
                                               
                                               
                             ?>                  
                                   
            
        </tbody>
        </table>
          <div class="text-center "> <?php echo $pager2->renderFullNav(); ?></div>  
         

          <?php              }          ?>
        
        <input type="hidden" name="page" id="page" value="1" class="page"/>
         </form>