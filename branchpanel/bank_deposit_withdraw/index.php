<?php
include('../../config.php'); 
require_once(PATH_LIBRARIES.'/classes/DBConn.php');
include(BRANCH_PATH_ADMIN_INCLUDE.'/header.php');
$db = new DBConn();
?>
<script>
$(document).ready(function()
{
///////////////////////////////////////////
  // Set Date Picker Date Format ////////////
  ///////////////////////////////////////////
  $(function() {
    $("#from_date").datepicker({
      dateFormat: "dd-mm-yy"
    });
  
    $("#to_date").datepicker({
      dateFormat: "dd-mm-yy"
    });
  });
});



</script>




<script type="text/javascript" src="js_file.js" ></script>
<div id="loader">
    <div class="loader-block"><i class="fa-li fa fa-spinner fa-spin spinloader"></i></div>
</div>

<div class="pageTitle">
	<div class="ef_header_tools pull-right">
        <a class="btn btn-success btn-sm" href="report.php"><i class="glyphicon glyphicon-list"></i> <strong>Invoice Report</strong></a>
    </div>
	<h1 class="pull-left">Bank Deposits</h1>
    <div class="clearfix"></div>
</div>

<div class="main">
  <div class="clear formbgstyle">
    <form class="form-horizontal" role="form" id="bank_deposits" method="post"  >

        <div class="center-block">
            <div class="form-group">
              <label class="control-label col-sm-4 mandatory" for="bank_name">Bank Name <span>*</span>:</label>
              <!--<div class="col-sm-2 padding-left-right-zero">
                <input type="text" class="form-control input-sm" id="client_code" name="client_code" placeholder="Ex: 101, 102..." />
              </div>-->
              <div class="col-sm-3 padding-left-right-zero">
 <?php  $result_bank=$db->ExecuteQuery("SELECT Bank_Id,Bank_Name FROM tbl_banks");  ?>
                <select name="bank_name" id="bank_name" class="form-control input-sm">
                  <option value="">---SELECT ANY ONE---</option>
              <?php foreach($result_bank as $sql_result)
                        { ?>
                  <option value="<?php echo $sql_result['Bank_Id']; ?>"><?php echo $sql_result['Bank_Name']; ?></option>
                  <?php }?>
                </select>            
               </div> 

              <div class="col-sm-1" id="clientname">
                 
              </div>
            </div>    
            <div class="form-group">
            <label class="control-label col-sm-4 mandatory" for="client_code">Date <span>*</span>:</label>
              <div class="col-sm-3">
                <input type="text" class="form-control input-sm" id="from_date" name="from_date"  value="" />
              </div>
            </div>
              
            <div class="form-group">
            <label class="control-label col-sm-4 mandatory" for="total_cash">Total Cash <span>*</span>:</label>
              <div class="col-sm-3">
                <input type="text" class="form-control input-sm" id="total_cash" name="total_cash" readonly="readonly" />
              </div>
            </div>
            
            <div class="form-group">
            <label class="control-label col-sm-4 mandatory" for="total_pay">Total Pay <span>*</span>:</label>
              <div class="col-sm-3">
                <input type="text" class="form-control input-sm" id="total_pay" name="total_pay" readonly="readonly" />
              </div>
            </div>
            
            <div class="form-group">
            <div class="col-sm-3">
                <input type="button" class="btn btn-primary btn-sm" id="submit" value="submit">
              </div>
            </div>
            
            
               
    	</div>

    </form>
    <br />
    
  