// JavaScript Document

        $(document).on('click', '.pagination a', function(event)
		{		
		event.preventDefault();
		var page=$(this).attr('id');
	    
		$("input[id=page]").val(page);
		
		
		$.ajax({  
				type: "GET",  
				url: "dashboard_curd.php", 
				data: {page:page,type:"invoice_not_paid"},  
				async: false,
				success: function(value) { //alert(value);
					
				  $('#full_amount_not_paid').html(value);
				}
		});//eof ajax
		
	});


 