<?php
/***************************************/
/*                                     */
/*       Export database content       */
/*                                     */
/*       Backuper OnLine Module        */
/***************************************/

require_once('functions.php');

$data = ($_GET['sqlstr'] ? $_GET['sqlstr'] : $_POST['sqlstr']);
$only_lines = ($_GET['only_lines'] ? $_GET['only_lines'] : $_POST['only_lines']);

if(get_magic_quotes_gpc()) $data=stripslashes($data);

$queries = array();

if ($only_lines == "1")
	$queries = explode("\r\n", $data);
else
	$queries = query_parser($data);

$n=count($queries);

for($i=0; $i<$n; $i++)
{
	if ($only_lines == "1")
	{
		$queries[$i] = trim($queries[$i]);
		if ($queries[$i][0] == '#') continue;
		if (($queries[$i][0] == '-') || ($queries[$i][1] == '-')) continue;
		if (strlen($queries[$i])<1) continue;
	}
	// echo 'Query '.($i+1).' : '.$queries[$i]."\r\n";

	//$first_word=strtolower(substr($queries[$i],0,strpos($queries[$i],' ')));

	$res=@mysql_query($queries[$i]);

	if(mysql_errno()!=0)
	{
		echo mysql_error()."\r\n\r\n";
		done('aborted.');
	}
	else
		echo mysql_affected_rows()."\r\n\r\n";
}

echo "\r\n#end";
done();
?>