<?php
/************************************************/
/*                                              */
/*  List databases to wich this user has access */
/*                                              */
/*     Backuper OnLine Module                   */
/************************************************/

require_once('functions.php');
// echo "before query";
$res=query("show databases");
// echo "after query";

while ($r=mysql_fetch_array($res,MYSQL_NUM))
{
	echo $r[0]."\r\n";
}
echo "\r\n#end";
done();
?>