<?php
$file="demo.xls";
$test='<table width="500" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td width="80"><img width="20%" src="../../image_upload/franchise/thumb/'.$invoiceInfo[1]['Franchise_Logo'].'" alt=""></td>
				<td width="80%" align="center"><h4 align="center">INVOICE</h4></td>
			</tr>
		</table>';
header("Content-type: application/vnd.ms-excel");
header("Content-Disposition: attachment; filename=$file");
echo $test;
?>