<?php
/***************************************/
/*                                     */
/*       Export database content       */
/*                                     */
/*       Backuper OnLine Module        */
/***************************************/

// usage : export.php?db=db_name&tables[]=table1&tables[]=table2

require_once('functions.php');

// - TABLE HEAD
if (!$_GET['table']) $_GET['table'] = $_POST['table'];

echo "#-- deleting current '".$_GET['table']."' table\r\n\r\n";
echo "drop table if exists ".$escape_quote.$_GET['table'].$escape_quote.";\r\n\r\n";
echo "#-- export table structure for '".$_GET['table']."'\r\n\r\n";
$c=mysql_fetch_row(query("show create table ".$escape_quote.$_GET['table'].$escape_quote.""));

echo $c[1].";\r\n\r\n";

// ------------------------

echo "\r\n#end";
done();
?>