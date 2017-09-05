<?php
include(PATH_MASTERS.'/include/head.php');
if($_SESSION['user']=="")
{?>
<script>
	window.location.href = '<?php echo PATH_ADMIN_LINK.'/index.php'; ?>';
	</script>
<?php }
?>
<script>
$(document).ready(function() {
$("#logoff").click(function(){
$.ajax(
	{
	url:'<?php echo PATH_ADMIN_LINK.'/logout.php'; ?>',
	type:'POST',
	data:{},
	async:false,
	success:function(data){
	if (data=="true")
		{
			document.location.href='<?php echo PATH_ADMIN_LINK.'/index.php'; ?>';
		}
	}
	});
});
});
</script>
    <div class="headPart">
      <div>
        <div class="title flote_left"><h1>ADMIN PANEL</h1></div>
        <div class="logout float_right">
          <div class="user_style">
            <button type="button" class="btn btn-default" id="logoff"> <span class="glyphicon glyphicon-off"></span> Logoff </button>
          </div>
          <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"> <span class="glyphicon glyphicon-user"></span> <span class="caret"></span> </button>
        </div>
      </div>
      <div class="clear"></div>
    </div>
</div>
<!--logout menu end here-->
<div class="clear"></div>

<nav class="navbar navbar-inverse top-nav" role="navigation" style="border-radius:0;">
  <ul class="nav nav-pills dropdown open">
    <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="100"> Masters <b class="caret"></b></a>
      <ul class="dropdown-menu multi-level">
        <li class="dropdown-submenu">
        	<a tabindex="-1" href="#"> Location Management </a>
            <ul class="dropdown-menu">
                <li><a tabindex="-1" href="<?php echo MASTERS_LINK_CONTROL?>/zone">Operational Zone</a></li>
                <li><a tabindex="-1" href="<?php echo MASTERS_LINK_CONTROL?>/state">State</a></li>
                <li><a tabindex="-1" href="<?php echo MASTERS_LINK_CONTROL?>/destination">Destination</a></li>
                <li><a tabindex="-1" href="<?php echo MASTERS_LINK_CONTROL?>/taxes">Taxes</a></li>
            </ul>
        </li>
        <li class="dropdown-submenu"><a tabindex="-1" href="<?php echo MASTERS_LINK_CONTROL?>/branch">Branch</a></li>
      </ul>
    </li>
  </ul>
 </nav>

