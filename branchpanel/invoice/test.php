<?php
$number = 123.465;
$txt = sprintf("With 2 decimals: %1\$.2f
<br>With no decimals: %1\$u",$number);
echo $txt;
?>