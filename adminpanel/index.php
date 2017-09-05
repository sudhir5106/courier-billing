<?php 
require('../config.php');
include(PATH_ADMIN_INCLUDE.'/head.php');
?>

<script>
$(document).ready(function(){
	$("#msg").hide();
	
	document.onkeydown = function(event) {
	   if (event.keyCode == 13) {
		   $("#login").trigger("click");
	   }
	}
	
	$("#login").click(function(){
		
		$("#msg").hide();
		$("#msg").text('');
		var user_name=$("#user").val();
		var password=$("#password").val();
		
		if (user_name=="")
		{
			$("#msg").append("<strong>Warning!</strong> Enter User Name");
			$("#msg").show();
			return false;
		}
		if (password=="")
		{
			$("#msg").append("<strong>Warning!</strong> Enter Password");
			$("#msg").show();
			return false;
		}
		var x;
		$.ajax(
		{
			url:'check_login.php',
			type:'POST',
			data:{user:user_name,password:password},
			async:false,
			success:function(data){ //alert(data);
				x=data;
			}//eof of success
		});
		if(x=="true")
		{
			document.location.href="home.php";
		}
		else
		{
			$("#msg").append("<strong>Warning!</strong> Incorrect Username/Password!");
			$("#msg").show();
		}
	});
});
</script>
<div class="admin_body">
<div class="admin">
<form class="form-horizontal" role="form" id="index" name="index" method="post">
<div class="login_title">Admin Login </div>
  <div class="input-group"><span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
    <input type="text" id="user" name="user" class="form-control" placeholder="Username">
  </div>
  <div class="input-group padding"> <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
    <input type="password" id="password" name="password" class="form-control" placeholder="Password">
  </div>
  <div align="center" class="padding">
    <button  type="button" id="login" class="btn btn-success">Login</button>
  </div>
  <br />
  
</form>
<div class="alert alert-danger alert-dismissable" id="msg">
</div>
</div>


</div>
<?php  include('footer.php');?>