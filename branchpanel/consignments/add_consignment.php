<?php
include('../../config.php'); 
require_once(PATH_LIBRARIES.'/classes/DBConn.php');
include(BRANCH_PATH_ADMIN_INCLUDE.'/header.php');
$db = new DBConn();
?>
<style>
.checkboxVerAlign{margin-right:5px !important; margin-top:13px !important;}
</style>
<script type="text/javascript" src="consignment.js"></script>
<script>
$(document).ready(function(){ 


	//////////////////////////////////////////
	// this function is used to get the Amount
	// from rate master
	function getAmt(){
		
		// Check that selected destination zone id 
		// is exit in the rate master or not
		var formdata = new FormData();
		formdata.append('type', "zoneExist");
		formdata.append('zone_id', $("#zone_id").val());
		formdata.append('dest_id', $("#dest_id").val());
		formdata.append('client_id', $("#client_id").val());
		formdata.append('send_by', $("#send_by").val());
		
		var x;
		$.ajax({
		   type: "POST",
		   url: "consignment_curd.php",
		   data:formdata,
		   success: function(data){ //alert(data);
		   
				if(data==0){
					$("#subtotal").val("");
					$("#total_amt").val("");
				}//eof if condition
				else{
				
					var formdata = new FormData();
					formdata.append('type', "getSubtotal");
					formdata.append('client_id', $("#client_id").val());
					formdata.append('dest_id', $("#dest_id").val());
					formdata.append('send_by', $("#send_by").val());
					formdata.append('weight', $("#weight").val());
					
					var x;
					$.ajax({
						type:"POST",
						url:"consignment_curd.php",
						data:formdata,
						success: function(data){ //alert(data);
							
							if($("#discount_percent").val()!=0 && $("#discount_rs").val()==0){
								
								var discount = (data * $("#discount_percent").val())/100;
								var total_amt = data - discount;
								
								$("#subtotal").val(data);
								$("#total_amt").val(total_amt);
								
							}
							else if($("#discount_percent").val()==0 && $("#discount_rs").val()!=0){
															
								var total_amt = data - $("#discount_rs").val();
									
								$("#subtotal").val(data);
								$("#total_amt").val(total_amt);
									
							}
							else{
								$("#subtotal").val(data);
								$("#total_amt").val(data);
							}
						},			
						cache: false,
						contentType: false,
						processData: false
					});//eof ajax 
				
				
					
				}//eof else
		   },//eof success			
			cache: false,
			contentType: false,
			processData: false
		});//eof ajax
		
	}

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
//	.on( 'autocompleteresponse autocompleteselect', function( e, ui ){
	.on( 'autocompleteselect', function( e, ui ){
					
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
				   
				   if($('#dest_id').val()=="" || $("#send_by").val()=="" || $("#weight").val()==""){
					
						$("#subtotal").val("");
						$("#total_amt").val("");
					   
				   }//eof if condition
				   else{
						
						// this function is written in 
						// add_consignment and edit consignment
						getAmt();

					}//eof else
			   },
			   cache: false,
			   contentType: false,
			   processData: false
			});//eof ajax
		
	});
	
	
	/////////////////////////////////////////////////////////////////////////////////////
	///////////// Get destination code and name list(autocomplete)///////////////////////
	/////////////////////////////////////////////////////////////////////////////////////  
	var destcodelist = [
		<?php // PHP begins here		  
			$menu=$db->ExecuteQuery("SELECT Destination_Name FROM tbl_destinations");
			foreach($menu as $val) {
				echo '"'.$val['Destination_Name']. '",';
			} // PHP ends here*/
		?>
	];// eof json format
	
	$("#Destination_Name").autocomplete({
   
		source: function(req, responseFn) {
			var re = $.ui.autocomplete.escapeRegex(req.term);
			var matcher = new RegExp( "^" + re, "i" );
			var a = $.grep( destcodelist, function(item,index){
				return matcher.test(item);
			});
			responseFn( a );
		}
	}).on( 'autocompleteselect', function( e, ui ){
					
			var formdata = new FormData();
			formdata.append('type', "getDestinationName");
			formdata.append('Destination_Name', $("#Destination_Name").val());
	
			var x;
			$.ajax({
			   type: "POST",
			   url: "consignment_curd.php",
			   data:formdata,
			   success: function(data){ //alert(data);
				   $('#destinationName').html(data);
				   
				   if($('#client_id').val()=="" || $("#send_by").val()=="" || $("#weight").val()==""){
					
						$("#subtotal").val("");
						$("#total_amt").val("");
					   
				   }//eof if condition
				   else{
						
						// this function is written in 
						// add_consignment and edit consignment
						getAmt();
						 
					}//eof else
				   
			   },
			   cache: false,
			   contentType: false,
			   processData: false
			});//eof ajax
		
	});
	
	///////////////////////////////
	//set date format in datepicker
	///////////////////////////////
	$(function() {
		$("#date").datepicker({
			dateFormat: "dd-mm-yy"		
		});
	});

	
});// eof ready function
</script>

