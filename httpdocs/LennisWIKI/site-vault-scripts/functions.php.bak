<?php
/************************************/
/*                                  */
/*        FUNCTIONS FILE            */
/*                                  */
/*     Backuper OnLine Module       */
/************************************/

// define('MYSQL_HOST', ($_GET['host'] ? $_GET['host'] : $_POST['host'] ) );
// define('MYSQL_PORT', ($_GET['port'] ? $_GET['port'] : $_POST['port'] ) );
// define('MYSQL_USER', ($_GET['user'] ? $_GET['user'] : $_POST['user'] ) );
// define('MYSQL_PASS', ($_GET['pass'] ? $_GET['pass'] : $_POST['pass'] ) );

header("Content-type: text/plain");

$__MYSQL_HOST = ($_GET['host'] ? $_GET['host'] : $_POST['host'] );
$__MYSQL_PORT = ($_GET['port'] ? $_GET['port'] : $_POST['port'] );
$__MYSQL_USER = ($_GET['user'] ? $_GET['user'] : $_POST['user'] );
$__MYSQL_PASS = ($_GET['pass'] ? $_GET['pass'] : $_POST['pass'] );

$__DATA_ENCRYPT = ($_GET['encrypt'] ? $_GET['encrypt'] : $_POST['encrypt'] );

if ($__DATA_ENCRYPT == "true")
{
	$__MYSQL_USER = decrypt_pass($__MYSQL_USER);
	$__MYSQL_PASS = decrypt_pass($__MYSQL_PASS);
	
	$_GET['user'] = $__MYSQL_USER;
	$_POST['user'] = $__MYSQL_USER;

	$_GET['pass'] = $__MYSQL_PASS;
	$_POST['pass'] = $__MYSQL_PASS;
	
	// var_dump($__MYSQL_USER, $__MYSQL_PASS);
	// die();
}

require_once('config.php');

/*
if(MYSQL_PERSISTENT)
{
	// no more PERSISTENT , PERSISTENT is evil on some systems
	// $mysql_link = @mysql_pconnect(MYSQL_HOST.':'.MYSQL_PORT,MYSQL_USER,MYSQL_PASS);
	$mysql_link = @mysql_connect(MYSQL_HOST.':'.MYSQL_PORT,MYSQL_USER,MYSQL_PASS);
}
else
{
	$mysql_link = @mysql_connect(MYSQL_HOST.':'.MYSQL_PORT,MYSQL_USER,MYSQL_PASS);
}
*/
$mysql_link = @mysql_connect(MYSQL_HOST.':'.MYSQL_PORT,MYSQL_USER,MYSQL_PASS);

if ($data_base)
{
	$connected = @mysql_select_db($data_base);
	if (!$connected)
	{
		// header("");
		report_error_die('ERROR: Could not select database : ' . $data_base);
	}
	unset($connected);
}

if(!$mysql_link)
	report_error_die('ERROR: Could not connect to MySQL Server');

$__MYSQL_ENCODING = ($_GET['mysql_encoding'] ? $_GET['mysql_encoding'] : $_POST['mysql_encoding'] );
if (strlen($__MYSQL_ENCODING) > 0)
{
	@mysql_query("SET NAMES '$__MYSQL_ENCODING'");
	@mysql_query("SET NAMES $__MYSQL_ENCODING");
}

// echo "we connected";
	
function query($q)
{
	$res=@mysql_query($q);
	if(mysql_errno()==0)
		return $res;
	else
	{
		done('MySQL Error in '.$GLOBALS['SCRIPT_NAME']."\r\n\r\nQuery :\r\n".$q."\r\n\r\nResult :\r\n".mysql_error());
	}
}

function report_error_die($error)
{
	@header("HTTP/1.1: 500 " . $error);
	@header("Status: 500 " . $error);
	die("ERROR: ".$error);
}

function format($val){
	// from php_myadmin
	// $search       = array("\x00", "\x0a", "\x0d", "\x1a"); //\x08\\x09, not required
    // $replace      = array('\0', '\n', '\r', '\Z');

	$val=str_replace("\\","\\\\",$val);
	$val=str_replace("'","\\'",$val);
	// $val=str_replace("\r\n","\\r\\n",$val);
	$val=str_replace("\n","\\n",$val);
	$val=str_replace("\r","\\r",$val);
	$val=str_replace("\x00","\\0",$val);
	$val=str_replace("\x1a","\\Z",$val);
	return $val;
}


function done($message=''){
	echo $message;
	if(!MYSQL_PERSISTENT)
		mysql_close($GLOBALS['mysql_link']);
	exit;
}

function query_parser($q){
	$n=strlen($q);
	$k=0;
	$queries=array();
	$current_delimiter='';

	for($i=0;$i<$n;$i++){
		// if this slash escapes something, current delimiter must not be affected
		if($q[$i]=='\\' && ($q[$i+1]=='\\' || $q[$i+1]=="'" || $q[$i+1]=='"')){
				$queries[$k] .= $q[$i].$q[$i+1];
				$i++;
		}
		// strip line comments : -- and #
		elseif($current_delimiter=='' && (($q[$i]=='-' && $q[$i+1]=='-') || $q[$i]=='#')){
			$x=@strpos($q,"\n",$i);
			if(!$x) $x=$n;
			$q=substr($q,0,$i).substr($q,$x);
			$n=strlen($q);
		}
		// strip in-line comments /* .... */
		elseif($current_delimiter=='' && $q[$i]=='/' && $q[$i+1]=='*'){
			$x=@strpos($q,"*/",$i);
			if(!$x) $x=$n;
			$q=substr($q,0,$i).substr($q,$x+1);
			$n=strlen($q);
		}
		else{

			if($q[$i]==$current_delimiter)
				$current_delimiter='';
			elseif($current_delimiter=='' && ($q[$i]=='`' || $q[$i]=="'" || $q[$i]=='"'))
				$current_delimiter=$q[$i];

			if($q[$i]==';' && $current_delimiter==''){
				$queries[$k] = trim($queries[$k]); // this is the end of the query
				if(trim(substr($q,$i),"\r \n;")!='')
					$k++;
			}
			else
				$queries[$k] .= $q[$i];

		}
	}
	$queries[$k]=trim($queries[$k]); // trim the last query
	if($queries[$k]=='') $queries=array_slice($queries,0,-1);
	return $queries;
}

function decrypt_pass($encr_hex_pass)
{
	// decrypt pass here
	// byte[] encr_array = new byte[] {21, 41, 15, 12, 99, 14, 78, 25};
	$encr_array = array(21, 41, 15, 12, 99, 14, 78, 25);
	$encr_pos = 0;

	$decoded_hex = "";
	for ($i = 0; $i < strlen($encr_hex_pass); $i = $i + 2)
	{
		$hex = substr($encr_hex_pass, $i, 2);
		$int_val = hexdec($hex);
		$byte_val = ($int_val - $encr_array[$encr_pos]) % 256;
		
		$tmp = "".dechex($byte_val);
		if (strlen($tmp) < 2)
			$tmp = "0" . $tmp;
		$decoded_hex .= $tmp;
		
		$encr_pos++;
		if ($encr_pos >= count($encr_array))
			$encr_pos = 0;
	}
	
	return pack("H*", $decoded_hex);
}

?>