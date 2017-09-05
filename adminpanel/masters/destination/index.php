<?php
include('../../../config.php'); 
require_once(PATH_LIBRARIES.'/classes/DBConn.php');
require_once(PATH_LIBRARIES.'/functions/fun1.php');
include(PATH_ADMIN_INCLUDE.'/header.php');
require_once(PATH_LIBRARIES.'/classes/ps_pagination.php');
$db = new DBConn();

	$con  = mysql_connect(SERVER, DBUSER, DBPASSWORD);
	$rows_per_page=ROWS_PER_PAGE;
	$links_per_page=PAGELINK_PER_PAGE;
	
	$sql="SELECT D.*, S.State_Name FROM tbl_destinations D INNER JOIN tbl_states S ON S.State_Id = D.State_Id ORDER BY S.State_Name ASC";
	$res=$db->ExecuteQuery($sql);
		
	if(isset($_REQUEST['page']) && $_REQUEST['page']>1)
	{
		$i=($_REQUEST['page']-1)*$rows_per_page+1;
	}
	else
	{
		$i=1;
	}
	$pager = new PS_Pagination($con,$sql,$rows_per_page,$links_per_page);	
	$rs=$pager->paginate();

?>
<script type="text/javascript" src="destination.js" ></script>

<script>
$(document).ready(function(){ 
	///////////// Get state code and name list(autocomplete)///////////////////////  
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
	<h1>Add New Destination</h1>
</div>

<div class="main">	
    <div class="clear formbgstyle">
    	<form class="form-horizontal" role="form" id="insertDest" method="post">
        	<div>
            	<div class="form-group">
                  <label class="control-label col-sm-3 mandatory" for="dest_code">Destination Code <span>*</span>:</label>
                  <div class="col-sm-2">
                    <input type="text" class="form-control input-sm" id="dest_code" name="dest_code" placeholder="Destination Code"  />
                  </div>
                </div>
                <div class="form-group">
                  <label class="control-label col-sm-3 mandatory" for="dest_name">Destination Name <span>*</span>:</label>
                  <div class="col-sm-3">
                    <input type="text" class="form-control input-sm" id="dest_name" name="dest_name" placeholder="Destination Name" />
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="control-label col-sm-3 mandatory" for="state_code">State Code <span>*</span>:</label>
                  <div class="col-sm-2">
                    <input type="text" class="form-control input-sm" id="state_code" name="state_code" placeholder="Ex: CG, MH..." />
                  </div>
                  
                  <div class="col-sm-2" id="statename">
                  	 <input type="text" class="form-control input-sm" id="state_name" name="state_name" placeholder="State Name" readonly="readonly" value="" />
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
        
        
        <form method="post" id="myform" name="myform">
        <table class="table table-hover table-bordered" id="addedProducts">
            <thead>
                <tr class="success">
                    <th>Sno.</th>
                    <th>Destination Code</th>
                    <th>Destination Name</th>
                    <th>State Name</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            <?php 
			
			if(empty($rs)==false)
			{
            
				while($Val=mysql_fetch_array($rs)){ ?>
                <tr>
                    <td><?php echo $i;?></td>
                    <td><?php echo $Val['Destination_Code'];?></td>
                    <td><?php echo $Val['Destination_Name'];?></td>
                    <td><?php echo $Val['State_Name'];?></td>
                    <td>
                        <button type="button" id="editbtn" class="btn btn-success btn-sm" onClick="window.location.href='edit_destination.php?id=<?php echo $Val['Destination_Id'];?>'" ><span class="glyphicon glyphicon-edit"></span> Edit</button>
                        <button type="button" class="btn btn-danger btn-sm delete" id="<?php echo $Val['Destination_Id']; ?>" name="delete"><span class="glyphicon glyphicon-trash"></span> Delete</button>
                    </td>
                </tr>
            <?php $i++;}
			}?>
            </tbody>
        </table>
        <input type="hidden" name="page" id="page" value="1"/>
     </form>
     <div class="text-center"> <?php echo $pager->renderFullNav() ?></div>
   </div>
</div>