<?php
include('../../../config.php'); 
require_once(PATH_LIBRARIES.'/classes/DBConn.php');
include(PATH_ADMIN_INCLUDE.'/header.php');
$db = new DBConn();

// get all list of states
$stateList=$db->ExecuteQuery("SELECT *, Zone_Code, Zone_Name FROM tbl_states S
INNER JOIN tbl_zones Z ON Z.Zone_Id = S.Zone_Id");
?>
<script type="text/javascript"  src="state.js" ></script>

<script>
$(document).ready(function(){ 
	///////////// Get Zone List(autocomplete)///////////////////////  
	var zonelist  = [
		<?php // PHP begins here
		  
			$menu=$db->ExecuteQuery("SELECT Zone_Code FROM tbl_zones ");
			foreach($menu as $val) {
				echo '"'.$val['Zone_Code']. '",';
			} // PHP ends here*/
		?>
	];// eof json format
	
	$("#zone_code").autocomplete({
   
		source: function(req, responseFn) {
			var re = $.ui.autocomplete.escapeRegex(req.term);
			var matcher = new RegExp( "^" + re, "i" );
			var a = $.grep( zonelist, function(item,index){
				return matcher.test(item);
			});
			responseFn( a );
		}
	}).on( 'autocompleteresponse autocompleteselect', function( e, ui ){
					
			var formdata = new FormData();
			formdata.append('type', "getZone");
			formdata.append('zone_code', $("#zone_code").val());
	
			var x;
			$.ajax({
			   type: "POST",
			   url: "state_curd.php",
			   data:formdata,
			   success: function(data){ //alert(data);
				   $('#zonename').html(data);
			   },
			   cache: false,
			   contentType: false,
			   processData: false
			});//eof ajax
		
	});
	
});// eof ready function
</script>
<div class="pageTitle">
	<h1>Add State</h1>
</div>

<div class="main">
    <div class="clear formbgstyle">
    	<form class="form-horizontal" role="form" id="insertState" method="post" >
        	<div>
            	<div class="form-group">
                  <label class="control-label col-sm-3 mandatory" for="state_code">State Code <span>*</span>:</label>
                  <div class="col-sm-2">
                    <input type="text" class="form-control input-sm" id="state_code" name="state_code" placeholder="State Code"  />
                  </div>
                </div>
                <div class="form-group">
                  <label class="control-label col-sm-3 mandatory" for="state_name">State Name <span>*</span>:</label>
                  <div class="col-sm-3">
                    <input type="text" class="form-control input-sm" id="state_name" name="state_name" placeholder="State Name" />
                  </div>
                </div>
                <div class="form-group">
                  <label class="control-label col-sm-3 mandatory" for="zone_code">Zone Code <span>*</span>:</label>
                  <div class="col-sm-2">
                    <input type="text" class="form-control input-sm" id="zone_code" name="zone_code" placeholder="Ex: Zone1, Zone2..." />
                  </div>
                  
                  <div class="col-sm-2" id="zonename">
                  	 <input type="text" class="form-control input-sm" id="zone_name" name="zone_name" placeholder="Zone Name" readonly="readonly" value="" />
                  </div>
                </div>
                
                
                <div class="form-group">
                  <div class="col-sm-3"></div>
                  <div class="col-sm-3">
                  	<input type="button" class="btn btn-primary btn-sm" id="submit" value="Add New">
                    <input type="reset" class="btn btn-default btn-sm" value="Reset" id="reset">
                  </div>
                </div>
            </div>
        </form>
        
        <table class="table table-hover table-bordered" id="addedProducts">
            <thead>
                <tr class="success">
                    <th>Sno.</th>
                    <th>State Code</th>
                    <th>State Name</th>
                    <th>Zone Code</th>
                    <th>Zone Name</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            <?php 
            $i=1;
            foreach($stateList as $stateListVal){ ?>
                <tr>
                    <td><?php echo $i;?></td>
                    <td><?php echo $stateListVal['State_Code'];?></td>
                    <td><?php echo $stateListVal['State_Name'];?></td>
                    <td><?php echo $stateListVal['Zone_Code'];?></td>
                    <td><?php echo $stateListVal['Zone_Name'];?></td>
                    <td>
                        <button type="button" id="editbtn" class="btn btn-success btn-sm" onClick="window.location.href='edit_state.php?id=<?php echo $stateListVal['State_Id'];?>'" >
                    <span class="glyphicon glyphicon-edit"></span> Edit
                        </button>
                        
                        <button type="button" class="btn btn-danger btn-sm delete" id="<?php echo $stateListVal['State_Id']; ?>" name="delete">
                            <span class="glyphicon glyphicon-trash"></span> Delete
                        </button>
                    </td>
                </tr>
            <?php $i++;} ?>
            </tbody>
        </table>
    </div>
</div>