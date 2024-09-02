<?php
/***************************************/
/*                                     */
/*       Export database content       */
/*                                     */
/*       Backuper OnLine Module        */
/***************************************/

// usage : export.php?db=db_name&tables[]=table1&tables[]=table2

require_once('functions.php');

// - TABLE BODY

if (!$_GET['table']) $_GET['table'] = $_POST['table'];
if (!$_GET['unbuffered']) $_GET['unbuffered'] = $_POST['unbuffered'];

echo "#-- export table content for '".$_GET['table']."'\r\n\r\n";

	if ($_GET['unbuffered'] == "1")
		$res=mysql_unbuffered_query("select * from ".$escape_quote.$_GET['table'].$escape_quote."");
	else $res=mysql_query("select * from ".$escape_quote.$_GET['table'].$escape_quote."");
	$n=mysql_num_fields($res);

	$field_list='';
	for($i=0;$i<$n;$i++)
		$field_list.="".$escape_quote.mysql_field_name($res,$i).$escape_quote.', ';
	echo "#insert into ".$escape_quote.$_GET['table'].$escape_quote." ( ".substr($field_list,0,-2)." ) values \r\n";
	//echo "#insert_list";

	while($r=mysql_fetch_row($res))
	{
		echo "( ";
		for($k=0;$k<($n-1);$k++)
		{
			if (!is_null($r[$k])) echo "'".format($r[$k])."', ";
			else echo "NULL, ";
		}
		if (!is_null($r[$k])) echo "'".format($r[$k])."');\r\n";
		else echo "NULL);\r\n";
	}

echo "\r\n#end";
done();
?>