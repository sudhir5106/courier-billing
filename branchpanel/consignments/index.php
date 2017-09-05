<?php
include('../../config.php'); 
require_once(PATH_LIBRARIES.'/classes/DBConn.php');
include(BRANCH_PATH_ADMIN_INCLUDE.'/header.php');
require_once(PATH_LIBRARIES.'/classes/ps_pagination.php');
$db = new DBConn();

$con  = mysql_connect(SERVER, DBUSER, DBPASSWORD);
$rows_per_page=ROWS_PER_PAGE;
$totpagelink=PAGELINK_PER_PAGE;

//Get Consignment List
$sql="SELECT DATE_FORMAT(Date_Of_Submit,'%d-%m-%Y') AS Date, Consignment_Id, Consignment_No, Destination_Name, CASE WHEN Mode=1 THEN 'Dox' ELSE 'Non-Dox' END AS Mode, CASE WHEN Send_By=1 THEN 'Surface' WHEN Send_By=2 THEN 'Air' ELSE 'Urgent' END Send_By, Total_Weight_In_KG, FORMAT(Total_Amount, 2) AS Total_Amount, Client_Name, Client_Code, Operator_Name FROM tbl_consignments CO
LEFT JOIN tbl_destinations D ON D.Destination_Id = CO.Destination_Id
LEFT JOIN tbl_operators O ON O.Operator_Id = CO.Operator_Id
LEFT JOIN tbl_clients C ON C.Client_id = CO.Client_id
WHERE CO.Branch_Id=".$_SESSION['buser']." ORDER BY CO.Date_Of_Submit DESC, Consignment_No DESC";

$Consignment=$db->ExecuteQuery($sql);

//Get Total Consignment Amt.
$getTotalAmt = "SELECT SUM(Total_Amount) AS Total_Amount FROM tbl_consignments";

$getTotalAmtQuery=$db->ExecuteQuery($getTotalAmt);

if(isset($_REQUEST['page']) && $_REQUEST['page']>1)
{
	$i=($_REQUEST['page']-1)*$rows_per_page+1;
}
else
{
	$i=1;
}

$pager = new PS_Pagination($con,$sql,$rows_per_page,$totpagelink);
$rs=$pager->paginate();
?>

<script type="text/javascript" src="consignment.js" ></script>
<script>
$(document).ready(function(){ 

	/////////////////////////////////////////////////////
	// Get Client Code and Name list(autocomplete)///////
	/////////////////////////////////////////////////////  
	var clientcodelist = [
		<?php // PHP begins here
		  
			$menu=$db->ExecuteQuery("SELECT Client_Code, Client_Name, Address FROM tbl_clients WHERE Branch_Id=".$_SESSION['buser']." AND Client_Id IN (SELECT Client_Id FROM tbl_rates)");
			foreach($menu as $val) {
				echo '"'.$val['Client_Name'].'-'.$val['Client_Code'].'-'.$val['Address'].'", ';
			} // PHP ends here*/
		?>
	];// eof json format
	
	$("#client_name").autocomplete({
   
		source: function(req, responseFn) {
			var re = $.ui.autocomplete.escapeRegex(req.term);
			var matcher = new RegExp( "^" + re, "i" );
			var a = $.grep( clientcodelist, function(item,index){
				return matcher.test(item);
			});
			responseFn( a );
		}
	}).on( 'autocompleteresponse autocompleteselect', function( e, ui ){
					
			var formdata = new FormData();
			formdata.append('type', "getClientName");
			formdata.append('client_name', $("#client_name").val());
	
			var x;
			$.ajax({
			   type: "POST",
			   url: "consignment_curd.php",
			   data:formdata,
			   success: function(data){ //alert(data);
				   $('#clientname').html(data);
			   },
			   cache: false,
			   contentType: false,
			   processData: false
			});//eof ajax
		
	});//eof autocomplete code
});//eof ready function


$(function() {
	$("#from_date").datepicker({
		dateFormat: "dd-mm-yy"	
	});

	$("#to_date").datepicker({
		dateFormat: "dd-mm-yy"	
	});
});
</script>
<style>
@media print
{
  .headPart, .top-nav, .pageTitle, .srchBox, .pagination{display:none;}
}
</style>

<div id="loader">
    <div class="loader-block"><i class="fa-li fa fa-spinner fa-spin spinloader"></i></div>
</div>

<div class="pageTitle">
	<div class="ef_header_tools pull-right">
        <a class="btn btn-success btn-sm" href="add_consignment.php"><i class="glyphicon glyphicon-list"></i> <strong>Add New Consignment </strong></a>
        <button onclick="window.print()" type="button" class="btn btn-info btn-sm" id="print" name="print"> <span class="glyphicon glyphicon-print"></span> Print </button>
    </div>
	<h1 class="pull-left">Consignment List</h1>
    <div class="clearfix"></div>
