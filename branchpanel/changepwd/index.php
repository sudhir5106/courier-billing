<?php 
require('../../config.php');
require_once(PATH_LIBRARIES.'/classes/DBConn.php');
include(BRANCH_PATH_ADMIN_INCLUDE.'/header.php');
$db = new DBConn();

	$ChangePwd=$db->ExecuteQuery("SELECT Password FROM tbl_branchs  WHERE Branch_Id='".$_SESSION['buser']."'");
echo "SELECT Password FROM tbl_branchs WHERE Branch_Id='".$_SESSION['buser']."'";
?>
<script type="text/javascript" src="pwd.js"></script>
<div class="main">
	<h4>Change Password</h4>
    <div class="clear formbgstyle">
    	<form class="form-horizontal" role="form" id="changePassword" method="post">
   <input type="hidden" id="password" value="<?php echo $ChangePwd[1]['Password'];?>"/>
            	<div class="form-group">
                   <label class="control-label col-sm-3 mandatory" for="old_pwd">Old Password: </label>
                  <div class="col-sm-3">
                    <input type="password" placeholder="Old Password" id="old_pwd" name="old_pwd" class="form-control input-sm" >
                  </div>
                </div>
                <div class="form-group">
                  <label class="control-label col-sm-3 mandatory" for="new_pwd">New Password <span>*</span>:</label>
                  <div class="col-sm-3">
                    <input type="password" class="form-control input-sm" id="new_pwd" name="new_pwd" placeholder="New Password" />
                  </div>
                </div>
                <div class="form-group">
                  <label class="control-label col-sm-3 mandatory" for="con_pwd">Confirm New Password: </label>
                  <div class="col-sm-3">
                    <input type="password" placeholder="Confirm New Password" id="con_pwd" name="con_pwd" class="form-control input-sm" >
                  </div>
                </div>
               <div class="form-group">
                  <div class="col-sm-9 col-sm-offset-3">
                  <button type="button" id="submit" class="btn btn-success btn-sm">Submit</button>
                   </div>
                </div>
            </div>
        </form>
  
 

</div>
</div>
