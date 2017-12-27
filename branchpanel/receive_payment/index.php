<?php
include('../../config.php'); 
require_once(PATH_LIBRARIES.'/classes/DBConn.php');
include(BRANCH_PATH_ADMIN_INCLUDE.'/header.php');
$db = new DBConn();
?>
<script type="text/javascript" src="invoice.js" ></script>
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
	})
	.on( 'autocompleteresponse autocompleteselect', function( e, ui ){
					
			var formdata = new FormData();
			formdata.append('type', "getClientName");
			formdata.append('client_name', $("#client_name").val());
	
			var x;
			$.ajax({
			   type: "POST",
			   url: "invoice_curd.php",
			   data:formdata,
			   success: function(data){ //alert(data);
				   $('#clientname').html(data);
			   },
			   cache: false,
			   contentType: false,
			   processData: false
			});//eof ajax
		
	});
	
  
	
});

</script>

<div id="loader">
  <div class="loader-block"><i class="fa-li fa fa-spinner fa-spin spinloader"></i></div>
</div>

<div class="pageTitle">
  <div class="ef_header_tools pull-right"> </div>
  <h1 class="pull-left">Receive Payment</h1>
  <div class="clearfix"></div>
</div>

<div class="main">
  <div class="clear formbgstyle">
    
    <div class="clientFilter">
    	<form class="form-horizontal" role="form" id="searchClient" method="post"  >
          <div class="center-block">
            <div class="form-group">
              <label class="control-label col-sm-4 mandatory" for="client_code">Client Name <span>*</span>:</label>
              <!--<div class="col-sm-2 padding-left-right-zero">
                    <input type="text" class="form-control input-sm" id="client_code" name="client_code" placeholder="Ex: 101, 102..." />
                  </div>-->
              <div class="col-sm-3 padding-left-right-zero">
                <input type="text" class="form-control input-sm" id="client_name" name="client_name" placeholder="Client Name" value="" />
              </div>
              <div class="col-sm-1">
                <input type="button" class="btn btn-primary btn-sm" id="submit" value="Search">
              </div>
              <div class="col-sm-1" id="clientname"> </div>
            </div>
          </div>
        </form>
    </div>
    
    <div id="msg" class="alert alert-success"  align="center" style="display:none;"><strong> Paid successfully!</strong></div>
    
    <div id="table_data">
      
      
    </div>
    
  </div>
</div>