</div>
<div class="main">
    <div class="clear formbgstyle">
        <div class="col-sm-12 srchBox">
           <form id="consignmentSrchFrm" name="consignmentSrchFrm" class="form-inline pull-left" method="post">
                 <div class="form-group">
                  <input type="text" id="consignment_no" name="consignment_no" class="form-control input-sm"  placeholder="Consignment No" value=""/>
                 </div>
                 <div class="form-group">
                  <input type="button" name="search_consignment"  id="search_consignment" Value="Search" class="btn btn-primary btn-sm">
                 </div>
           </form>
           
           <!--<form id="clientSrchFrm" name="clientSrchFrm" class="form-inline pull-left" method="post">
                 
                 <div class="form-group">
                  <input type="text" class="form-control input-sm" id="client_name" name="client_name" placeholder="Client Name" value="" />
                 </div>
                 <div class="form-group">
                  <input type="button" name="searchClientWise" id="searchClientWise" Value="Search" class="btn btn-primary btn-sm">
                 </div>
           </form>-->
           
           <form id="dateSrchFrm" name="dateSrchFrm" class="form-inline pull-left" method="post">                 
                 <div class="form-group">
                  <input type="text" class="form-control input-sm" id="client_name" name="client_name" placeholder="Client Name" value="" />
                 </div>
                 <div class="form-group">
                    <input type="text" placeholder="From-Date" id="from_date" name="from_date" class="form-control input-sm"  value=""/>
                 </div>
                 <div class="form-group">
                   <input type="text" placeholder="To-Date" id="to_date" name="to_date" class="form-control input-sm" value="" />
                 </div>
                 <div class="form-group">
                   <input type="button" id="searchByDateBtn" name="searchByDateBtn" Value="Search" class="btn btn-primary btn-sm">
                 </div>
           </form>
        </div>
        <div class="clear formbgstyle" id="detail">
          <table class="table table-hover table-bordered" id="addedProducts">
             <thead>
              <tr class="success">
                     <th>Sno.</th>
                     <th>Date</th>
                     <th>AWB No.</th>
                     <th>Destination</th>
                     <th>Mode</th>
                     <th>Sent By</th>
                     <th>Weight</th>
                     <th>Total Amount</th>
                     <th>Client Name/Code</th>
                     <th>Operator</th>
                     <th>Action</th>
                   </tr>
            </thead>
            <tbody>
    <?php 
        if(count($Consignment) > 0){
                                
            if($rs){
                while($val = mysql_fetch_assoc($rs)) 
                {			
                    ?>
                  <tr>
                     <td ><?php echo $i;?></td>
                     <td><?php echo $val['Date'];?></td>
                     <td><?php echo $val['Consignment_No'];?></td>
                     <td><?php echo $val['Destination_Name'];?></td>
                     <td><?php echo $val['Mode'];?></td>
                     <td><?php echo $val['Send_By'];?></td>
                     <td><?php echo $val['Total_Weight_In_KG'];?></td>                     
                     <td><?php echo $val['Total_Amount'];?></td>
                     <td><?php echo $val['Client_Name'].'-'.$val['Client_Code'];?></td>
                     <td><?php echo $val['Operator_Name']==NULL?'Branch':$val['Operator_Name'];?></td>
                     
                     <td>
                     	<button type="button" id="editbtn" class="btn btn-success btn-sm" onClick="window.location.href='edit_consignment.php?id=<?php echo $val['Consignment_Id'];?>'"><span class="glyphicon glyphicon-edit"></span> Edit </button>                  
                  		<button type="button" class="btn btn-danger btn-sm delete" id="<?php echo $val['Consignment_Id']; ?>" name="delete"> <span class="glyphicon glyphicon-trash"></span> Delete </button>
                     </td>
                  </tr>
                  <?php $i++;
                  }//eof while loop ?>
                  <tr style="background:#EFEFEF">
                  	<td colspan="7" align="right"><strong>Total</strong></td>
                    <td colspan="4"><strong><?php echo $getTotalAmtQuery[1]['Total_Amount']; ?></strong></td>
                  </tr>
                  <?php	
             }//eof if condition
        }//eof if condition
        else
        {?>
                  <tr>
                      <td colspan="10" align="center">No Record Found</td>
                  </tr>
    <?php }//eof else ?>
        </tbody>
      </table>
      <div class="text-center"> <?php echo $pager->renderFullNav(); ?></div>
    </div>
</div>
