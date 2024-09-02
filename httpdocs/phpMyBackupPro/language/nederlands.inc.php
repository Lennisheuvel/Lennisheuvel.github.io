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

/*basic data*/
define('BD_LANG_SHORTCUT',"nl"); // used for the php function setlocale() (http://www.php.net/setlocale)
define('BD_DATE_FORMAT',"%d-%m-%Y %H:%M uur"); // used for the php function strftime() (http://www.php.net/strftime)
define('BD_CHARSET_HTML',"ISO-8859-15"); // the charset used in you language for html
define('BD_CHARSET_EMAIL',"ISO-8859-1"); // the charset used in your langauge for MIME-emails

/*functions.inc.php*/
define('F_START',"start");
define('F_CONFIG',"configuratie");
define('F_IMPORT',"importeren");
define('F_BACKUP',"backup");
define('F_SCHEDULE',"backup inplannen");
define('F_DB_INFO',"database-info");
define('F_SQL_QUERY',"sql queries");
define('F_HELP',"hulp");
define('F_LOGOUT',"afmelden");
define('F_FOOTER',"Bezoek de %sphpMyBackupPro website%s voor nieuwe releases en nieuws.");
define('F_NOW_AVAILABLE',"Een nieuwe versie van phpMyBackupPro is nu verkrijgbaar op %s".PMBP_WEBSITE."%s");
define('F_SELECT_DB',"Selecteer databases voor backup");
define('F_SELECT_ALL',"selecteer allen");
define('F_COMMENTS',"Commentaar");
define('F_EX_TABLES',"exporteer tabellen");
define('F_EX_DATA',"exporteer data");
define('F_EX_DROP',"voeg 'drop table' toe");
define('F_EX_COMP',"compressie");
define('F_EX_OFF',"geen");
define('F_EX_GZIP',"gzip");
define('F_EX_ZIP',"zip");
define('F_DEL_FAILED',"Verwijderen van backup %s is mislukt");
define('F_FTP_1',"FTP-verbinding maken met server is mislukt");
define('F_FTP_2',"Inloggen met gebruiker is mislukt");
define('F_FTP_3',"FTP-upload mislukt");
define('F_FTP_4',"Bestand succesvol geüpload als");
define('F_FTP_5',"Verwijderen van bestand '%s' met FTP is mislukt");
define('F_FTP_6',"Bestand '%s' is succesvol verwijderd van FTP server");
define('F_FTP_7',"Bestand '%s' niet gevonden op FTP server");
define('F_MAIL_1',"Eén van de email-adressen is foutief");
define('F_MAIL_2',"Deze mail werd gestuurd door phpMyBackupPro ".PMBP_VERSION." ".PMBP_WEBSITE.". Server: ");
define('F_MAIL_3',"kon niet gelezen worden");
define('F_MAIL_4',"MySQL backup van");
define('F_MAIL_5',"Email kon niet verzonden worden");
define('F_MAIL_6',"Bestanden succesvol verzonden per email naar");
define('F_YES',"ja");
define('F_NO',"nee");
define('F_DURATION',"Duur");
define('F_SECONDS',"seconden");

