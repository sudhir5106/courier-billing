<?php
include('../../../config.php'); 
require_once(PATH_LIBRARIES.'/classes/DBConn.php');
include(BRANCH_PATH_ADMIN_INCLUDE.'/header.php');
$db = new DBConn();

// Get list of Banks
$bankList=$db->ExecuteQuery("SELECT Bank_Id, Bank_Name, Account_Name, Account_No, Branch_Address, IFSC_Code, Branch_Id
FROM tbl_banks 
WHERE Branch_Id=".$_SESSION['buser']);
?>

<script type="text/javascript"  src="bank.js" ></script>

<div class="pageTitle">
	<div class="ef_header_tools pull-right">
        <a class="btn btn-success btn-sm" href="add_bank.php"><i class="glyphicon glyphicon-plus"></i> <strong>Add New Bank</strong></a>
    </div>
	<h1 class="pull-left">Bank List</h1>
    <div class="clearfix"></div>
</div>
<div class="main">
	<div class="clear formbgstyle">
        <table class="table table-hover table-bordered" id="addedProducts">
          <thead>
            <tr class="success">
              <th>Sno.</th>
              <th>Bank Name</th>
              <th>Account Name</th>
              <th>Account No</th>
              <th>Branch Address</th>
              <th>IFSC Code</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
	<?php 
        $i=1;
        foreach($bankList as $bankListVal){ ?>
            <tr>
              <td><?php echo $i;?></td>
              <td><?php echo $bankListVal['Bank_Name'];?></td>
              <td><?php echo $bankListVal['Account_Name'];?></td>
              <td><?php echo $bankListVal['Account_No'];?></td>
              <td><?php echo $bankListVal['Branch_Address'];?></td>
              <td><?php echo $bankListVal['IFSC_Code'];?></td>
              
              <td><button type="button" id="editbtn" class="btn btn-success btn-sm" onClick="window.location.href='edit_bank.php?id=<?php echo $bankListVal['Bank_Id'];?>'"><span class="glyphicon glyphicon-edit"></span> Edit</button>
                <button type="button" class="btn btn-danger btn-sm delete" id="<?php echo $bankListVal['Bank_Id']; ?>" name="delete"><span class="glyphicon glyphicon-trash"></span> Delete</button></td>
            </tr>
            <?php $i++;} ?>
          </tbody>
        </table>
    </div>
</div>