<?php
/***************************************/
/*                                     */
/* List tables from a certain database */
/*                                     */
/*       Backuper OnLine Module        */
/***************************************/

require_once('functions.php');

if (!$_GET['db']) $_GET['db'] = $_POST['db'];

$res=query("show tables from ".$escape_quote.$_GET['db'].$escape_quote."");

while($r=mysql_fetch_array($res,MYSQL_NUM)){
	echo $r[0]."\r\n";
}
echo "\r\n#end";
done();
?>