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
             $j=1;
     //foreach($resultsql_select_invoice as $val)
              while($val=mysql_fetch_array($rs))
				     {   $query="SELECT Invoice_Id,Invoice_No,Final_Total_Amt FROM tbl_invoices WHERE  Client_Id=".$val['Client_Id']." AND Payment_Status='0'"; 
                      $select_invoice=$rateClass->ExecuteQuery($query);
                      foreach($select_invoice as $invoice_select)
                      {
                        $tbl_pid_amount="SELECT  sum(Paid_Amount) as amount FROM  
                         tbl_invoice_paid_amount  WHERE  Invoice_Id=".$invoice_select['Invoice_Id'];
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
              <td ><?php echo $j;?></td>
              <td><?php echo '<strong>'.$val['Client_Name'].'</strong>-'.$val['Client_Code'];?></td>
              <td><?php echo $invoice_id ;?></td>
              <td><?php echo $Final_Total_Amt; ?></td>
              
            </tr>
            <?php 
                   $j++;            
                                    
             
             $invoice_id="";
             $Final_Total_Amt=0;
             $amount="";
             }    ?>                  
                                   
            
        </tbody>
        </table>
          <div class="text-center "> </div>  
         

        
        <input type="hidden" name="page" id="page" value="1" class="page"/>
         </form>




         <?php } //if(empty($rs)==false)?>
                      <div class="text-center">
      <?php echo  $pager->renderFullNav(); ?>
      </div> 
 <?php  }?>
 <input type="hidden" name="page" id="page" value="1"/>
 
 </form>