/*index.php*/
define('I_SQL_ERROR',"FOUT: Voeg de correcte data MySQL data in the 'configuratie' in, a.u.b.!");
define('I_NAME',"Dit is phpMyBackupPro");
define('I_WELCOME',"phpMyBackupPro is gratis software, uitgegeven onder de GNU GPL-licentie.<br>
Als u hulp nodig heeft, probeer dan online hulp of bezoek de website %s.<br><br>
Kies in het hoofdmenu wat u nu wilt gaan doen! Als dit uw eerste keer is dat u phpMyBackupPro gebruikt, is de configuratie een goed begin!
De rechten van de map 'export' en het bestand 'global_conf.php' moeten op 0777 gezet zijn.");
define('I_CONF_ERROR',"Het bestand ".PMBP_GLOBAL_CONF." is niet schrijfbaar!");
define('I_DIR_ERROR',"De map ".PMBP_EXPORT_DIR." is niet schrijfbaar!");
define('PMBP_I_INFO',"Systeeminformatie");
define('PMBP_I_SERVER',"Server");
define('PMBP_I_TIME',"Tiij");
define('PMBP_I_PHP_VERS',"PHP-versie");
define('PMBP_I_MEM_LIMIT',"PHP Geheugenlimiet");
define('PMBP_I_SAFE_MODE',"Safe Mode geactiveerd");
define('PMBP_I_FTP',"FTP-overdracht mogelijk");
define('PMBP_I_MAIL',"Emails verzendbaar");
define('PMBP_I_GZIP',"gzip-compressie mogelijk");
define('PMBP_I_SQL_SERVER',"MySQL Server");
define('PMBP_I_SQL_CLIENT',"MySQL Client");
define('PMBP_I_NO_RES',"*kon niet gevonden worden*");
define('PMBP_I_LAST_SCHEDULED',"Laatste ingeplande backup");
define('PMBP_I_LAST_LOGIN',"Laatste login");
define('PMBP_I_LAST_LOGIN_ERROR',"Laatste incorrecte login");

/*config.php*/
define('C_SITENAME',"Website-naam");
define('C_LANG',"taal");
define('C_SQL_HOST',"MySQL hostname");
define('C_SQL_USER',"MySQL gebruikersnaam");
define('C_SQL_PASSWD',"MySQL wachtwoord");
define('C_SQL_DB',"alleen deze database");
define('C_FTP_USE',"bewaar backups over FTP?");
define('C_FTP_BACKUP',"gebruik directory backup?");
define('C_FTP_REC',"backup directories recursief?");
define('C_FTP_SERVER',"FTP server (url or IP)");
define('C_FTP_USER',"FTP gebruikersnaam");
define('C_FTP_PASSWD',"FTP wachtwoord");
define('C_FTP_PATH',"FTP pad");
define('C_FTP_PASV',"Gebruik FTP passief?");
define('C_FTP_PORT',"FTP poort");
define('C_FTP_DEL',"verwijder bestanden van FTP-server");
define('C_EMAIL_USE',"Gebruik email?");
define('C_EMAIL',"email-adres");
define('C_STYLESHEET',"skin");
define('C_DATE',"datumstijl");
define('C_DEL_TIME',"verwijder lokale backups na x dagen");
define('C_DEL_NUMBER',"bewaar max x bestanden per database");
define('C_TIMELIMIT',"PHP tijdslimiet");
define('C_IMPORT_ERROR',"Laat importeerfouten zien?");
define('C_NO_LOGIN',"Zet login-functie uit?");
define('C_LOGIN',"HTTP authenticatie?");
define('C_DIR_BACKUP',"Zet directory-backups aan?");
define('C_DIR_REC',"Directory-backup met subdirectories?");
define('C_CONFIRM',"bevestigingsniveau");
define('C_CONFIRM_1',"leegmaken, verwijderen, importeren");
define('C_CONFIRM_2',"alles leegmaken, verwijderen, importeren");
define('C_CONFIRM_3',"ALLES leegmaken, verwijderen, importeren");
define('C_CONFIRM_4',"bevestig niets");

define('C_BASIC_VAL',"Basisconfiguratie");
define('C_EXT_VAL',"Uitgebreide configuratie");
define('PMBP_C_SYSTEM_VAL',"Systeemvariabelen");
define('PMBP_C_SYS_WARNING',"Deze systeemvariabelen worden ingesteld door phpMyBackupPro. Wijzig deze niet, tenzij u weet wat u doet!");
define('C_TITLE_SQL',"SQL-data");
define('C_TITLE_FTP',"FTP-instellingen");
define('C_TITLE_EMAIL',"Backup per email");
define('C_TITLE_STYLE',"Stijl van phpMyBackupPro");
define('C_TITLE_DELETE',"Automatisch verwijderen van backup-bestanden");
define('C_TITLE_CONFIG',"Verdere instellingen");
define('C_WRONG_TYPE',"is niet correct!");
define('C_WRONG_SQL',"MySQL-gegevens zijn niet correct!");
define('C_WRONG_DB',"MySQL database-naam is niet correct!");
define('C_WRONG_FTP',"FTP-gegevens is niet correct!");
define('C_OPEN',"Kan niet openen");
define('C_WRITE',"Kan niet schrijven naar");
define('C_SAVED',"Data successvol opgeslagen");
define('C_WRITEABLE',"is niet schrijfbaar");
define('C_SAVE',"Opslaan");

/*import.php*/
define('IM_ERROR',"%d fout(en) zijn opgetreden. U kunt 'empty database' gebruiken om er zeker van te zijn dat de database geen tabellen bevat.");
define('IM_SUCCESS',"Successvol geïmporteerd");
define('IM_TABLES',"tabellen en");
define('IM_ROWS',"rijen");

define('B_EMPTIED_ALL',"Alle databases zijn succesvol leeggemaakt");
define('B_EMPTIED',"De database is succesvol leeggemaakt");
define('B_DELETED',"Bestand is succesvol verwijderd");
define('B_DELETED_ALL',"Alle bestanden zijn succesvol verwijderd");
define('B_NO_FILES',"Geen backup-bestanden voorhanden");
define('B_DELETE_ALL_2',"verwijder ALLE backups");
define('B_IMPORT_ALL',"importeer ALLE backups");
define('B_EMPTY_ALL',"ALLE databases leegmaken");
define('B_EMPTY_DB',"database leegmaken");
define('B_DELETE_ALL',"verwijder alle backups");
define('B_INFO',"info");
define('B_VIEW',"bekijk");
define('B_DOWNLOAD',"download");
define('B_IMPORT',"importeer");
define('B_IMPORT_FRAG',"gefragmenteerd");
define('B_DELETE',"verwijder");
define('B_CONF_EMPTY_DB',"Weet u zeker dat u de database wilt leegmaken?");
define('B_CONF_DEL_ALL',"Weet u zeker dat u alle backups van deze database wilt verwijderen?");
define('B_CONF_IMP',"Weet u zeker dat u deze backup wilt importeren?");
define('B_CONF_DEL',"Weet u zeker dat u deze backup wilt verwijderen?");
define('B_CONF_EMPT_ALL',"Weet u zeker dat u ALLE databases wilt leegmaken?");
define('B_CONF_IMP_ALL',"Weet u zeker dat u ALLE laatste backups wil importeren?");
define('B_CONF_DEL_ALL_2',"Weet u zeker dat u ALLE backups wilt verwijderen?");
define('B_LAST_BACKUP',"Laatste backup gemaakt op");
define('B_SIZE_SUM',"Totale grootte van alle backups");

/*backup.php*/
define('EX_SAVED',"Bestand succesvol opgeslagen als");
define('EX_NO_DB',"Geen database geselecteerd");
define('EX_EXPORT',"Backup");
define('EX_NOT_SAVED',"Kon backup van database %s niet opslaan in '%s'");
define('EX_DIRS',"Selecteer directories voor backup naar FTP-server");
define('EX_DIRS_MAN',"Geef meer directory-paden in, relatief t.o.v. de phpMyBackupPro directory.<br>Scheiden met '|'");
define('EX_PACKED',"Vat alles samen in één ZIP-bestand");
define('PMBP_EX_NO_AVAILABLE',"Database %s is niet beschikbaar");
define('PMBP_EXS_UPDATE_DIRS',"Vernieuw directory-lijst");
define('PMBP_EX_NO_ARGV',"Gebruiksvoorbeeld:\n$ php backup.php db1,db2,db3
Voor meer functies, lees 'SHELL_MODE.txt' in de 'documentation'-directory");

/*scheduled.php*/
define('EXS_PERIOD',"Selecteer backup-tijdstip");
define('EXS_PATH',"Selecteer de directory waar het PHP-bestand geplaatst wordt");
define('EXS_BACK',"terug");
define('PMBP_EXS_ALWAYS',"Bij iedere oproep");
define('EXS_HOUR',"uur");
define('EXS_HOURS',"uren");
define('EXS_DAY',"dag");
define('EXS_DAYS',"dagen");
define('EXS_WEEK',"week");
define('EXS_WEEKS',"weken");
define('EXS_MONTH',"moaand");
define('EXS_SHOW',"Laat script zien");
define('PMBP_EXS_INCL',"Voeg dit script in het PHP-bestand (%s) in, dat voor u de backup-taak moet gaan doen");
define('PMBP_EXS_SAVE',"of sla dit script op als een nieuw bestand (een bestaand bestand zal overschreven worden!)");

/*file_info.php*/
define('INF_INFO',"info");
define('INF_DATE',"Datum");
define('INF_DB',"Database");
define('INF_SIZE',"Backup-grootte");
define('INF_COMP',"Is compressed");
define('INF_DROP',"Bevat 'drop table'");
define('INF_TABLES',"Bevat tabellen");
define('INF_DATA',"Bevat data");
define('INF_COMMENT',"Commentaar");
define('INF_NO_FILE',"Geen bestand geselecteerd");

/*db_status.php*/
define('DB_NAME',"naam van de database");
define('DB_NUM_TABLES',"aantal tabellen");
define('DB_NUM_ROWS',"aantal rijen");
define('DB_SIZE',"grootte");
define('DB_DIFF',"Grootten kunnen verschillen van de grootten van de backup-bestanden!");
define('DB_NO_DB',"Geen databases beschikbaar");
define('DB_TABLES',"tabelleninformatie");
define('DB_TAB_TITLE',"tabellen van database ");
define('DB_TAB_NAME',"naam van tabel");
define('DB_TAB_COLS',"aantal velden");

/*sql_query.php*/
define('SQ_ERROR',"Fouten geconstateerd in regelnummer");
define('SQ_SUCCESS',"Successvol doorgevoerd");
define('SQ_RESULT',"Query resultaat");
define('SQ_AFFECTED',"Aantal beroerde rijen");
define('SQ_WARNING',"Let op: Deze pagina is bedoeld voor het uitvoeren van sql-queries op de databases. Roekeloos gebruik kan uw databases vernielen!");
define('SQ_SELECT_DB',"Selecteer database");
define('SQ_INSERT',"Voeg uw sql-query hier in");
define('SQ_FILE',"Upload sql-bestand");
define('SQ_SEND',"Zend");

/*login.php*/
define('LI_MSG',"A.u.b. inloggen (gebruik uw MySQL-gebruikersnaam en -wachtwoord)");
define('LI_USER',"gebruikersnaam");
define('LI_PASSWD',"wachtwoord");
define('LI_LOGIN',"Login");
define('LI_LOGED_OUT',"Veilig afgemeld!");
define('LI_NOT_LOGED_OUT',"Niet veilig afgemeld!<br>Om veilig af te melden, voer een FOUTIEF wachtwoord in");

/*big_import.php*/
define('BI_IMPORTING_FILE',"Importeren bestand");
define('BI_INTO_DB',"Naar database");
define('BI_SESSION_NO',"Sessienummer");
define('BI_STARTING_LINE',"Begin op regel ");
define('BI_STOPPING_LINE',"Eindig op regel");
define('BI_QUERY_NO',"Aantal queries uitgevoerd");
define('BI_BYTE_NO',"Aantal bytes verwerkt tot nu toe");
define('BI_DURATION',"Duur van laatste sessie");
define('BI_THIS_LAST',"deze sessie/totaal");
define('BI_END',"Einde van bestand bereikt, import lijkt OK");
define('BI_RESTART',"Herstart importeren van bestand ");
define('BI_SCRIPT_RUNNING',"Dit script wordt nog verwerkt!<br>Wacht alstublieft tot het einde van het bestand is bereikt");
define('BI_CONTINUE',"Hervatten van regel");
define('BI_ENABLE_JS',"Maak het JavaScript mogelijk om automatisch verder te gaan");
define('BI_BROKEN_ZIP',"Het ZIP-bestand lijkt beschadigd te zijn");
define('BI_WRONG_FILE',"Gestopt op regel %s.<br>De huidige query bevat meer dan %s uitvoerregels. Dat gebeurt als uw backup-bestand was gemaakt met een programma dat geen punt-komma gevolgd door een regeleinde aan het einde van elke query invoegt, of als het backup-bestand 'extended inserts' bevat.");
?>