<div class="pageTitle">
	<div class="ef_header_tools pull-right">
		<a class="btn btn-success btn-sm" href="index.php"><i class="glyphicon glyphicon-list"></i> <strong>Consignment List</strong></a>
  	</div>
	<h1 class="pull-left">Add New Consignment</h1>
    <div class="clearfix"></div>
</div>

<div class="main">
	<div class="clear formbgstyle">
    	
        <div id="msg" class="alert alert-success" style="display:none;"><strong>Consignment Added successfully!</strong></div>
        
    	<form class="form-horizontal" role="form" id="insertConsignment" method="post">
        	<div>
            	
                <div class="form-group">
                  <label class="control-label col-sm-3 mandatory" for="date">Date<span>*</span>:</label>
                  <input class="pull-left checkboxVerAlign" id="dateChkbx" type="checkbox" />
                  <div class="col-sm-2 input-group">
                  	<input type="text" class="form-control" id="date" name="date" value="<?php echo date("d-m-Y") ?>"/>
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="control-label col-sm-3 mandatory" for="consignment_no">Consignment / AWB No.<span>*</span>:</label>
                  <input class="pull-left checkboxVerAlign" id="cnoChkbx" type="checkbox" />
                  <div class="col-sm-3 input-group">
                    <input type="text" class="form-control input-sm" id="consignment_no" name="consignment_no"  />
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="control-label col-sm-3 mandatory" for="client_name">Client Name <span>*</span>:</label>
                  <input class="pull-left checkboxVerAlign" id="ccodeChkbx" type="checkbox" />
                  <!--<div class="col-sm-1 padding-left-right-zero">
                    <input type="text" class="form-control input-sm" id="client_code" name="client_code" placeholder="Ex: 101, 102..." />
                  </div>-->
                  <div class="col-sm-3 padding-left-right-zero">
                  	<input type="text" class="form-control input-sm" id="client_name" name="client_name" placeholder="Client Name" value="" />
                  </div>                  
                  <div class="col-sm-4" id="clientname">
                  	 
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="control-label col-sm-3 mandatory" for="Destination_Name">City / Destination Name  <span>*</span>:</label>
                  <input class="pull-left checkboxVerAlign" id="dcodeChkbx"  type="checkbox" />
                  <!--<div class="col-sm-1 padding-left-right-zero">
                    <input type="text" class="form-control input-sm" id="dest_code" name="dest_code" placeholder="Ex: RAI, BHI..." />
                  </div>-->
                  
                  <div class="col-sm-4 padding-left-right-zero">
                     <input type="text" class="form-control input-sm" id="Destination_Name" name="Destination_Name" placeholder="Destination Name"  value="" />
                  </div>
                  <div id="destinationName"></div>
                </div>
                
                <div class="form-group">
                  <label class="control-label col-sm-3 mandatory" for="mode">Mode(Dox/Non-Dox) <span>*</span>:</label>
                  <input class="pull-left checkboxVerAlign" id="modeChkbx" type="checkbox" />
                  <div class="col-sm-2 input-group">
                      <select id="mode" name="mode" class="form-control input-sm" >
                          <option value="1">Dox</option>
                          <option value="2">Non-Dox</option>
                      </select>
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="control-label col-sm-3 mandatory" for="pieces">No. of Pieces<span>*</span>:</label>
                  <input class="pull-left checkboxVerAlign" id="piecesChkbx" type="checkbox" />
                  <div class="col-sm-1 input-group">
                    <input type="text" class="form-control input-sm" id="pieces" name="pieces" value="1" />
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="control-label col-sm-3 mandatory" for="send_by">Send By<span>*</span>:</label>
                  <input class="pull-left checkboxVerAlign" id="sendByChkbx" type="checkbox" />
                  <div class="col-sm-2 input-group">
                  	 <select id="send_by" name="send_by"  class="form-control input-sm">
                        <option value="">Select Mode</option>
                        <option value="1">Surface</option>
                        <option value="2">Air</option>
                        <option value="3">Urgent</option>
                      </select>
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="control-label col-sm-3 mandatory" for="weight">Total Weight (KG.)<span>*</span>:</label>
                  <input class="pull-left checkboxVerAlign"  id="weightChkbx" type="checkbox" />
                  <div class="col-sm-1 input-group">
                    <input type="text" class="form-control input-sm" id="weight" name="weight" />
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="control-label col-sm-3 mandatory" for="subtotal">Subtotal <span>*</span>:</label>
                  <div class="col-sm-2 input-group">
                  	<span class="input-group-addon"><span class="fa fa-inr"></span></span>
                    <input type="text" class="form-control" id="subtotal" name="subtotal" />
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="control-label col-sm-3 mandatory" for="discount_rs">Discount :</label>
                  <div class="col-sm-1 padding-left-right-zero">
                  	<div class="col-sm-2 padding-left-right-zero radio-pad"><input type="radio" id="disPercentRadio" name="disRadio" checked="checked" /></div>
                    <div class="col-sm-10 padding-left-right-zero">
                    	<input type="text" class="form-control input-sm" id="discount_percent" name="discount_percent" placeholder="In (%)" />
                    </div>
                  </div>
                  
                  <div class="col-sm-2 padding-left-right-zero">
                  	<div class="col-sm-2 padding-right-zero radio-pad"><input type="radio" id="disRsRadio" name="disRadio" /></div>
                  	<div class="col-sm-6 padding-left-right-zero">
                    	<input type="text" class="form-control input-sm" id="discount_rs" name="discount_rs" placeholder="In (Rs.)" readonly="readonly" />
                    </div>
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="control-label col-sm-3 mandatory" for="total_amt">Total Amount <span>*</span>:</label>
                  <div class="col-sm-2 input-group">
                    <span class="input-group-addon"><span class="fa fa-inr"></span></span>
                    <input type="text" class="form-control" id="total_amt" name="total_amt" readonly="readonly" />
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="control-label col-sm-3 mandatory" for="insured_value">Insured Value :</label>
                  <div class="col-sm-2 input-group">
                    <span class="input-group-addon"><span class="fa fa-inr"></span></span>
                    <input type="text" class="form-control" id="insured_value" name="insured_value" value="0" />
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="control-label col-sm-3 mandatory" for="other_charges">Other Charges :</label>
                  <div class="col-sm-2 input-group">
                    <span class="input-group-addon"><span class="fa fa-inr"></span></span>
                    <input type="text" class="form-control" id="other_charges" name="other_charges" value="0" />
                  </div>
                </div>
                
                <hr />  
                
                <div class="form-group">
                  <div class="col-sm-3"></div>
                  <div class="col-sm-3">
                  	<input type="hidden" class="form-control" id="cuurentDate" value="<?php echo date('d-m-Y'); ?>" />
                  	<input type="button" class="btn btn-primary btn-xl" id="submit" value="Add">
                    <input type="reset" class="btn btn-default btn-xl" value="Reset" id="reset">
                  </div>
                </div>
            </div>
        </form>
       
    </div>
</div>