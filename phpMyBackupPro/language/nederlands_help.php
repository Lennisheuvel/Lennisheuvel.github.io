<?php
/*
 +--------------------------------------------------------------------------+
 | phpMyBackupPro                                                           |
 +--------------------------------------------------------------------------+
 | Copyright (c) 2004-2007 by Dirk Randhahn                                 |                               
 | http://www.phpMyBackupPro.net                                            |
 | version information can be found in definitions.php.                     |
 |                                                                          |
 | This program is free software; you can redistribute it and/or            |
 | modify it under the terms of the GNU General Public License              |
 | as published by the Free Software Foundation; either version 2           |
 | of the License, or (at your option) any later version.                   |
 |                                                                          |
 | This program is distributed in the hope that it will be useful,          |
 | but WITHOUT ANY WARRANTY; without even the implied warranty of           |
 | MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            |
 | GNU General Public License for more details.                             |
 |                                                                          |
 | You should have received a copy of the GNU General Public License        |
 | along with this program; if not, write to the Free Software              |
 | Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,USA.|
 +--------------------------------------------------------------------------+
*/
/*
 +--------------------------------------------------------------------------+
 | phpMyBackupPro Dutch translation                                         |
 +--------------------------------------------------------------------------+
 | Dutch translation 2.1                                                    |
 | September 2007 by Paul Staring                                           |
 +--------------------------------------------------------------------------+
*/

chdir("..");
require_once("definitions.php");

echo "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01//EN\"
   \"http://www.w3.org/TR/html4/loose.dtd\">
<html".ARABIC_HTML.">
<head>
<meta http-equiv=\"Content-Type\" content=\"text/html;charset=".BD_CHARSET_HTML."\">
<link rel=\"stylesheet\" href=\"./../".PMBP_STYLESHEET_DIR.$CONF['stylesheet'].".css\" type=\"text/css\">
<title>phpMyBackupPro - ".F_HELP."</title>
</head>
<body>
<table border=\"0\" cellspacing=\"2\" cellpadding=\"0\" width=\"100%\">\n
<tr><th colspan=\"2\" class=\"active\">";
echo PMBP_image_tag("../".PMBP_IMAGE_DIR."logo.png","phpMyBackupPro ".PMBP_WEBSITE,PMBP_WEBSITE);
echo "</th></tr>\n";

