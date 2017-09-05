<?php 
include('../../config.php'); 
require_once(PATH_LIBRARIES.'/classes/rate.php');
$rateClass = new rate();


///*******************************************************
/// for Client invalid ///////////////////////////////////
///*******************************************************
if($_POST['type']=="clientInvalid")
{
	$clientName = explode("-", $_POST['client_name']);
	
	$sql=$rateClass->ExecuteQuery("SELECT EXISTS( SELECT 1 FROM tbl_clients WHERE Client_Name='".$clientName[0]."' AND Branch_Id=".$_SESSION['buser']." ) AS 'Find'");
	
	echo $sql[1]['Find'];	  
}

///*******************************************************
/// for Destination invalid //////////////////////////////
///*******************************************************
if($_POST['type']=="destInvalid")
{
	$sql=$rateClass->ExecuteQuery("SELECT EXISTS( SELECT 1 FROM tbl_destinations WHERE Destination_Name ='".$_POST['Destination_Name']."' ) AS 'Find'");
	
	echo $sql[1]['Find'] ;	  
}

///*******************************************************
/// for Consignment No invalid ///////////////////////////
///*******************************************************
if($_POST['type']=="invalidCons")
{
	$sql=$rateClass->ExecuteQuery("SELECT EXISTS( SELECT 1 FROM tbl_consignments WHERE Consignment_No='".$_POST['consignment_no']."' AND Branch_Id=".$_SESSION['buser']." ) AS 'Find'");
	
	echo $sql[1]['Find'];	  
}

///*******************************************************
/// To Date Should be greater than From Date
///*******************************************************
if($_POST['type']=="greaterThenFromDate")
{
	
	$fromDate=date('Y-m-d',strtotime($_POST['from_date']));
	$toDate=date('Y-m-d',strtotime($_POST['to_date']));
	
	if($fromDate > $toDate){
		echo 0;
	}
	else{
		echo 1;
	}
	
}

///*************************************************************************
/// If Rates are not defined in the rate master for this detination and zone
///*************************************************************************
if($_POST['type']=="rateNoExist")
{
	$sql=$rateClass->ExecuteQuery("SELECT EXISTS(SELECT 1 FROM tbl_rates WHERE Zone_Id=(SELECT Zone_Id FROM tbl_states WHERE State_Id=(SELECT State_Id FROM tbl_destinations WHERE Destination_Id=".$_POST['dest_id']."))) AS Find");
	
	echo $sql[1]['Find'] ;	  
}


///****************************************************************************************
/// If Rates are not defined in the rate master for destination and zone
///****************************************************************************************
if($_POST['type']=="zoneExist")
{
	// Get Branch Destination
	$getBranchDest=$rateClass->ExecuteQuery("SELECT Destination_Id FROM tbl_branchs WHERE Branch_Id=".$_SESSION['buser']);
	// Get Branch State
	$getBranchState = $rateClass->ExecuteQuery("SELECT State_Id FROM tbl_destinations WHERE Destination_Id=".$getBranchDest[1]['Destination_Id']);
	
	// Get User Input Destination's State 
	// To Compare with the Branch State
	$getInputState=$rateClass->ExecuteQuery("SELECT State_Id FROM tbl_destinations WHERE Destination_Id=".$_POST['dest_id']);
	
	// check if the input destination id is 
	// coming under the "within state
	if($getBranchState[1]['State_Id'] == $getInputState[1]['State_Id']){
		
		// check if the input destination id is 
		// coming under the "within city
		if($getBranchDest[1]['Destination_Id'] == $_POST['dest_id']){
			
			$sql=$rateClass->ExecuteQuery("SELECT EXISTS(SELECT 1 FROM tbl_rates WHERE Zone_Id=1 AND Client_Id=".$_POST['client_id']." AND Send_By=".$_POST['send_by'].") AS Find");
			
		}//eof if condition
		else{
			$sql=$rateClass->ExecuteQuery("SELECT EXISTS(SELECT 1 FROM tbl_rates WHERE Zone_Id=2 AND Client_Id=".$_POST['client_id']." AND  Send_By=".$_POST['send_by'].") AS Find");
		}//eof else
		
	}
	else{
		$sql=$rateClass->ExecuteQuery("SELECT EXISTS(SELECT 1 FROM tbl_rates WHERE Zone_Id=".$_POST['zone_id']." AND Client_Id=".$_POST['client_id']." AND Send_By=".$_POST['send_by'].") AS Find");
	}
	
	echo $sql[1]['Find'] ;
}


