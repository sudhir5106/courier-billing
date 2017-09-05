<?php
session_start();
date_default_timezone_set('Asia/Calcutta');
define('SERVER','localhost');
define('DBUSER','root');//define(DBUSER,'kritipho_to');
define('DBPASSWORD','');
define('DBNAME','logisticsbilling_new');
define('ROOT',$_SERVER['DOCUMENT_ROOT'].'/courier-billing'); //FOR PHP ROOT LINK
//define(ROOT,$_SERVER['DOCUMENT_ROOT']); //FOR PHP ROOT LINK

define('PATH_LIBRARIES', ROOT.'/libraries');
define('PATH_JS_LIBRARIES','/courier-billing/js');
define('PATH_CSS_LIBRARIES','/courier-billing/css');
define('PATH_DATA_IMAGE','/courier-billing/data_images');
define('PATH_IMAGE','/courier-billing/images');

//masters path setup
define('PATH_MASTERS', ROOT.'/adminpanel');
define('PATH_ADMIN_LINK', '/courier-billing/adminpanel'); // for html link only
define('PATH_ADMIN_INCLUDE',ROOT.'/adminpanel/include');
define('MASTERS_LINK_CONTROL','/courier-billing/adminpanel/masters');

//branch path setup
define('BRANCH_PATH_MASTERS', ROOT.'/branchpanel');
define('BRANCH_PATH_ADMIN_LINK', '/courier-billing/branchpanel'); // for html link only
define('BRANCH_PATH_ADMIN_INCLUDE',ROOT.'/branchpanel/include');
define('BRANCH_MASTERS_LINK_CONTROL','/courier-billing/branchpanel/masters');
define('PATH_PDF_LINK','/courier-billing/pdfmail');
define("PATH_UPLOAD_IMAGE",'/courier-billing/image_upload');
define('PATH_PDF',ROOT.'/pdfmail');

// for pagination
define('ROWS_PER_PAGE',20);
define('PAGELINK_PER_PAGE',10);

/*__________________________________*/
?>