<?php
include('../../../config.php'); 
require_once(PATH_LIBRARIES.'/classes/DBConn.php');
include(PATH_ADMIN_INCLUDE.'/header.php');
$db = new DBConn();

// get list of Branch
$branchList=$db->ExecuteQuery("SELECT Branch_Id, Branch_Code, Branch_Name, Contact_Person, Address, Destination_Name, Contact_No, Email, Password, CASE WHEN Is_Active=1 THEN 'Block' ELSE 'Unblock' END AS Status FROM tbl_branchs B
INNER JOIN tbl_destinations D ON D.Destination_Id = B.Destination_Id");
?>
<script type="text/javascript"  src="branch.js" ></script>

<div class="pageTitle">
	<div class="ef_header_tools pull-right">
        <a class="btn btn-success btn-sm" href="add_branch.php"><i class="glyphicon glyphicon-plus"></i> <strong>Add New Branch</strong></a>
    </div>
	<h1 class="pull-left">Branch List</h1>
    <div class="clearfix"></div>
</div>
<div class="main">	
	<div class="clear formbgstyle">
        <table class="table table-hover table-bordered" id="addedProducts">
          <thead>
            <tr class="success">
              <th>Sno.</th>
              <th>Branch Code</th>
              <th>Branch Name</th>
              <th>Contact Person</th>
              <th>Address</th>
              <th>City</th>
              <th>Contact No</th>
              <th>Email</th>
              <th>Password</th>
              <th>Stauts</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
            <?php 
                $i=1;
                foreach($branchList as $branchListVal){ ?>
            <tr>
              <td><?php echo $i;?></td>
              <td><?php echo $branchListVal['Branch_Code'];?></td>
              <td><?php echo $branchListVal['Branch_Name'];?></td>
              <td><?php echo $branchListVal['Contact_Person'];?></td>
              <td><?php echo $branchListVal['Address'];?></td>
              <td><?php echo $branchListVal['Destination_Name'];?></td>
              <td><?php echo $branchListVal['Contact_No'];?></td>
              <td><?php echo $branchListVal['Email'];?></td>
              <td><?php echo $branchListVal['Password'];?></td>
              <td>
              	<button type="button" id="<?php echo $branchListVal['Status']."-".$branchListVal['Branch_Id']; ?>" class="status btn btn-sm <?php echo (($branchListVal['Status']=="Block") ? 'btn-danger':'btn-info')?>"><i class="fa <?php echo (($branchListVal['Status']=="Block") ? 'fa-lock':'fa-unlock')?>" aria-hidden="true"></i> <?php echo $branchListVal['Status']; ?></button>
              </td>
              
              <td><button type="button" id="editbtn" class="btn btn-success btn-sm" onClick="window.location.href='edit_branch.php?id=<?php echo $branchListVal['Branch_Id'];?>'" > <span class="glyphicon glyphicon-edit"></span> Edit </button>
                <button type="button" class="btn btn-danger btn-sm delete" id="<?php echo $branchListVal['Branch_Id']; ?>" name="delete"> <span class="glyphicon glyphicon-trash"></span> Delete </button></td>
            </tr>
            <?php $i++;} ?>
          </tbody>
        </table>
    </div>
</div>