///****************************************************************************************
/// If Rates are not defined in the rate master for Send By(SURFACE, AIR, URGENT) and zone
///****************************************************************************************
if($_POST['type']=="SendByRateNotExist")
{
	// Get Branch Destination
	$getBranchDest=$rateClass->ExecuteQuery("SELECT Destination_Id FROM tbl_branchs WHERE Branch_Id=".$_SESSION['buser']);
	// Get Branch State
	$getBranchState = $rateClass->ExecuteQuery("SELECT State_Id FROM tbl_destinations WHERE Destination_Id=".$getBranchDest[1]['Destination_Id']);
	
	// Get User Input Destination's State 
	// To Compare with the Branch State
	$getInputState=$rateClass->ExecuteQuery("SELECT State_Id FROM tbl_destinations WHERE Destination_Id=".$_POST['dest_id']);
	
	// check if the input destination id is 
	// coming under the "within state
	if($getBranchState[1]['State_Id'] == $getInputState[1]['State_Id']){
		
		// check if the input destination id is 
		// coming under the "within city
		if($getBranchDest[1]['Destination_Id'] == $_POST['dest_id']){
			$sql=$rateClass->ExecuteQuery("SELECT EXISTS(SELECT 1 FROM tbl_rates WHERE Zone_Id=1 AND Client_Id=".$_POST['client_id']." AND  Send_By=".$_POST['send_by'].") AS Find");
		}//eof if condition
		else{
			$sql=$rateClass->ExecuteQuery("SELECT EXISTS(SELECT 1 FROM tbl_rates WHERE Zone_Id=2 AND Client_Id=".$_POST['client_id']." AND  Send_By=".$_POST['send_by'].") AS Find");
		}//eof else
	}//eof if condition
	else{
		
		$sql=$rateClass->ExecuteQuery("SELECT EXISTS(SELECT 1 FROM tbl_rates WHERE Zone_Id=(SELECT Zone_Id FROM tbl_states WHERE State_Id=(SELECT State_Id FROM tbl_destinations WHERE Destination_Id=".$_POST['dest_id'].")) AND Client_Id=".$_POST['client_id']." AND Send_By=".$_POST['send_by'].") AS Find");
		
	}//eof else
	
	echo $sql[1]['Find'] ;	  
}

///*************************************************************************
/// If Rates are not defined in the rate master for this detination and zone
///*************************************************************************
if($_POST['type']=="weightNotFound")
{
	$sql=$rateClass->ExecuteQuery("SELECT EXISTS(SELECT 1 FROM tbl_weight_rate_relation WHERE Weight_From < ".$_POST['weight']." AND Weight_To >= ".$_POST['weight']." AND Rate_Id=(SELECT Rate_Id FROM tbl_rates WHERE Client_Id=".$_POST['client_id']." AND Zone_Id=(SELECT Zone_Id FROM tbl_states WHERE State_Id=(SELECT State_Id FROM tbl_destinations WHERE Destination_Id=".$_POST['dest_id'].")))) AS Find");
	
	echo $sql[1]['Find'] ;	  
}

///*******************************************************
/// Check If the same AWB No. used before 30 days or not.
///*******************************************************
if($_POST['type']=="ABWExist")
{
	$rawdate = $_POST['date'];
	$date = date('Y-m-d', strtotime($rawdate));
	
	$sql=$rateClass->ExecuteQuery("SELECT EXISTS (SELECT 1 FROM tbl_consignments WHERE Consignment_No='".$_POST['consignment_no']."' AND Date_Of_Submit BETWEEN DATE( DATE_SUB( '".$date."' , INTERVAL 30 DAY ) ) AND DATE ( NOW() ) AND Branch_Id=".$_SESSION['buser'].") AS Find");
	
	echo $sql[1]['Find'] ;	  
}


