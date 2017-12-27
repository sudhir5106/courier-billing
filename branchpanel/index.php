<?php 
require('../config.php');
include(BRANCH_PATH_ADMIN_INCLUDE.'/head.php');
 

//if($_SESSION['buser']==" ")
 if (isset($_SESSION['buser'])) {
 ?>
  <script>
  window.location.href = '<?php echo BRANCH_PATH_ADMIN_LINK.'/home.php'; ?>';
</script>
 <?php

 }?>
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
		var email =$("#buser").val();
		var password =$("#password").val();
		
		if (email=="")
		{
			$("#msg").append("<strong>Warning!</strong> Please Enter Email Id");
			$("#msg").show();
			return false;
		}
		
		if (password=="")
		{
			$("#msg").append("<strong>Warning!</strong> Please Enter Password");
			$("#msg").show();
			return false;
		}
		
		var x;
		$.ajax({
			url:'check_branch_login.php',
			type:'POST',
			data:{email:email,password:password},
			success:function(data){ //alert(data);
				x=data;
				if(x=="true")
				{
					document.location.href="home.php";
				}
				else
				{
					$("#msg").append("<strong>Warning!</strong> Incorrect Username/Password!");
					$("#msg").show();
				}
			}
			
		});
	});
});
</script>

<div class="admin_body">
  <div class="admin">
    <form class="form-horizontal" role="form" id="index" name="index" method="post">
      <div class="login_title">Branch Login </div>
      <div class="input-group"><span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
        <input type="text" id="buser" name="buser" class="form-control" placeholder="Email">
      </div>
      <div class="input-group padding"> <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
        <input type="password" id="password" name="password" class="form-control" placeholder="Password">
      </div>
      <div align="center" class="padding">
        <button  type="button" id="login" class="btn btn-success">Login</button>
      </div>
      <br />
    </form>
    <div class="alert alert-danger alert-dismissable" id="msg"> </div>
  </div>
</div>
