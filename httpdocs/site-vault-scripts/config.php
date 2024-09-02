<?php
/************************************/
/*                                  */
/*          CONFIG FILE             */
/*                                  */
/*     Backuper OnLine Module       */
/************************************/

define('MYSQL_HOST', ($_GET['host'] ? $_GET['host'] : $_POST['host'] ) );
define('MYSQL_PORT', ($_GET['port'] ? $_GET['port'] : $_POST['port'] ) );
define('MYSQL_USER', ($_GET['user'] ? $_GET['user'] : $_POST['user'] ) );
define('MYSQL_PASS', ($_GET['pass'] ? $_GET['pass'] : $_POST['pass'] ) );

$escape_quote = $_GET['escape_quote'];
if (strlen($_POST['escape_quote'])>0)
	$escape_quote = $_POST['escape_quote'];

$data_base = ($_GET['db'] ? $_GET['db'] : $_POST['db']);

define('MYSQL_PERSISTENT',TRUE);    // if you don't know, put false

@set_time_limit(0);
//
$allowed_mysql_commands=array('update','delete','insert','alter','drop','create','replace','grant','revoke');

?>