// choose help text
switch(preg_replace("'^.*/'","",$_GET['script'])) {
    case 'index.php': $filename=F_START;
    $html="Op deze pagina kunt u systeeminformatie zien over de server waar phpMyBackupPro op draait.<br><br>
    ".PMBP_I_SERVER.": Hier kunt u zien op wat voor server phpMyBackupPro draait en wat de huidige server-tijd is.<br>
    "."PHP".": Hier kunt u de versie van PHP zien en informatie over verschillende PHP-modules en functies.
    U kunt zien of PHP's 'safe mode' geactiveerd is, wat de geheugenlimiet is, of gzip-compressie mogelijk is,
    en of het mogelijk is met deze server emails te zenden en bestanden met FTP te verzenden.<br>
    "."MySQL".": Hier kunt u de versie van uw MySQL-server zien en die van uw client.<br>
    ".F_BACKUP.": Hier kunt u zien hoeveel schijfruimte is ingenomen door opgeslagen backups,
    wanneer de laatste backup gemaakt is en wanneer de laatste backup is gemaakt door een ingepland script.<br>
    ".LI_LOGIN.": Hier kunt u zien wanneer u voor het laatst ingelogd was op phpMyBackupPro en vanaf welk IP-adres.";
    break;
    case 'config.php': $filename=F_CONFIG;
    $html="Er zijn twee niveaus van configuratie: basis- en uitgebreide configuratieopties. Het wijzigen van de uitgebreide opties is optioneel.
	Het '*'-teken geeft aan dat de waarde niet leeg mag zijn.<br><br>
	Basisconfiguratie:<br>
	".C_SITENAME.": Geef het systeem een naam, zoals bv. 'productie-server'.<br>
	".C_LANG.": Wijzig de taal van phpMyBackupPro. U kunt verschillende taalpakketten downloaden van de phpMyBackupPro project-site.<br>
	".C_SQL_HOST.": Voer de MySQL-hostnaam in, bv. '127.0.0.1'.<br>
	".C_SQL_USER.": Voer uw MySQL gebruikersnaam in.<br>
	".C_SQL_PASSWD.": Voer uw MySQL wachtwoord in.<br>
	".C_SQL_DB.": Als u maar één database op deze server wilt gebruiken, kunt u de naam ervan hier invoeren.<br>
	".C_FTP_USE.": Vink deze optie aan als u FTP-functies wilt gebruiken om uw backups automatisch naar een FTP-server te uploaden.<br>
	".C_FTP_BACKUP.": Vink deze optie aan als u de backup van directories naar een FTP-server mogelijk wilt maken.<br>
	".C_FTP_REC.": Vink dit aan als de subdirectories van directories ook meegenomen moeten worden in de backup.<br>
	".C_FTP_SERVER.": Voer het IP-adres of de URL in van uw FTP-server.<br>
	".C_FTP_USER.": Voer uw FTP-loginnaam in.<br>
	".C_FTP_PASSWD.": Voer uw FTP-wachtwoord in.<br>
	".C_FTP_PATH.": Voer het pad in voor op de FTP-server waar u uw backups opgeslagen wilt hebben.<br>
	".C_FTP_PASV.": Vink dit aan om passieve FTP te gebruiken.<br>
	".C_FTP_PORT.": Voer de poort in waarop uw FTP-server bereikbaar is. Standaard waarde voor deze poort is 21.<br>
	".C_FTP_DEL.": Vink deze optie aan als u wilt dat backup-bestanden op de FTP-server automatisch verwijderd worden als ze lokaal verwijderd zijn.<br>
	".C_EMAIL_USE.": Vink deze optie aan als u uw backups automatisch via email wilt verzenden.<br>
	".C_EMAIL.": Voer het email-adres in waar u uw backups heen wilt zenden.<br><br>
	Uitgebreide configuratie:<br>
	".C_STYLESHEET.": Kies een stijlblad voor phpMyBackupPro. U kunt verscheidene stijlbladen downloaden van de phpMyBackupPro project-site.<br>
	".C_DATE.": Kies uw favoriete datumstijl.<br>
	".C_LOGIN.": U kunt HTTP-authenticatie inschakelen als u dat wilt.<br>
	".C_DEL_TIME.": Voer een aantal dagen in waarna de backupbestanden automatisch verwijderd worden. Voer 0 in om deze functie uit te schakelen.<br>
	".C_DEL_NUMBER.": Specificeer een maximum aantal voor de backupbestanden die opgeslagen mogen worden voor iedere database.<br>
	".C_TIMELIMIT.": Verhoog de PHP-tijdslimiet als zich problemen voordoen met het maken van backups of imports. Heeft geen effect als PHP's 'safe mode' aan staat.<br>
	".C_CONFIRM.": Kies welke acties bij het maken van een import bevestigd moeten worden.<br>
	".C_IMPORT_ERROR.": Vink dit aan als u een lijst van import-fouten wilt ontvangen, mochten deze zich voordoen.<br>
	".C_DIR_BACKUP.": Vink dit aan als u directory-backups wilt inschakelen. Om deze mogelijkheid te gebruiken moeten de juiste FTP-gegevens ingegeven worden.<br>
	".C_DIR_REC.": Vink dit aan om backups van directories recursief te doen (met alle subdirectories).<br>
	".C_NO_LOGIN.": Vink dit aan om de loginfunctie uit te schakelen. Dit wordt afgeraden, omdat u hiermee iedereen toegang geeft tot uw database!<br><br>
	Systeemvariabelen:<br>
	Hier kunt de waarden van interne phpMyBackupPro systeemvariabelen wijzigen. Wijzig alleen iets als u weet wat u doet.
	Meer informatie is te vinden in het 'SYSTEM_VARIABLES.txt' documentatiebestand.";
    break;
    case 'import.php': $filename=F_IMPORT;
    $html="Hier kunt u alle lokaal opgeslagen backupbestanden zien.<br>
    U kunt meer informatie verkrijgen door op '".B_INFO."' te klikken.<br>
    Door op '".B_VIEW."' te klikken kunt u het backupbestand lezen.<br>
    Om het backupbestand te downloaden, hoeft u alleen op '".B_DOWNLOAD."' te klikken.<br>
    Klik '".B_IMPORT."' om het bestand te re-importeren in de database. Voordat u dit doet, kunt u de database leegmaken door '".B_EMPTY_DB."' te klikken.<br>
    U kunt grote backups importeren met de '".B_IMPORT_FRAG."' import. Dit zal de backup beetje bij beetje importeren.<br>
    Om een backupbestand te verwijderen klikt u '".B_DELETE."'. U kunt alle backups van een database verwijderen door op '".B_DELETE_ALL."' te klikken.<br><br>
    Klik '".B_EMPTY_ALL."' om alle beschikbare databases leeg te maken, klik '".B_IMPORT_ALL."' om van iedere database de laatste backup te importeren,
    klik '".B_DELETE_ALL_2."' om alle beschikbare backupbestanden te verwijderen.";
    break;
    case 'backup.php': $filename=F_BACKUP;
    $html="Hier kunt u kiezen van welke databases u een backup wilt maken.<br>
    Commentaar zal bij elk backupbestand opgeslagen worden.<br>
    U kunt kiezen of alleen de tabelstructuur, de data of beiden opgeslagen moeten worden.<br>
    Voeg een 'drop table if exists ...' regel aan elke tabelstructuur toe door 'add drop table' aan te vinken.<br>
    U kunt ook het compressietype kiezen voor de backupbestanden. Op sommige systemen niet beschikbaar.<br><br>
	Als u de FTP-backupfunctie ingeschakeld heeft, kunt u ook van complete directories een backup maken naar uw FTP-server.<br>
	De geselecteerde directories en de bestanden daarin zullen worden gekopieerd naar het '".C_FTP_PATH."', ingesteld in de '".F_CONFIG."'-pagina.<br>
	Het is mogelijk de afzonderlijke bestanden te verzenden per email, maar u kunt de optie '".EX_PACKED."' aanvinken om alle bestanden en directories in één ZIP-bestand samen te vatten.
	Dit neemt meer tijd in beslag dan een normale overdracht. De directory-lijst wordt slechts éénmalig gegenereerd, bij de login. Als u de lijst opnieuw wilt genereren, kiest u '".PMBP_EXS_UPDATE_DIRS."'.";
    break;
    case 'scheduled.php': $filename=F_SCHEDULE;
    $html="Om de backup te automatiseren, kunt u code genereren die u kunt invoegen in een bestaand PHP-script.<br>
    Wanneer dit script wordt gestart, wordt de backup automatisch gestart. U kunt instellen wanneer de backup moet lopen.<br><br>
    Vervolgens, kies waar het script zich zal bevinden. De directory phpMyBackupPro mag hierna niet verplaatst worden!
	(Als u kennis heeft van programmeren met PHP kunt u dit pad later aanpassen.)<br><br>
	Een klik op '".EXS_SHOW."' zal een script tonen dat voor het maken van de ingeplande backup gebruikt kan worden. Kopieer de code en voeg het in een bestaand bestand in,
	of gebruik '".C_SAVE."' om het script automatisch met een opgegeven bestandsnaam op te slaan. Dit zal een bestaand bestand met dezelfde naam overschrijven!<br>
	N.B.: Het bestand moet in de op de vorige pagina geselecteerde directory staan om goed te werken.<br>
    De backup zal alleen gemaakt worden wanneer het script gestart wordt. U kunt het invoegen in een bestaand PHP-bestand of een frameset met een onzichtbaar frame gebruiken.<br><br>
    Alle configuratieopties werken ook in dit script!<br>U kunt meer informatie vinden over de backup-optie in de 'backup' help.<br><br>
    Als u een grotere lijst van beschikbare directories wilt zien, gaat u naar de configuratiepagina en verandert u de systeemvariabele 'dir_lists' in 2!";
    break;
    case 'db_info.php': $filename=F_DB_INFO;
    $html="Hier kunt u een kleine samenvatting van uw databases zien.<br><br>
    In de kolom '".DB_NUM_ROWS."' kunt u het totale aantal rijen van alle tabellen zien.<br>
    Als een database tabellen bevat, kunt u op '".DB_TABLES."' klikken om de namen, het aantal kolommen, het aantal rijen en de grootte van alle tabellen van de geselecteerde database te zien.<br>
    De grootten kunnen verschillen van de grootten van backupbestanden door toegevoegde informatie die nodig is in de backupbestanden.";
    break;
    case 'sql_query.php': $filename=F_SQL_QUERY;
    $html="Deze pagina is om simpele SQL-queries naar de database te sturen.<br><br>
    U kunt een database selecteren waar u de queries op wilt uitvoeren.<br>
    U kunt één of meer SQL-queries in het tekstvak invoeren.<br>
    Queries als 'select ...' zullen een resultatentabel teruggeven.<br>
    Sommige queries als 'delete ...' zullen alleen een '".SQ_SUCCESS."' teruggeven.<br><br>
    Als u een bestand upload voor uitvoer zult u een foutbericht voor iedere fout die zich voordoet ontvangen! (en dit kunnen er veel zijn!)<br>
    Het laatste foutbericht bevat een lijst van alle queries waar zich fouten in voordeden. Een 'F' voor het nummer van de query geeft aan dat deze query zich in het bestand bevond.<br><br>
    Deze functies zijn nog niet volwassen! Er is geen garantie dat alle correcte queries ook succesvol uitgevoerd kunnen worden!";
    break;
    default: $html="Sorry, geen help beschikbaar voor deze pagina.";
}

echo "<tr>\n<td>\n";
if ($filename) echo "<br><div class=\"bold_left\">Hulp bij ".$filename.":</div><br>\n";
echo $html;
echo "</td>\n</tr>\n</table>\n</body>\n</html>";
?>