///*******************************************************
/// Get Subtotal Amount //////////////////////////////////
///*******************************************************
if($_POST['type']=="getSubtotal")
{
	
	$rateClass->getSubtotal($_POST['client_id'], $_POST['dest_id'], $_POST['send_by'], $_POST['weight']);
	
}

///*******************************************************
/// Get Client Name
///*******************************************************
if($_POST['type']=="getClientName")
{
	
	if(!empty($_POST['client_name'])){
		
		$isarr = substr_count($_POST['client_name'], '-');		
		if($isarr!=0){
			$clientName = explode('-',$_POST['client_name']);	
			$sql="SELECT Client_Id, Client_Name, Address, (SELECT Destination_Name FROM tbl_destinations D WHERE C.Destination_Id=D.Destination_Id) AS Destination_Name FROM tbl_clients C WHERE Client_Name='".$clientName[0]."' AND Client_Code=".$clientName[1];
			//echo "SELECT Client_Id, Client_Name FROM tbl_clients WHERE Client_Name='".$clientName[0]."'";
			$res=$rateClass->ExecuteQuery($sql);
		}
	}	
	
		
	if(!empty($res))
    {
 		echo "<input type='hidden' class='form-control input-sm' id='client_id' name='client_id' value='".$res[1]['Client_Id']."' />";
    }
		
}

///*******************************************************
/// Get Destination Id and Name
///*******************************************************
if($_POST['type']=="getDestinationName")
{
	$sql="SELECT Destination_Id, Destination_Name, Zone_Id 
	FROM tbl_destinations D	
	INNER JOIN tbl_states S ON D.State_Id = S.State_Id	
	WHERE Destination_Name='".$_POST['Destination_Name']."'";
	$res=$rateClass->ExecuteQuery($sql);
		
	if(!empty($res))
    {
 		echo "<input type='hidden' id='dest_id' name='dest_id' value='".$res[1]['Destination_Id']."' /> <input type='hidden' id='zone_id' name='zone_id' value='".$res[1]['Zone_Id']."' />";
    }
}

