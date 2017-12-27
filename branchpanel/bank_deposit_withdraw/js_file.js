// JavaScript Document
$(document).ready(function()
{
		///////////////////////////////////
	// validation for Bank Deposits
	////////////////////////////////////
	$("#bank_deposits").validate({
		rules: 
		{ 		
			bank_name: 
			{ 
				required: true,
				
			},
			from_date: 
			{ 
				required: true,
				
			},
			total_pay: 
			{ 
				required: true,
				number:true,
				
			},
		},
		message:
		{
		}
		
	});// eof validation
	
	
	//////////////////////////////////////////
	// on click of submit button /////////////
	//////////////////////////////////////////
	$(document).on("click","#submit", function(){
		
		flag=$("#bank_deposits").valid();
		
		if (flag==true)
		{		
			var formdata = new FormData();
			var bank_name=$('#bank_name').val();
			var from_date=$('#from_date').val();
			var total_cash=$('#total_cash').val();
			var total_pay=$('#total_pay').val();
		 formdata.append('type', "payment_paid");
		 formdata.append('bank_name', "bank_name");
		 formdata.append('from_date', "from_date");
		 formdata.append('total_cash', "total_cash");
		 formdata.append('total_pay', "total_pay");

		 		
		}
	});
	

//////////////////////////////////////////
	// on chang of from_date  /////////////
	//////////////////////////////////////////

$(document).on("change","#from_date", function(){
	alert("hello");
      var formdata = new FormData();
			var bank_name=$('#bank_name').val();
			var from_date=$('#from_date').val();
			formdata.append('type', "total_amount_get");

       $.ajax({
			   type: "POST",
			   url: "curd_file.php",
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