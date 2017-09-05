<?php

class domExcel{
	///*******************************************************
	/// convert html to excel ////////////////////////////////
	///*******************************************************
	function load_html($exlsheetName, $html){
		
		$file=$exlsheetName;
		$filecontent=$html;
		header("Content-type: application/vnd.ms-excel");
		header("Content-Disposition: attachment; filename=$file");
		echo $filecontent;
			
	}
}
?>