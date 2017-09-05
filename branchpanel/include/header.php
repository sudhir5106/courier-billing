<?php
require_once(PATH_LIBRARIES.'/classes/DBConn.php');
include(BRANCH_PATH_MASTERS.'/include/head.php');

$db = new DBConn();

if(!isset($_SESSION['buser']))
{?>
<script>
	window.location.href = '<?php echo BRANCH_PATH_ADMIN_LINK.'/index.php'; ?>';
</script>
<?php }
?>
<script>
$(document).ready(function() {
	$("#logoff").click(function(){
		$.ajax(
		{
			url:'<?php echo BRANCH_PATH_ADMIN_LINK.'/branch_logout.php'; ?>',
			type:'POST',
			data:{},
			async:false,
			success:function(data){//alert(data);
				if (data=="true")
				{
					document.location.href='<?php echo BRANCH_PATH_ADMIN_LINK.'/index.php'; ?>';
				}
			}//eof success
		});//eof ajax
	});//eof click function
});//eof ready function
</script>
<?php 
$sql="SELECT Branch_Code, Branch_Name FROM tbl_branchs WHERE Branch_Id='".$_SESSION['buser']."'";
$res=$db->ExecuteQuery($sql);
?>
<div class="headPart">
      <div>
        <div class="title flote_left">Branch Administrator Panel</div>
        <div class="logout float_right">
          <div class="pull-right">
          	<div class="user_style">
            	<button type="button" class="btn btn-default" id="logoff"> <span class="glyphicon glyphicon-off"></span> Logoff </button>
            </div>
          </div>
          <div class="pull-right accountName">
          	<strong>Branch Code</strong>: <?php echo $res[1]['Branch_Code'] ?><br />
          	<strong>Branch Name</strong>: <?php echo $res[1]['Branch_Name']; ?>
          </div>
        </div>
      </div>
      <div class="clear"></div>
    </div>
</div>
<!--logout menu end here-->
<div class="clear"></div>

<nav class="navbar navbar-inverse top-nav	" role="navigation" style="border-radius:0;">
  <ul class="nav nav-pills dropdown open">
    <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="100"> Masters <b class="caret"></b></a>
      <ul class="dropdown-menu multi-level">
        <li><a tabindex="-1" href="<?php echo BRANCH_MASTERS_LINK_CONTROL?>/operator">Operators</a></li>
        <li><a tabindex="-1" href="<?php echo BRANCH_MASTERS_LINK_CONTROL?>/clients">Clients</a></li>
        <li><a tabindex="-1" href="<?php echo BRANCH_MASTERS_LINK_CONTROL?>/rate">Rate master</a></li>
        <li><a tabindex="-1" href="<?php echo BRANCH_MASTERS_LINK_CONTROL?>/banks">Banks</a></li>
      </ul>
    </li>
    <li><a tabindex="-1" href="<?php echo BRANCH_PATH_ADMIN_LINK?>/consignments/">Consignment Entry</a></li>
    <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="100"> Billing <b class="caret"></b></a>
    	<ul class="dropdown-menu">
            <li><a tabindex="-1" href="<?php echo BRANCH_PATH_ADMIN_LINK?>/invoice/"> Generate Invoice </a></li>
            <li><a tabindex="-1" href="<?php echo BRANCH_PATH_ADMIN_LINK?>/invoice/report.php"> Invoice Report</a></li>
            <li><a tabindex="-1" href="<?php echo BRANCH_PATH_ADMIN_LINK?>/paymentreport/"> Payment Receipt Report</a></li>
        </ul>
    </li>
    <li><a tabindex="-1" href="<?php echo BRANCH_PATH_ADMIN_LINK?>/changepwd/">Change Password</a></li>
  </ul>
</nav>