///*******************************************************
/// To Insert New Consignment /////////////////////////////////
///*******************************************************
if($_POST['type']=="addConsignment")
{
	if($_POST['insured_value']!=0)
	{
		$insured_value = $_POST['insured_value'];

		$sql="SELECT Insurance_Percent FROM tbl_clients WHERE Client_Id=".$_POST['client_id'];
		$res=$rateClass->ExecuteQuery($sql);
		
		$Ipercent=($insured_value*$res[1]['Insurance_Percent'])/100;
		$insuranceOtherCharges=$Ipercent+$_POST['other_charges'];
	}
	else{
		$insured_value=0;
		
		if($_POST['other_charges']!=0)
		{
			$insuranceOtherCharges=$_POST['other_charges'];
		}
		else{
			$insuranceOtherCharges=0;
		}
	}
	
	
	if($_POST['discount_percent']==""){
		$discountPercent = 0;	
	}
	else{
		$discountPercent = $_POST['discount_percent'];
	}
	
	if($_POST['discount_rs']==""){
		$discount_rs = 0;	
	}
	else{
		$discount_rs = $_POST['discount_rs'];
	}
	
	$rawdate = $_POST['date'];
	$date = date('Y-m-d', strtotime($rawdate));
	
	
	$con= mysql_connect(SERVER,DBUSER,DBPASSWORD);
	mysql_query('SET AUTOCOMMIT=0',$con);
	mysql_query('START TRANSACTION',$con);
	
	try
	{	
		$res=mysql_query("INSERT INTO tbl_consignments (Consignment_No, Destination_Id, Mode, No_Of_Pieces, Send_By, Total_Weight_In_KG, Insured_Value, Subtotal, Discount_Percent, Discount_Rs, Total_Amount, Other_Charges, Insurance_Other_Charges, Client_id, Branch_Id, Date_Of_Submit)
VALUES('".$_POST['consignment_no']."', ".$_POST['dest_id'].", ".$_POST['mode'].", ".$_POST['pieces'].", ".$_POST['send_by'].", ".$_POST['weight'].", ".$insured_value.", ".$_POST['subtotal'].", ".$discountPercent.", ".$discount_rs.", ".$_POST['total_amt'].", ".$_POST['other_charges'].", ".$insuranceOtherCharges.", ".$_POST['client_id'].", ".$_SESSION['buser'].", '".$date."')");


		if(!$res)
		{
			throw new Exception('a');
		}
		
		mysql_query("COMMIT",$con);
		echo 1;
	}
	catch(Exception $e)
	{
		echo  $e->getMessage();
		mysql_query('ROLLBACK',$con);
		mysql_query('SET AUTOCOMMIT=1',$con);
	}
}

///*******************************************************
/// To edit Consignment /////////////////////////////////
///*******************************************************
if($_POST['type']=="editConsignment")
{
	
	if($_POST['insured_value']!=0)
	{
		$insured_value = $_POST['insured_value'];
		
		$sql="SELECT Insurance_Percent FROM tbl_clients WHERE Client_Id=".$_POST['client_id'];
		$res=$rateClass->ExecuteQuery($sql);
		
		$Ipercent=($insured_value*$res[1]['Insurance_Percent'])/100;
		$insuranceOtherCharges=$Ipercent+$_POST['other_charges'];
	}
	else{
		$insured_value=0;
		
		if($_POST['other_charges']!=0)
		{
			$insuranceOtherCharges=$_POST['other_charges'];
		}
		else{
			$insuranceOtherCharges=0;
		}
	}

	if($_POST['discount_percent']==""){
		$discountPercent = 0;	
	}
	else{
		$discountPercent = $_POST['discount_percent'];
	}
	
	if($_POST['discount_rs']==""){
		$discount_rs = 0;	
	}
	else{
		$discount_rs = $_POST['discount_rs'];
	}
	
	$rawdate = $_POST['date'];
	$date = date('Y-m-d', strtotime($rawdate));
	
	//echo $date;
	
	$con= mysql_connect(SERVER,DBUSER,DBPASSWORD);
	mysql_query('SET AUTOCOMMIT=0',$con);
	mysql_query('START TRANSACTION',$con);
	
	try
	{	
		
		$res=mysql_query("UPDATE tbl_consignments SET Destination_Id=".$_POST['dest_id'].", Mode=".$_POST['mode'].", No_Of_Pieces=".$_POST['pieces'].", Send_By=".$_POST['send_by'].", Total_Weight_In_KG=".$_POST['weight'].", Insured_Value=".$insured_value.", Subtotal=".$_POST['subtotal'].", Discount_Percent=".$discountPercent.", Discount_Rs=".$discount_rs.", Total_Amount=".$_POST['total_amt'].", Other_Charges=".$_POST['other_charges'].", Insurance_Other_Charges=".$insuranceOtherCharges.", Client_id=".$_POST['client_id'].", Date_Of_Submit='".$date."' WHERE Consignment_Id=".$_POST['consignment_id']);
		
		
		if(!$res)
		{
			throw new Exception('a');
		}
		
		mysql_query("COMMIT",$con);
		echo 1;
	}
	catch(Exception $e)
	{
		echo  $e->getMessage();
		mysql_query('ROLLBACK',$con);
		mysql_query('SET AUTOCOMMIT=1',$con);
	}
}

///*******************************************************
/// Delete row from tbl_consignments table
///*******************************************************

if($_POST['type']=="delete")
{
	 $tblname="tbl_consignments";
	 $condition="Consignment_Id=".$_POST['id'];
	 $res=$rateClass->deleteRecords($tblname,$condition);
	
}

///***********************************************************
/// Search row from tbl_consignments table consignment no wise
///***********************************************************
if($_POST['type']=="search_consignment")
{ 
	$consignment=$rateClass->ExecuteQuery("SELECT DATE_FORMAT(Date_Of_Submit,'%d-%m-%Y') AS Date, Consignment_Id, Consignment_No, Destination_Name, CASE WHEN Mode=1 THEN 'Dox' ELSE 'Non-Dox' END AS Mode, CASE WHEN Send_By=1 THEN 'Surface' WHEN Send_By=2 THEN 'Air' ELSE 'Urgent' END Send_By, Total_Weight_In_KG, FORMAT(Total_Amount, 2) AS Total_Amount, Client_Name, Client_Code, Operator_Name FROM tbl_consignments CO
LEFT JOIN tbl_destinations D ON D.Destination_Id = CO.Destination_Id
LEFT JOIN tbl_operators O ON O.Operator_Id = CO.Operator_Id
LEFT JOIN tbl_clients C ON C.Client_id = CO.Client_id
WHERE CO.Branch_Id=".$_SESSION['buser']." AND CO.Consignment_No='".$_POST['consignment_no']."'");
?>
<table class="table table-hover table-bordered" id="addedProducts">
     <thead>
      <tr class="success">
             <th>Sno.</th>
             <th>Date</th>
             <th>AWB No.</th>
             <th>Destination</th>
             <th>Mode</th>
             <th>Sent By</th>
             <th>Weight</th>
             <th>Total Amount</th>
             <th>Client Name/Code</th>
             <th>Operator</th>
             <th>Action</th>
           </tr>
    </thead>
    <tbody>
	<?php 
    if(count($consignment) > 0)
    {
        $i=1;
        foreach($consignment as $val){ ?>
            <tr>
            	 <td ><?php echo $i;?></td>
                     <td><?php echo $val['Date'];?></td>
                     <td><?php echo $val['Consignment_No'];?></td>
                     <td><?php echo $val['Destination_Name'];?></td>
                     <td><?php echo $val['Mode'];?></td>
                     <td><?php echo $val['Send_By'];?></td>
                     <td><?php echo $val['Total_Weight_In_KG'];?></td>                     
                     <td><?php echo $val['Total_Amount'];?></td>
                     <td><?php echo $val['Client_Name'].'-'.$val['Client_Code'];?></td>
                     <td><?php echo $val['Operator_Name']==NULL?'Branch':$val['Operator_Name'];?></td>
                 
                 <td>
                    <button type="button" id="editbtn" class="btn btn-success btn-sm" onClick="window.location.href='edit_consignment.php?id=<?php echo $val['Consignment_Id'];?>'"><span class="glyphicon glyphicon-edit"></span> Edit </button>                  
                    <button type="button" class="btn btn-danger btn-sm delete" id="<?php echo $val['Consignment_Id']; ?>" name="delete"> <span class="glyphicon glyphicon-trash"></span> Delete </button>
                 </td>
             
            </tr>
            <?php $i++;} 
			}
			else
	         { ?>
            <tr>
              <td colspan="10" align="center">No Record Found</td>
            </tr>
            <?php } ?>
          </tbody>
        </table>	
<?php
}


///*******************************************************
/// Search row from tbl_consignments table client wise
///*******************************************************
if($_POST['type']=="searchClientWise")
{ 
	$clientName = explode("-", $_POST['client_name']);
	$consignment=$rateClass->ExecuteQuery("SELECT DATE_FORMAT(Date_Of_Submit,'%d-%m-%Y') AS Date, Consignment_Id, Consignment_No, Destination_Name, CASE WHEN Mode=1 THEN 'Dox' ELSE 'Non-Dox' END AS Mode, CASE WHEN Send_By=1 THEN 'Surface' WHEN Send_By=2 THEN 'Air' ELSE 'Urgent' END Send_By, Total_Weight_In_KG, FORMAT(Total_Amount, 2) AS Total_Amount, Client_Name, Client_Code, Operator_Name FROM tbl_consignments CO
LEFT JOIN tbl_destinations D ON D.Destination_Id = CO.Destination_Id
LEFT JOIN tbl_operators O ON O.Operator_Id = CO.Operator_Id
LEFT JOIN tbl_clients C ON C.Client_id = CO.Client_id
WHERE CO.Branch_Id=".$_SESSION['buser']." AND CO.Client_Id=(SELECT Client_Id FROM tbl_clients WHERE Client_Name='".$clientName[0]."') ORDER BY Date_Of_Submit ASC");
?>
<table class="table table-hover table-bordered" id="addedProducts">
     <thead>
      <tr class="success">
             <th>Sno.</th>
             <th>Date</th>
             <th>AWB No.</th>
             <th>Destination</th>
             <th>Mode</th>
             <th>Sent By</th>
             <th>Weight</th>
             <th>Total Amount</th>
             <th>Client Name/Code</th>
             <th>Operator</th>
             <th>Action</th>
           </tr>
    </thead>
    <tbody>
	<?php 
    if(count($consignment) > 0)
    {
        $i=1;
        foreach($consignment as $val){ ?>
            <tr>
            	 <td ><?php echo $i;?></td>
                     <td><?php echo $val['Date'];?></td>
                     <td><?php echo $val['Consignment_No'];?></td>
                     <td><?php echo $val['Destination_Name'];?></td>
                     <td><?php echo $val['Mode'];?></td>
                     <td><?php echo $val['Send_By'];?></td>
                     <td><?php echo $val['Total_Weight_In_KG'];?></td>                     
                     <td><?php echo $val['Total_Amount'];?></td>
                     <td><?php echo $val['Client_Name'].'-'.$val['Client_Code'];?></td>
                     <td><?php echo $val['Operator_Name']==NULL?'Branch':$val['Operator_Name'];?></td>
                 
                 <td>
                    <button type="button" id="editbtn" class="btn btn-success btn-sm" onClick="window.location.href='edit_consignment.php?id=<?php echo $val['Consignment_Id'];?>'"><span class="glyphicon glyphicon-edit"></span> Edit </button>                  
                    <button type="button" class="btn btn-danger btn-sm delete" id="<?php echo $val['Consignment_Id']; ?>" name="delete"> <span class="glyphicon glyphicon-trash"></span> Delete </button>
                 </td>
             
            </tr>
            <?php $i++;} 
			}
			else
	         { ?>
            <tr>
              <td colspan="10" align="center">No Record Found</td>
            </tr>
            <?php } ?>
          </tbody>
        </table>	
<?php
}



///*******************************************************
/// Search row from tbl_consignments table date wise
///*******************************************************
if($_POST['type']=="searchDateWise")
{ 
	$str = "";
	$str2 = "";
	$fromdate = $_POST['from_date'];
    $fromdate = date("Y-m-d", strtotime($fromdate));
    $todate = $_POST['to_date'];
    $todate = date("Y-m-d", strtotime($todate));
	
	if($_POST['client_name']!=""){
			
		$client_name = explode("-",$_POST['client_name']);
		
		$cust=$rateClass->ExecuteQuery("SELECT Client_Id FROM tbl_clients 
		WHERE Client_Name='".$client_name[0]."' AND Client_Code=".$client_name[1]." AND Branch_Id=".$_SESSION['buser']);
		
		if(isset($cust[1]['Client_Id']))
		{
			$str.=" AND C.Client_Id=".$cust[1]['Client_Id'];
			
			//varible for second query
			$str2.=" AND Client_Id=".$cust[1]['Client_Id'];
		}				
	}
	
	if($_POST['from_date']!="" and $_POST['to_date']!=""){
		  $fromdate = $_POST['from_date'];
		  $fromdate = date("Y-m-d", strtotime($fromdate));
		  $todate = $_POST['to_date'];
		  $todate = date("Y-m-d", strtotime($todate));
		  $str.=" AND Date_Of_Submit  BETWEEN '$fromdate' AND '$todate' ";
		  
		  //varible for second query
		  $str2.=" AND Date_Of_Submit  BETWEEN '$fromdate' AND '$todate' ";
	}
	
    //$str=" AND Date_Of_Submit  BETWEEN '$fromdate' AND '$todate' ";
	
	$consignment=$rateClass->ExecuteQuery("SELECT DATE_FORMAT(Date_Of_Submit,'%d-%m-%Y') AS Date, Consignment_Id, Consignment_No, Destination_Name, CASE WHEN Mode=1 THEN 'Dox' ELSE 'Non-Dox' END AS Mode, CASE WHEN Send_By=1 THEN 'Surface' WHEN Send_By=2 THEN 'Air' ELSE 'Urgent' END Send_By, Total_Weight_In_KG, FORMAT(Total_Amount, 2) AS Total_Amount, Client_Name, Client_Code, Operator_Name 
	
	FROM tbl_consignments CO

LEFT JOIN tbl_destinations D ON D.Destination_Id = CO.Destination_Id
LEFT JOIN tbl_operators O ON O.Operator_Id = CO.Operator_Id
LEFT JOIN tbl_clients C ON C.Client_id = CO.Client_id

WHERE CO.Branch_Id=".$_SESSION['buser']." ".$str." ORDER BY Date_Of_Submit ASC");

//Get Total Consignment Amt.
$getTotalAmt=$rateClass->ExecuteQuery("SELECT FORMAT(SUM(Total_Amount),2) AS Total_Amount FROM tbl_consignments WHERE Branch_Id=".$_SESSION['buser']." ".$str2);

?>
<table class="table table-hover table-bordered" id="addedProducts">
     <thead>
      <tr class="success">
             <th>Sno.</th>
             <th>Date</th>
             <th>AWB No.</th>
             <th>Destination</th>
             <th>Mode</th>
             <th>Sent By</th>
             <th>Weight</th>
             <th>Total Amount</th>
             <th>Client Name/Code</th>
             <th>Operator</th>
             <th>Action</th>
           </tr>
    </thead>
    <tbody>
	<?php 
    if(count($consignment) > 0)
    {
        $i=1;
        foreach($consignment as $val){ ?>
            <tr>
            	 	 <td ><?php echo $i;?></td>
                     <td><?php echo $val['Date'];?></td>
                     <td><?php echo $val['Consignment_No'];?></td>
                     <td><?php echo $val['Destination_Name'];?></td>
                     <td><?php echo $val['Mode'];?></td>
                     <td><?php echo $val['Send_By'];?></td>
                     <td><?php echo $val['Total_Weight_In_KG'];?></td>                     
                     <td><?php echo $val['Total_Amount'];?></td>
                     <td><?php echo $val['Client_Name'].'-'.$val['Client_Code'];?></td>
                     <td><?php echo $val['Operator_Name']==NULL?'Branch':$val['Operator_Name'];?></td>
                 
                 <td>
                    <button type="button" id="editbtn" class="btn btn-success btn-sm" onClick="window.location.href='edit_consignment.php?id=<?php echo $val['Consignment_Id'];?>'"><span class="glyphicon glyphicon-edit"></span> Edit </button>                  
                    <button type="button" class="btn btn-danger btn-sm delete" id="<?php echo $val['Consignment_Id']; ?>" name="delete"> <span class="glyphicon glyphicon-trash"></span> Delete </button>
                 </td>
             
            </tr>
            <?php $i++;} // eof foreach loop ?>
			
			<tr style="background:#EFEFEF">
                <td colspan="7" align="right"><strong>Total</strong></td>
                <td colspan="4"><strong><?php echo $getTotalAmt[1]['Total_Amount']; ?></strong></td>
              </tr>
		<?php } // eof if condition
			else
	         { ?>
            <tr>
              <td colspan="10" align="center">No Record Found</td>
            </tr>
            <?php } ?>
          </tbody>
        </table>	
<?php
}
?>