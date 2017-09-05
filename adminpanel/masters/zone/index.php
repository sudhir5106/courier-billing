<?php
include('../../../config.php'); 
require_once(PATH_LIBRARIES.'/classes/DBConn.php');
include(PATH_ADMIN_INCLUDE.'/header.php');
$db = new DBConn();

// get all list of homepage slider images
$res=$db->ExecuteQuery("SELECT * FROM tbl_zones");
?>
<script type="text/javascript"  src="zone.js" ></script>

<div class="pageTitle">
	<h1>Add Operational Zone</h1>
</div>

<div class="main">	
    <div class="clear formbgstyle">
    	<form class="form-horizontal" role="form" id="insertZone" method="post">
        	<div>
            	<div class="form-group">
                  <label class="control-label col-sm-3 mandatory" for="zone_code">Zone Code <span>*</span>:</label>
                  <div class="col-sm-3">
                    <input type="text" class="form-control input-sm" id="zone_code" name="zone_code" placeholder="Zone Code"  />
                  </div>
                </div>
                <div class="form-group">
                  <label class="control-label col-sm-3 mandatory" for="zone_name">Zone Name <span>*</span>:</label>
                  <div class="col-sm-3">
                    <input type="text" class="form-control input-sm" id="zone_name" name="zone_name" placeholder="Zone Name" />
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-sm-3"></div>
                  <div class="col-sm-3">
                  	<input type="button" class="btn btn-primary btn-sm" id="submit" value="Add New">
                    <input type="reset" class="btn btn-default btn-sm" value="Reset" id="reset">
                  </div>
                </div>
            </div>
        </form>
        
        <table class="table table-hover table-bordered" id="addedProducts">
            <thead>
                <tr class="success">
                    <th>Sno.</th>
                    <th>Zone Code</th>
                    <th>Zone Name</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            <?php 
            $i=1;
            foreach($res as $val){ ?>
                <tr>
                    <td><?php echo $i;?></td>
                    <td><?php echo $val['Zone_Code'];?></td>
                    <td><?php echo $val['Zone_Name'];?></td>
                    <td>
                        <button type="button" id="editbtn" class="btn btn-success btn-sm" onClick="window.location.href='edit_zone.php?id=<?php echo $val['Zone_Id'];?>'" >
                    <span class="glyphicon glyphicon-edit"></span> Edit
                        </button>
                        
                        <button type="button" class="btn btn-danger btn-sm delete" id="<?php echo $val['Zone_Id']; ?>" name="delete">
                            <span class="glyphicon glyphicon-trash"></span> Delete
                        </button>
                    </td>
                </tr>
            <?php $i++;} ?>
            </tbody>
        </table>
    </div>
</div>