<?php
include('../../../config.php'); 
require_once(PATH_LIBRARIES.'/classes/DBConn.php');
include(PATH_ADMIN_INCLUDE.'/header.php');
$db = new DBConn();

// Get all Taxes
$res=$db->ExecuteQuery("SELECT SGST, CGST, Service_Tax, SB_Tax, KKC_Tax FROM tbl_taxes");

?>
<script type="text/javascript" src="tax.js" ></script>

<div class="pageTitle">
	<h1>Type of Taxes</h1>
</div>

<div class="main">
    <div class="clear formbgstyle">
    	<table class="table table-hover table-bordered" id="addedProducts">
            <thead>
                <tr class="success">
                    <th>Sno.</th>
                    <th>SGST (%)</th>
                    <th>CGST (%)</th>
                    <th>Service Tax (%)</th>
                    <th>Swatch Bharat Cess (%)</th>
                    <th>Krishi Kalyan Cess (%)</th>
                    <!--<th>Action</th>-->
                </tr>
            </thead>
            <tbody>
            <?php 
            $i=1;
            foreach($res as $val){ ?>
                <tr>
                    <td><?php echo $i;?></td>
                    <td><?php echo $val['SGST'];?></td>
                    <td><?php echo $val['CGST'];?></td>
                    <td><?php echo $val['Service_Tax'];?></td>
                    <td><?php echo $val['SB_Tax'];?></td>
                    <td><?php echo $val['KKC_Tax'];?></td>
                    <!--<td>
                        <button type="button" id="editbtn" class="btn btn-success btn-sm" onClick="window.location.href='edit_tax.php?id=<?php echo $val['Tax_id'];?>'" ><span class="glyphicon glyphicon-edit"></span> Edit
                        </button>
                        
                        <button type="button" class="btn btn-danger btn-sm delete" id="<?php echo $val['Tax_id']; ?>" name="delete">
                            <span class="glyphicon glyphicon-trash"></span> Delete
                        </button>
                    </td>-->
                </tr>
            <?php $i++;} ?>
            </tbody>
        </table>
    </div>
</div>