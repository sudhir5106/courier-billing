<?php 
include('../../../config.php'); 
require_once(PATH_LIBRARIES.'/classes/DBConn.php');
$db = new DBConn();


///*******************************************************
/// Validate that the data already exist or not
///*******************************************************
if($_POST['type']=="validate1")
{

	$sql="SELECT Destination_Code FROM tbl_destinations WHERE Destination_Code='".$_POST['dest_code']."'";
	$res=$db->ExecuteQuery($sql);
		
	if(empty($res))
    {
 		echo 1;
    }
	else
	{
		echo 0;
	}

}

///*******************************************************
/// Validate that the data already exist or not
///*******************************************************
if($_POST['type']=="validate2")
{

	$sql="SELECT Destination_Name FROM tbl_destinations WHERE Destination_Name='".$_POST['dest_name']."'";
	$res=$db->ExecuteQuery($sql);
		
	if(empty($res))
    {
 		echo 1;
    }
	else
	{
		echo 0;
	}
}

///*******************************************************
/// Validate that the data already exist or not for EDIT
///*******************************************************
if($_POST['type']=="destCodeEditValid")
{

	$sql="SELECT Destination_Code FROM tbl_destinations WHERE Destination_Id!=".$_POST['dest_id']." AND Destination_Code='".$_POST['dest_code']."'";
	
	$res=$db->ExecuteQuery($sql);
		
	if(empty($res))
    {
 		echo 1;
    }
	else
	{
		echo 0;
	}

}

///*******************************************************
/// Validate that the data already exist or not for EDIT
///*******************************************************
if($_POST['type']=="destNameEditValid")
{

	$sql="SELECT Destination_Name FROM tbl_destinations WHERE Destination_Id!=".$_POST['dest_id']." AND Destination_Name='".$_POST['dest_name']."'";
	$res=$db->ExecuteQuery($sql);
		
	if(empty($res))
    {
 		echo 1;
    }
	else
	{
		echo 0;
	}
}



///*******************************************************
/// Get State Name
///*******************************************************
if($_POST['type']=="getStateName")
{
	$sql="SELECT State_Name, State_Id FROM tbl_states WHERE State_Code='".$_POST['state_code']."'";
	$res=$db->ExecuteQuery($sql);
		
	if(empty($res))
    {
 		echo "<input type='text' class='form-control input-sm' id='state_name' name='state_name' placeholder='State Name' readonly='readonly' value='' />";
    }
	else{
		
		echo "<input type='text' class='form-control input-sm' id='state_name' name='state_name' placeholder='State Name' readonly='readonly' value='".$res[1]['State_Name']."' /> <input type='hidden' class='form-control input-sm' id='state_id' name='state_id' value='".$res[1]['State_Id']."' />";
		
	}	

}


///*******************************************************
/// To Insert New Destination ////////////////////////////
///*******************************************************
if($_POST['type']=="addDestination")
{
	$con= mysql_connect(SERVER,DBUSER,DBPASSWORD);
	mysql_query('SET AUTOCOMMIT=0',$con);
	mysql_query('START TRANSACTION',$con);
	
	try
	{	
		$tablename = "tbl_destinations";
		$tblfield=array('Destination_Code','Destination_Name','State_Id');
		$tblvalues=array($_POST['dest_code'], $_POST['dest_name'], $_POST['state_id']);
		$res=$db->valInsert($tablename,$tblfield,$tblvalues);
		
		if(!$res)
		{
			throw new Exception('0');
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
/// Edit Destination
///*******************************************************
if($_POST['type']=="editdestination")
{
	$tblname="tbl_destinations";
	$tblfield=array('Destination_Code','Destination_Name','State_Id');
	$tblvalues=array($_POST['dest_code'], $_POST['dest_name'], $_POST['state_id']);
	$condition="Destination_Id=".$_POST['id'];
	$res=$db->updateValue($tblname,$tblfield,$tblvalues,$condition);
	
	if (empty($res))
	{
		echo 0;
	}
	else
	{
		echo 1;
	}
}


///*******************************************************
/// Delete row from destination_master table
///*******************************************************
if($_POST['type']=="delete")
{
	 $tblname="tbl_destinations";
	 $condition="Destination_Id=".$_POST['Destination_Id'];
	 $res=$db->deleteRecords($tblname,$condition);
}

?>