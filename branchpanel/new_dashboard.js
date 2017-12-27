 $(document).on('click', '.pagination_first a', function(event)
		{		
		var page=$(this).attr('id');
	    //var district=$('#district').val();
	       alert(page);
		$("#new_page").val(page);
	var str = $("#planresult_new").serializeArray();
		
		 $.ajax({
         type: "GET",
         url: "report_invoice_not paid.php",
          async: false,
         success: function(data){ alert(data);
           x=data;
           $("input[id=new_page]").val(page);
           $('#full_amount_not_paid').html(data);
         }
         });
		
	});