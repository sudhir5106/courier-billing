<?php
include('../../../config.php'); 
require_once(PATH_LIBRARIES.'/classes/DBConn.php');
include(BRANCH_PATH_ADMIN_INCLUDE.'/header.php');
require_once(PATH_LIBRARIES.'/classes/ps_pagination.php');
$db = new DBConn();

$con  = mysql_connect(SERVER, DBUSER, DBPASSWORD);
$rows_per_page=ROWS_PER_PAGE;
$totpagelink=PAGELINK_PER_PAGE;

//Get Client List
$sql="SELECT Client_Id, DATE_FORMAT(Joining_Date, '%d-%m-%Y') AS Date, Client_Code, Client_Name, Destination_Name, Address, Contact_No, Email, Password, CASE WHEN Is_Active=1 THEN 'Block' ELSE 'Unblock' END AS Status FROM tbl_clients C
RIGHT JOIN tbl_destinations D ON D.Destination_Id = C.Destination_Id
WHERE Branch_Id=".$_SESSION['buser']." ORDER BY Client_Id DESC";


$Client=$db->ExecuteQuery($sql);

if(isset($_REQUEST['page']) && $_REQUEST['page']>1)
{
	$i=($_REQUEST['page']-1)*$rows_per_page+1;
}
else
{
	$i=1;
}

$pager = new PS_Pagination($con,$sql,$rows_per_page,$totpagelink);
$rs=$pager->paginate();
?>

<script type="text/javascript" src="client.js" ></script>
<script>
	$(document).ready(function(){ 
	
		/////////////////////////////////////////////////////
	// Get Client Code and Name list(autocomplete)///////
	/////////////////////////////////////////////////////  
	var clientcodelist = [
		<?php // PHP begins here
		  
			$menu=$db->ExecuteQuery("SELECT Client_Name FROM tbl_clients WHERE Branch_Id=".$_SESSION['buser']);
			foreach($menu as $val) {
				echo '"'.$val['Client_Name'].'", ';
			} // PHP ends here*/
		?>
	];// eof json format
	
		$("#client_name").autocomplete({
	   
			source: function(req, responseFn) {
				var re = $.ui.autocomplete.escapeRegex(req.term);
				var matcher = new RegExp( "^" + re, "i" );
				var a = $.grep( clientcodelist, function(item,index){
					return matcher.test(item);
				});
				responseFn( a );
			}
		});
	});//eof ready function
</script>

<div class="pageTitle">
	<div class="ef_header_tools pull-right">
        <a class="btn btn-success btn-sm" href="add_client.php"><i class="glyphicon glyphicon-list"></i> <strong>Add New Client </strong></a>
    </div>
	<h1 class="pull-left">Client List</h1>
    <div class="clearfix"></div>
</div>
<div class="main">

	<div class="clear formbgstyle">
        <div class="col-sm-12 srchBox">
           <form id="searchClientWise" class="form-inline" method="post">
                 <div class="form-group">
                  <!--<input type="text" id="client_code" name="client_code" class="form-control input-sm"  placeholder="Client Code" value=""/>-->
                  <input type="text" id="client_name" name="client_name" class="form-control input-sm"  placeholder="Client Name" value=""/>
                 </div>
                 <div class="form-group">
                  <input type="button" name="search"  id="search" Value="Search" class="btn btn-primary btn-sm">
                 </div>
           </form>
        </div>
        <div class="clear formbgstyle" id="detail">
          <table class="table table-hover table-bordered" id="addedProducts">
             <thead>
              <tr class="success">
                     <th>Sno.</th>
                     <th>Date</th>
                     <th>Client Code</th>
                     <th>Client/Company Name</th>
                     <th>Address</th>
                     <th>City</th>
                     <th>Contact No</th>
                     <th>Email</th>
                     <th>Password</th>
                     <th>Status</th>
                     <th>Action</th>
                   </tr>
            </thead>
            <tbody>
    <?php 
        if(count($Client) > 0){
                                
            if($rs){
                while($val = mysql_fetch_assoc($rs)) 
                {			
                    ?>
                  <tr>
                     <td><?php echo $i;?></td>
                     <td><?php echo $val['Date']; ?></td>
                     <td><?php echo $val['Client_Code'];?></td>
                     <td><?php echo $val['Client_Name'];?></td>
                     <td><?php echo $val['Address'];?></td>
                     <td><?php echo $val['Destination_Name'];?></td>
                     <td><?php echo $val['Contact_No'];?></td>                     
                     <td><?php echo $val['Email'];?></td>
                     <td><?php echo $val['Password'];?></td>
                     
                     <td><button type="button" id="<?php echo $val['Status']."-".$val['Client_Id']; ?>" class="status btn btn-sm <?php echo (($val['Status']=="Block") ? 'btn-danger':'btn-info')?>"><i class="fa <?php echo (($val['Status']=="Block") ? 'fa-lock':'fa-unlock')?>" aria-hidden="true"></i> <?php echo $val['Status']; ?></button></td>
                     
                     <td>
                     	<button type="button" id="editbtn" class="btn btn-success btn-sm" onClick="window.location.href='edit_client.php?id=<?php echo $val['Client_Id'];?>'"><span class="glyphicon glyphicon-edit"></span> Edit </button>                  
                  		<button type="button" class="btn btn-danger btn-sm delete" id="<?php echo $val['Client_Id']; ?>" name="delete"> <span class="glyphicon glyphicon-trash"></span> Delete </button>
                     </td>
                  </tr>
                  <?php $i++;
                  }//eof while loop 	
             }//eof if condition
        }//eof if condition
        else
        {?>
                  <tr>
                      <td colspan="11" align="center">No Record Found</td>
                  </tr>
    <?php }//eof else ?>
        </tbody>
      </table>
      <div class="text-center"> <?php echo $pager->renderFullNav(); ?></div>
    </div>
</div>
