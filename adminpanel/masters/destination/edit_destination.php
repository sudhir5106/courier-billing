<?php
include('../../../config.php'); 
require_once(PATH_LIBRARIES.'/classes/DBConn.php');
include(PATH_ADMIN_INCLUDE.'/header.php');
$db = new DBConn();

// get all list of states
$res=$db->ExecuteQuery("SELECT D.*, S.State_Code, S.State_Name FROM tbl_destinations D
INNER JOIN tbl_states S ON S.State_Id = D.State_Id
WHERE D.Destination_Id='".$_GET['id']."'");

?>
<script type="text/javascript" src="destination.js" ></script>

<script>
$(document).ready(function(){ 
	///////////// Get Zone List(autocomplete)///////////////////////  
	var statecodelist = [
		<?php // PHP begins here
		  
			$menu=$db->ExecuteQuery("SELECT State_Code FROM tbl_states");
			foreach($menu as $val) {
				echo '"'.$val['State_Code']. '",';
			} // PHP ends here*/
		?>
	];// eof json format
	
	$("#state_code").autocomplete({
   
		source: function(req, responseFn) {
			var re = $.ui.autocomplete.escapeRegex(req.term);
			var matcher = new RegExp( "^" + re, "i" );
			var a = $.grep( statecodelist, function(item,index){
				return matcher.test(item);
			});
			responseFn( a );
		}
	}).on( 'autocompleteresponse autocompleteselect', function( e, ui ){
					
			var formdata = new FormData();
			formdata.append('type', "getStateName");
			formdata.append('state_code', $("#state_code").val());
	
			var x;
			$.ajax({
			   type: "POST",
			   url: "destination_curd.php",
			   data:formdata,
			   success: function(data){ //alert(data);
				   $('#statename').html(data);
			   },
			   cache: false,
			   contentType: false,
			   processData: false
			});//eof ajax
		
	});
	
});// eof ready function
</script>
<div class="pageTitle">
	<h1>Edit Destination</h1>
</div>

<div class="main">	
    <div class="clear formbgstyle">
    	<form class="form-horizontal" role="form" id="editDest" method="post">
        	<div>
            	<div class="form-group">
                  <label class="control-label col-sm-3 mandatory" for="dest_code">Destination Code <span>*</span>:</label>
                  <div class="col-sm-2">
                    <input type="text" class="form-control input-sm" id="dest_code" name="dest_code" placeholder="Destination Code" value="<?php echo $res[1]['Destination_Code']; ?>" />
                  </div>
                </div>
                <div class="form-group">
                  <label class="control-label col-sm-3 mandatory" for="dest_name">Destination Name <span>*</span>:</label>
                  <div class="col-sm-3">
                    <input type="text" class="form-control input-sm" id="dest_name" name="dest_name" placeholder="Destination Name" value="<?php echo $res[1]['Destination_Name']; ?>" />
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="control-label col-sm-3 mandatory" for="state_code">State Code <span>*</span>:</label>
                  <div class="col-sm-2">
                  	<input type="text" class="form-control input-sm" id="state_code" name="state_code" placeholder="Ex: CG, MH..." value="<?php echo $res[1]['State_Code']; ?>" />
                  </div>
                  
                  <div class="col-sm-2" id="statename">
                  	 <input type="hidden" class="form-control input-sm" id="state_id" name="state_id" value="<?php echo $res[1]['State_Id']; ?>" />
                  	 <input type="text" class="form-control input-sm" id="state_name" name="state_name" placeholder="State Name" readonly="readonly" value="<?php echo $res[1]['State_Name']; ?>" />
                  </div>
                </div>
                
                <div class="form-group">
                  <div class="col-sm-3"></div>
                  <div class="col-sm-3">
                  	<input id="id" name="id" type="hidden" value="<?php echo $res[1]['Destination_Id']; ?>">
                  	<input type="button" class="btn btn-primary btn-sm" id="edit" value="Update">
                    <input type="reset" class="btn btn-default btn-sm" value="Reset" id="reset">
                  </div>
                </div>
            </div>
        </form>
    </div>
</div>