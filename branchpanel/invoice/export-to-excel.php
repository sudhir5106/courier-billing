<?php

header("Content-type: application/vnd.ms-excel");
header("Content-Disposition: attachment; filename=".rand().".xls");
echo $_GET["data"]
?>