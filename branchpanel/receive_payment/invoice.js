// JavaScript Document
$(document).ready(function(){
	
	
	///////////////////////////////////
	// validation for Search Client
	////////////////////////////////////
	$("#searchClient").validate({
		rules: 
		{ 		
			client_name: 
			{ 
				required: true,
				clinetExists:true,
				
			},
		},
		message:
		{
		}
		/*onkeyup:false,
		onfocusout:false,
		onclick:false*/
	});// eof validation
	
	///////////////////////////////////
	// validation for Date
	////////////////////////////////////
	$("#searchRate").validate({
		rules: 
		{ 
		
			from_date: 
			{ 
				required: true,
			    maxDate:true,
				// dateExists:true,
			},
			to_date:
			{
				required: true,
				greaterThenFrom: true,
			},
			
		},
		messages:
		{
			
		}
	});// eof validation


	
	////////////////////////////////////
	// on click of client code drop down
	////////////////////////////////////	
	$(document).on("click","#client_name, ul, li.ui-menu-item, li.ui-menu-item a", function(){
		
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
	
	////////////////////////////////////	
	//// method for client validation ////
	////////////////////////////////////
    $.validator.addMethod('clinetExists', function(val, element)
	{		
		$.ajax({
			 url:"invoice_curd.php",
			 type: "POST",
			 data: {type:"clinetExists",client_name:$('#client_name').val()},
			 async:false,
			 success:function(data){//alert(data);
				 isSuccess=(data==1)?true:false;
			 }
		});//eof ajax
		return isSuccess ;				
	}, 'Invalid Client Name.'); 
	
	
   
	
	
	//////////////////////////////////////////
	// on click of submit button /////////////
	//////////////////////////////////////////
	$(document).on("click","#submit", function(){
		
		flag=$("#searchClient").valid();
		
		if (flag==true)
		{		
			$("#loader").show();
			
			$.ajax({
			   type: "POST",
			   url: "invoice_curd.php",
			   data:{type:"client",client_id:$('#client_id').val()},
			   async: false,
			   success: function(data){ //alert(data);
			   	  
				  //$('#payment_recive_form')[0].reset();
				  $('#table_data').html(data);
				  $("#loader").hide('slow');

				  ////**Set  Form Validation**////
                  $("#payment_recive_form").validate({
	          	rules: 
					{ 
								pay_amount:
								{
									required: true,
									number:true,
									check_pay_amount:true,
									
										
								},
								ch_dd_no:
								{
									required: true,
								},
								transaction_no:
								{
									required: true,
								},
								bank_name:
								{
								   required: true,	
								},
								total_amount:
								{
									required: true,
														
								},
								dedu_amount:
								{
								required: true,	
													
								},
								from_date:
								{
								required: true,	
								},
								tds:
								{
						         number: {
						      depends:function(){
						        $(this).val($.trim($(this).val()));
						        return true;
						                         }
						            },
								},
								baddebt:
								{
								   number: {
						      depends:function(){
						        $(this).val($.trim($(this).val()));
						        return true;
						                         }
						            },
								}

					},
								messages:
								{
									pay_amount:
									{
										number:"Please Enter Only Numbers."
									}
								}


					       });	




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
			   },			 
			});//eof ajax			
		}
	});
	
	
	////////////////////////////////////////////
	// Click Function to get all consignments
	////////////////////////////////////////////		
	$(document).on('click', '#search', function() {
		
		
		flag=$("#searchRate").valid();
		
		if (flag==true)
		{		
			
			var x;
			$.ajax({
			   type: "POST",
			   url: "invoice_curd.php",
			   data:{type:"searchClient",from_date: $('#from_date').val(),to_date:$('#to_date').val(),client_id:$('#client_id').val()},
			   async: false,
			   success: function(data){ //alert(data);
				  //x=data;
				  //value=data.split("@"); 
				  /*$('#client_code').val(value[0]);*/
				  //$('#last_date').val(value[1]);
				  //$('#detail').html(value[2]);
				  $('#detail').html(data)
			   },
			 
			});//eof ajax
			
		}
	});
	
	////////////////////////////////////////////
	// Click Function to generate the invoice
	////////////////////////////////////////////
	
	
	/////////////////////////////////////////////////////
	// click function to select all records
	/////////////////////////////////////////////////////
	$(document).on('click', '#select_all', function() {	
		
		var x;
		$.ajax({
		   type: "POST",
		   url: "invoice_curd.php",
		   data:{type:"searchAll"},
		   async: false,
		   success: function(data){ //alert(data);
			   x=data;
			   $('#detail').html(data);
		   },
		});//eof ajax
	});
	
	
	/////////////////////////////////////////////////////
	// function for Invoice payment
	/////////////////////////////////////////////////////
	$(document).on('click', '.pay', function() {
		
			var x;
			$.ajax({
			   type: "POST",
			   url: "invoice_curd.php",
			   data:{type:"payment",id: $(this).attr('id')},
			   async: false,
			   success: function(data){//alert(data);
				   x=data;
			   },
			  
			});//eof ajax
		 if(x!=0)
			  {
				location.reload();  
				  
			  }
			  
	});
	
	
	
	//////////////////////////////////////
 $(document).on('keyup', '.calculate', function() {
 	     
             var tds=$.trim($('#tds').val());
		      var debt=$.trim($('#baddebt').val());
		     
		 	var received_amount= $.trim($('#pay_amount').val());
		 	if(tds!="" && debt!="" && received_amount=="")
		 	{ 
		 	 var final_amount=parseFloat(debt)+parseFloat(tds);
		 	
		 	}
		 	else
		 	{
		 		if(tds=="" && received_amount!="" && debt!="" )
		 		{
		 			var final_amount=parseFloat(received_amount)+parseFloat(debt);
		 		}
		 		 if(debt=="" && received_amount!="" && tds!="")
		 		{
		 			var final_amount=parseFloat(received_amount)+parseFloat(tds);
		 		}
		 		 if(debt!="" && received_amount!="" && tds!="")
		 		{
		 			var final_amount=parseFloat(received_amount)+parseFloat(tds)+parseFloat(debt);
		 		}
		 		
		 	}
		 	if(tds=="" && debt=="")
		 	{  
		 	  var final_amount=parseFloat(received_amount);	
		 	}
		 	
		 	$('#final_amount').val(final_amount);
		 	  
});
	//////////////////////////////////////
	//////////////////////////////////////
 $('#hidden_field').hide();
 	//////////////////////////////////////
 $(document).on('keyup', '.clear_recived_amt', function() {
	
           $('#pay_amount').val("");
           $('#final_amount').val("");

	});
	
///////////////////////////////////////////////////
	// Method to check is the check_pay_amount
	///////////////////////////////////////////////////
	$.validator.addMethod('check_pay_amount', function(val, element)
	{		
		var final_amount= $('#final_amount').val();	
		var total_amount= $('#total_amount').val();	
		
		if(parseFloat(total_amount)>=parseFloat(final_amount))
		{
			return true;
		}
	   
					
	}, 'Sum of (Received Amount + TDS + Bed Debt) should not be greater than Total Amount.');	


	
	
	///////////////////////////////////////////////////
	// Method to check is the data already exist or not
	///////////////////////////////////////////////////
	
	$("#backBtn").click(function(){
		location.reload();
	});
	
	//////////////////////////////////
	// on click of delete button
	//////////////////////////////////
	

///Generating Payment for Invoice////



$(document).on('click', '.mode', function() {

	var id=$(this).attr('id');

	if(id=="dd_cheque")
	{
		
		$('#trdd_cheque').show();
	    $('#trtransacation').hide();
	    $('#bank_name_row').show();
	    
	}
	if(id=="neft")
	{
		
	     $('#trdd_cheque').hide();
	     $('#trtransacation').show();
	     $('#bank_name_row').show();
	    
	}
	if(id=="cash")
	{
		
		$('#trdd_cheque').hide();
	        $('#trtransacation').hide();
	        $('#bank_name_row').hide();
	        
	} 

});

$('.show_dedu').hide();
$('#deduction_show').change(function()
{ 
	
	if($('#deduction_show').prop('checked') == true)		 
	{  
	
		$('.show_dedu').show();
	}
	else
	{   
		$('.show_dedu').hide();
	}
	
});




});//eof of ready function
$(document).on('change', '.selecctall', function() 
{ 
      
       var flag_check=$(this).prop('checked');
           $('#checked_allboxes').prop("checked", false);   
	       $('.deduction_mode').show();
	        $('#baddebt').val(" "); 
            $('#tds').val(" ");  
var additionAmt=0;
var i=0;
var check_invoice_id=[];
var check_id='';
var invoice_amount='';
var count_check_box=0;
var selct_box_count=0;
$('.selecctall').each(function(){	 
            
             
			if($(this).prop('checked') == true)		 
			{   
				check_invoice_id.push($(this).attr("id"));//put the Consignment_Id's in the array
				check_id+=$(this).attr("id")+',';
				i++; //to getting how many checkboxes are checked
             
			}//eof if condition
			
count_check_box++;
	    });//eof each function



if(i!=0){					
				$('.selecctall').each(function()
				{
                               if($(this).prop('checked') == true)		 
			     	             {	
				     	               var rec = $(this).closest("tr").find(".balance").text();
					                  additionAmt = parseFloat(additionAmt) + parseFloat(rec);
					                  $('#total_amount').val(additionAmt);
					                   invoice_amount+=rec+',';
					                   selct_box_count++;
					                    
                                }

                               


				});

				if(selct_box_count!=0)
				{
				              if(selct_box_count==count_check_box)
				               {
				             	 $('#checked_allboxes').prop('checked',true);
				               }
				}
					
		}//eof if condition

if(i==0){					
				$('#total_amount').val(" ");
					
		}//eof if condition
		
      console.log(check_id);   
      $('#invoice_id_store').val(check_id);
      $('#invoice_amount_store').val(invoice_amount);

});




$(document).on('change','#checked_allboxes', function() 
{
	$('.deduction_mode').show();
var additionAmt=0;
var i=0;
var check_invoice_id=[];
var check_id='';
var invoice_amount='';
if($('#checked_allboxes').prop('checked') == true){
         $('.selecctall').each(function()
         {	 
                       $(this).prop("checked", true);         
			           if($(this).prop('checked') == true)		 
			               {   
				                check_invoice_id.push($(this).attr("id"));//put the Consignment_Id's in the array
				                check_id+=$(this).attr("id")+',';
				                 i++; //to getting how many checkboxes are checked

			               }//eof if condition
	    });//eof each function

 }
else{        
   
     $('.selecctall').each(function(){	 
            $(this).prop("checked", false); });
           $('#total_amount').val(" ");



    }

if(i!=0){					
			$('.selecctall').each(function()
			{
                           if($(this).prop('checked') == true)		 
		     	             {	
			     	               var rec = $(this).closest("tr").find(".balance").text();
				                  additionAmt = parseFloat(additionAmt) + parseFloat(rec);
				                  $('#total_amount').val(additionAmt);
				                   invoice_amount+=rec+',';
                            }


			});
				
		}//eof if condition

      console.log(check_id);   
      $('#invoice_id_store').val(check_id);
      $('#invoice_amount_store').val(invoice_amount);
});










	////////////////////////////////////////////		
	$(document).on('click', '#pay_receive_amount', function() {
		     
		flag=$("#payment_recive_form").valid();
		
		if (flag==true)
		{		
			
            // append the values into formdata
		///////////////////////////////////
		var invoice_id_store=$('#invoice_id_store').val();
		var total_amount=$('#total_amount').val();
		var tds=$('#tds').val();
		var debt=$('#baddebt').val();
		var pay_amount=$('#pay_amount').val();
		var mode = $("input[name='mode']:checked"). val();
		var bank_name = $("#bank_name"). val();
		var client_name = $("#client_name"). val();
		var client_name_array = client_name.split("-"); 
		var client_code=client_name_array[1];
		var invoice_amount_store=$('#invoice_amount_store').val();
		var narration=$('#narration').val();
		var from_date=$('#from_date').val();
		//alert(from_date);
		if(mode=='cash')
		{
			var  transaction_no='---';
			var  cheque_no='---';
		}
		if(mode=='neft')
		{
			var  transaction_no=$('#transaction_no').val();
			var cheque_no='---';
		}
		if(mode=='dd_cheque')
		{
			var  cheque_no=$('#ch_dd_no').val();
			var transaction_no='---';
		}
		if(debt=='')
		{
		    debt=0;	
		}
        if(tds=='')
        {
        	tds=0;
        }
        
		var formdata = new FormData();
		formdata.append('type', "payment_receive");
		formdata.append('invoice_id_store',invoice_id_store);
		formdata.append('transaction_no', transaction_no);
        formdata.append('cheque_no',cheque_no);
        formdata.append('bank_name',bank_name);
        formdata.append('tds',tds);
        formdata.append('debt',debt);
        formdata.append('total_amount',total_amount);
        formdata.append('received',pay_amount);
        formdata.append('narration',narration);
        formdata.append('payment_mode',mode);
        formdata.append('client_code',client_code); 
        formdata.append('invoice_amount_store',invoice_amount_store); 
        formdata.append('from_date',from_date);

			$.ajax({
			   type: "POST",
			   url: "invoice_curd.php",
			   data:formdata,
			   success: function(data){ //alert(data);
					
					if(data)
					{       //$('#hideDiv').show();
					       $('#table_data').html(" ");
					        // $('#msg').show().FadeOut(20000);
					           $( "#msg" ).fadeToggle( "slow", "linear" );
					           $( "#msg" ).fadeOut(5000);
					}
					
				},
			   cache: false,
			   contentType: false,
			   processData: false
			});//eof ajax
			
		}
	});
	
	////////////////////////////////////////////
	


