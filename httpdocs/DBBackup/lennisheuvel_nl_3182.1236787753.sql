# MySQL dump of database 'lennisheuvel_nl_3182' on host '10.171.105.25'
# backup date and time: 03/11/09 17:09:13
# built by phpMyBackupPro v.2.1
# http://www.phpMyBackupPro.net



### structure of table `archive` ###

DROP TABLE IF EXISTS `archive`;

CREATE TABLE `archive` (
  `ar_namespace` int(11) NOT NULL default '0',
  `ar_title` varbinary(255) NOT NULL default '',
  `ar_text` mediumblob NOT NULL,
  `ar_comment` tinyblob NOT NULL,
  `ar_user` int(10) unsigned NOT NULL default '0',
  `ar_user_text` varbinary(255) NOT NULL,
  `ar_timestamp` binary(14) NOT NULL default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `ar_minor_edit` tinyint(4) NOT NULL default '0',
  `ar_flags` tinyblob NOT NULL,
  `ar_rev_id` int(10) unsigned default NULL,
  `ar_text_id` int(10) unsigned default NULL,
  `ar_deleted` tinyint(3) unsigned NOT NULL default '0',
  `ar_len` int(10) unsigned default NULL,
  `ar_page_id` int(10) unsigned default NULL,
  `ar_parent_id` int(10) unsigned default NULL,
  KEY `name_title_timestamp` (`ar_namespace`,`ar_title`,`ar_timestamp`),
  KEY `usertext_timestamp` (`ar_user_text`,`ar_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;


### data of table `archive` ###



### structure of table `category` ###

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `cat_id` int(10) unsigned NOT NULL auto_increment,
  `cat_title` varbinary(255) NOT NULL,
  `cat_pages` int(11) NOT NULL default '0',
  `cat_subcats` int(11) NOT NULL default '0',
  `cat_files` int(11) NOT NULL default '0',
  `cat_hidden` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`cat_id`),
  UNIQUE KEY `cat_title` (`cat_title`),
  KEY `cat_pages` (`cat_pages`)
) ENGINE=InnoDB DEFAULT CHARSET=binary AUTO_INCREMENT=1;


### data of table `category` ###



### structure of table `categorylinks` ###

DROP TABLE IF EXISTS `categorylinks`;

CREATE TABLE `categorylinks` (
  `cl_from` int(10) unsigned NOT NULL default '0',
  `cl_to` varbinary(255) NOT NULL default '',
  `cl_sortkey` varbinary(70) NOT NULL default '',
  `cl_timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  UNIQUE KEY `cl_from` (`cl_from`,`cl_to`),
  KEY `cl_sortkey` (`cl_to`,`cl_sortkey`,`cl_from`),
  KEY `cl_timestamp` (`cl_to`,`cl_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;


### data of table `categorylinks` ###



### structure of table `externallinks` ###

DROP TABLE IF EXISTS `externallinks`;

CREATE TABLE `externallinks` (
  `el_from` int(10) unsigned NOT NULL default '0',
  `el_to` blob NOT NULL,
  `el_index` blob NOT NULL,
  KEY `el_from` (`el_from`,`el_to`(40)),
  KEY `el_to` (`el_to`(60),`el_from`),
  KEY `el_index` (`el_index`(60))
) ENGINE=InnoDB DEFAULT CHARSET=binary;


### data of table `externallinks` ###

insert into `externallinks` values ('11', 'http://www.fanfare-sintarnoldus.nl/', 'http://nl.fanfare-sintarnoldus.www./');
insert into `externallinks` values ('20', 'http://nl.wikipedia.org/wiki/Help:Gebruik_van_bestanden#Een_bestand_plaatsen:_thumbnail', 'http://org.wikipedia.nl./wiki/Help:Gebruik_van_bestanden#Een_bestand_plaatsen:_thumbnail');


### structure of table `filearchive` ###

DROP TABLE IF EXISTS `filearchive`;

CREATE TABLE `filearchive` (
  `fa_id` int(11) NOT NULL auto_increment,
  `fa_name` varbinary(255) NOT NULL default '',
  `fa_archive_name` varbinary(255) default '',
  `fa_storage_group` varbinary(16) default NULL,
  `fa_storage_key` varbinary(64) default '',
  `fa_deleted_user` int(11) default NULL,
  `fa_deleted_timestamp` binary(14) default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `fa_deleted_reason` blob,
  `fa_size` int(10) unsigned default '0',
  `fa_width` int(11) default '0',
  `fa_height` int(11) default '0',
  `fa_metadata` mediumblob,
  `fa_bits` int(11) default '0',
  `fa_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE') default NULL,
  `fa_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart') default 'unknown',
  `fa_minor_mime` varbinary(32) default 'unknown',
  `fa_description` tinyblob,
  `fa_user` int(10) unsigned default '0',
  `fa_user_text` varbinary(255) default NULL,
  `fa_timestamp` binary(14) default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `fa_deleted` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`fa_id`),
  KEY `fa_name` (`fa_name`,`fa_timestamp`),
  KEY `fa_storage_group` (`fa_storage_group`,`fa_storage_key`),
  KEY `fa_deleted_timestamp` (`fa_deleted_timestamp`),
  KEY `fa_user_timestamp` (`fa_user_text`,`fa_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary AUTO_INCREMENT=1;


### data of table `filearchive` ###



### structure of table `hitcounter` ###

DROP TABLE IF EXISTS `hitcounter`;

CREATE TABLE `hitcounter` (
  `hc_id` int(10) unsigned NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=latin1 MAX_ROWS=25000;


### data of table `hitcounter` ###



### structure of table `image` ###

DROP TABLE IF EXISTS `image`;

CREATE TABLE `image` (
  `img_name` varbinary(255) NOT NULL default '',
  `img_size` int(10) unsigned NOT NULL default '0',
  `img_width` int(11) NOT NULL default '0',
  `img_height` int(11) NOT NULL default '0',
  `img_metadata` mediumblob NOT NULL,
  `img_bits` int(11) NOT NULL default '0',
  `img_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE') default NULL,
  `img_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart') NOT NULL default 'unknown',
  `img_minor_mime` varbinary(32) NOT NULL default 'unknown',
  `img_description` tinyblob NOT NULL,
  `img_user` int(10) unsigned NOT NULL default '0',
  `img_user_text` varbinary(255) NOT NULL,
  `img_timestamp` varbinary(14) NOT NULL default '',
  `img_sha1` varbinary(32) NOT NULL default '',
  PRIMARY KEY  (`img_name`),
  KEY `img_usertext_timestamp` (`img_user_text`,`img_timestamp`),
  KEY `img_size` (`img_size`),
  KEY `img_timestamp` (`img_timestamp`),
  KEY `img_sha1` (`img_sha1`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;


### data of table `image` ###

insert into `image` values ('40jr_Orion_001.JPG', '61767', '518', '336', '0', '8', 'BITMAP', 'image', 'jpeg', '', '7', 'Twan', '20090220132351', 'gf441r7bg48661y6xamtcsfbcyfi0y7');
insert into `image` values ('40jr_Orion_002.JPG', '78884', '518', '336', '0', '8', 'BITMAP', 'image', 'jpeg', '', '7', 'Twan', '20090220132427', 'fv7qcj1uhhkrkuqmpp7tfk9wa64mfk5');
insert into `image` values ('Centrum_Lennisheuvel.JPG', '50254', '770', '170', '0', '8', 'BITMAP', 'image', 'jpeg', '', '7', 'Twan', '20090220135801', 'lg9ww7r21qgixh4mq3wm51qg5ja4bst');
insert into `image` values ('Fanfare_001.JPG', '60309', '495', '329', '0', '8', 'BITMAP', 'image', 'jpeg', '', '7', 'Twan', '20090220134711', 'escolvpqylt4sgsvsb5fyhkoao6z5ud');
insert into `image` values ('Fanfare_002.JPG', '86121', '494', '332', '0', '8', 'BITMAP', 'image', 'jpeg', '', '7', 'Twan', '20090220134746', '00s063qc8ftbs0titrfc55b3vx0zphb');
insert into `image` values ('Fanfare_003a.JPG', '71954', '501', '274', '0', '8', 'BITMAP', 'image', 'jpeg', '', '7', 'Twan', '20090220134817', 'iw610vazjs01qmz0j5r78cyra4bbkzs');
insert into `image` values ('Fanfare_004.JPG', '64409', '500', '323', '0', '8', 'BITMAP', 'image', 'jpeg', '', '7', 'Twan', '20090220135021', 'mt75ck8pfaco8jms30cfry4ndrw1gym');
insert into `image` values ('Fanfare_005.JPG', '67525', '518', '336', '0', '8', 'BITMAP', 'image', 'jpeg', '', '7', 'Twan', '20090220135046', 'klsi2l24t40b9103zqwp7nhzwxuzkoh');
insert into `image` values ('Fanfare_006.JPG', '61130', '518', '336', '0', '8', 'BITMAP', 'image', 'jpeg', '', '7', 'Twan', '20090220135124', '24ywp1zilg6rtkedyz12anoyv4wv2h9');
insert into `image` values ('Fanfare_007.JPG', '66981', '505', '326', '0', '8', 'BITMAP', 'image', 'jpeg', '', '7', 'Twan', '20090220135154', 'fiiqus30jfqxdub5qz7xq5i3oatzd6m');
insert into `image` values ('Geschiedenis_Orion_001.JPG', '95021', '778', '504', '0', '8', 'BITMAP', 'image', 'jpeg', '', '7', 'Twan', '20090220131707', '9uq802em25w0a9jd0r52gez4pmde8u9');
insert into `image` values ('Geschiedenis_Orion_002.jpg', '140769', '778', '504', '0', '8', 'BITMAP', 'image', 'jpeg', '', '7', 'Twan', '20090220131835', 'bwqbu5d34snpsowtjuldr8f41go1v4n');
insert into `image` values ('Geschiedenis_Orion_003.JPG', '753047', '2457', '1604', '0', '8', 'BITMAP', 'image', 'jpeg', '', '7', 'Twan', '20090222203412', '8zlknc0awn2y4r9eig3huyxxuwnqv01');
insert into `image` values ('Geschiedenis_Orion_004.JPG', '51328', '518', '336', '0', '8', 'BITMAP', 'image', 'jpeg', '', '7', 'Twan', '20090222203547', '9lilorvfm6ecqcqey4612lyp81hl89b');
insert into `image` values ('Nieuwbouw_001.JPG', '475085', '2592', '1680', '0', '8', 'BITMAP', 'image', 'jpeg', '', '7', 'Twan', '20090222195707', 'ai0w5vh22ryxkfxko5zu0v8nvxowq6h');
insert into `image` values ('Nieuwbouw_002.JPG', '564026', '2564', '1665', '0', '8', 'BITMAP', 'image', 'jpeg', '', '7', 'Twan', '20090222200438', 'fj286uq1ol7oxky0lmd10hy0rke9ejk');
insert into `image` values ('Nieuwbouw_003.JPG', '179622', '2592', '1680', '0', '8', 'BITMAP', 'image', 'jpeg', '', '7', 'Twan', '20090222200525', '9p4yh096tbyg1uwm7ic0sjx7fyt16pe');
insert into `image` values ('Nieuwbouw_005.JPG', '289798', '2592', '1680', '0', '8', 'BITMAP', 'image', 'jpeg', '', '7', 'Twan', '20090222195319', 'ruwom8yu4mmdmqdyxlfypbicfbln2xv');
insert into `image` values ('Sleutel.gif', '814', '99', '60', '0', '4', 'BITMAP', 'image', 'gif', '', '1', 'WikiAdmin', '20090115202518', 'qrvwp32nufto4uhlpbwvt4hh6my6dlo');
insert into `image` values ('Sneeuw_001.JPG', '136898', '761', '502', '0', '8', 'BITMAP', 'image', 'jpeg', '', '7', 'Twan', '20090222195149', 'j12ffd35sgo3mj5r6nne7hrznjh28uh');
insert into `image` values ('Theresiakerk.JPG', '40737', '300', '484', '0', '8', 'BITMAP', 'image', 'jpeg', '', '8', 'Toonvangrinsven', '20090224002413', 'hhkew7bctxapfq0u8nqhfxukbt33g02');
insert into `image` values ('Vacantiewerk_001.jpg', '188802', '778', '504', '0', '8', 'BITMAP', 'image', 'jpeg', '', '7', 'Twan', '20090222201748', 'rx8g0h1smxksuqih3dckoth21rageru');
insert into `image` values ('Vacantiewerk_002.jpg', '123928', '778', '504', '0', '8', 'BITMAP', 'image', 'jpeg', '', '7', 'Twan', '20090222201831', '6btt8l6o9mseps1g0o4v88dszmelvsj');
insert into `image` values ('Vacantiewerk_003.jpg', '163261', '778', '504', '0', '8', 'BITMAP', 'image', 'jpeg', '', '7', 'Twan', '20090222201918', '7ts7psvzu4ogsnwm5bzs49pjzhlo8os');
insert into `image` values ('Vacantiewerk_004.jpg', '142791', '778', '504', '0', '8', 'BITMAP', 'image', 'jpeg', '', '7', 'Twan', '20090222202007', '0ezyfu5bdzww9jroqaidt9lst4vu0li');
insert into `image` values ('Vacantiewerk_005.jpg', '227269', '1296', '840', '0', '8', 'BITMAP', 'image', 'jpeg', '', '7', 'Twan', '20090222202140', 'e78bgb0ju0gfjp77wov4809jmqu0948');
insert into `image` values ('Zevenmijlstappers_001.JPG', '364575', '2592', '1680', '0', '8', 'BITMAP', 'image', 'jpeg', '', '7', 'Twan', '20090222193951', 'fenojb7zhpo3j0yrhzasqs4y45rk8oq');


### structure of table `imagelinks` ###

DROP TABLE IF EXISTS `imagelinks`;

CREATE TABLE `imagelinks` (
  `il_from` int(10) unsigned NOT NULL default '0',
  `il_to` varbinary(255) NOT NULL default '',
  UNIQUE KEY `il_from` (`il_from`,`il_to`),
  KEY `il_to` (`il_to`,`il_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;


### data of table `imagelinks` ###

insert into `imagelinks` values ('5', '40jr_Orion_001.JPG');
insert into `imagelinks` values ('5', '40jr_Orion_002.JPG');
insert into `imagelinks` values ('5', 'Centrum_Lennisheuvel.JPG');
insert into `imagelinks` values ('5', 'Geschiedenis_Orion_001.JPG');
insert into `imagelinks` values ('5', 'Geschiedenis_Orion_002.jpg');
insert into `imagelinks` values ('5', 'Geschiedenis_Orion_003.JPG');
insert into `imagelinks` values ('5', 'Geschiedenis_Orion_004.JPG');
insert into `imagelinks` values ('5', 'Zevenmijlstappers_001.JPG');
insert into `imagelinks` values ('7', 'Fanfare_007.JPG');
insert into `imagelinks` values ('11', 'Fanfare_001.JPG');
insert into `imagelinks` values ('11', 'Fanfare_002.JPG');
insert into `imagelinks` values ('11', 'Fanfare_003a.JPG');
insert into `imagelinks` values ('11', 'Fanfare_004.JPG');
insert into `imagelinks` values ('11', 'Fanfare_005.JPG');
insert into `imagelinks` values ('11', 'Fanfare_006.JPG');
insert into `imagelinks` values ('11', 'Fanfare_007.JPG');
insert into `imagelinks` values ('11', 'Geschiedenis_Orion_001.JPG');
insert into `imagelinks` values ('22', 'Nieuwbouw_001.JPG');
insert into `imagelinks` values ('22', 'Nieuwbouw_002.JPG');
insert into `imagelinks` values ('22', 'Nieuwbouw_003.JPG');
insert into `imagelinks` values ('22', 'Nieuwbouw_005.JPG');
insert into `imagelinks` values ('22', 'Sneeuw_001.JPG');
insert into `imagelinks` values ('28', 'Vacantiewerk_001.jpg');
insert into `imagelinks` values ('28', 'Vacantiewerk_002.jpg');
insert into `imagelinks` values ('28', 'Vacantiewerk_003.jpg');
insert into `imagelinks` values ('28', 'Vacantiewerk_004.jpg');
insert into `imagelinks` values ('28', 'Vacantiewerk_005.jpg');


### structure of table `interwiki` ###

DROP TABLE IF EXISTS `interwiki`;

CREATE TABLE `interwiki` (
  `iw_prefix` varbinary(32) NOT NULL,
  `iw_url` blob NOT NULL,
  `iw_local` tinyint(1) NOT NULL,
  `iw_trans` tinyint(4) NOT NULL default '0',
  UNIQUE KEY `iw_prefix` (`iw_prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;


### data of table `interwiki` ###

insert into `interwiki` values ('acronym', 'http://www.acronymfinder.com/af-query.asp?String=exact&Acronym=$1', '0', '0');
insert into `interwiki` values ('advogato', 'http://www.advogato.org/$1', '0', '0');
insert into `interwiki` values ('annotationwiki', 'http://www.seedwiki.com/page.cfm?wikiid=368&doc=$1', '0', '0');
insert into `interwiki` values ('arxiv', 'http://www.arxiv.org/abs/$1', '0', '0');
insert into `interwiki` values ('c2find', 'http://c2.com/cgi/wiki?FindPage&value=$1', '0', '0');
insert into `interwiki` values ('cache', 'http://www.google.com/search?q=cache:$1', '0', '0');
insert into `interwiki` values ('codersbase', 'http://www.codersbase.com/index.php/$1', '0', '0');
insert into `interwiki` values ('commons', 'http://commons.wikimedia.org/wiki/$1', '0', '0');
insert into `interwiki` values ('corpknowpedia', 'http://corpknowpedia.org/wiki/index.php/$1', '0', '0');
insert into `interwiki` values ('dictionary', 'http://www.dict.org/bin/Dict?Database=*&Form=Dict1&Strategy=*&Query=$1', '0', '0');
insert into `interwiki` values ('disinfopedia', 'http://www.disinfopedia.org/wiki.phtml?title=$1', '0', '0');
insert into `interwiki` values ('docbook', 'http://wiki.docbook.org/topic/$1', '0', '0');
insert into `interwiki` values ('drumcorpswiki', 'http://www.drumcorpswiki.com/index.php/$1', '0', '0');
insert into `interwiki` values ('dwjwiki', 'http://www.suberic.net/cgi-bin/dwj/wiki.cgi?$1', '0', '0');
insert into `interwiki` values ('efnetceewiki', 'http://purl.net/wiki/c/$1', '0', '0');
insert into `interwiki` values ('efnetcppwiki', 'http://purl.net/wiki/cpp/$1', '0', '0');
insert into `interwiki` values ('efnetpythonwiki', 'http://purl.net/wiki/python/$1', '0', '0');
insert into `interwiki` values ('efnetxmlwiki', 'http://purl.net/wiki/xml/$1', '0', '0');
insert into `interwiki` values ('elibre', 'http://enciclopedia.us.es/index.php/$1', '0', '0');
insert into `interwiki` values ('eljwiki', 'http://elj.sourceforge.net/phpwiki/index.php/$1', '0', '0');
insert into `interwiki` values ('emacswiki', 'http://www.emacswiki.org/cgi-bin/wiki.pl?$1', '0', '0');
insert into `interwiki` values ('eokulturcentro', 'http://esperanto.toulouse.free.fr/wakka.php?wiki=$1', '0', '0');
insert into `interwiki` values ('foldoc', 'http://foldoc.org/?$1', '0', '0');
insert into `interwiki` values ('foxwiki', 'http://fox.wikis.com/wc.dll?Wiki~$1', '0', '0');
insert into `interwiki` values ('freebsdman', 'http://www.FreeBSD.org/cgi/man.cgi?apropos=1&query=$1', '0', '0');
insert into `interwiki` values ('gej', 'http://www.esperanto.de/cgi-bin/aktivikio/wiki.pl?$1', '0', '0');
insert into `interwiki` values ('gentoo-wiki', 'http://gentoo-wiki.com/$1', '0', '0');
insert into `interwiki` values ('google', 'http://www.google.com/search?q=$1', '0', '0');
insert into `interwiki` values ('googlegroups', 'http://groups.google.com/groups?q=$1', '0', '0');
insert into `interwiki` values ('gotamac', 'http://www.got-a-mac.org/$1', '0', '0');
insert into `interwiki` values ('hammondwiki', 'http://www.dairiki.org/HammondWiki/$1', '0', '0');
insert into `interwiki` values ('hewikisource', 'http://he.wikisource.org/wiki/$1', '1', '0');
insert into `interwiki` values ('hrwiki', 'http://www.hrwiki.org/index.php/$1', '0', '0');
insert into `interwiki` values ('imdb', 'http://us.imdb.com/Title?$1', '0', '0');
insert into `interwiki` values ('infosecpedia', 'http://www.infosecpedia.org/pedia/index.php/$1', '0', '0');
insert into `interwiki` values ('jargonfile', 'http://sunir.org/apps/meta.pl?wiki=JargonFile&redirect=$1', '0', '0');
insert into `interwiki` values ('jspwiki', 'http://www.jspwiki.org/wiki/$1', '0', '0');
insert into `interwiki` values ('keiki', 'http://kei.ki/en/$1', '0', '0');
insert into `interwiki` values ('kmwiki', 'http://kmwiki.wikispaces.com/$1', '0', '0');
insert into `interwiki` values ('linuxwiki', 'http://linuxwiki.de/$1', '0', '0');
insert into `interwiki` values ('lojban', 'http://www.lojban.org/tiki/tiki-index.php?page=$1', '0', '0');
insert into `interwiki` values ('lqwiki', 'http://wiki.linuxquestions.org/wiki/$1', '0', '0');
insert into `interwiki` values ('lugkr', 'http://lug-kr.sourceforge.net/cgi-bin/lugwiki.pl?$1', '0', '0');
insert into `interwiki` values ('mathsongswiki', 'http://SeedWiki.com/page.cfm?wikiid=237&doc=$1', '0', '0');
insert into `interwiki` values ('meatball', 'http://www.usemod.com/cgi-bin/mb.pl?$1', '0', '0');
insert into `interwiki` values ('mediawikiwiki', 'http://www.mediawiki.org/wiki/$1', '0', '0');
insert into `interwiki` values ('mediazilla', 'http://bugzilla.wikipedia.org/$1', '1', '0');
insert into `interwiki` values ('memoryalpha', 'http://www.memory-alpha.org/en/index.php/$1', '0', '0');
insert into `interwiki` values ('metawiki', 'http://sunir.org/apps/meta.pl?$1', '0', '0');
insert into `interwiki` values ('metawikipedia', 'http://meta.wikimedia.org/wiki/$1', '0', '0');
insert into `interwiki` values ('moinmoin', 'http://purl.net/wiki/moin/$1', '0', '0');
insert into `interwiki` values ('mozillawiki', 'http://wiki.mozilla.org/index.php/$1', '0', '0');
insert into `interwiki` values ('oeis', 'http://www.research.att.com/cgi-bin/access.cgi/as/njas/sequences/eisA.cgi?Anum=$1', '0', '0');
insert into `interwiki` values ('openfacts', 'http://openfacts.berlios.de/index.phtml?title=$1', '0', '0');
insert into `interwiki` values ('openwiki', 'http://openwiki.com/?$1', '0', '0');
insert into `interwiki` values ('orgpatterns', 'http://www.bell-labs.com/cgi-user/OrgPatterns/OrgPatterns?$1', '0', '0');
insert into `interwiki` values ('patwiki', 'http://gauss.ffii.org/$1', '0', '0');
insert into `interwiki` values ('pmeg', 'http://www.bertilow.com/pmeg/$1.php', '0', '0');
insert into `interwiki` values ('ppr', 'http://c2.com/cgi/wiki?$1', '0', '0');
insert into `interwiki` values ('pythoninfo', 'http://wiki.python.org/moin/$1', '0', '0');
insert into `interwiki` values ('rfc', 'http://www.rfc-editor.org/rfc/rfc$1.txt', '0', '0');
insert into `interwiki` values ('s23wiki', 'http://is-root.de/wiki/index.php/$1', '0', '0');
insert into `interwiki` values ('seattlewiki', 'http://seattle.wikia.com/wiki/$1', '0', '0');
insert into `interwiki` values ('seattlewireless', 'http://seattlewireless.net/?$1', '0', '0');
insert into `interwiki` values ('senseislibrary', 'http://senseis.xmp.net/?$1', '0', '0');
insert into `interwiki` values ('slashdot', 'http://slashdot.org/article.pl?sid=$1', '0', '0');
insert into `interwiki` values ('sourceforge', 'http://sourceforge.net/$1', '0', '0');
insert into `interwiki` values ('squeak', 'http://wiki.squeak.org/squeak/$1', '0', '0');
insert into `interwiki` values ('susning', 'http://www.susning.nu/$1', '0', '0');
insert into `interwiki` values ('svgwiki', 'http://wiki.svg.org/$1', '0', '0');
insert into `interwiki` values ('tavi', 'http://tavi.sourceforge.net/$1', '0', '0');
insert into `interwiki` values ('tejo', 'http://www.tejo.org/vikio/$1', '0', '0');
insert into `interwiki` values ('theopedia', 'http://www.theopedia.com/$1', '0', '0');
insert into `interwiki` values ('tmbw', 'http://www.tmbw.net/wiki/$1', '0', '0');
insert into `interwiki` values ('tmnet', 'http://www.technomanifestos.net/?$1', '0', '0');
insert into `interwiki` values ('tmwiki', 'http://www.EasyTopicMaps.com/?page=$1', '0', '0');
insert into `interwiki` values ('twiki', 'http://twiki.org/cgi-bin/view/$1', '0', '0');
insert into `interwiki` values ('uea', 'http://www.tejo.org/uea/$1', '0', '0');
insert into `interwiki` values ('unreal', 'http://wiki.beyondunreal.com/wiki/$1', '0', '0');
insert into `interwiki` values ('usemod', 'http://www.usemod.com/cgi-bin/wiki.pl?$1', '0', '0');
insert into `interwiki` values ('vinismo', 'http://vinismo.com/en/$1', '0', '0');
insert into `interwiki` values ('webseitzwiki', 'http://webseitz.fluxent.com/wiki/$1', '0', '0');
insert into `interwiki` values ('why', 'http://clublet.com/c/c/why?$1', '0', '0');
insert into `interwiki` values ('wiki', 'http://c2.com/cgi/wiki?$1', '0', '0');
insert into `interwiki` values ('wikia', 'http://www.wikia.com/wiki/$1', '0', '0');
insert into `interwiki` values ('wikibooks', 'http://en.wikibooks.org/wiki/$1', '1', '0');
insert into `interwiki` values ('wikicities', 'http://www.wikicities.com/index.php/$1', '0', '0');
insert into `interwiki` values ('wikif1', 'http://www.wikif1.org/$1', '0', '0');
insert into `interwiki` values ('wikihow', 'http://www.wikihow.com/$1', '0', '0');
insert into `interwiki` values ('wikimedia', 'http://wikimediafoundation.org/wiki/$1', '0', '0');
insert into `interwiki` values ('wikinews', 'http://en.wikinews.org/wiki/$1', '1', '0');
insert into `interwiki` values ('wikinfo', 'http://www.wikinfo.org/index.php/$1', '0', '0');
insert into `interwiki` values ('wikipedia', 'http://en.wikipedia.org/wiki/$1', '1', '0');
insert into `interwiki` values ('wikiquote', 'http://en.wikiquote.org/wiki/$1', '1', '0');
insert into `interwiki` values ('wikisource', 'http://sources.wikipedia.org/wiki/$1', '1', '0');
insert into `interwiki` values ('wikispecies', 'http://species.wikipedia.org/wiki/$1', '1', '0');
insert into `interwiki` values ('wikitravel', 'http://wikitravel.org/en/$1', '0', '0');
insert into `interwiki` values ('wikt', 'http://en.wiktionary.org/wiki/$1', '1', '0');
insert into `interwiki` values ('wiktionary', 'http://en.wiktionary.org/wiki/$1', '1', '0');
insert into `interwiki` values ('wlug', 'http://www.wlug.org.nz/$1', '0', '0');
insert into `interwiki` values ('zwiki', 'http://zwiki.org/$1', '0', '0');
insert into `interwiki` values ('zzz wiki', 'http://wiki.zzz.ee/index.php/$1', '0', '0');


### structure of table `ipblocks` ###

DROP TABLE IF EXISTS `ipblocks`;

CREATE TABLE `ipblocks` (
  `ipb_id` int(11) NOT NULL auto_increment,
  `ipb_address` tinyblob NOT NULL,
  `ipb_user` int(10) unsigned NOT NULL default '0',
  `ipb_by` int(10) unsigned NOT NULL default '0',
  `ipb_by_text` varbinary(255) NOT NULL default '',
  `ipb_reason` tinyblob NOT NULL,
  `ipb_timestamp` binary(14) NOT NULL default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `ipb_auto` tinyint(1) NOT NULL default '0',
  `ipb_anon_only` tinyint(1) NOT NULL default '0',
  `ipb_create_account` tinyint(1) NOT NULL default '1',
  `ipb_enable_autoblock` tinyint(1) NOT NULL default '1',
  `ipb_expiry` varbinary(14) NOT NULL default '',
  `ipb_range_start` tinyblob NOT NULL,
  `ipb_range_end` tinyblob NOT NULL,
  `ipb_deleted` tinyint(1) NOT NULL default '0',
  `ipb_block_email` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`ipb_id`),
  UNIQUE KEY `ipb_address` (`ipb_address`(255),`ipb_user`,`ipb_auto`,`ipb_anon_only`),
  KEY `ipb_user` (`ipb_user`),
  KEY `ipb_range` (`ipb_range_start`(8),`ipb_range_end`(8)),
  KEY `ipb_timestamp` (`ipb_timestamp`),
  KEY `ipb_expiry` (`ipb_expiry`)
) ENGINE=InnoDB DEFAULT CHARSET=binary AUTO_INCREMENT=3;


### data of table `ipblocks` ###

insert into `ipblocks` values ('1', 'User1', '3', '1', 'WikiAdmin', 'Foutieve informatie invoeren', '20090210204046', '0', '0', '1', '1', '20090210205546', '', '', '0', '0');
insert into `ipblocks` values ('2', 'User2', '4', '1', 'WikiAdmin', 'Foutieve informatie invoeren', '20090210204221', '0', '0', '1', '1', '20090210205721', '', '', '0', '0');


### structure of table `job` ###

DROP TABLE IF EXISTS `job`;

CREATE TABLE `job` (
  `job_id` int(10) unsigned NOT NULL auto_increment,
  `job_cmd` varbinary(60) NOT NULL default '',
  `job_namespace` int(11) NOT NULL,
  `job_title` varbinary(255) NOT NULL,
  `job_params` blob NOT NULL,
  PRIMARY KEY  (`job_id`),
  KEY `job_cmd` (`job_cmd`,`job_namespace`,`job_title`)
) ENGINE=InnoDB DEFAULT CHARSET=binary AUTO_INCREMENT=1;


### data of table `job` ###



### structure of table `langlinks` ###

DROP TABLE IF EXISTS `langlinks`;

CREATE TABLE `langlinks` (
  `ll_from` int(10) unsigned NOT NULL default '0',
  `ll_lang` varbinary(20) NOT NULL default '',
  `ll_title` varbinary(255) NOT NULL default '',
  UNIQUE KEY `ll_from` (`ll_from`,`ll_lang`),
  KEY `ll_lang` (`ll_lang`,`ll_title`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;


### data of table `langlinks` ###



### structure of table `logging` ###

DROP TABLE IF EXISTS `logging`;

CREATE TABLE `logging` (
  `log_id` int(10) unsigned NOT NULL auto_increment,
  `log_type` varbinary(10) NOT NULL default '',
  `log_action` varbinary(10) NOT NULL default '',
  `log_timestamp` binary(14) NOT NULL default '19700101000000',
  `log_user` int(10) unsigned NOT NULL default '0',
  `log_namespace` int(11) NOT NULL default '0',
  `log_title` varbinary(255) NOT NULL default '',
  `log_comment` varbinary(255) NOT NULL default '',
  `log_params` blob NOT NULL,
  `log_deleted` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`log_id`),
  KEY `type_time` (`log_type`,`log_timestamp`),
  KEY `user_time` (`log_user`,`log_timestamp`),
  KEY `page_time` (`log_namespace`,`log_title`,`log_timestamp`),
  KEY `times` (`log_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary AUTO_INCREMENT=68;


### data of table `logging` ###

insert into `logging` values ('1', 'upload', 'upload', '20090115202519', '1', '6', 'Sleutel.gif', '', '', '0');
insert into `logging` values ('2', 'patrol', 'patrol', '20090115205009', '1', '0', 'Hoofdpagina', '', '3\n1\n1', '0');
insert into `logging` values ('3', 'patrol', 'patrol', '20090115205058', '1', '0', 'Hoofdpagina', '', '4\n3\n1', '0');
insert into `logging` values ('4', 'move', 'move', '20090115205154', '1', '0', 'Hoofdpagina', '', 'Historische Kamer', '0');
insert into `logging` values ('5', 'patrol', 'patrol', '20090115205236', '1', '0', 'Historische_Kamer', '', '7\n5\n1', '0');
insert into `logging` values ('6', 'patrol', 'patrol', '20090117140040', '1', '8', 'Sidebar', '', '8\n0\n1', '0');
insert into `logging` values ('7', 'patrol', 'patrol', '20090117140317', '1', '0', 'Historische_Kamer', '', '9\n7\n1', '0');
insert into `logging` values ('8', 'patrol', 'patrol', '20090117140436', '1', '8', 'Sidebar', '', '10\n8\n1', '0');
insert into `logging` values ('9', 'patrol', 'patrol', '20090117140559', '1', '8', 'Sidebar', '', '11\n10\n1', '0');
insert into `logging` values ('10', 'patrol', 'patrol', '20090117140833', '1', '8', 'Sidebar', '', '12\n11\n1', '0');
insert into `logging` values ('11', 'patrol', 'patrol', '20090117141810', '1', '8', 'Sidebar', '', '13\n12\n1', '0');
insert into `logging` values ('12', 'patrol', 'patrol', '20090117141828', '1', '8', 'Sidebar', '', '14\n13\n1', '0');
insert into `logging` values ('13', 'patrol', 'patrol', '20090117141911', '1', '8', 'Sidebar', '', '15\n14\n1', '0');
insert into `logging` values ('14', 'patrol', 'patrol', '20090117141944', '1', '8', 'Sidebar', '', '16\n15\n1', '0');
insert into `logging` values ('15', 'patrol', 'patrol', '20090117142039', '1', '8', 'Sidebar', '', '17\n16\n1', '0');
insert into `logging` values ('16', 'patrol', 'patrol', '20090123140506', '1', '0', 'Gebouwen', '', '18\n0\n1', '0');
insert into `logging` values ('17', 'patrol', 'patrol', '20090128130926', '1', '0', 'Gebouwen', '', '19\n18\n1', '0');
insert into `logging` values ('18', 'patrol', 'patrol', '20090128131032', '1', '0', 'Gebouwen', '', '20\n19\n1', '0');
insert into `logging` values ('19', 'patrol', 'patrol', '20090128131121', '1', '0', 'Gebouwen', '', '21\n20\n1', '0');
insert into `logging` values ('20', 'patrol', 'patrol', '20090128131139', '1', '0', 'Gebouwen', '', '22\n21\n1', '0');
insert into `logging` values ('21', 'patrol', 'patrol', '20090128134002', '1', '0', 'Gebouwen', '', '23\n22\n1', '0');
insert into `logging` values ('22', 'patrol', 'patrol', '20090128195449', '1', '8', 'Sidebar', '', '24\n17\n1', '0');
insert into `logging` values ('23', 'patrol', 'patrol', '20090128195519', '1', '8', 'Sidebar', '', '25\n24\n1', '0');
insert into `logging` values ('24', 'patrol', 'patrol', '20090207150322', '1', '8', 'Sidebar', '', '26\n25\n1', '0');
insert into `logging` values ('25', 'patrol', 'patrol', '20090207150350', '1', '8', 'Sidebar', '', '27\n26\n1', '0');
insert into `logging` values ('26', 'block', 'block', '20090210204046', '1', '2', 'User1', 'Foutieve informatie invoeren', '15 min\nnocreate', '0');
insert into `logging` values ('27', 'block', 'block', '20090210204221', '1', '2', 'User2', 'Foutieve informatie invoeren', '15 min\nnocreate', '0');
insert into `logging` values ('28', 'upload', 'upload', '20090219194334', '7', '6', 'Geschiedenis_Orion_001.JPG', '', '', '0');
insert into `logging` values ('29', 'patrol', 'patrol', '20090219195002', '1', '0', 'Families', '', '31\n0\n1', '0');
insert into `logging` values ('30', 'patrol', 'patrol', '20090219195047', '1', '0', 'Families', '', '32\n31\n1', '0');
insert into `logging` values ('31', 'patrol', 'patrol', '20090219195102', '1', '0', 'Families', '', '33\n32\n1', '0');
insert into `logging` values ('32', 'patrol', 'patrol', '20090219195541', '1', '0', 'Families', '', '34\n33\n1', '0');
insert into `logging` values ('33', 'upload', 'upload', '20090220130430', '7', '6', 'Geschiedenis_Orion_002.jpg', '', '', '0');
insert into `logging` values ('34', 'upload', 'overwrite', '20090220131707', '7', '6', 'Geschiedenis_Orion_001.JPG', '', '', '0');
insert into `logging` values ('35', 'upload', 'overwrite', '20090220131835', '7', '6', 'Geschiedenis_Orion_002.jpg', '', '', '0');
insert into `logging` values ('36', 'upload', 'upload', '20090220132351', '7', '6', '40jr_Orion_001.JPG', '', '', '0');
insert into `logging` values ('37', 'upload', 'upload', '20090220132427', '7', '6', '40jr_Orion_002.JPG', '', '', '0');
insert into `logging` values ('38', 'upload', 'upload', '20090220134711', '7', '6', 'Fanfare_001.JPG', '', '', '0');
insert into `logging` values ('39', 'upload', 'upload', '20090220134746', '7', '6', 'Fanfare_002.JPG', '', '', '0');
insert into `logging` values ('40', 'upload', 'upload', '20090220134817', '7', '6', 'Fanfare_003a.JPG', '', '', '0');
insert into `logging` values ('41', 'upload', 'upload', '20090220135021', '7', '6', 'Fanfare_004.JPG', '', '', '0');
insert into `logging` values ('42', 'upload', 'upload', '20090220135046', '7', '6', 'Fanfare_005.JPG', '', '', '0');
insert into `logging` values ('43', 'upload', 'upload', '20090220135124', '7', '6', 'Fanfare_006.JPG', '', '', '0');
insert into `logging` values ('44', 'upload', 'upload', '20090220135155', '7', '6', 'Fanfare_007.JPG', '', '', '0');
insert into `logging` values ('45', 'upload', 'upload', '20090220135801', '7', '6', 'Centrum_Lennisheuvel.JPG', '', '', '0');
insert into `logging` values ('46', 'patrol', 'patrol', '20090221102504', '1', '0', 'Families', '', '58\n34\n1', '0');
insert into `logging` values ('47', 'patrol', 'patrol', '20090221102520', '1', '0', 'Families', '', '59\n58\n1', '0');
insert into `logging` values ('48', 'patrol', 'patrol', '20090221103207', '1', '0', 'Families', '', '60\n59\n1', '0');
insert into `logging` values ('49', 'patrol', 'patrol', '20090221103827', '1', '12', 'Inhoud', '', '61\n0\n1', '0');
insert into `logging` values ('50', 'patrol', 'patrol', '20090221103914', '1', '12', 'Inhoud', '', '62\n61\n1', '0');
insert into `logging` values ('51', 'patrol', 'patrol', '20090221103956', '1', '12', 'Inhoud', '', '63\n62\n1', '0');
insert into `logging` values ('52', 'upload', 'upload', '20090222193951', '7', '6', 'Zevenmijlstappers_001.JPG', '', '', '0');
insert into `logging` values ('53', 'upload', 'upload', '20090222194958', '7', '6', 'Sneeuw_001.JPG', '', '', '0');
insert into `logging` values ('54', 'upload', 'overwrite', '20090222195149', '7', '6', 'Sneeuw_001.JPG', '', '', '0');
insert into `logging` values ('55', 'upload', 'upload', '20090222195319', '7', '6', 'Nieuwbouw_005.JPG', '', '', '0');
insert into `logging` values ('56', 'upload', 'upload', '20090222195707', '7', '6', 'Nieuwbouw_001.JPG', '', '', '0');
insert into `logging` values ('57', 'upload', 'upload', '20090222200438', '7', '6', 'Nieuwbouw_002.JPG', '', '', '0');
insert into `logging` values ('58', 'upload', 'upload', '20090222200525', '7', '6', 'Nieuwbouw_003.JPG', '', '', '0');
insert into `logging` values ('59', 'upload', 'upload', '20090222201748', '7', '6', 'Vacantiewerk_001.jpg', '', '', '0');
insert into `logging` values ('60', 'upload', 'upload', '20090222201831', '7', '6', 'Vacantiewerk_002.jpg', '', '', '0');
insert into `logging` values ('61', 'upload', 'upload', '20090222201918', '7', '6', 'Vacantiewerk_003.jpg', '', '', '0');
insert into `logging` values ('62', 'upload', 'upload', '20090222202007', '7', '6', 'Vacantiewerk_004.jpg', '', '', '0');
insert into `logging` values ('63', 'upload', 'upload', '20090222202140', '7', '6', 'Vacantiewerk_005.jpg', '', '', '0');
insert into `logging` values ('64', 'upload', 'upload', '20090222203412', '7', '6', 'Geschiedenis_Orion_003.JPG', '', '', '0');
insert into `logging` values ('65', 'upload', 'upload', '20090222203547', '7', '6', 'Geschiedenis_Orion_004.JPG', '', '', '0');
insert into `logging` values ('66', 'patrol', 'patrol', '20090222215530', '1', '0', 'Straten', '', '110\n87\n1', '0');
insert into `logging` values ('67', 'upload', 'upload', '20090224002413', '8', '6', 'Theresiakerk.JPG', '', '', '0');


### structure of table `math` ###

DROP TABLE IF EXISTS `math`;

CREATE TABLE `math` (
  `math_inputhash` varbinary(16) NOT NULL,
  `math_outputhash` varbinary(16) NOT NULL,
  `math_html_conservativeness` tinyint(4) NOT NULL,
  `math_html` blob,
  `math_mathml` blob,
  UNIQUE KEY `math_inputhash` (`math_inputhash`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;


### data of table `math` ###



### structure of table `objectcache` ###

DROP TABLE IF EXISTS `objectcache`;

CREATE TABLE `objectcache` (
  `keyname` varbinary(255) NOT NULL default '',
  `value` mediumblob,
  `exptime` datetime default NULL,
  UNIQUE KEY `keyname` (`keyname`),
  KEY `exptime` (`exptime`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;


### data of table `objectcache` ###

insert into `objectcache` values ('lennisheuvel_nl_3182:messages:nl', 'Uê¡ä¬0ÜÔ}ä“c¡É^‹MOUjwA¨XØQá8P”2iı`|\"√s¢Ùí˘ÊcÚåq1b(¢˜∞ï%F~~E∆·X∂†jB∏ﬂt«·D±B0÷Éìs Sk–÷Éì9lÎÓÃ“ÉìeK®Ìª:µç\nµbˇŸºC†#ûDc^Qm¿yY∫ˇ1hyB%[¨üﬂéu#XΩ=òa„vÒ¢N¸ò^Gï˝2n‰\0UÛÃpäeQLG≈ÜiöŒÚUög•ªﬂmù- ˇb%(˙…ı', '2009-03-11 18:03:32');
insert into `objectcache` values ('lennisheuvel_nl_3182:pcache:idhash:1-0!1!0!!nl!2!edit=0', 'mUMs\Z9Õô_—p…e¡3ÿâÌ¡ÎÀÆ+¶‚™BícJ†ˆå@#MI\Z∞ù JÌœ€\'pô√¥ZÍ˜^ø˜E>,z·<ª˚64mË√º¯ÈãEØûÚcËç|ëggÁEÔ¢π¸óÈZ˘`ùÚÛäÈ≥®Ÿ—⁄:®‰U´%’Ë=“nx≈F2}bd*ñlîßï0X0¯Yqªb˝~–π8j.qÿê‰g¶e:1ÊaÔög^¶gµ0x!!L…ZI PÖBﬂ«ü«(,ôu‡·f≥â.[Ëkzü©Öt¢d“¿‰õ„ï©l+_Î“U™UÒlÜ‘ñåï™$[KRÕïµé^~ø¸6‘∞Û÷\Z≤¶∂\0¶KI[ì–öùfE’ûX <XWã†ò,pA`âÿ3ÿk6⁄…r◊íc°ïglPK™’Ç\"£Ä$™Í\"¡(5U–@ ∂\0ÑÊ∂F;Ÿ\rËVó∂UñYªLåb÷Ç€RíW$∏	±y›•[ÂSﬂí¢>…®π?h∆¿ÕR°mƒØE@Pî\\)^«≠Üv™˝…çoé}´É¿ö⁄ˆ=ı¨igZÕA5Ë˛!’hú]òõ∂VR≤û	«t÷ÍøhçCRìπ˛Û°].¶ÿÿﬂN-V îoânìm≠.Å\n ¿Aí_˛€ ﬂµ¥äﬁç¸‚˛ç_;›~ü:wºûLH´ZEFçu°3¡”Ÿ9{ì¿9±0bA˘Qû•Ogb}ËÛc≥±Ò\\∑HÚÍô éÜŸ˘i˛aH≥ß¿æ3Â∫â¢ípe[3¸¸vﬁ’cÉ©SìÊòZ3\n∆‹œbÒNøŸŸ ˇ\"Vúfhõ?—ük*ZÚ\Z˝G£Fˇ8ŒœÜEìí\n%+·´\"Ôg›ºõuªFwá]Üw˛Œ(2\n™fD›–0ÀŒ≥„<Àœ≤„„ä’”UrÇ{ÂÉ‹b\"o‡	ﬂâ\"+~˛¬Zéµ¿∏ƒÃ˛¬i\\∞&e¸Ωñ∑¢TÛﬁhVdÈrJªÄnä‚ª\ZáÂcÙiﬂ0±&æ‚~À\'Ω›S4Ôn<‚„c˚\nd ›∂f?>‹ãèÂﬁJ?ÆAw?; pıàY1Bø%ÃıÖSxﬁŸOÈry:à^≥ê„¿ık8õ˝\Zø∑Çõº˛.ú¡LºänæÜ2q7]8Ë» º€ˇ€x\'ïıß§‚∏ÈŒ≠…Û”¸\r:Ìç~˝', '2009-03-11 18:03:34');
insert into `objectcache` values ('lennisheuvel_nl_3182:pcache:idhash:11-0!1!0!!nl!2!edit=0', 'ÌX[o€6ÓÎ¸+NÙ“\ròMIæFæE◊5Ÿ∫&@ÉÂa⁄:∂K§@“qí¢ˇ}á≤î⁄ŒNá†÷<H2œ˝|•EAy«\\‘Gõ/¨ÖAÙ…DÌ»ÀN“z}z:ù»pê<√°˜+óSÆÒÏ£êˆÏµñ*ç∆\r\rípìs	ìî3Ù≤e=AßB¢7Ç“ú)T¶0`ŒÇêumêè~Aòﬁ©(®|ÜZLBB∞ﬂ⁄î0Fc9∑¿•T˙˛>8ÌéÁúÎJà8°N≈lÜí~RM∆	‚‘:Ö*fBF•Ki4∫X.ÿ{îRòòíxâ◊d\\ÿè«t£U$µ•í®\rÃeòa∆˘‹BÜñÙËæ0bÇ.™pÙ fBŒ=éπå:M—\\i@cLj*ÉXXJ∂N…äYïLë0Ás∞¬πj¿Z„VU)5ti\n*\Zñ86¬b◊Å‡L4Ná^bm1∂\\.•q›P◊yŸÙÜLôW°IÑ@-y\n|aï\\dc‘XaS‹—è∆tËI5Ui™ñﬁËØ‡oGX∫ñ«‘Q™fnH*—Å-…3∫æPÖ‘Ïπkrû÷Áh`!\n‹‘Ç.±R∆uÀuYS[–µ7-zx¡Â w’ÍòH”Ö±∫Ä‚«\n%Ú°·MNIJ ˛L¸ÍµÍtÈº˙©Q∞úÿi˘òR(€1„NÒä⁄ÉiJûñCœ_˝ŒyóøGµû[°‰hì—+\næÏ˘V)êÆ’t•[<\Zƒ‚b+⁄X]z`ÏïÎ˘Rƒ6â h∑ÛÀæCVk6!ànîÀÑ\"h∂ÚK˚pcÌ÷Öe©õqMƒ¨ßD¢®\0ªÂ±0πY´<Ñ•áäSlµYN?dÇv€e#OÚW+¢ºûé”\"ìwh&âp 	sv§©˙3ﬂ\Zøøªaú»¯o8∂n\0ÖT£Å»f¿S;Ù®b=ŸJ¬π1¨hÛôœŸ˝±YQN˝°‰ä∫á)zƒ8◊ë°◊Ìy0V:F]PÄ≠^àåöZ^∑—)Ò¥Ó-[º˜P–Î	!£‚DÒŒö£ûØàÁl+/ïS‚«ì“§˘LhR}pÊFım˘\nB √1€äR≤‡VÏª†Ô˘ˇ\n˙oÅm¯Ï∞\rw¬6|,∂m÷ÿVî[ÿÜ`¸◊∞m˘œ€&ﬂ	‹RÌËÜ,Ï≤Ì8∑‡≠¬ﬂÖoßÛ4¯“MˇüæÂ_∫›⁄	Î÷c°éYål+ -§[Oˆ}˛/ÈÁám{\'l€è≈6`AámEπÖm˚;∂Oämg\'l;è≈∂≈Z∂Â∂ùÔÿ>)∂›ù∞Ì~≈I™…∂¢‹¬∂˚\0∂›ß¸¯“’ù÷ã≥’@åN¬—¬íKâX¶ ™óÆ≈π¨∆5ØLå Û˛^Ωµ∏<>ÜTd¬Ç∆\\i[;¶ªV4FiêäŒjµê\\–dÅ_¸’éï±uºÃπåÈ<7I›ú¬àkå¿g°øﬂ\r⁄!å©S;¡,OπE ,2îˆΩ∑ó9J#.Úbf”Öú∏©A›w¡kı˙®∂J˝#ø@º“üIB]6°≥Â§k3≠3ôû5É^ÂÖR$‚Ñõ$\nÇ∫øÏ˘{{2›˜0vËÉ+…äÃM£≤ºπ˘Õ¿˝&¡\r.ºõ≠»Àﬁs9[eﬁ97^üG~ÙÈ3…íΩ°ígJ\\tù@IÀÖ4Gi¸üââ◊GæÛËVîﬁ	ØblÜw´=R˚µ°ŒÃ»\ZùFÀ´\\ú8ÊW„MZp∑éKv+…B∑ƒf}=\\[?å◊$.˘√bá∏µûõ§Ü‰¯ÅYB_DÅKãr‹>kﬁ)\n7DùuQ˘oÓùf≠˚EÌ˚Eù˚E›/¢œ%‘oÀÈ‡MãIrìÃvô\rﬁ∏rÃ†˜fo@ˇAΩ+GnÎ´»„CãŸ6B´âˆÅRÎòÓì‡îª±ÎÊjpõ§«ZÂ®ÌI¶/÷«Ê/baà\rW±6í;©v…[√ê6v´Ó{˝œˇ\0', '2009-03-11 20:30:07');
insert into `objectcache` values ('lennisheuvel_nl_3182:pcache:idhash:20-0!1!0!!nl!2!edit=0', 'µT…n€0ÌY_1V9Ÿ¢î’Ùr)Ç&höà—\rZöHå)R );ÚÔ⁄Q`Ë1∫úyú˜f„O3œÑuhÔZﬂ¥>ÊY _?Âq=«\'è?“i,@ã\Z\'ÒL	·—≈”q\"¶„*õ¬ÿ5BCÆÑsì∏ﬁÙ+Öí\Z„)th\'DwËB4n¶ø‰„\nL∑≤¯0â+Ôû$Z\r6r%,§[&·î\\°j¯O\\⁄VÆk°Kt^Ëı˜K¸8-ö¿ÊPÛÖØ⁄z©ÖTqßãíA´Ö“/Ω¬/dµ®&±6F)≥âßæ 4¢îZÑ≤¡⁄k¥.Ø§RH1°6%*™JÖD\05zh∫‚Qùêlª˚àÊ◊3ÂNºò5¢˙∏G*‹ò\Zäéh_d^˘–#T¶%≤A4N\ZÍJØﬂáË7≥(YKOI4∆˙hFkrtéDkCs”jœ!KR∂˝¢ôqæèO‘‚§ŒÖ\'_êK26<OO3X>{t—k ã∏Ö-€\ZµˇÓÚ©AÌ‰:®Û	≠ŒΩ4∫#gÅ<Í˜ß—N˘ΩXc Ôπ»+ÑçÙ¨®»Z∫\n€5™ÖVã„Ù\"„ÕƒeQ	WÒåıY/Ì±^O´^÷£a!%/Î–Ï∫Åå±!;NY∆éY:Ñ@v$=°Öπ∫lEâ7RØ\\<úÒ◊7Ú•‰˚A)ó∆J‹wúá—^HÌÓTÒõ⁄î«£%g!\"€ﬁ\"ys\"Ô8ÈÉıÇ`hê®2·H´öŒ\'qbΩ[e2ÑﬂY˚I‰˚ﬁõ}{∂gø.ˆ<A¸uMÈÓ£C.ﬂ7ÌÉa˚¢\\˛´∂m$y:Í*M|è€I9(Â≠˘)h”ÏÛÅıäû™kèıÁåwØ·ï1˚5\Zí„Ø∞ZÍÚìıùs”g÷4h˝A”3*˛∑˝\'˜[!%ıºm‘Å∏y7u›œ≤4e«√”≥xÙˆ', '2009-03-11 20:30:19');
insert into `objectcache` values ('lennisheuvel_nl_3182:pcache:idhash:22-0!1!0!!nl!2!edit=0', 'ÌX[s⁄FÓk¯kı°ÌL@ â¶ì∂ôÿm.û±ßyÙ,Ë ≠-ÌjV+¿…¯ø˜úïD$ é›€KÎúÎwnÀΩ˝ tŒπ.@ø/M^\Z\'¸SéC\'ªÑçq&E8zåBgj¯<&¢«®Ö√)/ä˙sQf◊∑\'ŒôLT9≥©—¯äf”H¨\Z#L\n»JÇY%6uÒ„‘EëYoZ¶¯/-≥)¨ Ì˚®¡Y¢ay‚|˚\ZäE•éÆN!#7EŒeKEñŸ¥3Ûß.qflW¿PH≥≠FfjŸ©ÀÒïä¿x+Æ”¬hŒÕó!˜C¯l‚ÒÓ/¨ﬁ’êR\n|«~ï-÷∂ıx@/uâÇÂ◊r2∫K◊Ã>◊ˆàKmÂRπ∂#—€Bã‹0sõZCSÓ5_ÒäÍÃòX≤Ô◊BFj=(µæTãK«)¸¿>±◊˝_Ÿ	sÊp#Æo@:ìÜ{*\"h∏+–JlŸkﬂˇ0awA[∑àì3…3¥◊≥6~7	Ÿ∫ü\0èR!qDX∑AŸ6®÷õÊ≥S0ª\"¢`†Gû!jIü9ósUÆ◊ãô/ô|Ïëp\Zx*\n\0¥¿+\r©îéî*Ã\ró∆öI–Q§t>`ø\0#kïja∏6çV±ﬂAVºç≈Ç¿‘·{aà£â∫Rz+ëß‹àµí—S˜£*Yj¡TŒ\0∆ô!\"˙R?¿v»gòëﬂ	:¢h|≠)¨rƒ÷ºhíäõN`ÿH≈\\F†Q•P2‚<∞_Å›\0‹‘9$ËêFàÇ/ö	Ç)±x≤	()≈Gí∏7IÅ-ïQVÁÁ˚ “î|„[â\ZXD…Meœû•uª,@\Zö®6mô*n§¢öV˝“®[˘˝pˆ€ôãÉ\0õAû‰?⁄Û¯‰ÂréQGB∆·Ö(◊WûÁ~=Ω=·E∆cpX%Ó¸D)TXÀV\Z¥¿<†\"›Ä∆<a9ö‹Êª€±Rd1„©˘m≤B/v¬%Ök<Ç‹c˜‹nîÓ»ÛÚM7ÙµàLr‚ ”A?\"Nel‰‡hlèÈn}6’≥I?cÕèY>{ŸÈú\ZÏ—Rç±l…‰‘=j\'¶j:5d=,§€LKL°\n¿‹à\"dÁº0îêKëf\\VöO∑‘∑UW‰;≥XÆπFsﬂ·¸◊H!ªy™ ~ ^·Î5ˆ[n˚’ \rV¯ØÇï¢ç¬\0+Öôkë-\n7∂;©ÅÁçõ≠Óu„ƒú⁄˘	“≥¥@Mõ9˙ûÛ(™øœzO¶û°$ÂÕx˜\'∫·£(˝Ω\'O∂∑ãÆ≥π⁄`ò[jU[ƒê˘„qæôê‘jiÿûÿ\n◊xB6ÂÊMÿV€≥⁄V≥ñ≈ªN,d?Ö•	/çö∞ö§©U\ZZc!®-<rﬂ	lIJ∆W&r+«\Zπ÷h}m$¿ÓÓyr-Ê˛ı` ˇÛ`<qp.Z±ì˘∫V’Øæe6bç˜?W„‡Å5[cœı\"wœ”Å\Zˇ◊¯ÆÒÅ5>∂∆#w4t˜<®Òˇ\Zˇ√5?∞∆„?Qcﬂ›Ût†∆„ø∆v#Î5+ŸÁÌß≥*?`Û˘,ø≥ı4/ø∞|`”˝ÇãΩuˆ÷ª:]√ΩÈQøœzÔ`}~é;M&”ê+mzÁ¯Æ’ä/mR·%m°Ji®]ﬂ≥Ωs\\»˙∞As∏Â…EZ“:Å∑ êyn‡?˜«õc}äﬁ%d¥F·¶£„/ëÊrØ69»B¨pÎ≤O~ÿ≤î∫]5ﬁ=rﬁÎ˜Ë|‰ºë_‡ﬁCãñIj~À“VJØdz5Ù_anÖB%ºH¬ Ë{G˛ëwt$”£‡\"aN<Zµp02⁄\'≥úÓë«ﬁ–˜oà-Ã»==}ÚG°ìΩ·2.qﬁyS8z·ß;‰˘»˚Céï–f<\'ÜíÜYºO£∑<g2=≤ËY-ÑwâŒ]˜D}Åbø„5\Z3C_«°„û\rFNc‚íf∫yHÜz{F`w@ZŸ∫6mz–¢üE-Å?≥ìO¥1=è£ÄˆØc˙ì}fpsxs‹abVv#Àπ´ãÚjÉ;®‰È°¢`≥_Äm™N÷ﬂ©◊ıR–¶û‚ù»vìS=í<U™m˛∏ñxÏÓPkáñ:\n?	t`?ÿJ6OÆö‡∞öıwtÜ’∑:ëF„\\«æ≥\\V’≠üeUZæ3π#sﬁ\rÜﬂ:\"∏¨ã‡/∏¿‘8˚˘\ZZ_√øñµù”ÛÄú†ª¶OŒµ qëÏoÄ\nﬂ¥Jâß‰÷\\ßs.õ”£3≈˛·MbË°£?\0', '2009-03-11 20:30:05');
insert into `objectcache` values ('lennisheuvel_nl_3182:pcache:idhash:28-0!1!0!!nl!2!edit=0', 'ÌY[o€∏ﬁ◊˙W0⁄ámÅ⁄∫ÿN˘,≈6ÿû&@Éˆ±†%Zf,ëÇD_“¢ˇ˝|§$GñÌ∆iwœÀŸ†â-gæ·Ã|#íΩÒ]œ∑niñ≥Ïf©“•≤|œıøÊ~ﬂ∑í;∂Q÷ﬂª˝Åoçù∆åpl)X$àiûóﬂÛeí–Ïal]ãπ\\Ü÷d§2¸ÜìQ»Wïä‚*fÕΩI1md„Î»∆îIk¥åÒ\'Ê5≥1[±∏ÌBÉíy∆fcÎ◊ø∏Y∂¢*gkñ- ÕS*jjbôLYfM‹ë≠%“ú†Ù≤&˚¶ ˘#õ‚7Êß∏#ÇÖ4:Óâ˜Ñ\'u+?‡Àruº˚∏÷~>Ë{ŒñÎÖL†MWRÑ«Ò{ﬂ«o\Z˙AWÿÁîÊJ Ï∏#˝a§4Û|7ﬁ1!x>„ﬂÀ≈˘˜]x4±o~ÿöR∂Êñmÿ§ „©\"Í!e∞3ˆ=]—b‘ö>#/◊®tπÓ‰sπæì¡ùå¢òΩ\"_…äfÿÙ8…òXS∂‡˜&¨a%}ÀCVIW,√2\"#ﬁ±ˆÚ’ê|#p⁄¿¬OJM‡–AæÍEÅ¯ªAH÷Ì9£aÃZŸ◊#€ê@µ5J\'◊3»=•ŸkBcíC#\'!#2Õx0W`·Ç∏óWWØâÃ\"ä»2ñ)2g™a>ê	Wå0&≈\0åQÙ™∆Oº&k`¨‡)åOYLEî!F940†Òc˝HÀñ—Çe¶…]–u+r-t(≥f„nÁVÍ	’`\Z)Ö[+\Z+3˚û#L(Ùœú”<«àˆè∆±ˆâ≈Çi:ÈÂ√ïò±ô‚˜°ô“CJq=„wıîNZw]£ÊCë5>\0à»™åÜ\\q)`êÃó\nã õ Â∫0Ö˛≠ŸLï√!áîO¶±©ùâ/åÃ§íd…Åx9ËìóWØ∞¥\\órOt¿„\"Óö˙èÒÍò◊FEè9ÿwx4◊‘jJtﬂÃR1\nnÕC5˜›ÅónÜ5v⁄µ>]ˇumÎÄo:È<Ω2/§ÒÔ≥)ñ¢`¸è4ÿ¶·≥„Ù;˜i¥}—ÒÑFÃ\"ÖíUüJ™©ìO\"¨Iç-xî\r`m ∑ç◊v◊Ó^ÿálw‡§õˆaWÃÚ∆¶X(<∏ôÍºecÀ±vÉS¯l“≤ºÄ¶:≈ªaÖé‡≥áø;|4ﬁFœL*›MÃˆÇï/∏»mP3ë¢ä\\ÈX;ày⁄IE-˝z8¨*vŸ@ıcˇØn\"7ö|πÌQÃtªTdLu¡É[∫≤÷%<‘‹∏ß‡8˘m‡Ù√ò≥îhzmkæIh∂ /≈[EìÒ&C¥ãéBÑå@(òZpô/P¿†¿´íìÂ^´]§Yñ= î,é—∏X§\Zœ)\r√Úy“z1*3Zno»«z›z>≤´i–¿€§ı‚≈v≥∂ã9ïõ∑à€ÔrAÈ≈^Am\'ón˘§€K7ƒí≠∂SPSkñs±uƒˆß£Q˘Ñ.ïír»êæ\Z´,xŒﬂAn˜trªœ%˜Ö}Aõ‰vr{»ÌÓí€´ë˚b∞√Ì˝änf°Ã[±°0¬jZ•ÖDˇ?Ê€;=ﬂﬁsÛÕl6hÊ€;ûoÔﬂ|ˇÛ˘ÓûûÔÓsÛ›∑˚¨ôÔÓÒ|wˇÕ˜?üÔﬁÈ˘Ó=7ﬂ3{∂∑YÎœwÔüos(lUßBΩµ˘ƒ1;≥ﬂN7‰øÂWWW?#-∑(€3^„‰î„]]•q≤€ö-Ø5N1ßß1s‡¢‚ãM≠ÔØ_=újz{œpƒŒe¬	FÁÔ\ZlçŒ⁄m“zœ÷∑∑$Ê8Áíå•2S≠[|f2`y.ıV{”@.∏Èˆl◊1?≠[ô´6€¿\\à√dÎ_Œø0ü8∂Á\\^∏}èLQö9ŒêI™wÃ4_&8ûô˜fÉ„lŒWz˝˙ŒëÃñ\"–—\n›—‡≠vªr˝]1\r^Õh0g`ñöì{¿·VØ{Œñ+ÒÁ.N~~j&˘<ú”|Ó{É∂sÊû9gg\">ÛŒµcáË%)û0Tyíœq.ùÆÎxNﬂàÜ◊˜ûnœ∑íw8/—ﬁq±»≠!ıˇÎ7»\\»˛¿í#ôqV\\hÅä‚\0sáˇ°¨·‘w¥E«h¡Ω;ÄWªztÄiQ|˙l64ó±nÁº”≥*w∫ØU◊≥–Á⁄ŸÜìfnôõ˙∏WøkÌ¸µi}z¨ØoÇ=9∏arﬂî{O»ªO»{O»˚èÚoeöﬁlä„Â°4°¸?0Sf;yx/ˇ,Vı—∑`’µbI3\\≈ı¯[)ÎÊ/!¯D3›Õ\Z£%†=˜ør\0Pøß„â‹V7à’ëﬂÚ`®˝âErÎ!®∏I+r^ﬁ-öÆ5¸¶M˛8T◊o4Ù(ûAÒ~‚¢Ω0ﬁ5∆ª?±X‹Î˙Äz®˜@Ωh€Õ¡Ù\rLˇ\'`Pïµ˜¡às@Tµ~õ…îejß%yP¯•˛ü<øÑ<˜LŸ©˛ª™\'ÓÙ&?éá>†ˇ', '2009-03-11 20:30:09');
insert into `objectcache` values ('lennisheuvel_nl_3182:pcache:idhash:30-0!1!0!!nl!2!edit=0', 'uS¡N„0‰úØprÿÖ÷››BPâ•ëàÿ#2…€ƒ¬±#€)Ì\"˛;)©X_¨º7ÒÃõ±∑åPñ‰‹X0€ﬁuΩK%ÏÕ≤K⁄ˆ.Y[ñëå%—è8MQtØyé§hÖC:m\\î˚›Ë¨’)]*uØC‰å‡aEπ∂.Ö}«UÖÑ*eÔAV¸Ü≈´K≤†Ë˘‡¿F¥ù‰7uﬂÇrˇ¡]Ô;PVÏ\0uÉzÙ∑W•Zç‰8êGi˙+˙T˛¿w»G|…À–´p\rzÅí†î∞\rÙ;êOJ>edIY7Äò®\Znñ·«$∆q¨dLc®Ñ˚âQ…â¨„má(∆+úB(^`Ç}pêú{;Ô∏™{^√ùP/6YsÜŸ€ªÔﬂªÚ#◊⁄ò6.CC+«Ö≤[Y˝Êµ(ìı3√·D<¸ÂÂû|‰ò”áÍ“√¡XÔL¯Ù±í”ã”Ûd<¢N¬¥/ÑÌ\"à=9`ø≤ô÷È§æ©&ù ~”˙qßË`√ıﬁÅQ\\~gÉø]0ƒ8õÛ^ﬂp)¡f’[‡’∆A{,ÁÛ\"ﬂj==~Â∏QB’G’/¬c)π—7KÑzgN¶ØÂ§÷è~\\úâ+∆+1ãÜ˙Ö…2Û—º\0', '2009-03-12 12:05:01');
insert into `objectcache` values ('lennisheuvel_nl_3182:pcache:idhash:33-0!1!0!!nl!2!edit=0', 'uS¡N„0ÂúØprÿN‘]∏ ïX\Zâh˜àL2õX8vd;•]ƒøc\"%’Æ/Vf^ÊΩy3ﬁ2BYísc¡l{◊ı.aî∞wÀñ,iÿªdmYF2ñD?‚4E—#ºÂ9í¢Ë¥qQÓo£K∞V§t®‘Ωrë3ÇáÂ⁄∫ˆW™îΩYÒ¬gØ.»í¢óÉ–ví;@‹‘} ˝wªÔ@Y±‘\rÍ—ü^ïNh5í„@•ÈuÙ•¸âÔ êè¯íó\r†7·\ZÙ\n$A)aËw üï|Œ»%e›\0b¢j∏mXñ•8&1éc%c\ZC%‹F°%\'Z∞é∑¢ØpF°xIW(–…¬€˘¿U›Û\ZÑzµ…ö3Ãﬁ?|é¯‹çoπ÷F¿4qZ9.î› Í\'ØEô¨_ÒóóWxÚëcN¢óˆåıŒÑO?Vrz~∫H∆Öp∆A˚@∏ŒÉÿ#ëˆ{6”8ùƒ7’$ƒoZﬂÓl∏›;0äÀŸ‡∑Î	Ü1Œ˙|‘w\\J0áYÙxµq–À˘Z‰{≠ßÂW>Òõ%T}˝&<ñí›Åq≥âPÔÃ…ÙµúT¬˙÷Éã3q≈∏≥—P0%ú¨?>', '2009-03-12 12:05:29');
insert into `objectcache` values ('lennisheuvel_nl_3182:pcache:idhash:5-0!1!0!!nl!2!edit=0', 'ÌZ[o€8û◊˙W0\Z†”\0µu±”8∂„†”Kíù∂	¶Ÿ-0/m—6mI‘JTú¥Ë/€«˝c˚Jr‰kìvÊiß@][<<◊Ô\\(ˆ¢„zÎí\'©H.2g⁄ÍxnÁK⁄9ËX·ï∏’V7Ì∂<ßcı4ÇIˇÿ“jh±a¿”¥¯ûfa»ìªcÎ<ö®Ã∑˙=ù‡ØﬂÔ˘Ú¶‹¢•ñ&^?\'ÎŸ¯⁄≥A“Øı≤\0Å¨∞\rƒçÍ.vp6IƒËÿ˙˘£åÙı’D$\"ï¸:Nî\n∞û∆<™lå≤p ´ÔˆlZÈ≥UMÜıâ+ô±úY±£gs¸\r‰£Uöâd∂]!Ô1\n´ä:€=‰U’9˙Z%c±√-^„éfx¨{√6J<Ã3/á}˝‰x\"|mW®π[‚√Ó˘<>Dß\"\"BÄyúN2ô^_$RÌ–ßµ[üUvÃ∞€Í+ õ“¡6	©√D∆öÈªXÄ+X⁄S~√ÛßVü…{6óëØÊçt¢ÊWjx•∆„@Ï≥/ÏÜ\'z|§Áÿ»éô539ù¡Ω›rıL˙¢\\Ω	L\ZõÂ%nœˆªÏ+É“F,Ù‰,‚!⁄íbd≤uŸ%·º>‹dÑºfõÚâ-‹ÇÕ€ÑIÛh¥oãÄj\ZæÕù|àØ∞kÇ]å`T6˜ôØT¬ﬁÚ{◊`ˇ	¨À†EÙ[ÔÙ$ªKEƒ‹£ßÀB‚ï˘,‰Z$íÛÄeR≥æ~ÛÅÕ6KÄ2 Í≤7óÏ¸ú›ƒv6g≠˙˙∏>sLFcë∆BÖ‰≥,∞3ïùËÁFL¿ä˚–Ôw©Æ•¯∂ráNU‰Q…°7Ëøñi¨R	.={Ä	≥˚µ3•F˛ú\\¸,‰QFÜúÔkóÄÊàE˚9˚UeâØ\"˙z1‘úèXÎ9˚¿Sû¯Ãcû›¨}@JF+ú¨Ny8‡¥˘L±ú∆Ùımﬂˇh¡&<	U$ˇù	b˘ZeHçÁ^\r^óÇ√«l0‡)s_ãÓ1∞^Ä∞ïb≥^[+ $l.+Ç‚ı*„ãÇﬂ\'¿ÿ,Pq,\"ü‹§ë˚QåÔw±w\"äk\nbÉùIë0®0Kôäât§¥Ç9<’ÙKFÃsú&$÷ßB$x:ì*ù5\nøR+/,\ZäÎHë=Ω\\Ì≤ÿ⁄π‘OÁøù€(b‚∂O‚”˙è_éÑh`ªÛJD:…¬Î%ˇqy∫+d»«¬b˘F´ gk‰˝û«å˙ÿ¬íW &©-l·⁄€%Œ•Ø\'«÷·°c¡±<òπÙc†‡É‰ÿ¬Wª(ÏEåÚë%ÓøÆƒD≈ù$¯H ∂Võ)ÿü∞Å¯,EÄ@	I÷ó¡“JD!AM∞a†<œiO⁄`Áë	2OÜ)FÏ≥úFl ßcq£ƒòˆŒÖ`|·P ïñ∞Y?Á<)D$\"0≈Åä“@ë§_⁄DÄ÷A∫É3ÀÊT≥9Eœ\0Ìgë.äÃc£{*RR î©q\rlÌàÔ)ƒµ’àVûnç- [8∞ÏÉ#{ªTªÂ8Òm}óZ@xÔÖªÏOÒFká7Œ#Í\"KJ†òF«£HùT›≥ãÏ˛j€Ì¡fµæÂØ÷m◊}ü1’∫¯UÕúà{4©¸\Z¨Ü(bÂÍcrú#‹Ä|\0É5iDMMÊY‚´$n∞?P\Z©Œû·Ù®¢4¢(\"-¿>¿Ä4YîÀ√z(ßÿB‘“$eœÍ⁄&ó«ú ˚MHPÑD±ﬂ0√Yieeı¬ûúTáËΩ°~ö(0ùêﬂ¨˛⁄äå\"Ã°–Íé‡`\\›q€^|€µùãPÛ5V6\"ÜÓa~–âòME6ˆ©<›3π˜T(}ä÷î#BÏÈœÕ£n€ŸØ‚Û9}¬#{tho5Œv€Ñ‡∆\0]•ÍªáK\0^äIÓ•¢∞µò\ry¨Û†≤Ç=ë›˝%Q£Ïèxp_C•ÈÙb∞Êªt&£‘™UÈ»Bª˙0êq#é∆˜N9®˙ƒ*˚kŸ©˚}_pA`Û˝’OÍ§y◊AÇﬂ◊√|ëUî¬)<4E-g‘R)«@.¢ÂRêbîß‰˝ıπã¢(J>œ0‰¥Î¯8⁄o‘(ë«fæ\'˛`läŒ©yp≤O3;ñ4ÏÎ…æôûBÖ\rë\ZA\"/H¶_3E⁄œ	8Ë“dABûh∞O–\r;–h‡√	\rWJ`f;ÈŸrQ	âu>)|¶æúëﬁÚháÂÁùóI§?√(EQêL•\'\rB3xò{ú)¡”8éîl9u8^éI)M.)Í^·˜®›Üﬁ@Wö\ZÕvÇä¬ÔogÉaﬁá†Bõ cF£ôœ£tjÙùg‚\'ú\n/UVx€çÙì˝∆J∏P3TÍî∏õë ë4Ÿ¬r’1åjàK˝ÈXwçõ1Â¡ô„áiï1◊h}¬û∫[_¯æVº—*jÃÉ@$wH0òÛÜ»√º\n‡wÃ}ø¯›Ø=È…ﬁo9å S˙Û%8Åø§4âs>”˘ÒÌAÅÿßÄπ|tÇœ\'ãeÀö‘ÌJ`Ó¡ÅiÿÙd≠-àe;¨ŸäoN}ã›NﬁBhgAÚ›µàëÓ0ûiÖl˛»4ßÚY…¡sæ´	mú$º∆4o+e ˜nπ·A#ﬁ#^ÿ/⁄õ«√ 6Êls\nÂ ÇËU∫ƒa{„—†RœV¢Sƒ3{D≈ÓWEc\re»j~‰¿§˝%ßí10Úˇï]ÀF®∏?ÊPqláoÜJ1Olá  @ÒÁBÂ}ﬁôP» ◊^T˚O˛∆IÀô&¬~?.pR‚ˆ∫¨õî¯kpv—ˇ˝í◊ΩáÜﬁ{lË=€ÛÏuYõBÔ˝ï°?ÂÓ\"ÿ4ıiH£ôÊ°`0µÚÊ°VÎÌ’Î¨ˆAÃ//Y C©Y\"bïhz°\'j(RÃŒò¢ c®≤sm◊1jó*’uqs3ã\rÉåNÿÚ≥Ë0«ˆú£C˜¿cËù÷ÆD”!ì˙8√Q^o°{sãa8ï7Ù˛ãÆ Ÿ(ãÜ4ï“^´◊K’?Úa¡Ç~àûâ—OÍ	F‚;TﬁÌ]G¡uáÊNlà:“üt“9®;{Óû≥∑{ﬁû•>vhàá{Ca˘ÙÙ»i∫éÁ4YF“È‘mu¨NÙ0Úé^§Z]ﬁq:_æbÕ≈⁄+X<V8†TiAEö„¯u¯Ô˘X≠Ó†„G«ÏÇvW^ XOO€ £◊˙tºÏö´Y∑Ò¢—≤JWÑˆÚ≤Ëü§ÏäíÜ∂MıπWy~ÓWVH˘sìÙ¨M˜¬Ôò∫≤„vwPÂ5≤†raÿÜ\n∫m’´Æz‘÷W∫ﬂ“¢˘ ™÷ºæ˝PnàæysõüÃ7a©˜Qà/Å‡É:-N’ßgÇ˚ÁZÑ´± oÍœî™≤?¬¬\'ûD(ê+OÅÊÈAÁãÑ\0ﬁiQ0··Ú∆¥¥fø!`§aîπª 7@ØM˜|‰ä‘|Økuø”ÔFXøÒ€$ 3¢º-¢ºuQÕQ”‚pM@\Zπ5Õ∞Î+∑KõLi\Z9≠ë◊Yªü õ‡&q®\"_Kp^&\n®÷Kå≤„ßÍ˘…ó)*≈ù):KpΩ*+ËR%Ûº¶{‰5[$Ë', '2009-03-11 20:30:02');
insert into `objectcache` values ('lennisheuvel_nl_3182:pcache:idhash:7-0!1!0!!nl!2!edit=0', 'uT—n⁄0Ì3_·¯bõRä!L”‘µt]ãT¥>V&π$V\'≤ùVıﬂgß A∂Â!éÓ=æÁ˙‹„<p 8^\nc¡<4ÆnÊåÚwÀGó+ÿ:<ıﬂ#¬Ò¨ûœ*lﬂÅ÷“>-~,b©3ÿÍ¢˛‚§Sê|›¨T&uŒøΩû	nó◊•JXõ`Yä0˙ƒ„=\nPÛô,s$îK0F÷§∫∞◊∆Æh uLb2å;,1%§ﬁˆˇ‚~ìô+Ï≥ Û¬◊øa¥ÆL&¡>œg±ò˜fqÌ_Qøèz˜∂\\\"%KÈêÅ∫2Æ∑Ù´©R∞∂2HW†¥j¥„àÊÙñïu}ÿ÷BgHÍT5dÂo‡àƒåL∆tƒ–zÁ¿ˆVP÷J8@¬‰M	⁄˝wµ≠A[˘\n®ngÖ6çNù¨ÙÅúÚ^ø?Ô}v˛(^!ê©H\Z∏Ω¿©V–öWPœZ=È%„u‚2+Ñ-¯∏O\"\Zë(“*bd“%Ö9YÇu¢¨#dBÜî0¬&£\nÏ¡.Ù‹{ÁNËºÒ£∫ì˙≈‚©‡Ñø¯ıπo˛ƒye$\'∆!Qi\'§∂*˚)rô‚ÈöìPë¥ª|w+O~‡8•—K˚∆zaZﬂrLÉs|(±\né;∏⁄¬röÌ4Ÿb˜£9é≥£¯\"; ÑÊ≠3C¨Ω@‘≥wM8ïúN?ˆ\n]m-‘øÚæ{Ñv¿\'‹W◊B)0ªìË\ràl·†Ïv˙y°o™Í∏¸ƒ\'ûÑ—˛~v¢{¬n+KS’`‹…∞òÌÏ¯ØqñIÎUŸµü4∑:∏ÂdjåQJÜååÒÙ„', '2009-03-11 20:29:55');


### structure of table `oldimage` ###

DROP TABLE IF EXISTS `oldimage`;

CREATE TABLE `oldimage` (
  `oi_name` varbinary(255) NOT NULL default '',
  `oi_archive_name` varbinary(255) NOT NULL default '',
  `oi_size` int(10) unsigned NOT NULL default '0',
  `oi_width` int(11) NOT NULL default '0',
  `oi_height` int(11) NOT NULL default '0',
  `oi_bits` int(11) NOT NULL default '0',
  `oi_description` tinyblob NOT NULL,
  `oi_user` int(10) unsigned NOT NULL default '0',
  `oi_user_text` varbinary(255) NOT NULL,
  `oi_timestamp` binary(14) NOT NULL default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `oi_metadata` mediumblob NOT NULL,
  `oi_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE') default NULL,
  `oi_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart') NOT NULL default 'unknown',
  `oi_minor_mime` varbinary(32) NOT NULL default 'unknown',
  `oi_deleted` tinyint(3) unsigned NOT NULL default '0',
  `oi_sha1` varbinary(32) NOT NULL default '',
  KEY `oi_usertext_timestamp` (`oi_user_text`,`oi_timestamp`),
  KEY `oi_name_timestamp` (`oi_name`,`oi_timestamp`),
  KEY `oi_name_archive_name` (`oi_name`,`oi_archive_name`(14)),
  KEY `oi_sha1` (`oi_sha1`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;


### data of table `oldimage` ###

insert into `oldimage` values ('Geschiedenis_Orion_001.JPG', '20090220131707!Geschiedenis_Orion_001.JPG', '228595', '2592', '1680', '8', '', '7', 'Twan', '20090219194334', '0', 'BITMAP', 'image', 'jpeg', '0', '5ghkerg25lir9w7gcxkvcy4c8e8816k');
insert into `oldimage` values ('Geschiedenis_Orion_002.jpg', '20090220131835!Geschiedenis_Orion_002.jpg', '333098', '2592', '1680', '8', '', '7', 'Twan', '20090220130430', '0', 'BITMAP', 'image', 'jpeg', '0', '6qrwwngj2h7rplt2ld9o70d7rl7ahjv');
insert into `oldimage` values ('Sneeuw_001.JPG', '20090222195149!Sneeuw_001.JPG', '142635', '778', '504', '8', '', '7', 'Twan', '20090222194958', '0', 'BITMAP', 'image', 'jpeg', '0', '5v3ckk606aztb1q0j8uxvvuk4fo1knj');


### structure of table `page` ###

DROP TABLE IF EXISTS `page`;

CREATE TABLE `page` (
  `page_id` int(10) unsigned NOT NULL auto_increment,
  `page_namespace` int(11) NOT NULL,
  `page_title` varbinary(255) NOT NULL,
  `page_restrictions` tinyblob NOT NULL,
  `page_counter` bigint(20) unsigned NOT NULL default '0',
  `page_is_redirect` tinyint(3) unsigned NOT NULL default '0',
  `page_is_new` tinyint(3) unsigned NOT NULL default '0',
  `page_random` double unsigned NOT NULL,
  `page_touched` binary(14) NOT NULL default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `page_latest` int(10) unsigned NOT NULL,
  `page_len` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`page_id`),
  UNIQUE KEY `name_title` (`page_namespace`,`page_title`),
  KEY `page_random` (`page_random`),
  KEY `page_len` (`page_len`)
) ENGINE=InnoDB DEFAULT CHARSET=binary AUTO_INCREMENT=37;


### data of table `page` ###

insert into `page` values ('1', '0', 'Historische_Kamer', '', '325', '0', '0', '0.007304290089', '20090117140317', '9', '757');
insert into `page` values ('2', '6', 'Sleutel.gif', '', '2', '0', '1', '0.049186153786', '20090219195047', '2', '0');
insert into `page` values ('3', '0', 'Hoofdpagina', '', '0', '1', '1', '0.750182740089', '20090117140317', '6', '31');
insert into `page` values ('4', '8', 'Sidebar', '', '24', '0', '0', '0.722718008375', '20090207150350', '27', '288');
insert into `page` values ('5', '0', 'Gebouwen', '', '153', '0', '0', '0.796272870132', '20090223192344', '116', '2396');
insert into `page` values ('6', '6', 'Geschiedenis_Orion_001.JPG', '', '11', '0', '0', '0.375718282669', '20090220132835', '38', '0');
insert into `page` values ('7', '0', 'Families', '', '37', '0', '0', '0.887294609488', '20090221103207', '60', '36');
insert into `page` values ('8', '6', 'Geschiedenis_Orion_002.jpg', '', '7', '0', '0', '0.763189803569', '20090220131835', '39', '0');
insert into `page` values ('9', '6', '40jr_Orion_001.JPG', '', '4', '0', '1', '0.072214794507', '20090220132530', '42', '0');
insert into `page` values ('10', '6', '40jr_Orion_002.JPG', '', '4', '0', '1', '0.152855042808', '20090220132530', '43', '0');
insert into `page` values ('11', '0', 'Verenigingen', '', '63', '0', '0', '0.276491129829', '20090222094829', '72', '945');
insert into `page` values ('12', '6', 'Fanfare_001.JPG', '', '3', '0', '1', '0.451335345023', '20090220134936', '48', '0');
insert into `page` values ('13', '6', 'Fanfare_002.JPG', '', '4', '0', '1', '0.788699476959', '20090220134936', '49', '0');
insert into `page` values ('14', '6', 'Fanfare_003a.JPG', '', '3', '0', '1', '0.482982341078', '20090220134936', '50', '0');
insert into `page` values ('15', '6', 'Fanfare_004.JPG', '', '3', '0', '1', '0.226928718271', '20090220135021', '52', '0');
insert into `page` values ('16', '6', 'Fanfare_005.JPG', '', '2', '0', '1', '0.491576114417', '20090220135046', '53', '0');
insert into `page` values ('17', '6', 'Fanfare_006.JPG', '', '4', '0', '1', '0.986062899913', '20090220135124', '54', '0');
insert into `page` values ('18', '6', 'Fanfare_007.JPG', '', '10', '0', '1', '0.12735284871', '20090221102504', '55', '0');
insert into `page` values ('19', '6', 'Centrum_Lennisheuvel.JPG', '', '3', '0', '1', '0.62746993108', '20090220135801', '57', '0');
insert into `page` values ('20', '12', 'Inhoud', '', '8', '0', '0', '0.24741278233', '20090221103956', '63', '267');
insert into `page` values ('21', '6', 'Zevenmijlstappers_001.JPG', '', '6', '0', '1', '0.513417201042', '20090222194314', '74', '0');
insert into `page` values ('22', '0', 'Straten', '', '41', '0', '0', '0.86650435004', '20090222215530', '110', '1109');
insert into `page` values ('23', '6', 'Sneeuw_001.JPG', '', '6', '0', '0', '0.614713416247', '20090222195952', '80', '0');
insert into `page` values ('24', '6', 'Nieuwbouw_005.JPG', '', '3', '0', '1', '0.346446720111', '20090222200227', '81', '0');
insert into `page` values ('25', '6', 'Nieuwbouw_001.JPG', '', '3', '0', '1', '0.139954308076', '20090222200227', '82', '0');
insert into `page` values ('26', '6', 'Nieuwbouw_002.JPG', '', '3', '0', '1', '0.854559621607', '20090222200438', '85', '0');
insert into `page` values ('27', '6', 'Nieuwbouw_003.JPG', '', '3', '0', '1', '0.061418878953', '20090222200525', '86', '0');
insert into `page` values ('28', '0', 'Gebeurtenissen', '', '49', '0', '0', '0.469745609369', '20090222202715', '99', '1068');
insert into `page` values ('29', '6', 'Vacantiewerk_001.jpg', '', '4', '0', '1', '0.587378734771', '20090222202643', '91', '0');
insert into `page` values ('30', '6', 'Vacantiewerk_002.jpg', '', '5', '0', '1', '0.715934013308', '20090222202643', '92', '0');
insert into `page` values ('31', '6', 'Vacantiewerk_003.jpg', '', '5', '0', '1', '0.226301685923', '20090222202643', '93', '0');
insert into `page` values ('32', '6', 'Vacantiewerk_004.jpg', '', '3', '0', '1', '0.025991180113', '20090222202643', '94', '0');
insert into `page` values ('33', '6', 'Vacantiewerk_005.jpg', '', '5', '0', '1', '0.314668792428', '20090222202613', '95', '0');
insert into `page` values ('34', '6', 'Geschiedenis_Orion_003.JPG', '', '5', '0', '1', '0.016508353697', '20090222203710', '101', '0');
insert into `page` values ('35', '6', 'Geschiedenis_Orion_004.JPG', '', '8', '0', '1', '0.10905056029', '20090222203710', '102', '0');
insert into `page` values ('36', '6', 'Theresiakerk.JPG', '', '11', '0', '0', '0.787404092893', '20090224003421', '118', '57');


### structure of table `page_props` ###

DROP TABLE IF EXISTS `page_props`;

CREATE TABLE `page_props` (
  `pp_page` int(11) NOT NULL,
  `pp_propname` varbinary(60) NOT NULL,
  `pp_value` blob NOT NULL,
  PRIMARY KEY  (`pp_page`,`pp_propname`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;


### data of table `page_props` ###



### structure of table `page_restrictions` ###

DROP TABLE IF EXISTS `page_restrictions`;

CREATE TABLE `page_restrictions` (
  `pr_page` int(11) NOT NULL,
  `pr_type` varbinary(60) NOT NULL,
  `pr_level` varbinary(60) NOT NULL,
  `pr_cascade` tinyint(4) NOT NULL,
  `pr_user` int(11) default NULL,
  `pr_expiry` varbinary(14) default NULL,
  `pr_id` int(10) unsigned NOT NULL auto_increment,
  PRIMARY KEY  (`pr_page`,`pr_type`),
  UNIQUE KEY `pr_id` (`pr_id`),
  KEY `pr_typelevel` (`pr_type`,`pr_level`),
  KEY `pr_level` (`pr_level`),
  KEY `pr_cascade` (`pr_cascade`)
) ENGINE=InnoDB DEFAULT CHARSET=binary AUTO_INCREMENT=1;


### data of table `page_restrictions` ###



### structure of table `pagelinks` ###

DROP TABLE IF EXISTS `pagelinks`;

CREATE TABLE `pagelinks` (
  `pl_from` int(10) unsigned NOT NULL default '0',
  `pl_namespace` int(11) NOT NULL default '0',
  `pl_title` varbinary(255) NOT NULL default '',
  UNIQUE KEY `pl_from` (`pl_from`,`pl_namespace`,`pl_title`),
  KEY `pl_namespace` (`pl_namespace`,`pl_title`,`pl_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;


### data of table `pagelinks` ###

insert into `pagelinks` values ('3', '0', 'Historische_Kamer');


### structure of table `protected_titles` ###

DROP TABLE IF EXISTS `protected_titles`;

CREATE TABLE `protected_titles` (
  `pt_namespace` int(11) NOT NULL,
  `pt_title` varbinary(255) NOT NULL,
  `pt_user` int(10) unsigned NOT NULL,
  `pt_reason` tinyblob,
  `pt_timestamp` binary(14) NOT NULL,
  `pt_expiry` varbinary(14) NOT NULL default '',
  `pt_create_perm` varbinary(60) NOT NULL,
  PRIMARY KEY  (`pt_namespace`,`pt_title`),
  KEY `pt_timestamp` (`pt_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;


### data of table `protected_titles` ###



### structure of table `querycache` ###

DROP TABLE IF EXISTS `querycache`;

CREATE TABLE `querycache` (
  `qc_type` varbinary(32) NOT NULL,
  `qc_value` int(10) unsigned NOT NULL default '0',
  `qc_namespace` int(11) NOT NULL default '0',
  `qc_title` varbinary(255) NOT NULL default '',
  KEY `qc_type` (`qc_type`,`qc_value`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;


### data of table `querycache` ###



### structure of table `querycache_info` ###

DROP TABLE IF EXISTS `querycache_info`;

CREATE TABLE `querycache_info` (
  `qci_type` varbinary(32) NOT NULL default '',
  `qci_timestamp` binary(14) NOT NULL default '19700101000000',
  UNIQUE KEY `qci_type` (`qci_type`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;


### data of table `querycache_info` ###



### structure of table `querycachetwo` ###

DROP TABLE IF EXISTS `querycachetwo`;

CREATE TABLE `querycachetwo` (
  `qcc_type` varbinary(32) NOT NULL,
  `qcc_value` int(10) unsigned NOT NULL default '0',
  `qcc_namespace` int(11) NOT NULL default '0',
  `qcc_title` varbinary(255) NOT NULL default '',
  `qcc_namespacetwo` int(11) NOT NULL default '0',
  `qcc_titletwo` varbinary(255) NOT NULL default '',
  KEY `qcc_type` (`qcc_type`,`qcc_value`),
  KEY `qcc_title` (`qcc_type`,`qcc_namespace`,`qcc_title`),
  KEY `qcc_titletwo` (`qcc_type`,`qcc_namespacetwo`,`qcc_titletwo`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;


### data of table `querycachetwo` ###



### structure of table `recentchanges` ###

DROP TABLE IF EXISTS `recentchanges`;

CREATE TABLE `recentchanges` (
  `rc_id` int(11) NOT NULL auto_increment,
  `rc_timestamp` varbinary(14) NOT NULL default '',
  `rc_cur_time` varbinary(14) NOT NULL default '',
  `rc_user` int(10) unsigned NOT NULL default '0',
  `rc_user_text` varbinary(255) NOT NULL,
  `rc_namespace` int(11) NOT NULL default '0',
  `rc_title` varbinary(255) NOT NULL default '',
  `rc_comment` varbinary(255) NOT NULL default '',
  `rc_minor` tinyint(3) unsigned NOT NULL default '0',
  `rc_bot` tinyint(3) unsigned NOT NULL default '0',
  `rc_new` tinyint(3) unsigned NOT NULL default '0',
  `rc_cur_id` int(10) unsigned NOT NULL default '0',
  `rc_this_oldid` int(10) unsigned NOT NULL default '0',
  `rc_last_oldid` int(10) unsigned NOT NULL default '0',
  `rc_type` tinyint(3) unsigned NOT NULL default '0',
  `rc_moved_to_ns` tinyint(3) unsigned NOT NULL default '0',
  `rc_moved_to_title` varbinary(255) NOT NULL default '',
  `rc_patrolled` tinyint(3) unsigned NOT NULL default '0',
  `rc_ip` varbinary(40) NOT NULL default '',
  `rc_old_len` int(11) default NULL,
  `rc_new_len` int(11) default NULL,
  `rc_deleted` tinyint(3) unsigned NOT NULL default '0',
  `rc_logid` int(10) unsigned NOT NULL default '0',
  `rc_log_type` varbinary(255) default NULL,
  `rc_log_action` varbinary(255) default NULL,
  `rc_params` blob,
  PRIMARY KEY  (`rc_id`),
  KEY `rc_timestamp` (`rc_timestamp`),
  KEY `rc_namespace_title` (`rc_namespace`,`rc_title`),
  KEY `rc_cur_id` (`rc_cur_id`),
  KEY `new_name_timestamp` (`rc_new`,`rc_namespace`,`rc_timestamp`),
  KEY `rc_ip` (`rc_ip`),
  KEY `rc_ns_usertext` (`rc_namespace`,`rc_user_text`),
  KEY `rc_user_text` (`rc_user_text`,`rc_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary AUTO_INCREMENT=119;


### data of table `recentchanges` ###

insert into `recentchanges` values ('28', '20090219193609', '20090219193609', '7', 'Twan', '0', 'Gebouwen', '/* Gemeenschapshuis Orion */ ', '0', '0', '0', '5', '28', '23', '0', '0', '', '0', '80.255.240.118', '532', '702', '0', '0', null, '', '');
insert into `recentchanges` values ('29', '20090219194334', '20090219194334', '7', 'Twan', '6', 'Geschiedenis_Orion_001.JPG', '', '0', '0', '0', '0', '0', '0', '3', '0', '', '1', '80.255.240.118', null, null, '0', '28', 'upload', 'upload', '');
insert into `recentchanges` values ('30', '20090219194600', '20090219194600', '7', 'Twan', '0', 'Gebouwen', '/* Gemeenschapshuis Orion */ ', '0', '0', '0', '5', '30', '28', '0', '0', '', '0', '80.255.240.118', '702', '856', '0', '0', null, '', '');
insert into `recentchanges` values ('31', '20090219195002', '20090219195002', '1', 'WikiAdmin', '0', 'Families', 'Nieuwe pagina: [[afbeelding:sleutel.gif]]', '0', '0', '1', '7', '31', '0', '1', '0', '', '1', '84.27.97.70', '0', '26', '0', '0', null, '', '');
insert into `recentchanges` values ('32', '20090219195047', '20090219195047', '1', 'WikiAdmin', '0', 'Families', '', '0', '0', '0', '7', '32', '31', '0', '0', '', '1', '84.27.97.70', '26', '52', '0', '0', null, '', '');
insert into `recentchanges` values ('33', '20090219195102', '20090219195102', '1', 'WikiAdmin', '0', 'Families', '', '0', '0', '0', '7', '33', '32', '0', '0', '', '1', '84.27.97.70', '52', '41', '0', '0', null, '', '');
insert into `recentchanges` values ('34', '20090219195541', '20090219195541', '1', 'WikiAdmin', '0', 'Families', 'Pagina leeggehaald', '0', '0', '0', '7', '34', '33', '0', '0', '', '1', '84.27.97.70', '41', '0', '0', '0', null, '', '');
insert into `recentchanges` values ('35', '20090220130101', '20090220130101', '7', 'Twan', '0', 'Gebouwen', '/* Gemeenschapshuis Orion */ ', '0', '0', '0', '5', '35', '30', '0', '0', '', '0', '80.255.240.118', '856', '857', '0', '0', null, '', '');
insert into `recentchanges` values ('36', '20090220130430', '20090220130430', '7', 'Twan', '6', 'Geschiedenis_Orion_002.jpg', '', '0', '0', '0', '0', '0', '0', '3', '0', '', '1', '80.255.240.118', null, null, '0', '33', 'upload', 'upload', '');
insert into `recentchanges` values ('37', '20090220131056', '20090220131056', '7', 'Twan', '0', 'Gebouwen', '/* Gemeenschapshuis Orion */ ', '0', '0', '0', '5', '37', '35', '0', '0', '', '0', '80.255.240.118', '857', '1072', '0', '0', null, '', '');
insert into `recentchanges` values ('38', '20090220131707', '20090220131707', '7', 'Twan', '6', 'Geschiedenis_Orion_001.JPG', '', '0', '0', '0', '6', '0', '0', '3', '0', '', '1', '80.255.240.118', null, null, '0', '34', 'upload', 'overwrite', '');
insert into `recentchanges` values ('39', '20090220131835', '20090220131835', '7', 'Twan', '6', 'Geschiedenis_Orion_002.jpg', '', '0', '0', '0', '8', '0', '0', '3', '0', '', '1', '80.255.240.118', null, null, '0', '35', 'upload', 'overwrite', '');
insert into `recentchanges` values ('40', '20090220132022', '20090220132022', '7', 'Twan', '0', 'Gebouwen', '/* Gemeenschapshuis Orion */ ', '0', '0', '0', '5', '40', '37', '0', '0', '', '0', '80.255.240.118', '1072', '1079', '0', '0', null, '', '');
insert into `recentchanges` values ('41', '20090220132152', '20090220132152', '7', 'Twan', '0', 'Gebouwen', '/* Gemeenschapshuis Orion */ ', '0', '0', '0', '5', '41', '40', '0', '0', '', '0', '80.255.240.118', '1079', '1231', '0', '0', null, '', '');
insert into `recentchanges` values ('42', '20090220132351', '20090220132351', '7', 'Twan', '6', '40jr_Orion_001.JPG', '', '0', '0', '0', '0', '0', '0', '3', '0', '', '1', '80.255.240.118', null, null, '0', '36', 'upload', 'upload', '');
insert into `recentchanges` values ('43', '20090220132427', '20090220132427', '7', 'Twan', '6', '40jr_Orion_002.JPG', '', '0', '0', '0', '0', '0', '0', '3', '0', '', '1', '80.255.240.118', null, null, '0', '37', 'upload', 'upload', '');
insert into `recentchanges` values ('44', '20090220132530', '20090220132530', '7', 'Twan', '0', 'Gebouwen', '/* Gemeenschapshuis Orion */ ', '0', '0', '0', '5', '44', '41', '0', '0', '', '0', '80.255.240.118', '1231', '1262', '0', '0', null, '', '');
insert into `recentchanges` values ('45', '20090220132834', '20090220132834', '7', 'Twan', '0', 'Verenigingen', 'Nieuwe pagina:  == Fanfare Sint Arnoldus ==  De fanfare Sint Arnoldus is opgericht in 1969 en bestaat anno 2009 dus 40 jaar. Hier enkele plaatjes uit de oude doos om het rijke verleden van deze fanf...', '0', '0', '1', '11', '45', '0', '1', '0', '', '0', '80.255.240.118', '0', '281', '0', '0', null, '', '');
insert into `recentchanges` values ('46', '20090220133245', '20090220133245', '7', 'Twan', '0', 'Verenigingen', '/* Fanfare Sint Arnoldus */ ', '0', '0', '0', '11', '46', '45', '0', '0', '', '0', '80.255.240.118', '281', '630', '0', '0', null, '', '');
insert into `recentchanges` values ('47', '20090220134635', '20090220134635', '7', 'Twan', '0', 'Verenigingen', '/* Fanfare Sint Arnoldus */ ', '0', '0', '0', '11', '47', '46', '0', '0', '', '0', '80.255.240.118', '630', '848', '0', '0', null, '', '');
insert into `recentchanges` values ('48', '20090220134711', '20090220134711', '7', 'Twan', '6', 'Fanfare_001.JPG', '', '0', '0', '0', '0', '0', '0', '3', '0', '', '1', '80.255.240.118', null, null, '0', '38', 'upload', 'upload', '');
insert into `recentchanges` values ('49', '20090220134746', '20090220134746', '7', 'Twan', '6', 'Fanfare_002.JPG', '', '0', '0', '0', '0', '0', '0', '3', '0', '', '1', '80.255.240.118', null, null, '0', '39', 'upload', 'upload', '');
insert into `recentchanges` values ('50', '20090220134817', '20090220134817', '7', 'Twan', '6', 'Fanfare_003a.JPG', '', '0', '0', '0', '0', '0', '0', '3', '0', '', '1', '80.255.240.118', null, null, '0', '40', 'upload', 'upload', '');
insert into `recentchanges` values ('51', '20090220134936', '20090220134936', '7', 'Twan', '0', 'Verenigingen', '/* Fanfare Sint Arnoldus */ ', '0', '0', '0', '11', '51', '47', '0', '0', '', '0', '80.255.240.118', '848', '892', '0', '0', null, '', '');
insert into `recentchanges` values ('52', '20090220135021', '20090220135021', '7', 'Twan', '6', 'Fanfare_004.JPG', '', '0', '0', '0', '0', '0', '0', '3', '0', '', '1', '80.255.240.118', null, null, '0', '41', 'upload', 'upload', '');
insert into `recentchanges` values ('53', '20090220135046', '20090220135046', '7', 'Twan', '6', 'Fanfare_005.JPG', '', '0', '0', '0', '0', '0', '0', '3', '0', '', '1', '80.255.240.118', null, null, '0', '42', 'upload', 'upload', '');
insert into `recentchanges` values ('54', '20090220135124', '20090220135124', '7', 'Twan', '6', 'Fanfare_006.JPG', '', '0', '0', '0', '0', '0', '0', '3', '0', '', '1', '80.255.240.118', null, null, '0', '43', 'upload', 'upload', '');
insert into `recentchanges` values ('55', '20090220135155', '20090220135155', '7', 'Twan', '6', 'Fanfare_007.JPG', '', '0', '0', '0', '0', '0', '0', '3', '0', '', '1', '80.255.240.118', null, null, '0', '44', 'upload', 'upload', '');
insert into `recentchanges` values ('56', '20090220135715', '20090220135715', '7', 'Twan', '0', 'Gebouwen', '/* Gemeenschapshuis Orion */ ', '0', '0', '0', '5', '56', '44', '0', '0', '', '0', '80.255.240.118', '1262', '1446', '0', '0', null, '', '');
insert into `recentchanges` values ('57', '20090220135801', '20090220135801', '7', 'Twan', '6', 'Centrum_Lennisheuvel.JPG', '', '0', '0', '0', '0', '0', '0', '3', '0', '', '1', '80.255.240.118', null, null, '0', '45', 'upload', 'upload', '');
insert into `recentchanges` values ('58', '20090221102504', '20090221102504', '1', 'WikiAdmin', '0', 'Families', '', '0', '0', '0', '7', '58', '34', '0', '0', '', '1', '84.27.97.70', '0', '30', '0', '0', null, '', '');
insert into `recentchanges` values ('59', '20090221102519', '20090221102519', '1', 'WikiAdmin', '0', 'Families', '', '0', '0', '0', '7', '59', '58', '0', '0', '', '1', '84.27.97.70', '30', '40', '0', '0', null, '', '');
insert into `recentchanges` values ('60', '20090221103207', '20090221103207', '1', 'WikiAdmin', '0', 'Families', '', '0', '0', '0', '7', '60', '59', '0', '0', '', '1', '84.27.97.70', '40', '36', '0', '0', null, '', '');
insert into `recentchanges` values ('61', '20090221103827', '20090221103827', '1', 'WikiAdmin', '12', 'Inhoud', 'Nieuwe pagina: [[Plaatjes]] Kijk op [http://nl.wikipedia.org/wiki/Help:Gebruik_van_bestanden#Een_bestand_plaatsen:_thumbnail deze pagina] voor verschillende mogelijkheden met plaatjes op een pagina....', '0', '0', '1', '20', '61', '0', '1', '0', '', '1', '84.27.97.70', '0', '265', '0', '0', null, '', '');
insert into `recentchanges` values ('62', '20090221103913', '20090221103913', '1', 'WikiAdmin', '12', 'Inhoud', '', '0', '0', '0', '20', '62', '61', '0', '0', '', '1', '84.27.97.70', '265', '262', '0', '0', null, '', '');
insert into `recentchanges` values ('63', '20090221103956', '20090221103956', '1', 'WikiAdmin', '12', 'Inhoud', '', '0', '0', '0', '20', '63', '62', '0', '0', '', '1', '84.27.97.70', '262', '267', '0', '0', null, '', '');
insert into `recentchanges` values ('64', '20090222092424', '20090222092424', '7', 'Twan', '0', 'Gebouwen', '/* Gemeenschapshuis Orion */ ', '0', '0', '0', '5', '64', '56', '0', '0', '', '0', '80.255.240.118', '1446', '1454', '0', '0', null, '', '');
insert into `recentchanges` values ('65', '20090222092526', '20090222092526', '7', 'Twan', '0', 'Gebouwen', '/* Gemeenschapshuis Orion */ ', '0', '0', '0', '5', '65', '64', '0', '0', '', '0', '80.255.240.118', '1454', '1467', '0', '0', null, '', '');
insert into `recentchanges` values ('66', '20090222092814', '20090222092814', '7', 'Twan', '0', 'Gebouwen', '/* Gemeenschapshuis Orion */ ', '0', '0', '0', '5', '66', '65', '0', '0', '', '0', '80.255.240.118', '1467', '1641', '0', '0', null, '', '');
insert into `recentchanges` values ('67', '20090222092957', '20090222092957', '7', 'Twan', '0', 'Gebouwen', '/* Gemeenschapshuis Orion */ ', '0', '0', '0', '5', '67', '66', '0', '0', '', '0', '80.255.240.118', '1641', '1681', '0', '0', null, '', '');
insert into `recentchanges` values ('68', '20090222094043', '20090222094043', '7', 'Twan', '0', 'Gebouwen', '/* Gemeenschapshuis Orion */ ', '0', '0', '0', '5', '68', '67', '0', '0', '', '0', '80.255.240.118', '1681', '1762', '0', '0', null, '', '');
insert into `recentchanges` values ('69', '20090222094233', '20090222094233', '7', 'Twan', '0', 'Gebouwen', '/* Gemeenschapshuis Orion */ ', '0', '0', '0', '5', '69', '68', '0', '0', '', '0', '80.255.240.118', '1762', '1794', '0', '0', null, '', '');
insert into `recentchanges` values ('70', '20090222094410', '20090222094410', '7', 'Twan', '0', 'Gebouwen', '/* Gemeenschapshuis Orion */ ', '0', '0', '0', '5', '70', '69', '0', '0', '', '0', '80.255.240.118', '1794', '1818', '0', '0', null, '', '');
insert into `recentchanges` values ('71', '20090222094448', '20090222094448', '7', 'Twan', '0', 'Gebouwen', '/* Gemeenschapshuis Orion */ ', '0', '0', '0', '5', '71', '70', '0', '0', '', '0', '80.255.240.118', '1818', '1822', '0', '0', null, '', '');
insert into `recentchanges` values ('72', '20090222094829', '20090222094829', '7', 'Twan', '0', 'Verenigingen', '/* Fanfare Sint Arnoldus */ ', '0', '0', '0', '11', '72', '51', '0', '0', '', '0', '80.255.240.118', '892', '945', '0', '0', null, '', '');
insert into `recentchanges` values ('73', '20090222193843', '20090222193843', '7', 'Twan', '0', 'Gebouwen', '/* Gemeenschapshuis Orion */ ', '0', '0', '0', '5', '73', '71', '0', '0', '', '0', '80.255.240.118', '1822', '2088', '0', '0', null, '', '');
insert into `recentchanges` values ('74', '20090222193951', '20090222193951', '7', 'Twan', '6', 'Zevenmijlstappers_001.JPG', '', '0', '0', '0', '0', '0', '0', '3', '0', '', '1', '80.255.240.118', null, null, '0', '52', 'upload', 'upload', '');
insert into `recentchanges` values ('75', '20090222194138', '20090222194138', '7', 'Twan', '0', 'Gebouwen', '/* Gemeenschapshuis Orion */ ', '0', '0', '0', '5', '75', '73', '0', '0', '', '0', '80.255.240.118', '2088', '2087', '0', '0', null, '', '');
insert into `recentchanges` values ('76', '20090222194314', '20090222194314', '7', 'Twan', '0', 'Gebouwen', '/* Gemeenschapshuis Orion */ ', '0', '0', '0', '5', '76', '75', '0', '0', '', '0', '80.255.240.118', '2087', '2086', '0', '0', null, '', '');
insert into `recentchanges` values ('77', '20090222194428', '20090222194428', '7', 'Twan', '0', 'Gebouwen', '/* Gemeenschapshuis Orion */ ', '0', '0', '0', '5', '77', '76', '0', '0', '', '0', '80.255.240.118', '2086', '2103', '0', '0', null, '', '');
insert into `recentchanges` values ('78', '20090222194851', '20090222194851', '7', 'Twan', '0', 'Straten', 'Nieuwe pagina:  == Gescheurmd Hemd == Het Gescheurd Hemd is de naam van de aanbouwwijk die vanaf 1990 is gerealiseerd aan de noordoostkant van het dorp. De bouw is gestart aan de straat Lennisheuvel...', '0', '0', '1', '22', '78', '0', '1', '0', '', '0', '80.255.240.118', '0', '515', '0', '0', null, '', '');
insert into `recentchanges` values ('79', '20090222194958', '20090222194958', '7', 'Twan', '6', 'Sneeuw_001.JPG', '', '0', '0', '0', '0', '0', '0', '3', '0', '', '1', '80.255.240.118', null, null, '0', '53', 'upload', 'upload', '');
insert into `recentchanges` values ('80', '20090222195149', '20090222195149', '7', 'Twan', '6', 'Sneeuw_001.JPG', '', '0', '0', '0', '23', '0', '0', '3', '0', '', '1', '80.255.240.118', null, null, '0', '54', 'upload', 'overwrite', '');
insert into `recentchanges` values ('81', '20090222195319', '20090222195319', '7', 'Twan', '6', 'Nieuwbouw_005.JPG', '', '0', '0', '0', '0', '0', '0', '3', '0', '', '1', '80.255.240.118', null, null, '0', '55', 'upload', 'upload', '');
insert into `recentchanges` values ('82', '20090222195707', '20090222195707', '7', 'Twan', '6', 'Nieuwbouw_001.JPG', '', '0', '0', '0', '0', '0', '0', '3', '0', '', '1', '80.255.240.118', null, null, '0', '56', 'upload', 'upload', '');
insert into `recentchanges` values ('83', '20090222195952', '20090222195952', '7', 'Twan', '0', 'Straten', '/* Gescheurmd Hemd */ ', '0', '0', '0', '22', '83', '78', '0', '0', '', '0', '80.255.240.118', '515', '790', '0', '0', null, '', '');
insert into `recentchanges` values ('84', '20090222200227', '20090222200227', '7', 'Twan', '0', 'Straten', '/* Gescheurmd Hemd */ ', '0', '0', '0', '22', '84', '83', '0', '0', '', '0', '80.255.240.118', '790', '970', '0', '0', null, '', '');
insert into `recentchanges` values ('85', '20090222200438', '20090222200438', '7', 'Twan', '6', 'Nieuwbouw_002.JPG', '', '0', '0', '0', '0', '0', '0', '3', '0', '', '1', '80.255.240.118', null, null, '0', '57', 'upload', 'upload', '');
insert into `recentchanges` values ('86', '20090222200525', '20090222200525', '7', 'Twan', '6', 'Nieuwbouw_003.JPG', '', '0', '0', '0', '0', '0', '0', '3', '0', '', '1', '80.255.240.118', null, null, '0', '58', 'upload', 'upload', '');
insert into `recentchanges` values ('87', '20090222200718', '20090222200718', '7', 'Twan', '0', 'Straten', '/* Gescheurmd Hemd */ ', '0', '0', '0', '22', '87', '84', '0', '0', '', '0', '80.255.240.118', '970', '1110', '0', '0', null, '', '');
insert into `recentchanges` values ('88', '20090222201029', '20090222201029', '7', 'Twan', '0', 'Gebeurtenissen', 'Nieuwe pagina:  == Koninginnedag ==   == Kerst ==   == Nieuwkomersavond ==   == Nieuwe pastoor ==   == Lennisfist ==', '0', '0', '1', '28', '88', '0', '1', '0', '', '0', '80.255.240.118', '0', '101', '0', '0', null, '', '');
insert into `recentchanges` values ('89', '20090222201554', '20090222201554', '7', 'Twan', '0', 'Gebeurtenissen', '', '0', '0', '0', '28', '89', '88', '0', '0', '', '0', '80.255.240.118', '101', '598', '0', '0', null, '', '');
insert into `recentchanges` values ('90', '20090222201655', '20090222201655', '7', 'Twan', '0', 'Gebeurtenissen', '/* Kindervakantiewerk */ ', '0', '0', '0', '28', '90', '89', '0', '0', '', '0', '80.255.240.118', '598', '690', '0', '0', null, '', '');
insert into `recentchanges` values ('91', '20090222201748', '20090222201748', '7', 'Twan', '6', 'Vacantiewerk_001.jpg', '', '0', '0', '0', '0', '0', '0', '3', '0', '', '1', '80.255.240.118', null, null, '0', '59', 'upload', 'upload', '');
insert into `recentchanges` values ('92', '20090222201831', '20090222201831', '7', 'Twan', '6', 'Vacantiewerk_002.jpg', '', '0', '0', '0', '0', '0', '0', '3', '0', '', '1', '80.255.240.118', null, null, '0', '60', 'upload', 'upload', '');
insert into `recentchanges` values ('93', '20090222201918', '20090222201918', '7', 'Twan', '6', 'Vacantiewerk_003.jpg', '', '0', '0', '0', '0', '0', '0', '3', '0', '', '1', '80.255.240.118', null, null, '0', '61', 'upload', 'upload', '');
insert into `recentchanges` values ('94', '20090222202007', '20090222202007', '7', 'Twan', '6', 'Vacantiewerk_004.jpg', '', '0', '0', '0', '0', '0', '0', '3', '0', '', '1', '80.255.240.118', null, null, '0', '62', 'upload', 'upload', '');
insert into `recentchanges` values ('95', '20090222202140', '20090222202140', '7', 'Twan', '6', 'Vacantiewerk_005.jpg', '', '0', '0', '0', '0', '0', '0', '3', '0', '', '1', '80.255.240.118', null, null, '0', '63', 'upload', 'upload', '');
insert into `recentchanges` values ('96', '20090222202430', '20090222202430', '7', 'Twan', '0', 'Gebeurtenissen', '/* Kindervakantiewerk */ ', '0', '0', '0', '28', '96', '90', '0', '0', '', '0', '80.255.240.118', '690', '976', '0', '0', null, '', '');
insert into `recentchanges` values ('97', '20090222202613', '20090222202613', '7', 'Twan', '0', 'Gebeurtenissen', '/* Kindervakantiewerk */ ', '0', '0', '0', '28', '97', '96', '0', '0', '', '0', '80.255.240.118', '976', '1007', '0', '0', null, '', '');
insert into `recentchanges` values ('98', '20090222202643', '20090222202643', '7', 'Twan', '0', 'Gebeurtenissen', '/* Kindervakantiewerk */ ', '0', '0', '0', '28', '98', '97', '0', '0', '', '0', '80.255.240.118', '1007', '1008', '0', '0', null, '', '');
insert into `recentchanges` values ('99', '20090222202715', '20090222202715', '7', 'Twan', '0', 'Gebeurtenissen', '/* Kindervakantiewerk */ ', '0', '0', '0', '28', '99', '98', '0', '0', '', '0', '80.255.240.118', '1008', '1068', '0', '0', null, '', '');
insert into `recentchanges` values ('100', '20090222203152', '20090222203152', '7', 'Twan', '0', 'Gebouwen', '/* Gemeenschapshuis Orion */ ', '0', '0', '0', '5', '100', '77', '0', '0', '', '0', '80.255.240.118', '2103', '2385', '0', '0', null, '', '');
insert into `recentchanges` values ('101', '20090222203412', '20090222203412', '7', 'Twan', '6', 'Geschiedenis_Orion_003.JPG', '', '0', '0', '0', '0', '0', '0', '3', '0', '', '1', '80.255.240.118', null, null, '0', '64', 'upload', 'upload', '');
insert into `recentchanges` values ('102', '20090222203547', '20090222203547', '7', 'Twan', '6', 'Geschiedenis_Orion_004.JPG', '', '0', '0', '0', '0', '0', '0', '3', '0', '', '1', '80.255.240.118', null, null, '0', '65', 'upload', 'upload', '');
insert into `recentchanges` values ('103', '20090222203710', '20090222203710', '7', 'Twan', '0', 'Gebouwen', '/* Gemeenschapshuis Orion */ ', '0', '0', '0', '5', '103', '100', '0', '0', '', '0', '80.255.240.118', '2385', '2385', '0', '0', null, '', '');
insert into `recentchanges` values ('104', '20090222203825', '20090222203825', '7', 'Twan', '0', 'Gebouwen', '/* Gemeenschapshuis Orion */ ', '0', '0', '0', '5', '104', '103', '0', '0', '', '0', '80.255.240.118', '2385', '2387', '0', '0', null, '', '');
insert into `recentchanges` values ('105', '20090222203901', '20090222203901', '7', 'Twan', '0', 'Gebouwen', '/* Gemeenschapshuis Orion */ ', '0', '0', '0', '5', '105', '104', '0', '0', '', '0', '80.255.240.118', '2387', '2385', '0', '0', null, '', '');
insert into `recentchanges` values ('106', '20090222203918', '20090222203918', '7', 'Twan', '0', 'Gebouwen', '/* Gemeenschapshuis Orion */ ', '0', '0', '0', '5', '106', '105', '0', '0', '', '0', '80.255.240.118', '2385', '2390', '0', '0', null, '', '');
insert into `recentchanges` values ('107', '20090222203951', '20090222203951', '7', 'Twan', '0', 'Gebouwen', '/* Gemeenschapshuis Orion */ ', '0', '0', '0', '5', '107', '106', '0', '0', '', '0', '80.255.240.118', '2390', '2396', '0', '0', null, '', '');
insert into `recentchanges` values ('108', '20090222204019', '20090222204019', '7', 'Twan', '0', 'Gebouwen', '/* Gemeenschapshuis Orion */ ', '0', '0', '0', '5', '108', '107', '0', '0', '', '0', '80.255.240.118', '2396', '2412', '0', '0', null, '', '');
insert into `recentchanges` values ('109', '20090222204949', '20090222204949', '7', 'Twan', '0', 'Gebouwen', '/* Gemeenschapshuis Orion */ ', '0', '0', '0', '5', '109', '108', '0', '0', '', '0', '80.255.240.118', '2412', '2411', '0', '0', null, '', '');
insert into `recentchanges` values ('110', '20090222215530', '20090222215530', '1', 'WikiAdmin', '0', 'Straten', '/* Gescheurmd Hemd */ ', '0', '0', '0', '22', '110', '87', '0', '0', '', '1', '84.27.97.70', '1110', '1109', '0', '0', null, '', '');
insert into `recentchanges` values ('111', '20090223191945', '20090223191945', '8', 'Toonvangrinsven', '0', 'Gebouwen', '/* Gemeenschapshuis Orion */ ', '0', '0', '0', '5', '111', '109', '0', '0', '', '0', '212.123.137.62', '2411', '2401', '0', '0', null, '', '');
insert into `recentchanges` values ('112', '20090223192005', '20090223192005', '8', 'Toonvangrinsven', '0', 'Gebouwen', '/* Gemeenschapshuis Orion */ ', '0', '0', '0', '5', '112', '111', '0', '0', '', '0', '212.123.137.62', '2401', '2400', '0', '0', null, '', '');
insert into `recentchanges` values ('113', '20090223192020', '20090223192020', '8', 'Toonvangrinsven', '0', 'Gebouwen', '/* Gemeenschapshuis Orion */ ', '0', '0', '0', '5', '113', '112', '0', '0', '', '0', '212.123.137.62', '2400', '2404', '0', '0', null, '', '');
insert into `recentchanges` values ('114', '20090223192059', '20090223192059', '8', 'Toonvangrinsven', '0', 'Gebouwen', '/* Gemeenschapshuis Orion */ ', '0', '0', '0', '5', '114', '113', '0', '0', '', '0', '212.123.137.62', '2404', '2411', '0', '0', null, '', '');
insert into `recentchanges` values ('115', '20090223192322', '20090223192322', '8', 'Toonvangrinsven', '0', 'Gebouwen', '/* Gemeenschapshuis Orion */ ', '0', '0', '0', '5', '115', '114', '0', '0', '', '0', '212.123.137.62', '2411', '2415', '0', '0', null, '', '');
insert into `recentchanges` values ('116', '20090223192344', '20090223192344', '8', 'Toonvangrinsven', '0', 'Gebouwen', '/* Gemeenschapshuis Orion */ ', '0', '0', '0', '5', '116', '115', '0', '0', '', '0', '212.123.137.62', '2415', '2396', '0', '0', null, '', '');
insert into `recentchanges` values ('117', '20090224002413', '20090224002413', '8', 'Toonvangrinsven', '6', 'Theresiakerk.JPG', '', '0', '0', '0', '0', '0', '0', '3', '0', '', '1', '212.123.137.62', null, null, '0', '67', 'upload', 'upload', '');
insert into `recentchanges` values ('118', '20090224003421', '20090224003421', '8', 'Toonvangrinsven', '6', 'Theresiakerk.JPG', '', '0', '0', '0', '36', '118', '117', '0', '0', '', '0', '212.123.137.62', '0', '57', '0', '0', null, '', '');


### structure of table `redirect` ###

DROP TABLE IF EXISTS `redirect`;

CREATE TABLE `redirect` (
  `rd_from` int(10) unsigned NOT NULL default '0',
  `rd_namespace` int(11) NOT NULL default '0',
  `rd_title` varbinary(255) NOT NULL default '',
  PRIMARY KEY  (`rd_from`),
  KEY `rd_ns_title` (`rd_namespace`,`rd_title`,`rd_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;


### data of table `redirect` ###

insert into `redirect` values ('3', '0', 'Historische_Kamer');


### structure of table `revision` ###

DROP TABLE IF EXISTS `revision`;

CREATE TABLE `revision` (
  `rev_id` int(10) unsigned NOT NULL auto_increment,
  `rev_page` int(10) unsigned NOT NULL,
  `rev_text_id` int(10) unsigned NOT NULL,
  `rev_comment` tinyblob NOT NULL,
  `rev_user` int(10) unsigned NOT NULL default '0',
  `rev_user_text` varbinary(255) NOT NULL default '',
  `rev_timestamp` binary(14) NOT NULL default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `rev_minor_edit` tinyint(3) unsigned NOT NULL default '0',
  `rev_deleted` tinyint(3) unsigned NOT NULL default '0',
  `rev_len` int(10) unsigned default NULL,
  `rev_parent_id` int(10) unsigned default NULL,
  PRIMARY KEY  (`rev_page`,`rev_id`),
  UNIQUE KEY `rev_id` (`rev_id`),
  KEY `rev_timestamp` (`rev_timestamp`),
  KEY `page_timestamp` (`rev_page`,`rev_timestamp`),
  KEY `user_timestamp` (`rev_user`,`rev_timestamp`),
  KEY `usertext_timestamp` (`rev_user_text`,`rev_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary MAX_ROWS=10000000 AVG_ROW_LENGTH=1024 AUTO_INCREMENT=119;


### data of table `revision` ###

insert into `revision` values ('1', '1', '1', '', '0', 'MediaWiki default', '20090114161438', '0', '0', '504', '0');
insert into `revision` values ('3', '1', '3', '/* Meer hulp over MediaWiki */', '1', 'WikiAdmin', '20090115205007', '0', '0', '193', '1');
insert into `revision` values ('4', '1', '4', '', '1', 'WikiAdmin', '20090115205058', '0', '0', '753', '3');
insert into `revision` values ('5', '1', '4', '[[Hoofdpagina]] hernoemd naar [[Historische Kamer]]', '1', 'WikiAdmin', '20090115205154', '1', '0', null, '4');
insert into `revision` values ('7', '1', '6', '', '1', 'WikiAdmin', '20090115205236', '0', '0', '717', '5');
insert into `revision` values ('9', '1', '8', '', '1', 'WikiAdmin', '20090117140317', '0', '0', '757', '7');
insert into `revision` values ('2', '2', '2', '', '1', 'WikiAdmin', '20090115202519', '0', '0', '0', '0');
insert into `revision` values ('6', '3', '5', '[[Hoofdpagina]] hernoemd naar [[Historische Kamer]]', '1', 'WikiAdmin', '20090115205154', '0', '0', '31', '0');
insert into `revision` values ('8', '4', '7', 'Nieuwe pagina: * navigation ** mainpage|mainpage-description ** portal-url|portal ** currentevents-url|currentevents ** recentchanges-url|recentchanges ** randompage-url|randompage ** helppage|help ...', '1', 'WikiAdmin', '20090117140035', '0', '0', '294', '0');
insert into `revision` values ('10', '4', '9', '', '1', 'WikiAdmin', '20090117140436', '0', '0', '296', '8');
insert into `revision` values ('11', '4', '10', '', '1', 'WikiAdmin', '20090117140559', '0', '0', '298', '10');
insert into `revision` values ('12', '4', '11', '', '1', 'WikiAdmin', '20090117140833', '0', '0', '296', '11');
insert into `revision` values ('13', '4', '12', '', '1', 'WikiAdmin', '20090117141809', '0', '0', '287', '12');
insert into `revision` values ('14', '4', '13', '', '1', 'WikiAdmin', '20090117141828', '0', '0', '296', '13');
insert into `revision` values ('15', '4', '14', '', '1', 'WikiAdmin', '20090117141911', '0', '0', '303', '14');
insert into `revision` values ('16', '4', '15', '', '1', 'WikiAdmin', '20090117141944', '0', '0', '279', '15');
insert into `revision` values ('17', '4', '16', '', '1', 'WikiAdmin', '20090117142039', '0', '0', '310', '16');
insert into `revision` values ('24', '4', '23', '', '1', 'WikiAdmin', '20090128195448', '0', '0', '310', '17');
insert into `revision` values ('25', '4', '24', '', '1', 'WikiAdmin', '20090128195519', '0', '0', '311', '24');
insert into `revision` values ('26', '4', '25', '', '1', 'WikiAdmin', '20090207150322', '0', '0', '309', '25');
insert into `revision` values ('27', '4', '26', '', '1', 'WikiAdmin', '20090207150350', '0', '0', '288', '26');
insert into `revision` values ('18', '5', '17', 'Nieuwe pagina: == Sint Theresia school ==  == Sint Theresia kerk ==  == Acht Zaligheden ==  == Gemeenschapshuis Orion ==', '1', 'WikiAdmin', '20090123140506', '0', '0', '105', '0');
insert into `revision` values ('19', '5', '18', '/* Sint Theresia kerk */', '1', 'WikiAdmin', '20090128130924', '0', '0', '522', '18');
insert into `revision` values ('20', '5', '19', '/* Het orgel */', '1', 'WikiAdmin', '20090128131032', '0', '0', '537', '19');
insert into `revision` values ('21', '5', '20', '/* Het orgel */', '1', 'WikiAdmin', '20090128131120', '0', '0', '534', '20');
insert into `revision` values ('22', '5', '21', '/* Het orgel */', '1', 'WikiAdmin', '20090128131139', '0', '0', '528', '21');
insert into `revision` values ('23', '5', '22', '/* Het orgel */', '1', 'WikiAdmin', '20090128134001', '0', '0', '532', '22');
insert into `revision` values ('28', '5', '27', '/* Gemeenschapshuis Orion */', '7', 'Twan', '20090219193609', '0', '0', '702', '23');
insert into `revision` values ('30', '5', '29', '/* Gemeenschapshuis Orion */', '7', 'Twan', '20090219194600', '0', '0', '856', '28');
insert into `revision` values ('35', '5', '34', '/* Gemeenschapshuis Orion */', '7', 'Twan', '20090220130101', '0', '0', '857', '30');
insert into `revision` values ('37', '5', '36', '/* Gemeenschapshuis Orion */', '7', 'Twan', '20090220131056', '0', '0', '1072', '35');
insert into `revision` values ('40', '5', '37', '/* Gemeenschapshuis Orion */', '7', 'Twan', '20090220132022', '0', '0', '1079', '37');
insert into `revision` values ('41', '5', '38', '/* Gemeenschapshuis Orion */', '7', 'Twan', '20090220132152', '0', '0', '1231', '40');
insert into `revision` values ('44', '5', '41', '/* Gemeenschapshuis Orion */', '7', 'Twan', '20090220132530', '0', '0', '1262', '41');
insert into `revision` values ('56', '5', '53', '/* Gemeenschapshuis Orion */', '7', 'Twan', '20090220135715', '0', '0', '1446', '44');
insert into `revision` values ('64', '5', '61', '/* Gemeenschapshuis Orion */', '7', 'Twan', '20090222092424', '0', '0', '1454', '56');
insert into `revision` values ('65', '5', '62', '/* Gemeenschapshuis Orion */', '7', 'Twan', '20090222092526', '0', '0', '1467', '64');
insert into `revision` values ('66', '5', '63', '/* Gemeenschapshuis Orion */', '7', 'Twan', '20090222092814', '0', '0', '1641', '65');
insert into `revision` values ('67', '5', '64', '/* Gemeenschapshuis Orion */', '7', 'Twan', '20090222092957', '0', '0', '1681', '66');
insert into `revision` values ('68', '5', '65', '/* Gemeenschapshuis Orion */', '7', 'Twan', '20090222094043', '0', '0', '1762', '67');
insert into `revision` values ('69', '5', '66', '/* Gemeenschapshuis Orion */', '7', 'Twan', '20090222094233', '0', '0', '1794', '68');
insert into `revision` values ('70', '5', '67', '/* Gemeenschapshuis Orion */', '7', 'Twan', '20090222094410', '0', '0', '1818', '69');
insert into `revision` values ('71', '5', '68', '/* Gemeenschapshuis Orion */', '7', 'Twan', '20090222094448', '0', '0', '1822', '70');
insert into `revision` values ('73', '5', '70', '/* Gemeenschapshuis Orion */', '7', 'Twan', '20090222193843', '0', '0', '2088', '71');
insert into `revision` values ('75', '5', '72', '/* Gemeenschapshuis Orion */', '7', 'Twan', '20090222194138', '0', '0', '2087', '73');
insert into `revision` values ('76', '5', '73', '/* Gemeenschapshuis Orion */', '7', 'Twan', '20090222194314', '0', '0', '2086', '75');
insert into `revision` values ('77', '5', '74', '/* Gemeenschapshuis Orion */', '7', 'Twan', '20090222194428', '0', '0', '2103', '76');
insert into `revision` values ('100', '5', '96', '/* Gemeenschapshuis Orion */', '7', 'Twan', '20090222203152', '0', '0', '2385', '77');
insert into `revision` values ('103', '5', '99', '/* Gemeenschapshuis Orion */', '7', 'Twan', '20090222203710', '0', '0', '2385', '100');
insert into `revision` values ('104', '5', '100', '/* Gemeenschapshuis Orion */', '7', 'Twan', '20090222203825', '0', '0', '2387', '103');
insert into `revision` values ('105', '5', '101', '/* Gemeenschapshuis Orion */', '7', 'Twan', '20090222203901', '0', '0', '2385', '104');
insert into `revision` values ('106', '5', '102', '/* Gemeenschapshuis Orion */', '7', 'Twan', '20090222203918', '0', '0', '2390', '105');
insert into `revision` values ('107', '5', '103', '/* Gemeenschapshuis Orion */', '7', 'Twan', '20090222203951', '0', '0', '2396', '106');
insert into `revision` values ('108', '5', '104', '/* Gemeenschapshuis Orion */', '7', 'Twan', '20090222204019', '0', '0', '2412', '107');
insert into `revision` values ('109', '5', '105', '/* Gemeenschapshuis Orion */', '7', 'Twan', '20090222204949', '0', '0', '2411', '108');
insert into `revision` values ('111', '5', '107', '/* Gemeenschapshuis Orion */', '8', 'Toonvangrinsven', '20090223191945', '0', '0', '2401', '109');
insert into `revision` values ('112', '5', '108', '/* Gemeenschapshuis Orion */', '8', 'Toonvangrinsven', '20090223192005', '0', '0', '2400', '111');
insert into `revision` values ('113', '5', '109', '/* Gemeenschapshuis Orion */', '8', 'Toonvangrinsven', '20090223192020', '0', '0', '2404', '112');
insert into `revision` values ('114', '5', '110', '/* Gemeenschapshuis Orion */', '8', 'Toonvangrinsven', '20090223192059', '0', '0', '2411', '113');
insert into `revision` values ('115', '5', '111', '/* Gemeenschapshuis Orion */', '8', 'Toonvangrinsven', '20090223192322', '0', '0', '2415', '114');
insert into `revision` values ('116', '5', '112', '/* Gemeenschapshuis Orion */', '8', 'Toonvangrinsven', '20090223192344', '0', '0', '2396', '115');
insert into `revision` values ('29', '6', '28', '', '7', 'Twan', '20090219194334', '0', '0', '0', '0');
insert into `revision` values ('38', '6', '28', 'heeft een nieuwe versie van \"[[Afbeelding:Geschiedenis Orion 001.JPG]]\" toegevoegd', '7', 'Twan', '20090220131707', '0', '0', null, '29');
insert into `revision` values ('31', '7', '30', 'Nieuwe pagina: [[afbeelding:sleutel.gif]]', '1', 'WikiAdmin', '20090219195002', '0', '0', '26', '0');
insert into `revision` values ('32', '7', '31', '', '1', 'WikiAdmin', '20090219195047', '0', '0', '52', '31');
insert into `revision` values ('33', '7', '32', '', '1', 'WikiAdmin', '20090219195102', '0', '0', '41', '32');
insert into `revision` values ('34', '7', '33', 'Pagina leeggehaald', '1', 'WikiAdmin', '20090219195541', '0', '0', '0', '33');
insert into `revision` values ('58', '7', '55', '', '1', 'WikiAdmin', '20090221102504', '0', '0', '30', '34');
insert into `revision` values ('59', '7', '56', '', '1', 'WikiAdmin', '20090221102519', '0', '0', '40', '58');
insert into `revision` values ('60', '7', '57', '', '1', 'WikiAdmin', '20090221103207', '0', '0', '36', '59');
insert into `revision` values ('36', '8', '35', '', '7', 'Twan', '20090220130430', '0', '0', '0', '0');
insert into `revision` values ('39', '8', '35', 'heeft een nieuwe versie van \"[[Afbeelding:Geschiedenis Orion 002.jpg]]\" toegevoegd', '7', 'Twan', '20090220131835', '0', '0', null, '36');
insert into `revision` values ('42', '9', '39', '', '7', 'Twan', '20090220132351', '0', '0', '0', '0');
insert into `revision` values ('43', '10', '40', '', '7', 'Twan', '20090220132427', '0', '0', '0', '0');
insert into `revision` values ('45', '11', '42', 'Nieuwe pagina:  == Fanfare Sint Arnoldus ==  De fanfare Sint Arnoldus is opgericht in 1969 en bestaat anno 2009 dus 40 jaar. Hier enkele plaatjes uit de oude doos om het rijke verleden van deze fanf...', '7', 'Twan', '20090220132834', '0', '0', '281', '0');
insert into `revision` values ('46', '11', '43', '/* Fanfare Sint Arnoldus */', '7', 'Twan', '20090220133245', '0', '0', '630', '45');
insert into `revision` values ('47', '11', '44', '/* Fanfare Sint Arnoldus */', '7', 'Twan', '20090220134635', '0', '0', '848', '46');
insert into `revision` values ('51', '11', '48', '/* Fanfare Sint Arnoldus */', '7', 'Twan', '20090220134936', '0', '0', '892', '47');
insert into `revision` values ('72', '11', '69', '/* Fanfare Sint Arnoldus */', '7', 'Twan', '20090222094829', '0', '0', '945', '51');
insert into `revision` values ('48', '12', '45', '', '7', 'Twan', '20090220134711', '0', '0', '0', '0');
insert into `revision` values ('49', '13', '46', '', '7', 'Twan', '20090220134746', '0', '0', '0', '0');
insert into `revision` values ('50', '14', '47', '', '7', 'Twan', '20090220134818', '0', '0', '0', '0');
insert into `revision` values ('52', '15', '49', '', '7', 'Twan', '20090220135021', '0', '0', '0', '0');
insert into `revision` values ('53', '16', '50', '', '7', 'Twan', '20090220135046', '0', '0', '0', '0');
insert into `revision` values ('54', '17', '51', '', '7', 'Twan', '20090220135124', '0', '0', '0', '0');
insert into `revision` values ('55', '18', '52', '', '7', 'Twan', '20090220135155', '0', '0', '0', '0');
insert into `revision` values ('57', '19', '54', '', '7', 'Twan', '20090220135801', '0', '0', '0', '0');
insert into `revision` values ('61', '20', '58', 'Nieuwe pagina: [[Plaatjes]] Kijk op [http://nl.wikipedia.org/wiki/Help:Gebruik_van_bestanden#Een_bestand_plaatsen:_thumbnail deze pagina] voor verschillende mogelijkheden met plaatjes op een pagina....', '1', 'WikiAdmin', '20090221103827', '0', '0', '265', '0');
insert into `revision` values ('62', '20', '59', '', '1', 'WikiAdmin', '20090221103913', '0', '0', '262', '61');
insert into `revision` values ('63', '20', '60', '', '1', 'WikiAdmin', '20090221103956', '0', '0', '267', '62');
insert into `revision` values ('74', '21', '71', '', '7', 'Twan', '20090222193951', '0', '0', '0', '0');
insert into `revision` values ('78', '22', '75', 'Nieuwe pagina:  == Gescheurmd Hemd == Het Gescheurd Hemd is de naam van de aanbouwwijk die vanaf 1990 is gerealiseerd aan de noordoostkant van het dorp. De bouw is gestart aan de straat Lennisheuvel...', '7', 'Twan', '20090222194851', '0', '0', '515', '0');
insert into `revision` values ('83', '22', '79', '/* Gescheurmd Hemd */', '7', 'Twan', '20090222195952', '0', '0', '790', '78');
insert into `revision` values ('84', '22', '80', '/* Gescheurmd Hemd */', '7', 'Twan', '20090222200227', '0', '0', '970', '83');
insert into `revision` values ('87', '22', '83', '/* Gescheurmd Hemd */', '7', 'Twan', '20090222200718', '0', '0', '1110', '84');
insert into `revision` values ('110', '22', '106', '/* Gescheurmd Hemd */', '1', 'WikiAdmin', '20090222215530', '0', '0', '1109', '87');
insert into `revision` values ('79', '23', '76', '', '7', 'Twan', '20090222194958', '0', '0', '0', '0');
insert into `revision` values ('80', '23', '76', 'heeft een nieuwe versie van \"[[Afbeelding:Sneeuw 001.JPG]]\" toegevoegd', '7', 'Twan', '20090222195149', '0', '0', null, '79');
insert into `revision` values ('81', '24', '77', '', '7', 'Twan', '20090222195319', '0', '0', '0', '0');
insert into `revision` values ('82', '25', '78', '', '7', 'Twan', '20090222195707', '0', '0', '0', '0');
insert into `revision` values ('85', '26', '81', '', '7', 'Twan', '20090222200438', '0', '0', '0', '0');
insert into `revision` values ('86', '27', '82', '', '7', 'Twan', '20090222200525', '0', '0', '0', '0');
insert into `revision` values ('88', '28', '84', 'Nieuwe pagina:  == Koninginnedag ==   == Kerst ==   == Nieuwkomersavond ==   == Nieuwe pastoor ==   == Lennisfist ==', '7', 'Twan', '20090222201029', '0', '0', '101', '0');
insert into `revision` values ('89', '28', '85', '', '7', 'Twan', '20090222201554', '0', '0', '598', '88');
insert into `revision` values ('90', '28', '86', '/* Kindervakantiewerk */', '7', 'Twan', '20090222201655', '0', '0', '690', '89');
insert into `revision` values ('96', '28', '92', '/* Kindervakantiewerk */', '7', 'Twan', '20090222202430', '0', '0', '976', '90');
insert into `revision` values ('97', '28', '93', '/* Kindervakantiewerk */', '7', 'Twan', '20090222202613', '0', '0', '1007', '96');
insert into `revision` values ('98', '28', '94', '/* Kindervakantiewerk */', '7', 'Twan', '20090222202643', '0', '0', '1008', '97');
insert into `revision` values ('99', '28', '95', '/* Kindervakantiewerk */', '7', 'Twan', '20090222202715', '0', '0', '1068', '98');
insert into `revision` values ('91', '29', '87', '', '7', 'Twan', '20090222201748', '0', '0', '0', '0');
insert into `revision` values ('92', '30', '88', '', '7', 'Twan', '20090222201831', '0', '0', '0', '0');
insert into `revision` values ('93', '31', '89', '', '7', 'Twan', '20090222201918', '0', '0', '0', '0');
insert into `revision` values ('94', '32', '90', '', '7', 'Twan', '20090222202007', '0', '0', '0', '0');
insert into `revision` values ('95', '33', '91', '', '7', 'Twan', '20090222202140', '0', '0', '0', '0');
insert into `revision` values ('101', '34', '97', '', '7', 'Twan', '20090222203412', '0', '0', '0', '0');
insert into `revision` values ('102', '35', '98', '', '7', 'Twan', '20090222203547', '0', '0', '0', '0');
insert into `revision` values ('117', '36', '113', '', '8', 'Toonvangrinsven', '20090224002413', '0', '0', '0', '0');
insert into `revision` values ('118', '36', '114', '', '8', 'Toonvangrinsven', '20090224003421', '0', '0', '57', '117');


### structure of table `searchindex` ###

DROP TABLE IF EXISTS `searchindex`;

CREATE TABLE `searchindex` (
  `si_page` int(10) unsigned NOT NULL,
  `si_title` varchar(255) NOT NULL default '',
  `si_text` mediumtext NOT NULL,
  UNIQUE KEY `si_page` (`si_page`),
  FULLTEXT KEY `si_title` (`si_title`),
  FULLTEXT KEY `si_text` (`si_text`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


### data of table `searchindex` ###

insert into `searchindex` values ('2', 'sleutel', ' ');
insert into `searchindex` values ('1', 'historische kamer', ' de historische kamer wordt gevuld met \'de levende geschiedenis van lennisheuvel\' in deze kamer van de website zijn we aangeland in het wiki gedeelte in een wiki kunt u een bijdrage leveren aan de inhoud van de website en we hebben u nodig omdat het voor u8c3a9u8c3a9n persoon onmogelijk is om allerlei historische informatie over lennisheuvel te verzamelen nu realiseer ik mij dat niet iedereen even handig is met de computer maar dat hoeft ook niet; de jeugd si dit vaak wel misschien eens een leuk idee om een kleinkind u te laten interviewen en dat het kleinkind het resultaat in deze wiki publiceert of een project op de middelbare school wat een bepaald stukje geschiedschrijving over lennisheuvel tot gevolg heeft ideu8c3aben en mogelijkheden te over ');
insert into `searchindex` values ('4', 'sidebar', ' categorieu8c3abn families families personen personen gebouwen gebouwen straten straten verenigingen verenigingen gebeurtenissen gebeurtenissen search navigation mainpage mainpage-description currentevents-url currentevents helppage help toolbox languages ');
insert into `searchindex` values ('3', 'hoofdpagina', ' ');
insert into `searchindex` values ('6', 'geschiedenis orion 001', ' ');
insert into `searchindex` values ('5', 'gebouwen', ' sint theresia school sint theresia kerk sint theresia kerk sint theresia kerk het orgel het orgel het orgel gebouwd door fa l verschueren heythuysen 1950; met oud materiaal uit uden kl kruisheren; ep ii vp hw 4-nw 4-ped 1 ingespeeld door huub hou t 1950 renovatie fa l verschueren heythuysen 1970; ep ii vp 9  dispositie  hoofdwerk manuaal i prestant 8 bourdon 8 octaaf 4 nasard 2 2 3 nevenwerk manuaal ii gamba 8 holpijp 8 flu8c3bbte harmonique 4 doublette 2 pedaal subbas 16 acht zaligheden acht zaligheden acht zaligheden gemeenschapshuis orion gemeenschapshuis de orion is het kloppend hart van de gemeenschap lennisheuvel hier links op de foto naast de in 2003 gerealiseerde kiosk afbeelding centrum_lennisheuvel jpg none de orion is opgericht in 1948 onder bezielende leiding van de toenmalige pastoor manders in het archief zijn bijgevoegde twee afbeeldingen gevonden waarvan de relatie met de orion niet duidelijk is bij uw schrijver dezes afbeelding geschiedenis_orion_003 jpg 400px gezelschap afbeelding geschiedenis_orion_004 jpg 400px interieur van de kerk anno de orion is nauw verbonden met mensen verenigingen en gebeurtenissen in het dorp zoals hier bij de start van een wandeltocht van de 7-mijls stappers later opgegaan in de keistampers het bord met aanduiding orion is later vervangen afbeelding zevenmijlstappers_001 jpg thumb vertrek van jeugdige zevenmijlsstappers midden jaren \'80 over de geschiedenis van orion is een serie artikelen verschenen in het dorpsorgaan rond kerk en orion 2008-2009 het gebouw is in jaartal uitgebreid  hier moet nog het een en ander over worden beschreven wie voelt zich geroepen   hieronder ziet u de fanfare sint arnoldus die in de kerk een mis opluistert ter ere van het 40-jarig bestaan van de orion 1988 eveneens ter gelegenheid van het 40-jarig bestaan werd er in de toenmalige kiosk een dansje in klederdracht opgevoerd 1988 ook was er een feestavond in de orion zelf  - wie weet nog wie hier op de foto staan -  afbeelding geschiedenis_orion_002 jpg boerendans in klederdracht afbeelding geschiedenis_orion_001 jpg mis in de theresiakerk afbeelding 40jr_orion_001 jpg feestavond afbeelding 40jr_orion_002 jpg gasten tijdens de feestavond  - wie weet nog wie hier op de foto staan -  ');
insert into `searchindex` values ('7', 'families', ' afbeelding fanfare_007 jpg 100px ');
insert into `searchindex` values ('8', 'geschiedenis orion 002', ' ');
insert into `searchindex` values ('9', '40jr orion 001', ' ');
insert into `searchindex` values ('10', '40jr orion 002', ' ');
insert into `searchindex` values ('11', 'verenigingen', ' fanfare sint arnoldus fanfare sint arnoldus fanfare sint arnoldus de fanfare sint arnoldus is opgericht in 1949 en bestaat anno 2009 dus 60 jaar in de achterliggende 60 jaren heeft de fanfare haar bestaansrecht in lennisheuvel bewezen en hebben vele inwoners kennis gemaakt met het musiceren in verenigingsverband alleszins reden om dit 60-jarig bestaan feestelijk te vieren de fanfare heeft ook een eigen website zie waar deze tekst aan is ontleend hier enkele plaatjes uit de oude doos om het rijke verleden van deze fanfare te illustreren gemaakt door c willers 1984-1986 afbeelding geschiedenis_orion_001 jpg heilige mis in de kerk afbeelding fanfare_001 jpg afbeelding fanfare_002 jpg afbeelding fanfare_003a jpg afbeelding fanfare_004 jpg afbeelding fanfare_005 jpg afbeelding fanfare_006 jpg afbeelding fanfare_007 jpg  wie weet wanneer deze foto foto\'s zijn gemaakt   ');
insert into `searchindex` values ('12', 'fanfare 001', ' ');
insert into `searchindex` values ('13', 'fanfare 002', ' ');
insert into `searchindex` values ('14', 'fanfare 003a', ' ');
insert into `searchindex` values ('15', 'fanfare 004', ' ');
insert into `searchindex` values ('16', 'fanfare 005', ' ');
insert into `searchindex` values ('17', 'fanfare 006', ' ');
insert into `searchindex` values ('18', 'fanfare 007', ' ');
insert into `searchindex` values ('19', 'centrum lennisheuvel', ' ');
insert into `searchindex` values ('20', 'inhoud', ' plaatjes kijk op deze pagina voor verschillende mogelijkheden met plaatjes op een pagina tip gebruik zoveel mogelijk \'thumbnails om de pagina overzichtelijk te houden ');
insert into `searchindex` values ('21', 'zevenmijlstappers 001', ' ');
insert into `searchindex` values ('22', 'straten', ' gescheurd hemd gescheurd hemd gescheurd hemd het gescheurd hemd is de naam van de aanbouwwijk die vanaf 1990 is gerealiseerd aan de noordoostkant van het dorp de bouw is gestart aan de straat lennisheuvel de naam van de wijk verwijst naar de vorm van de plattegrond die zou lijken op een hemd met een scheur voordat de wijk werd gebouwd was de aanblik van het dorp lennisheuvel heel anders dan vandaag je keek vanaf de velden achter in de tuinen van de huizen aan de straat lennisheuvel deze foto van c willers illustreert dat afbeelding sneeuw_001 jpg 400px center blik over de velden richting de kerk voor aanbouw van het gescheurd hemd aan de huizen is in verschillende fasen gebouwd de straatnamen verwijzen naar de geschiedenis pastoor tilmanstraat pastoor mandersstraat in de jaren \'90 zijn daar ploeg eg greep aan toegevoegd de laatste uitbreiding dateert van 2005 afbeelding nieuwbouw_001 jpg afbeelding nieuwbouw_002 jpg afbeelding nieuwbouw_003 jpg afbeelding nieuwbouw_005 jpg mijlstraat mijlstraat mijlstraat straat lennisheuvel armehoefstraat armehoefstraat armehoefstraat ');
insert into `searchindex` values ('23', 'sneeuw 001', ' ');
insert into `searchindex` values ('24', 'nieuwbouw 005', ' ');
insert into `searchindex` values ('25', 'nieuwbouw 001', ' ');
insert into `searchindex` values ('26', 'nieuwbouw 002', ' ');
insert into `searchindex` values ('27', 'nieuwbouw 003', ' ');
insert into `searchindex` values ('28', 'gebeurtenissen', ' kindervakantiewerk kindervakantiewerk kindervakantiewerk ieder jaar al sinds de oprichting in 19 organiseert het kindervakantiecomite een aantal activiteiten waarvan de belangrijkste de jaarlijks terugkerende zomeractiviteiten in het dorp bekend als kindervakantiewerk wat te begrijpen valt als je het enthousiasme ziet van alle deelnemers in de leeftijd van 4 tot 12 jaar tegenwoordig worden er traditioneel hutten gebouwd van oude pallets en hout blijkens deze foto uit 1985 was er ook toen al een avondactiviteit afbeelding vacantiewerk_005 jpg thumb onderstaande afbeeldingen laten zien hoe het midden jaren \'80 verliep tijdens deze kindervakantieweek naast de orion waar nog geen kiosk stond afbeelding vacantiewerk_001 jpg afbeelding vacantiewerk_002 jpg afbeelding vacantiewerk_003 jpg afbeelding vacantiewerk_004 jpg wie staan er op deze foto foto\'s wie staan er op deze foto foto\'s wie staan er op deze foto foto\'s koninginnedag koninginnedag koninginnedag kerst nieuwkomersavond nieuwkomersavond nieuwkomersavond nieuwe pastoor lennisfist lennisfist lennisfist ');
insert into `searchindex` values ('29', 'vacantiewerk 001', ' ');
insert into `searchindex` values ('30', 'vacantiewerk 002', ' ');
insert into `searchindex` values ('31', 'vacantiewerk 003', ' ');
insert into `searchindex` values ('32', 'vacantiewerk 004', ' ');
insert into `searchindex` values ('33', 'vacantiewerk 005', ' ');
insert into `searchindex` values ('34', 'geschiedenis orion 003', ' ');
insert into `searchindex` values ('35', 'geschiedenis orion 004', ' ');
insert into `searchindex` values ('36', 'theresiakerk', ' de parochiekerk is in 1926 gesticht door pastoor manders ');


### structure of table `site_stats` ###

DROP TABLE IF EXISTS `site_stats`;

CREATE TABLE `site_stats` (
  `ss_row_id` int(10) unsigned NOT NULL,
  `ss_total_views` bigint(20) unsigned default '0',
  `ss_total_edits` bigint(20) unsigned default '0',
  `ss_good_articles` bigint(20) unsigned default '0',
  `ss_total_pages` bigint(20) default '-1',
  `ss_users` bigint(20) default '-1',
  `ss_admins` int(11) default '-1',
  `ss_images` int(11) default '0',
  UNIQUE KEY `ss_row_id` (`ss_row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;


### data of table `site_stats` ###

insert into `site_stats` values ('1', '830', '115', '4', '36', '10', '1', '27');


### structure of table `templatelinks` ###

DROP TABLE IF EXISTS `templatelinks`;

CREATE TABLE `templatelinks` (
  `tl_from` int(10) unsigned NOT NULL default '0',
  `tl_namespace` int(11) NOT NULL default '0',
  `tl_title` varbinary(255) NOT NULL default '',
  UNIQUE KEY `tl_from` (`tl_from`,`tl_namespace`,`tl_title`),
  KEY `tl_namespace` (`tl_namespace`,`tl_title`,`tl_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;


### data of table `templatelinks` ###



### structure of table `text` ###

DROP TABLE IF EXISTS `text`;

CREATE TABLE `text` (
  `old_id` int(10) unsigned NOT NULL auto_increment,
  `old_text` mediumblob NOT NULL,
  `old_flags` tinyblob NOT NULL,
  PRIMARY KEY  (`old_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary MAX_ROWS=10000000 AVG_ROW_LENGTH=10240 AUTO_INCREMENT=115;


### data of table `text` ###

insert into `text` values ('1', '<big>\'\'\'De installatie van MediaWiki is geslaagd.\'\'\'</big>\n\nRaadpleeg de [http://meta.wikimedia.org/wiki/NL_Help:Inhoudsopgave handleiding] voor informatie over het gebruik van de wikisoftware.\n\n== Meer hulp over MediaWiki ==\n\n* [http://www.mediawiki.org/wiki/Manual:Configuration_settings Lijst met instellingen]\n* [http://www.mediawiki.org/wiki/Manual:FAQ Veelgestelde vragen (FAQ)]\n* [https://lists.wikimedia.org/mailman/listinfo/mediawiki-announce Mailinglijst voor aankondigingen van nieuwe versies]', 'utf-8');
insert into `text` values ('2', '', 'utf-8');
insert into `text` values ('3', '<big>\'\'\'De installatie van MediaWiki is geslaagd.\'\'\'</big>\n\nRaadpleeg de [http://meta.wikimedia.org/wiki/NL_Help:Inhoudsopgave handleiding] voor informatie over het gebruik van de wikisoftware.', 'utf-8');
insert into `text` values ('4', '<big>\'\'\'Historische Kamer\'\'\'</big>\n\nDe levende geschiedenis van Lennisheuvel \n\nIn deze kamer van de website zijn we aangeland in het WIKI gedeelte. In een WIKI kunt U een bijdrage leveren aan de inhoud van de website! En we hebben u nodig omdat het voor √©√©n persoon onmogelijk is om allerlei historische informatie over Lennisheuvel te verzamelen. \n\nNu realiseer ik mij dat niet iedereen even handig is met de computer. Maar dat hoeft ook niet; de jeugd si dit vaak wel! Misschien eens een leuk idee om een kleinkind u te laten interviewen en dat het kleinkind het resultaat in deze WIKI publiceert. Of een project op de middelbare school, wat een bepaald stukje geschiedschrijving over Lennisheuvel tot gevolg heeft. Ide√´en en mogelijkheden te over.', 'utf-8');
insert into `text` values ('5', '#REDIRECT [[Historische Kamer]]', 'utf-8');
insert into `text` values ('6', 'De levende geschiedenis van Lennisheuvel \n\nIn deze kamer van de website zijn we aangeland in het WIKI gedeelte. In een WIKI kunt U een bijdrage leveren aan de inhoud van de website! En we hebben u nodig omdat het voor √©√©n persoon onmogelijk is om allerlei historische informatie over Lennisheuvel te verzamelen. \n\nNu realiseer ik mij dat niet iedereen even handig is met de computer. Maar dat hoeft ook niet; de jeugd si dit vaak wel! Misschien eens een leuk idee om een kleinkind u te laten interviewen en dat het kleinkind het resultaat in deze WIKI publiceert. Of een project op de middelbare school, wat een bepaald stukje geschiedschrijving over Lennisheuvel tot gevolg heeft. Ide√´en en mogelijkheden te over.', 'utf-8');
insert into `text` values ('7', '* navigation\n** mainpage|mainpage-description\n** portal-url|portal\n** currentevents-url|currentevents\n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help\n* Categorien levende geschiedenis\n** Families\n** Personen\n** Gebouwen\n** Straten\n* SEARCH\n* TOOLBOX\n* LANGUAGES', 'utf-8');
insert into `text` values ('8', 'De Historische Kamer wordt gevuld met \'De Levende Geschiedenis van Lennisheuvel\'.\n\nIn deze kamer van de website zijn we aangeland in het WIKI gedeelte. In een WIKI kunt U een bijdrage leveren aan de inhoud van de website! En we hebben u nodig omdat het voor √©√©n persoon onmogelijk is om allerlei historische informatie over Lennisheuvel te verzamelen. \n\nNu realiseer ik mij dat niet iedereen even handig is met de computer. Maar dat hoeft ook niet; de jeugd si dit vaak wel! Misschien eens een leuk idee om een kleinkind u te laten interviewen en dat het kleinkind het resultaat in deze WIKI publiceert. Of een project op de middelbare school, wat een bepaald stukje geschiedschrijving over Lennisheuvel tot gevolg heeft. Ide√´en en mogelijkheden te over.', 'utf-8');
insert into `text` values ('9', '* navigation\n** mainpage|mainpage-description\n** portal-url|portal\n** currentevents-url|currentevents\n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help\n* Categorie√´n levende geschiedenis\n** Families\n** Personen\n** Gebouwen\n** Straten\n* SEARCH\n* TOOLBOX\n* LANGUAGES', 'utf-8');
insert into `text` values ('10', '* navigation\n** mainpage|mainpage-description\n** portal-url|portal\n** currentevents-url|currentevents\n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help\n\n* Categorie√´n Levende Geschiedenis\n** Families\n** Personen\n** Gebouwen\n** Straten\n\n* SEARCH\n* TOOLBOX\n* LANGUAGES', 'utf-8');
insert into `text` values ('11', '* navigation\n** mainpage|mainpage-description\n** portal-url|portal\n** currentevents-url|currentevents\n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help\n* Categorie√´n Levende Geschiedenis\n** Families\n** Personen\n** Gebouwen\n** Straten\n* SEARCH\n* TOOLBOX\n* LANGUAGES', 'utf-8');
insert into `text` values ('12', '* navigation\n** mainpage|mainpage-description\n** portal-url|portal\n** currentevents-url|currentevents\n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help\n* Categorie√´n Levende Geschiedenis\n** Families\n** Personen\n** Gebouwen\n** Straten\n* TOOLBOX\n* LANGUAGES', 'utf-8');
insert into `text` values ('13', '* navigation\n** mainpage|mainpage-description\n** portal-url|portal\n** currentevents-url|currentevents\n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help\n* Categorie√´n Levende Geschiedenis\n** Families\n** Personen\n** Gebouwen\n** Straten\n* SEARCH\n* TOOLBOX\n* LANGUAGES', 'utf-8');
insert into `text` values ('14', '* navigation\n** aap\n** mainpage|mainpage-description\n** portal-url|portal\n** currentevents-url|currentevents\n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help\n* Categorie√´n Levende Geschiedenis\n** Families\n** Personen\n** Gebouwen\n** Straten\n* SEARCH\n* TOOLBOX\n* LANGUAGES', 'utf-8');
insert into `text` values ('15', '* navigation\n** mainpage|mainpage-description\n** portal-url|portal\n** currentevents-url|currentevents\n** recentchanges-url|recentchanges\n** randompage-url|randompage\n* Categorie√´n Levende Geschiedenis\n** Families\n** Personen\n** Gebouwen\n** Straten\n* SEARCH\n* TOOLBOX\n* LANGUAGES', 'utf-8');
insert into `text` values ('16', '* navigation\n** mainpage|mainpage-description\n** portal-url|portal\n** currentevents-url|currentevents\n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help\n* Categorie√´n\n** Families|Families\n** Personen|Personen\n** Gebouwen|Gebouwen\n** Straten|Straten\n* SEARCH\n* TOOLBOX\n* LANGUAGES', 'utf-8');
insert into `text` values ('17', '== Sint Theresia school ==\n\n== Sint Theresia kerk ==\n\n== Acht Zaligheden ==\n\n== Gemeenschapshuis Orion ==', 'utf-8');
insert into `text` values ('18', '== Sint Theresia school ==\n\n== Sint Theresia kerk ==\n\n=== Het orgel ===\nGebouwd door Fa. L. Verschueren, Heythuysen 1950; met oud materiaal uit UDEN kl kruisheren; EP II vp: Hw 4-Nw 4-Ped 1. ingespeeld door Huub Hou?t, 1950.\n\nRenovatie Fa. L. Verschueren, Heythuysen 1970; EP II vp: 9\n\n\'\'\'Dispositie\'\'\'\n1970:\nHoofdwerk (manuaal I)\nPrestant 8, Bourdon 8, Octaaf 4, Nasard 2 2/3\nNevenwerk (manuaal II)\nGamba 8, Holpijp 8, Fl√ªte harmonique 4, Doublette 2\nPedaal\nSubbas 16\n\n== Acht Zaligheden ==\n\n== Gemeenschapshuis Orion ==', 'utf-8');
insert into `text` values ('19', '== Sint Theresia school ==\n\n== Sint Theresia kerk ==\n\n=== Het orgel ===\nGebouwd door Fa. L. Verschueren, Heythuysen 1950; met oud materiaal uit UDEN kl kruisheren; EP II vp: Hw 4-Nw 4-Ped 1. ingespeeld door Huub Hou?t, 1950.\n\nRenovatie Fa. L. Verschueren, Heythuysen 1970; EP II vp: 9\n\n\'\'\'Dispositie\'\'\'\n1970:\nHoofdwerk (manuaal I)</br>\nPrestant 8, Bourdon 8, Octaaf 4, Nasard 2 2/3\nNevenwerk (manuaal II)</br>\nGamba 8, Holpijp 8, Fl√ªte harmonique 4, Doublette 2\nPedaal</br>\nSubbas 16\n\n== Acht Zaligheden ==\n\n== Gemeenschapshuis Orion ==', 'utf-8');
insert into `text` values ('20', '== Sint Theresia school ==\n\n== Sint Theresia kerk ==\n\n=== Het orgel ===\nGebouwd door Fa. L. Verschueren, Heythuysen 1950; met oud materiaal uit UDEN kl kruisheren; EP II vp: Hw 4-Nw 4-Ped 1. ingespeeld door Huub Hou?t, 1950.\n\nRenovatie Fa. L. Verschueren, Heythuysen 1970; EP II vp: 9\n\n\'\'\'Dispositie\'\'\'\n1970:\nHoofdwerk (manuaal I)<br>\nPrestant 8, Bourdon 8, Octaaf 4, Nasard 2 2/3\nNevenwerk (manuaal II)<br>\nGamba 8, Holpijp 8, Fl√ªte harmonique 4, Doublette 2\nPedaal<br>\nSubbas 16\n\n== Acht Zaligheden ==\n\n== Gemeenschapshuis Orion ==', 'utf-8');
insert into `text` values ('21', '== Sint Theresia school ==\n\n== Sint Theresia kerk ==\n\n=== Het orgel ===\nGebouwd door Fa. L. Verschueren, Heythuysen 1950; met oud materiaal uit UDEN kl kruisheren; EP II vp: Hw 4-Nw 4-Ped 1. ingespeeld door Huub Hou?t, 1950.\n\nRenovatie Fa. L. Verschueren, Heythuysen 1970; EP II vp: 9\n\n\'\'\'Dispositie\'\'\'\nHoofdwerk (manuaal I)<br>\nPrestant 8, Bourdon 8, Octaaf 4, Nasard 2 2/3\nNevenwerk (manuaal II)<br>\nGamba 8, Holpijp 8, Fl√ªte harmonique 4, Doublette 2\nPedaal<br>\nSubbas 16\n\n== Acht Zaligheden ==\n\n== Gemeenschapshuis Orion ==', 'utf-8');
insert into `text` values ('22', '== Sint Theresia school ==\n\n== Sint Theresia kerk ==\n\n=== Het orgel ===\nGebouwd door Fa. L. Verschueren, Heythuysen 1950; met oud materiaal uit UDEN kl kruisheren; EP II vp: Hw 4-Nw 4-Ped 1. ingespeeld door Huub Hou?t, 1950.\n\nRenovatie Fa. L. Verschueren, Heythuysen 1970; EP II vp: 9\n\n\'\'\'Dispositie\'\'\'<br>\nHoofdwerk (manuaal I)<br>\nPrestant 8, Bourdon 8, Octaaf 4, Nasard 2 2/3\nNevenwerk (manuaal II)<br>\nGamba 8, Holpijp 8, Fl√ªte harmonique 4, Doublette 2\nPedaal<br>\nSubbas 16\n\n== Acht Zaligheden ==\n\n== Gemeenschapshuis Orion ==', 'utf-8');
insert into `text` values ('23', '* Categorie√´n\n** Families|Families\n** Personen|Personen\n** Gebouwen|Gebouwen\n** Straten|Straten\n* navigation\n** mainpage|mainpage-description\n** portal-url|portal\n** currentevents-url|currentevents\n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help\n* SEARCH\n* TOOLBOX\n* LANGUAGES', 'utf-8');
insert into `text` values ('24', '* Categorie√´n\n** Families|Families\n** Personen|Personen\n** Gebouwen|Gebouwen\n** Straten|Straten\n* SEARCH\n* navigation\n** mainpage|mainpage-description\n** portal-url|portal\n** currentevents-url|currentevents\n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help\n\n* TOOLBOX\n* LANGUAGES', 'utf-8');
insert into `text` values ('25', '* Categorie√´n\n** Families|Families\n** Personen|Personen\n** Gebouwen|Gebouwen\n** Straten|Straten\n** Verenigingen|Verenigingen\n** Gebeurtenissen|Gebeurtenissen\n* SEARCH\n* navigation\n** mainpage|mainpage-description\n** portal-url|portal\n** currentevents-url|currentevents\n** helppage|help\n\n* TOOLBOX\n* LANGUAGES', 'utf-8');
insert into `text` values ('26', '* Categorie√´n\n** Families|Families\n** Personen|Personen\n** Gebouwen|Gebouwen\n** Straten|Straten\n** Verenigingen|Verenigingen\n** Gebeurtenissen|Gebeurtenissen\n* SEARCH\n* navigation\n** mainpage|mainpage-description\n** currentevents-url|currentevents\n** helppage|help\n\n* TOOLBOX\n* LANGUAGES', 'utf-8');
insert into `text` values ('27', '== Sint Theresia school ==\n\n== Sint Theresia kerk ==\n\n=== Het orgel ===\nGebouwd door Fa. L. Verschueren, Heythuysen 1950; met oud materiaal uit UDEN kl kruisheren; EP II vp: Hw 4-Nw 4-Ped 1. ingespeeld door Huub Hou?t, 1950.\n\nRenovatie Fa. L. Verschueren, Heythuysen 1970; EP II vp: 9\n\n\'\'\'Dispositie\'\'\'<br>\nHoofdwerk (manuaal I)<br>\nPrestant 8, Bourdon 8, Octaaf 4, Nasard 2 2/3\nNevenwerk (manuaal II)<br>\nGamba 8, Holpijp 8, Fl√ªte harmonique 4, Doublette 2\nPedaal<br>\nSubbas 16\n\n== Acht Zaligheden ==\n\n== Gemeenschapshuis Orion ==\nOpgericht in 1948 onder bezielende leiding van de toenmalige pastoor Manders.\nDe Orion is het kloppend hart van de gemeenschap Lennisheuvel.\n[[Afbeelding:Voorbeeld.png]]', 'utf-8');
insert into `text` values ('28', '', 'utf-8');
insert into `text` values ('29', '== Sint Theresia school ==\n\n== Sint Theresia kerk ==\n\n=== Het orgel ===\nGebouwd door Fa. L. Verschueren, Heythuysen 1950; met oud materiaal uit UDEN kl kruisheren; EP II vp: Hw 4-Nw 4-Ped 1. ingespeeld door Huub Hou?t, 1950.\n\nRenovatie Fa. L. Verschueren, Heythuysen 1970; EP II vp: 9\n\n\'\'\'Dispositie\'\'\'<br>\nHoofdwerk (manuaal I)<br>\nPrestant 8, Bourdon 8, Octaaf 4, Nasard 2 2/3\nNevenwerk (manuaal II)<br>\nGamba 8, Holpijp 8, Fl√ªte harmonique 4, Doublette 2\nPedaal<br>\nSubbas 16\n\n== Acht Zaligheden ==\n\n== Gemeenschapshuis Orion ==\nOpgericht in 1948 onder bezielende leiding van de toenmalige pastoor Manders.\nDe Orion is het kloppend hart van de gemeenschap Lennisheuvel.\n[[Afbeelding:Geschiedenis_Orion_001.jpg]]\nHier ziet u de Fanfare Sint Arnoldus die in de kerk een mis opluistert ter ere van het 40-jarig bestaan van de Orion (1988, foto C. Willers)', 'utf-8');
insert into `text` values ('30', '[[afbeelding:sleutel.gif]]', 'utf-8');
insert into `text` values ('31', '[[afbeelding:Afbeelding:Geschiedenis_Orion_001.JPG]]', 'utf-8');
insert into `text` values ('32', '[[afbeelding:Geschiedenis_Orion_001.JPG]]', 'utf-8');
insert into `text` values ('33', '', 'utf-8');
insert into `text` values ('34', '== Sint Theresia school ==\n\n== Sint Theresia kerk ==\n\n=== Het orgel ===\nGebouwd door Fa. L. Verschueren, Heythuysen 1950; met oud materiaal uit UDEN kl kruisheren; EP II vp: Hw 4-Nw 4-Ped 1. ingespeeld door Huub Hou?t, 1950.\n\nRenovatie Fa. L. Verschueren, Heythuysen 1970; EP II vp: 9\n\n\'\'\'Dispositie\'\'\'<br>\nHoofdwerk (manuaal I)<br>\nPrestant 8, Bourdon 8, Octaaf 4, Nasard 2 2/3\nNevenwerk (manuaal II)<br>\nGamba 8, Holpijp 8, Fl√ªte harmonique 4, Doublette 2\nPedaal<br>\nSubbas 16\n\n== Acht Zaligheden ==\n\n== Gemeenschapshuis Orion ==\nDe Orion is het kloppend hart van de gemeenschap Lennisheuvel. Opgericht in 1948 onder bezielende leiding van de toenmalige pastoor Manders.\n\n[[afbeelding:Geschiedenis_Orion_001.jpg]]\nHier ziet u de Fanfare Sint Arnoldus die in de kerk een mis opluistert ter ere van het 40-jarig bestaan van de Orion (1988, foto C. Willers)', 'utf-8');
insert into `text` values ('35', '', 'utf-8');
insert into `text` values ('36', '== Sint Theresia school ==\n\n== Sint Theresia kerk ==\n\n=== Het orgel ===\nGebouwd door Fa. L. Verschueren, Heythuysen 1950; met oud materiaal uit UDEN kl kruisheren; EP II vp: Hw 4-Nw 4-Ped 1. ingespeeld door Huub Hou?t, 1950.\n\nRenovatie Fa. L. Verschueren, Heythuysen 1970; EP II vp: 9\n\n\'\'\'Dispositie\'\'\'<br>\nHoofdwerk (manuaal I)<br>\nPrestant 8, Bourdon 8, Octaaf 4, Nasard 2 2/3\nNevenwerk (manuaal II)<br>\nGamba 8, Holpijp 8, Fl√ªte harmonique 4, Doublette 2\nPedaal<br>\nSubbas 16\n\n== Acht Zaligheden ==\n\n== Gemeenschapshuis Orion ==\nDe Orion is het kloppend hart van de gemeenschap Lennisheuvel. Opgericht in 1948 onder bezielende leiding van de toenmalige pastoor Manders.\n\n[[afbeelding:Geschiedenis_Orion_001.jpg]]\nHier ziet u de Fanfare Sint Arnoldus die in de kerk een mis opluistert ter ere van het 40-jarig bestaan van de Orion (1988, foto C. Willers)\n[[Afbeelding:Geschiedenis_Orion_002.jpg]]\nEveneens ter gelegenheid van het 40-jarig bestaan werd er in de toenmalige kiosk een dansje opgevoerd (1988, foto C. Willers).\n-> Wie weet nog wie hier op de foto staan? <-', 'utf-8');
insert into `text` values ('37', '== Sint Theresia school ==\n\n== Sint Theresia kerk ==\n\n=== Het orgel ===\nGebouwd door Fa. L. Verschueren, Heythuysen 1950; met oud materiaal uit UDEN kl kruisheren; EP II vp: Hw 4-Nw 4-Ped 1. ingespeeld door Huub Hou?t, 1950.\n\nRenovatie Fa. L. Verschueren, Heythuysen 1970; EP II vp: 9\n\n\'\'\'Dispositie\'\'\'<br>\nHoofdwerk (manuaal I)<br>\nPrestant 8, Bourdon 8, Octaaf 4, Nasard 2 2/3\nNevenwerk (manuaal II)<br>\nGamba 8, Holpijp 8, Fl√ªte harmonique 4, Doublette 2\nPedaal<br>\nSubbas 16\n\n== Acht Zaligheden ==\n\n== Gemeenschapshuis Orion ==\nDe Orion is het kloppend hart van de gemeenschap Lennisheuvel. Opgericht in 1948 onder bezielende leiding van de toenmalige pastoor Manders.\n\n[[Afbeelding:Geschiedenis_Orion_001.JPG]]\n\nHier ziet u de Fanfare Sint Arnoldus die in de kerk een mis opluistert ter ere van het 40-jarig bestaan van de Orion (1988, foto C. Willers)\n\n[[Afbeelding:Geschiedenis_Orion_002.jpg]]\n\nEveneens ter gelegenheid van het 40-jarig bestaan werd er in de toenmalige kiosk een dansje opgevoerd (1988, foto C. Willers).\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'', 'utf-8');
insert into `text` values ('38', '== Sint Theresia school ==\n\n== Sint Theresia kerk ==\n\n=== Het orgel ===\nGebouwd door Fa. L. Verschueren, Heythuysen 1950; met oud materiaal uit UDEN kl kruisheren; EP II vp: Hw 4-Nw 4-Ped 1. ingespeeld door Huub Hou?t, 1950.\n\nRenovatie Fa. L. Verschueren, Heythuysen 1970; EP II vp: 9\n\n\'\'\'Dispositie\'\'\'<br>\nHoofdwerk (manuaal I)<br>\nPrestant 8, Bourdon 8, Octaaf 4, Nasard 2 2/3\nNevenwerk (manuaal II)<br>\nGamba 8, Holpijp 8, Fl√ªte harmonique 4, Doublette 2\nPedaal<br>\nSubbas 16\n\n== Acht Zaligheden ==\n\n== Gemeenschapshuis Orion ==\nDe Orion is het kloppend hart van de gemeenschap Lennisheuvel. Opgericht in 1948 onder bezielende leiding van de toenmalige pastoor Manders.\n\n[[Afbeelding:Geschiedenis_Orion_001.JPG]]\n\nHierboven ziet u de Fanfare Sint Arnoldus die in de kerk een mis opluistert ter ere van het 40-jarig bestaan van de Orion (1988, foto C. Willers)\n\n[[Afbeelding:Geschiedenis_Orion_002.jpg]]\n\nEveneens ter gelegenheid van het 40-jarig bestaan werd er in de toenmalige kiosk een dansje in klederdracht opgevoerd (1988, foto C. Willers).\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n\nOok was er een feestavond in de Orion zelf\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n[[Afbeelding:40_jaar_Orion_001.jpg]]', 'utf-8');
insert into `text` values ('39', '', 'utf-8');
insert into `text` values ('40', '', 'utf-8');
insert into `text` values ('41', '== Sint Theresia school ==\n\n== Sint Theresia kerk ==\n\n=== Het orgel ===\nGebouwd door Fa. L. Verschueren, Heythuysen 1950; met oud materiaal uit UDEN kl kruisheren; EP II vp: Hw 4-Nw 4-Ped 1. ingespeeld door Huub Hou?t, 1950.\n\nRenovatie Fa. L. Verschueren, Heythuysen 1970; EP II vp: 9\n\n\'\'\'Dispositie\'\'\'<br>\nHoofdwerk (manuaal I)<br>\nPrestant 8, Bourdon 8, Octaaf 4, Nasard 2 2/3\nNevenwerk (manuaal II)<br>\nGamba 8, Holpijp 8, Fl√ªte harmonique 4, Doublette 2\nPedaal<br>\nSubbas 16\n\n== Acht Zaligheden ==\n\n== Gemeenschapshuis Orion ==\nDe Orion is het kloppend hart van de gemeenschap Lennisheuvel. Opgericht in 1948 onder bezielende leiding van de toenmalige pastoor Manders.\n\n[[Afbeelding:Geschiedenis_Orion_001.JPG]]\n\nHierboven ziet u de Fanfare Sint Arnoldus die in de kerk een mis opluistert ter ere van het 40-jarig bestaan van de Orion (1988, foto C. Willers)\n\n[[Afbeelding:Geschiedenis_Orion_002.jpg]]\n\nEveneens ter gelegenheid van het 40-jarig bestaan werd er in de toenmalige kiosk een dansje in klederdracht opgevoerd (1988, foto C. Willers).\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n\nOok was er een feestavond in de Orion zelf\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n[[Afbeelding:40jr_Orion_001.JPG]] [[Afbeelding:40jr_Orion_002.JPG]]', 'utf-8');
insert into `text` values ('42', '\n== Fanfare Sint Arnoldus ==\n\nDe fanfare Sint Arnoldus is opgericht in 1969 en bestaat anno 2009 dus 40 jaar. Hier enkele plaatjes uit de oude doos om het rijke verleden van deze fanfare te illustreren gemaakt door C. Willers, 1984-1986?).\n[[Afbeelding:Geschiedenis_Orion_001.JPG]]', 'utf-8');
insert into `text` values ('43', '\n== Fanfare Sint Arnoldus ==\n\nDe fanfare Sint Arnoldus is opgericht in 1949 en bestaat anno 2009 dus 60 jaar. In de achterliggende 60 jaren heeft de fanfare haar bestaansrecht  in Lennisheuvel bewezen en hebben vele inwoners kennis gemaakt met het musiceren in verenigingsverband. Alleszins reden om dit 60-jarig bestaan feestelijk te vieren. De fanfare heeft ook een eigen website: zie [http://www.fanfare-sintarnoldus.nl/] waar deze tekst aan is ontleend. Hier enkele plaatjes uit de oude doos om het rijke verleden van deze fanfare te illustreren (gemaakt door C. Willers, 1984-1986?).\n[[Afbeelding:Geschiedenis_Orion_001.JPG]]', 'utf-8');
insert into `text` values ('44', '\n== Fanfare Sint Arnoldus ==\n\nDe fanfare Sint Arnoldus is opgericht in 1949 en bestaat anno 2009 dus 60 jaar. In de achterliggende 60 jaren heeft de fanfare haar bestaansrecht  in Lennisheuvel bewezen en hebben vele inwoners kennis gemaakt met het musiceren in verenigingsverband. Alleszins reden om dit 60-jarig bestaan feestelijk te vieren. De fanfare heeft ook een eigen website: zie [http://www.fanfare-sintarnoldus.nl/] waar deze tekst aan is ontleend. Hier enkele plaatjes uit de oude doos om het rijke verleden van deze fanfare te illustreren (gemaakt door C. Willers, 1984-1986?).\n[[Afbeelding:Geschiedenis_Orion_001.JPG]]\n[[Afbeelding:Fanfare_001.jpg]]\n[[Afbeelding:Fanfare_002.jpg]]\n[[Afbeelding:Fanfare_003a.jpg]]\n[[Afbeelding:Fanfare_004.jpg]]\n[[Afbeelding:Fanfare_005.jpg]]\n[[Afbeelding:Fanfare_006.jpg]]\n[[Afbeelding:Fanfare_007.jpg]]', 'utf-8');
insert into `text` values ('45', '', 'utf-8');
insert into `text` values ('46', '', 'utf-8');
insert into `text` values ('47', '', 'utf-8');
insert into `text` values ('48', '\n== Fanfare Sint Arnoldus ==\n\nDe fanfare Sint Arnoldus is opgericht in 1949 en bestaat anno 2009 dus 60 jaar. In de achterliggende 60 jaren heeft de fanfare haar bestaansrecht  in Lennisheuvel bewezen en hebben vele inwoners kennis gemaakt met het musiceren in verenigingsverband. Alleszins reden om dit 60-jarig bestaan feestelijk te vieren. De fanfare heeft ook een eigen website: zie [http://www.fanfare-sintarnoldus.nl/] waar deze tekst aan is ontleend. Hier enkele plaatjes uit de oude doos om het rijke verleden van deze fanfare te illustreren (gemaakt door C. Willers, 1984-1986?).\n[[Afbeelding:Geschiedenis_Orion_001.JPG]]\n[[Afbeelding:Fanfare_001.JPG]]\n[[Afbeelding:Fanfare_002.JPG]]\n[[Afbeelding:Fanfare_003a.JPG]]\n[[Afbeelding:Fanfare_004.JPG]]\n[[Afbeelding:Fanfare_005.JPG]]\n[[Afbeelding:Fanfare_006.JPG]]\n[[Afbeelding:Fanfare_007.JPG]]\n\nWie weet wanneer deze foto\'s zijn gemaakt?', 'utf-8');
insert into `text` values ('49', '', 'utf-8');
insert into `text` values ('50', '', 'utf-8');
insert into `text` values ('51', '', 'utf-8');
insert into `text` values ('52', '', 'utf-8');
insert into `text` values ('53', '== Sint Theresia school ==\n\n== Sint Theresia kerk ==\n\n=== Het orgel ===\nGebouwd door Fa. L. Verschueren, Heythuysen 1950; met oud materiaal uit UDEN kl kruisheren; EP II vp: Hw 4-Nw 4-Ped 1. ingespeeld door Huub Hou?t, 1950.\n\nRenovatie Fa. L. Verschueren, Heythuysen 1970; EP II vp: 9\n\n\'\'\'Dispositie\'\'\'<br>\nHoofdwerk (manuaal I)<br>\nPrestant 8, Bourdon 8, Octaaf 4, Nasard 2 2/3\nNevenwerk (manuaal II)<br>\nGamba 8, Holpijp 8, Fl√ªte harmonique 4, Doublette 2\nPedaal<br>\nSubbas 16\n\n== Acht Zaligheden ==\n\n== Gemeenschapshuis Orion ==\nDe Orion is het kloppend hart van de gemeenschap Lennisheuvel. Opgericht in 1948 onder bezielende leiding van de toenmalige pastoor Manders. Hier links op de foto naast de in 2004? gerealiseerde kiosk.\n[[Afbeelding:Centrum_Lennisheuvel.JPG]]\n\nDe Orion is nauw verbonden met mensen, verenigingen en gebeurtenissen in het dorp.\n[[Afbeelding:Geschiedenis_Orion_001.JPG]]\n\nHierboven ziet u de Fanfare Sint Arnoldus die in de kerk een mis opluistert ter ere van het 40-jarig bestaan van de Orion (1988, foto C. Willers)\n\n[[Afbeelding:Geschiedenis_Orion_002.jpg]]\n\nEveneens ter gelegenheid van het 40-jarig bestaan werd er in de toenmalige kiosk een dansje in klederdracht opgevoerd (1988, foto C. Willers).\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n\nOok was er een feestavond in de Orion zelf\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n[[Afbeelding:40jr_Orion_001.JPG]] [[Afbeelding:40jr_Orion_002.JPG]]', 'utf-8');
insert into `text` values ('54', '', 'utf-8');
insert into `text` values ('55', '[[afbeelding:Fanfare_007.JPG]]', 'utf-8');
insert into `text` values ('56', '[[afbeelding:Fanfare_007.JPG|thumbnail]]', 'utf-8');
insert into `text` values ('57', '[[afbeelding:Fanfare_007.JPG|100px]]', 'utf-8');
insert into `text` values ('58', '[[Plaatjes]]\nKijk op [http://nl.wikipedia.org/wiki/Help:Gebruik_van_bestanden#Een_bestand_plaatsen:_thumbnail deze pagina] voor verschillende mogelijkheden met plaatjes op een pagina. \nTIP: gebruik zoveel mogelijk \'thumbnails\' om de pagina overzichtelijk te houden.', 'utf-8');
insert into `text` values ('59', '*Plaatjes\nKijk op [http://nl.wikipedia.org/wiki/Help:Gebruik_van_bestanden#Een_bestand_plaatsen:_thumbnail deze pagina] voor verschillende mogelijkheden met plaatjes op een pagina. \nTIP: gebruik zoveel mogelijk \'thumbnails\' om de pagina overzichtelijk te houden.', 'utf-8');
insert into `text` values ('60', '== Plaatjes ==\nKijk op [http://nl.wikipedia.org/wiki/Help:Gebruik_van_bestanden#Een_bestand_plaatsen:_thumbnail deze pagina] voor verschillende mogelijkheden met plaatjes op een pagina. \nTIP: gebruik zoveel mogelijk \'thumbnails\' om de pagina overzichtelijk te houden.', 'utf-8');
insert into `text` values ('61', '== Sint Theresia school ==\n\n== Sint Theresia kerk ==\n\n=== Het orgel ===\nGebouwd door Fa. L. Verschueren, Heythuysen 1950; met oud materiaal uit UDEN kl kruisheren; EP II vp: Hw 4-Nw 4-Ped 1. ingespeeld door Huub Hou?t, 1950.\n\nRenovatie Fa. L. Verschueren, Heythuysen 1970; EP II vp: 9\n\n\'\'\'Dispositie\'\'\'<br>\nHoofdwerk (manuaal I)<br>\nPrestant 8, Bourdon 8, Octaaf 4, Nasard 2 2/3\nNevenwerk (manuaal II)<br>\nGamba 8, Holpijp 8, Fl√ªte harmonique 4, Doublette 2\nPedaal<br>\nSubbas 16\n\n== Acht Zaligheden ==\n\n== Gemeenschapshuis Orion ==\nDe Orion is het kloppend hart van de gemeenschap Lennisheuvel. Opgericht in 1948 onder bezielende leiding van de toenmalige pastoor Manders. Hier links op de foto naast de in 2004? gerealiseerde kiosk.\n[[Afbeelding:Centrum_Lennisheuvel.JPG | thumb]]\n\nDe Orion is nauw verbonden met mensen, verenigingen en gebeurtenissen in het dorp.\n[[Afbeelding:Geschiedenis_Orion_001.JPG]]\n\nHierboven ziet u de Fanfare Sint Arnoldus die in de kerk een mis opluistert ter ere van het 40-jarig bestaan van de Orion (1988, foto C. Willers)\n\n[[Afbeelding:Geschiedenis_Orion_002.jpg]]\n\nEveneens ter gelegenheid van het 40-jarig bestaan werd er in de toenmalige kiosk een dansje in klederdracht opgevoerd (1988, foto C. Willers).\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n\nOok was er een feestavond in de Orion zelf\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n[[Afbeelding:40jr_Orion_001.JPG]] [[Afbeelding:40jr_Orion_002.JPG]]', 'utf-8');
insert into `text` values ('62', '== Sint Theresia school ==\n\n== Sint Theresia kerk ==\n\n=== Het orgel ===\nGebouwd door Fa. L. Verschueren, Heythuysen 1950; met oud materiaal uit UDEN kl kruisheren; EP II vp: Hw 4-Nw 4-Ped 1. ingespeeld door Huub Hou?t, 1950.\n\nRenovatie Fa. L. Verschueren, Heythuysen 1970; EP II vp: 9\n\n\'\'\'Dispositie\'\'\'<br>\nHoofdwerk (manuaal I)<br>\nPrestant 8, Bourdon 8, Octaaf 4, Nasard 2 2/3\nNevenwerk (manuaal II)<br>\nGamba 8, Holpijp 8, Fl√ªte harmonique 4, Doublette 2\nPedaal<br>\nSubbas 16\n\n== Acht Zaligheden ==\n\n== Gemeenschapshuis Orion ==\nDe Orion is het kloppend hart van de gemeenschap Lennisheuvel. Opgericht in 1948 onder bezielende leiding van de toenmalige pastoor Manders. Hier links op de foto naast de in 2004? gerealiseerde kiosk.\n[[Afbeelding:Centrum_Lennisheuvel.JPG]]\n\nDe Orion is nauw verbonden met mensen, verenigingen en gebeurtenissen in het dorp.\n[[Afbeelding:Geschiedenis_Orion_001.JPG| thumb]]\n\nHierboven ziet u de Fanfare Sint Arnoldus die in de kerk een mis opluistert ter ere van het 40-jarig bestaan van de Orion (1988, foto C. Willers)\n\n[[Afbeelding:Geschiedenis_Orion_002.jpg| thumb]]\n\nEveneens ter gelegenheid van het 40-jarig bestaan werd er in de toenmalige kiosk een dansje in klederdracht opgevoerd (1988, foto C. Willers).\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n\nOok was er een feestavond in de Orion zelf\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n[[Afbeelding:40jr_Orion_001.JPG]] [[Afbeelding:40jr_Orion_002.JPG| thumb]]', 'utf-8');
insert into `text` values ('63', '== Sint Theresia school ==\n\n== Sint Theresia kerk ==\n\n=== Het orgel ===\nGebouwd door Fa. L. Verschueren, Heythuysen 1950; met oud materiaal uit UDEN kl kruisheren; EP II vp: Hw 4-Nw 4-Ped 1. ingespeeld door Huub Hou?t, 1950.\n\nRenovatie Fa. L. Verschueren, Heythuysen 1970; EP II vp: 9\n\n\'\'\'Dispositie\'\'\'<br>\nHoofdwerk (manuaal I)<br>\nPrestant 8, Bourdon 8, Octaaf 4, Nasard 2 2/3\nNevenwerk (manuaal II)<br>\nGamba 8, Holpijp 8, Fl√ªte harmonique 4, Doublette 2\nPedaal<br>\nSubbas 16\n\n== Acht Zaligheden ==\n\n== Gemeenschapshuis Orion ==\nDe Orion is het kloppend hart van de gemeenschap Lennisheuvel. Opgericht in 1948 onder bezielende leiding van de toenmalige pastoor Manders. Hier links op de foto naast de in 2004? gerealiseerde kiosk.\n\n[[Afbeelding:Centrum_Lennisheuvel.JPG]]\n\nDe Orion is nauw verbonden met mensen, verenigingen en gebeurtenissen in het dorp.\n[[Afbeelding:Geschiedenis_Orion_001.JPG| thumb]]\n\nOver de geschiedenis van Orion is een serie artikelen verschenen in het dorpsorgaan Rond KErk en Orion (2008-2009).\nHier ziet u de Fanfare Sint Arnoldus die in de kerk een mis opluistert ter ere van het 40-jarig bestaan van de Orion (1988, foto C. Willers)\n\n[[Afbeelding:Geschiedenis_Orion_002.jpg| thumb]]\n\nEveneens ter gelegenheid van het 40-jarig bestaan werd er in de toenmalige kiosk een dansje in klederdracht opgevoerd (1988, foto C. Willers).\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n\nOok was er een feestavond in de Orion zelf\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n[[Afbeelding:40jr_Orion_001.JPG | thumb | Feestavond Orion 40 jaar]] [[Afbeelding:40jr_Orion_002.JPG| thumb | Feestavond Orion 40 jaar]]', 'utf-8');
insert into `text` values ('64', '== Sint Theresia school ==\n\n== Sint Theresia kerk ==\n\n=== Het orgel ===\nGebouwd door Fa. L. Verschueren, Heythuysen 1950; met oud materiaal uit UDEN kl kruisheren; EP II vp: Hw 4-Nw 4-Ped 1. ingespeeld door Huub Hou?t, 1950.\n\nRenovatie Fa. L. Verschueren, Heythuysen 1970; EP II vp: 9\n\n\'\'\'Dispositie\'\'\'<br>\nHoofdwerk (manuaal I)<br>\nPrestant 8, Bourdon 8, Octaaf 4, Nasard 2 2/3\nNevenwerk (manuaal II)<br>\nGamba 8, Holpijp 8, Fl√ªte harmonique 4, Doublette 2\nPedaal<br>\nSubbas 16\n\n== Acht Zaligheden ==\n\n== Gemeenschapshuis Orion ==\nDe Orion is het kloppend hart van de gemeenschap Lennisheuvel. Opgericht in 1948 onder bezielende leiding van de toenmalige pastoor Manders. Hier links op de foto naast de in 2004? gerealiseerde kiosk.\n\n[[Afbeelding:Centrum_Lennisheuvel.JPG]]\n\nDe Orion is nauw verbonden met mensen, verenigingen en gebeurtenissen in het dorp.\n[[Afbeelding:Geschiedenis_Orion_001.JPG| thumb]]\n\nOver de geschiedenis van Orion is een serie artikelen verschenen in het dorpsorgaan Rond Kerk en Orion (2008-2009).\nHet gebouw is in (jaartal?) uitgebreid.\nHier ziet u de Fanfare Sint Arnoldus die in de kerk een mis opluistert ter ere van het 40-jarig bestaan van de Orion (1988, foto C. Willers)\n\n[[Afbeelding:Geschiedenis_Orion_002.jpg| thumb]]\n\nEveneens ter gelegenheid van het 40-jarig bestaan werd er in de toenmalige kiosk een dansje in klederdracht opgevoerd (1988, foto C. Willers).\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n\nOok was er een feestavond in de Orion zelf\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n[[Afbeelding:40jr_Orion_001.JPG | thumb | Feestavond Orion 40 jaar]] [[Afbeelding:40jr_Orion_002.JPG| thumb | Feestavond Orion 40 jaar]]', 'utf-8');
insert into `text` values ('65', '== Sint Theresia school ==\n\n== Sint Theresia kerk ==\n\n=== Het orgel ===\nGebouwd door Fa. L. Verschueren, Heythuysen 1950; met oud materiaal uit UDEN kl kruisheren; EP II vp: Hw 4-Nw 4-Ped 1. ingespeeld door Huub Hou?t, 1950.\n\nRenovatie Fa. L. Verschueren, Heythuysen 1970; EP II vp: 9\n\n\'\'\'Dispositie\'\'\'<br>\nHoofdwerk (manuaal I)<br>\nPrestant 8, Bourdon 8, Octaaf 4, Nasard 2 2/3\nNevenwerk (manuaal II)<br>\nGamba 8, Holpijp 8, Fl√ªte harmonique 4, Doublette 2\nPedaal<br>\nSubbas 16\n\n== Acht Zaligheden ==\n\n== Gemeenschapshuis Orion ==\nDe Orion is het kloppend hart van de gemeenschap Lennisheuvel. Opgericht in 1948 onder bezielende leiding van de toenmalige pastoor Manders. Hier links op de foto naast de in 2004? gerealiseerde kiosk.\n\n[[Afbeelding:Centrum_Lennisheuvel.JPG]]\n\nDe Orion is nauw verbonden met mensen, verenigingen en gebeurtenissen in het dorp.\n[[Afbeelding:Geschiedenis_Orion_001.JPG| thumb]]\n\nOver de geschiedenis van Orion is een serie artikelen verschenen in het dorpsorgaan Rond Kerk en Orion (2008-2009).\nHet gebouw is in (jaartal?) uitgebreid.\nHier ziet u de Fanfare Sint Arnoldus die in de kerk een mis opluistert ter ere van het 40-jarig bestaan van de Orion (1988)\nEveneens ter gelegenheid van het 40-jarig bestaan werd er in de toenmalige kiosk een dansje in klederdracht opgevoerd (1988?),\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n\nOok was er een feestavond in de Orion zelf\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n\n<gallery caption=\"40 jaar Orion\">\nAlle foto\'s gemaakt door C. Willers)\nAfbeelding:Geschiedenis_Orion_002.jpg | Mis in de Theresiakerk?\nAfbeelding:Geschiedenis_Orion_001.jpg | Boerendans\nAfbeelding:40jr_Orion_001.JPG | Feestavond \nAfbeelding:40jr_Orion_002.JPG| Gasten tijdens de feestavond\n</gallery>', 'utf-8');
insert into `text` values ('66', '== Sint Theresia school ==\n\n== Sint Theresia kerk ==\n\n=== Het orgel ===\nGebouwd door Fa. L. Verschueren, Heythuysen 1950; met oud materiaal uit UDEN kl kruisheren; EP II vp: Hw 4-Nw 4-Ped 1. ingespeeld door Huub Hou?t, 1950.\n\nRenovatie Fa. L. Verschueren, Heythuysen 1970; EP II vp: 9\n\n\'\'\'Dispositie\'\'\'<br>\nHoofdwerk (manuaal I)<br>\nPrestant 8, Bourdon 8, Octaaf 4, Nasard 2 2/3\nNevenwerk (manuaal II)<br>\nGamba 8, Holpijp 8, Fl√ªte harmonique 4, Doublette 2\nPedaal<br>\nSubbas 16\n\n== Acht Zaligheden ==\n\n== Gemeenschapshuis Orion ==\nDe Orion is het kloppend hart van de gemeenschap Lennisheuvel. Opgericht in 1948 onder bezielende leiding van de toenmalige pastoor Manders. Hier links op de foto naast de in 2004? gerealiseerde kiosk.\n\n[[Afbeelding:Centrum_Lennisheuvel.JPG]]\n\nDe Orion is nauw verbonden met mensen, verenigingen en gebeurtenissen in het dorp.\n\nOver de geschiedenis van Orion is een serie artikelen verschenen in het dorpsorgaan Rond Kerk en Orion (2008-2009).\nHet gebouw is in (jaartal?) uitgebreid. Daar moet nog het een en ander over worden beschreven. Wie voelt zich geroepen?\n\nHier ziet u de Fanfare Sint Arnoldus die in de kerk een mis opluistert ter ere van het 40-jarig bestaan van de Orion (1988)\nEveneens ter gelegenheid van het 40-jarig bestaan werd er in de toenmalige kiosk een dansje in klederdracht opgevoerd (1988?),\n\n\nOok was er een feestavond in de Orion zelf\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n\n<gallery caption=\"40 jaar Orion\">\nAlle foto\'s gemaakt door C. Willers\nAfbeelding:Geschiedenis_Orion_002.jpg | Mis in de Theresiakerk?\nAfbeelding:Geschiedenis_Orion_001.JPG | Boerendans\nAfbeelding:40jr_Orion_001.JPG | Feestavond \nAfbeelding:40jr_Orion_002.JPG| Gasten tijdens de feestavond\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n</gallery>', 'utf-8');
insert into `text` values ('67', '== Sint Theresia school ==\n\n== Sint Theresia kerk ==\n\n=== Het orgel ===\nGebouwd door Fa. L. Verschueren, Heythuysen 1950; met oud materiaal uit UDEN kl kruisheren; EP II vp: Hw 4-Nw 4-Ped 1. ingespeeld door Huub Hou?t, 1950.\n\nRenovatie Fa. L. Verschueren, Heythuysen 1970; EP II vp: 9\n\n\'\'\'Dispositie\'\'\'<br>\nHoofdwerk (manuaal I)<br>\nPrestant 8, Bourdon 8, Octaaf 4, Nasard 2 2/3\nNevenwerk (manuaal II)<br>\nGamba 8, Holpijp 8, Fl√ªte harmonique 4, Doublette 2\nPedaal<br>\nSubbas 16\n\n== Acht Zaligheden ==\n\n== Gemeenschapshuis Orion ==\nDe Orion is het kloppend hart van de gemeenschap Lennisheuvel. Opgericht in 1948 onder bezielende leiding van de toenmalige pastoor Manders. Hier links op de foto naast de in 2004? gerealiseerde kiosk.\n\n[[Afbeelding:Centrum_Lennisheuvel.JPG]]\n\nDe Orion is nauw verbonden met mensen, verenigingen en gebeurtenissen in het dorp.\n\nOver de geschiedenis van Orion is een serie artikelen verschenen in het dorpsorgaan Rond Kerk en Orion (2008-2009).\nHet gebouw is in (jaartal?) uitgebreid. Daar moet nog het een en ander over worden beschreven. Wie voelt zich geroepen?\n\nHieronder ziet u de Fanfare Sint Arnoldus die in de kerk een mis opluistert ter ere van het 40-jarig bestaan van de Orion (1988).\nEveneens ter gelegenheid van het 40-jarig bestaan werd er in de toenmalige kiosk een dansje in klederdracht opgevoerd (1988?).\n\n\nOok was er een feestavond in de Orion zelf\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n\n<gallery caption=\"40 jaar Orion (Alle foto\'s gemaakt door C. Willers)\">\nAfbeelding:Geschiedenis_Orion_002.jpg | Boerendans in klederdracht\nAfbeelding:Geschiedenis_Orion_001.JPG | Mis in de Theresiakerk?\nAfbeelding:40jr_Orion_001.JPG | Feestavond \nAfbeelding:40jr_Orion_002.JPG| Gasten tijdens de feestavond\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n</gallery>', 'utf-8');
insert into `text` values ('68', '== Sint Theresia school ==\n\n== Sint Theresia kerk ==\n\n=== Het orgel ===\nGebouwd door Fa. L. Verschueren, Heythuysen 1950; met oud materiaal uit UDEN kl kruisheren; EP II vp: Hw 4-Nw 4-Ped 1. ingespeeld door Huub Hou?t, 1950.\n\nRenovatie Fa. L. Verschueren, Heythuysen 1970; EP II vp: 9\n\n\'\'\'Dispositie\'\'\'<br>\nHoofdwerk (manuaal I)<br>\nPrestant 8, Bourdon 8, Octaaf 4, Nasard 2 2/3\nNevenwerk (manuaal II)<br>\nGamba 8, Holpijp 8, Fl√ªte harmonique 4, Doublette 2\nPedaal<br>\nSubbas 16\n\n== Acht Zaligheden ==\n\n== Gemeenschapshuis Orion ==\nDe Orion is het kloppend hart van de gemeenschap Lennisheuvel. Opgericht in 1948 onder bezielende leiding van de toenmalige pastoor Manders. Hier links op de foto naast de in 2004? gerealiseerde kiosk.\n\n[[Afbeelding:Centrum_Lennisheuvel.JPG]]\n\nDe Orion is nauw verbonden met mensen, verenigingen en gebeurtenissen in het dorp.\n\nOver de geschiedenis van Orion is een serie artikelen verschenen in het dorpsorgaan Rond Kerk en Orion (2008-2009).\nHet gebouw is in (jaartal?) uitgebreid. \'\'Daar moet nog het een en ander over worden beschreven. Wie voelt zich geroepen?\'\'\n\nHieronder ziet u de Fanfare Sint Arnoldus die in de kerk een mis opluistert ter ere van het 40-jarig bestaan van de Orion (1988).\nEveneens ter gelegenheid van het 40-jarig bestaan werd er in de toenmalige kiosk een dansje in klederdracht opgevoerd (1988?).\n\n\nOok was er een feestavond in de Orion zelf\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n\n<gallery caption=\"40 jaar Orion (Alle foto\'s gemaakt door C. Willers)\">\nAfbeelding:Geschiedenis_Orion_002.jpg | Boerendans in klederdracht\nAfbeelding:Geschiedenis_Orion_001.JPG | Mis in de Theresiakerk?\nAfbeelding:40jr_Orion_001.JPG | Feestavond \nAfbeelding:40jr_Orion_002.JPG| Gasten tijdens de feestavond\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n</gallery>', 'utf-8');
insert into `text` values ('69', '\n== Fanfare Sint Arnoldus ==\n\nDe fanfare Sint Arnoldus is opgericht in 1949 en bestaat anno 2009 dus 60 jaar. In de achterliggende 60 jaren heeft de fanfare haar bestaansrecht  in Lennisheuvel bewezen en hebben vele inwoners kennis gemaakt met het musiceren in verenigingsverband. Alleszins reden om dit 60-jarig bestaan feestelijk te vieren. De fanfare heeft ook een eigen website: zie [http://www.fanfare-sintarnoldus.nl/] waar deze tekst aan is ontleend. Hier enkele plaatjes uit de oude doos om het rijke verleden van deze fanfare te illustreren (gemaakt door C. Willers, 1984-1986?).\n\n<gallery caption=\"Sint Arnoldus jaren \'80\">\nAfbeelding:Geschiedenis_Orion_001.JPG | Heilige mis in de kerk\nAfbeelding:Fanfare_001.JPG\nAfbeelding:Fanfare_002.JPG\nAfbeelding:Fanfare_003a.JPG\nAfbeelding:Fanfare_004.JPG\nAfbeelding:Fanfare_005.JPG\nAfbeelding:Fanfare_006.JPG\nAfbeelding:Fanfare_007.JPG\n</gallery>\n\n\'\'Wie weet wanneer deze foto\'s zijn gemaakt?\'\'', 'utf-8');
insert into `text` values ('70', '== Sint Theresia school ==\n\n== Sint Theresia kerk ==\n\n=== Het orgel ===\nGebouwd door Fa. L. Verschueren, Heythuysen 1950; met oud materiaal uit UDEN kl kruisheren; EP II vp: Hw 4-Nw 4-Ped 1. ingespeeld door Huub Hou?t, 1950.\n\nRenovatie Fa. L. Verschueren, Heythuysen 1970; EP II vp: 9\n\n\'\'\'Dispositie\'\'\'<br>\nHoofdwerk (manuaal I)<br>\nPrestant 8, Bourdon 8, Octaaf 4, Nasard 2 2/3\nNevenwerk (manuaal II)<br>\nGamba 8, Holpijp 8, Fl√ªte harmonique 4, Doublette 2\nPedaal<br>\nSubbas 16\n\n== Acht Zaligheden ==\n\n== Gemeenschapshuis Orion ==\nDe Orion is het kloppend hart van de gemeenschap Lennisheuvel. Opgericht in 1948 onder bezielende leiding van de toenmalige pastoor Manders. Hier links op de foto naast de in 2004? gerealiseerde kiosk.\n\n[[Afbeelding:Centrum_Lennisheuvel.JPG]]\n\nDe Orion is nauw verbonden met mensen, verenigingen en gebeurtenissen in het dorp. Zoals hier bij de start van een wandeltocht van de 7-mijls stappers (later opgegaan in de Keistampers). Het bord met aanduiding Orion is later vervangen.\n[[Afbeelding:Zevenmijlsstappers_001.JPG | thumb \\ Vertrek van een wandeltocht van de jeugd (midden jaren \'80)]]\n\nOver de geschiedenis van Orion is een serie artikelen verschenen in het dorpsorgaan Rond Kerk en Orion (2008-2009).\nHet gebouw is in (jaartal?) uitgebreid. \'\'Hier moet nog het een en ander over worden beschreven. Wie voelt zich geroepen?\'\'\n\nHieronder ziet u de Fanfare Sint Arnoldus die in de kerk een mis opluistert ter ere van het 40-jarig bestaan van de Orion (1988).\nEveneens ter gelegenheid van het 40-jarig bestaan werd er in de toenmalige kiosk een dansje in klederdracht opgevoerd (1988?).\n\n\nOok was er een feestavond in de Orion zelf\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n\n<gallery caption=\"40 jaar Orion (Alle foto\'s gemaakt door C. Willers)\">\nAfbeelding:Geschiedenis_Orion_002.jpg | Boerendans in klederdracht\nAfbeelding:Geschiedenis_Orion_001.JPG | Mis in de Theresiakerk?\nAfbeelding:40jr_Orion_001.JPG | Feestavond \nAfbeelding:40jr_Orion_002.JPG| Gasten tijdens de feestavond\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n</gallery>', 'utf-8');
insert into `text` values ('71', '', 'utf-8');
insert into `text` values ('72', '== Sint Theresia school ==\n\n== Sint Theresia kerk ==\n\n=== Het orgel ===\nGebouwd door Fa. L. Verschueren, Heythuysen 1950; met oud materiaal uit UDEN kl kruisheren; EP II vp: Hw 4-Nw 4-Ped 1. ingespeeld door Huub Hou?t, 1950.\n\nRenovatie Fa. L. Verschueren, Heythuysen 1970; EP II vp: 9\n\n\'\'\'Dispositie\'\'\'<br>\nHoofdwerk (manuaal I)<br>\nPrestant 8, Bourdon 8, Octaaf 4, Nasard 2 2/3\nNevenwerk (manuaal II)<br>\nGamba 8, Holpijp 8, Fl√ªte harmonique 4, Doublette 2\nPedaal<br>\nSubbas 16\n\n== Acht Zaligheden ==\n\n== Gemeenschapshuis Orion ==\nDe Orion is het kloppend hart van de gemeenschap Lennisheuvel. Opgericht in 1948 onder bezielende leiding van de toenmalige pastoor Manders. Hier links op de foto naast de in 2004? gerealiseerde kiosk.\n\n[[Afbeelding:Centrum_Lennisheuvel.JPG]]\n\nDe Orion is nauw verbonden met mensen, verenigingen en gebeurtenissen in het dorp. Zoals hier bij de start van een wandeltocht van de 7-mijls stappers (later opgegaan in de Keistampers). Het bord met aanduiding Orion is later vervangen.\n[[Afbeelding:Zevenmijlsstappers 001.JPG | thumb | Vertrek van jeugdige Zevenmijlsstappers (midden jaren \'80)]]\n\nOver de geschiedenis van Orion is een serie artikelen verschenen in het dorpsorgaan Rond Kerk en Orion (2008-2009).\nHet gebouw is in (jaartal?) uitgebreid. \'\'Hier moet nog het een en ander over worden beschreven. Wie voelt zich geroepen?\'\'\n\nHieronder ziet u de Fanfare Sint Arnoldus die in de kerk een mis opluistert ter ere van het 40-jarig bestaan van de Orion (1988).\nEveneens ter gelegenheid van het 40-jarig bestaan werd er in de toenmalige kiosk een dansje in klederdracht opgevoerd (1988?).\n\n\nOok was er een feestavond in de Orion zelf\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n\n<gallery caption=\"40 jaar Orion (Alle foto\'s gemaakt door C. Willers)\">\nAfbeelding:Geschiedenis_Orion_002.jpg | Boerendans in klederdracht\nAfbeelding:Geschiedenis_Orion_001.JPG | Mis in de Theresiakerk?\nAfbeelding:40jr_Orion_001.JPG | Feestavond \nAfbeelding:40jr_Orion_002.JPG| Gasten tijdens de feestavond\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n</gallery>', 'utf-8');
insert into `text` values ('73', '== Sint Theresia school ==\n\n== Sint Theresia kerk ==\n\n=== Het orgel ===\nGebouwd door Fa. L. Verschueren, Heythuysen 1950; met oud materiaal uit UDEN kl kruisheren; EP II vp: Hw 4-Nw 4-Ped 1. ingespeeld door Huub Hou?t, 1950.\n\nRenovatie Fa. L. Verschueren, Heythuysen 1970; EP II vp: 9\n\n\'\'\'Dispositie\'\'\'<br>\nHoofdwerk (manuaal I)<br>\nPrestant 8, Bourdon 8, Octaaf 4, Nasard 2 2/3\nNevenwerk (manuaal II)<br>\nGamba 8, Holpijp 8, Fl√ªte harmonique 4, Doublette 2\nPedaal<br>\nSubbas 16\n\n== Acht Zaligheden ==\n\n== Gemeenschapshuis Orion ==\nDe Orion is het kloppend hart van de gemeenschap Lennisheuvel. Opgericht in 1948 onder bezielende leiding van de toenmalige pastoor Manders. Hier links op de foto naast de in 2004? gerealiseerde kiosk.\n\n[[Afbeelding:Centrum_Lennisheuvel.JPG]]\n\nDe Orion is nauw verbonden met mensen, verenigingen en gebeurtenissen in het dorp. Zoals hier bij de start van een wandeltocht van de 7-mijls stappers (later opgegaan in de Keistampers). Het bord met aanduiding Orion is later vervangen.\n[[Afbeelding:Zevenmijlstappers_001.JPG | thumb | Vertrek van jeugdige Zevenmijlsstappers (midden jaren \'80)]]\n\nOver de geschiedenis van Orion is een serie artikelen verschenen in het dorpsorgaan Rond Kerk en Orion (2008-2009).\nHet gebouw is in (jaartal?) uitgebreid. \'\'Hier moet nog het een en ander over worden beschreven. Wie voelt zich geroepen?\'\'\n\nHieronder ziet u de Fanfare Sint Arnoldus die in de kerk een mis opluistert ter ere van het 40-jarig bestaan van de Orion (1988).\nEveneens ter gelegenheid van het 40-jarig bestaan werd er in de toenmalige kiosk een dansje in klederdracht opgevoerd (1988?).\n\n\nOok was er een feestavond in de Orion zelf\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n\n<gallery caption=\"40 jaar Orion (Alle foto\'s gemaakt door C. Willers)\">\nAfbeelding:Geschiedenis_Orion_002.jpg | Boerendans in klederdracht\nAfbeelding:Geschiedenis_Orion_001.JPG | Mis in de Theresiakerk?\nAfbeelding:40jr_Orion_001.JPG | Feestavond \nAfbeelding:40jr_Orion_002.JPG| Gasten tijdens de feestavond\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n</gallery>', 'utf-8');
insert into `text` values ('74', '== Sint Theresia school ==\n\n== Sint Theresia kerk ==\n\n=== Het orgel ===\nGebouwd door Fa. L. Verschueren, Heythuysen 1950; met oud materiaal uit UDEN kl kruisheren; EP II vp: Hw 4-Nw 4-Ped 1. ingespeeld door Huub Hou?t, 1950.\n\nRenovatie Fa. L. Verschueren, Heythuysen 1970; EP II vp: 9\n\n\'\'\'Dispositie\'\'\'<br>\nHoofdwerk (manuaal I)<br>\nPrestant 8, Bourdon 8, Octaaf 4, Nasard 2 2/3\nNevenwerk (manuaal II)<br>\nGamba 8, Holpijp 8, Fl√ªte harmonique 4, Doublette 2\nPedaal<br>\nSubbas 16\n\n== Acht Zaligheden ==\n\n== Gemeenschapshuis Orion ==\nGemeenschapshuis de Orion is het kloppend hart van de gemeenschap Lennisheuvel. Opgericht in 1948 onder bezielende leiding van de toenmalige pastoor Manders. Hier links op de foto naast de in 2004? gerealiseerde kiosk.\n\n[[Afbeelding:Centrum_Lennisheuvel.JPG]]\n\nDe Orion is nauw verbonden met mensen, verenigingen en gebeurtenissen in het dorp. Zoals hier bij de start van een wandeltocht van de 7-mijls stappers (later opgegaan in de Keistampers). Het bord met aanduiding Orion is later vervangen.\n[[Afbeelding:Zevenmijlstappers_001.JPG | thumb | Vertrek van jeugdige Zevenmijlsstappers (midden jaren \'80)]]\n\nOver de geschiedenis van Orion is een serie artikelen verschenen in het dorpsorgaan Rond Kerk en Orion (2008-2009).\nHet gebouw is in (jaartal?) uitgebreid. \'\'Hier moet nog het een en ander over worden beschreven. Wie voelt zich geroepen?\'\'\n\nHieronder ziet u de Fanfare Sint Arnoldus die in de kerk een mis opluistert ter ere van het 40-jarig bestaan van de Orion (1988).\nEveneens ter gelegenheid van het 40-jarig bestaan werd er in de toenmalige kiosk een dansje in klederdracht opgevoerd (1988?).\n\n\nOok was er een feestavond in de Orion zelf\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n\n<gallery caption=\"40 jaar Orion (Alle foto\'s gemaakt door C. Willers)\">\nAfbeelding:Geschiedenis_Orion_002.jpg | Boerendans in klederdracht\nAfbeelding:Geschiedenis_Orion_001.JPG | Mis in de Theresiakerk?\nAfbeelding:40jr_Orion_001.JPG | Feestavond \nAfbeelding:40jr_Orion_002.JPG| Gasten tijdens de feestavond\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n</gallery>', 'utf-8');
insert into `text` values ('75', '\n== Gescheurmd Hemd ==\nHet Gescheurd Hemd is de naam van de aanbouwwijk die vanaf 1990 is gerealiseerd aan de noordoostkant van het dorp. De bouw is gestart aan de straat Lennisheuvel. De naam van de wijk verwijst naar de vorm van de plattegrond, die zou lijken op een hemd met een scheur.\n\nVoordat de wijk werd gebouwd was de aanblik van het dorp Lennisheuvel heel anders dan vandaag. Je keek vanaf de velden achter in de tuinen van de huizen aan de straat Lennisheuvel. Deze foto\'s van C. Willers illustreren dat.', 'utf-8');
insert into `text` values ('76', '', 'utf-8');
insert into `text` values ('77', '', 'utf-8');
insert into `text` values ('78', '', 'utf-8');
insert into `text` values ('79', '\n== Gescheurmd Hemd ==\nHet Gescheurd Hemd is de naam van de aanbouwwijk die vanaf 1990 is gerealiseerd aan de noordoostkant van het dorp. De bouw is gestart aan de straat Lennisheuvel. De naam van de wijk verwijst naar de vorm van de plattegrond, die zou lijken op een hemd met een scheur.\n\nVoordat de wijk werd gebouwd was de aanblik van het dorp Lennisheuvel heel anders dan vandaag. Je keek vanaf de velden achter in de tuinen van de huizen aan de straat Lennisheuvel. Deze foto van C. Willers illustreert dat.\n[[Afbeelding:Sneeuw_001.JPG|200px]]\n\nAan de huizen is in verschillende fasen gebouwd. De straatnamen verwijzen naar de geschiedenis: Pastoor Tilmanstraat, Pastoor Mandersstraat. In de jaren \'90 zijn daar ploeg, Eg, Greep aan toegevoegd. De laatste toevoeging dateert van 2005.', 'utf-8');
insert into `text` values ('80', '\n== Gescheurmd Hemd ==\nHet Gescheurd Hemd is de naam van de aanbouwwijk die vanaf 1990 is gerealiseerd aan de noordoostkant van het dorp. De bouw is gestart aan de straat Lennisheuvel. De naam van de wijk verwijst naar de vorm van de plattegrond, die zou lijken op een hemd met een scheur.\n\nVoordat de wijk werd gebouwd was de aanblik van het dorp Lennisheuvel heel anders dan vandaag. Je keek vanaf de velden achter in de tuinen van de huizen aan de straat Lennisheuvel. Deze foto van C. Willers illustreert dat.\n\n[[Afbeelding:Sneeuw_001.JPG|200px|center]]\n\nAan de huizen is in verschillende fasen gebouwd. De straatnamen verwijzen naar de geschiedenis: Pastoor Tilmanstraat, Pastoor Mandersstraat. In de jaren \'90 zijn daar ploeg, Eg, Greep aan toegevoegd. De laatste uitbreiding dateert van 2005.\n\n<gallery caption=\"Aanbouw Gescheurd Hemd\">\nAfbeelding:Nieuwbouw_001.JPG\nAfbeelding:Nieuwbouw_002.JPG\nAfbeelding:Nieuwbouw_003.JPG\nAfbeelding:Nieuwbouw_005.JPG\n</gallery>', 'utf-8');
insert into `text` values ('81', '', 'utf-8');
insert into `text` values ('82', '', 'utf-8');
insert into `text` values ('83', '\n== Gescheurmd Hemd ==\nHet Gescheurd Hemd is de naam van de aanbouwwijk die vanaf 1990 is gerealiseerd aan de noordoostkant van het dorp. De bouw is gestart aan de straat Lennisheuvel. De naam van de wijk verwijst naar de vorm van de plattegrond, die zou lijken op een hemd met een scheur.\n\nVoordat de wijk werd gebouwd was de aanblik van het dorp Lennisheuvel heel anders dan vandaag. Je keek vanaf de velden achter in de tuinen van de huizen aan de straat Lennisheuvel. Deze foto van C. Willers illustreert dat.\n\n[[Afbeelding:Sneeuw_001.JPG|400px|center|Blik over de velden richting de kerk voor aanbouw van het Gescheurd Hemd]]\n\nAan de huizen is in verschillende fasen gebouwd. De straatnamen verwijzen naar de geschiedenis: Pastoor Tilmanstraat, Pastoor Mandersstraat. In de jaren \'90 zijn daar ploeg, Eg, Greep aan toegevoegd. De laatste uitbreiding dateert van 2005.\n\n<gallery caption=\"Aanbouw Gescheurd Hemd\">\nAfbeelding:Nieuwbouw_001.JPG\nAfbeelding:Nieuwbouw_002.JPG\nAfbeelding:Nieuwbouw_003.JPG\nAfbeelding:Nieuwbouw_005.JPG\n</gallery>\n\n== Mijlstraat ==\n\n== Straat Lennisheuvel ==\n\n== Armehoefstraat ==', 'utf-8');
insert into `text` values ('84', '\n== Koninginnedag ==\n\n\n== Kerst ==\n\n\n== Nieuwkomersavond ==\n\n\n== Nieuwe pastoor ==\n\n\n== Lennisfist ==', 'utf-8');
insert into `text` values ('85', '\n== Kindervakantiewerk ==\nIeder jaar, al sinds de oprichting in 19??, organiseert het Kindervakantiecomite een aantal activiteiten, waarvan de belangrijkste de jaarlijks terugkerende zomeractiviteiten. In het dorp bekend als Kindervakantiewerk: wat te begrijpen valt als je het enthousiasme ziet van alle deelnemers in de leeftijd van 4 tot 12 jaar.\nOnderstaande afbeeldingen laten zien hoe het midden jaren \'80 verliep tijdens deze Kindervakantieweek (naast de Orion, waar nog geen kiosk stond).\n\n\n== Koninginnedag ==\n\n== Kerst ==\n\n\n== Nieuwkomersavond ==\n\n\n== Nieuwe pastoor ==\n\n\n== Lennisfist ==', 'utf-8');
insert into `text` values ('86', '\n== Kindervakantiewerk ==\nIeder jaar, al sinds de oprichting in 19??, organiseert het Kindervakantiecomite een aantal activiteiten, waarvan de belangrijkste de jaarlijks terugkerende zomeractiviteiten. In het dorp bekend als Kindervakantiewerk: wat te begrijpen valt als je het enthousiasme ziet van alle deelnemers in de leeftijd van 4 tot 12 jaar.\nOnderstaande afbeeldingen laten zien hoe het midden jaren \'80 verliep tijdens deze Kindervakantieweek (naast de Orion, waar nog geen kiosk stond).\n\ngallery caption=\"Kinder Vakantiewerk jaren \'80\">\nAfbeelding:Vacantiewerk_001.JPG\n</gallery>\n\n== Koninginnedag ==\n\n== Kerst ==\n\n\n== Nieuwkomersavond ==\n\n\n== Nieuwe pastoor ==\n\n\n== Lennisfist ==', 'utf-8');
insert into `text` values ('87', '', 'utf-8');
insert into `text` values ('88', '', 'utf-8');
insert into `text` values ('89', '', 'utf-8');
insert into `text` values ('90', '', 'utf-8');
insert into `text` values ('91', '', 'utf-8');
insert into `text` values ('92', '\n== Kindervakantiewerk ==\nIeder jaar, al sinds de oprichting in 19??, organiseert het Kindervakantiecomite een aantal activiteiten, waarvan de belangrijkste de jaarlijks terugkerende zomeractiviteiten. In het dorp bekend als Kindervakantiewerk: wat te begrijpen valt als je het enthousiasme ziet van alle deelnemers in de leeftijd van 4 tot 12 jaar.\nTegenwoordig worden er traditioneel hutten gebouwd van oude pallets en hout: blijkens deze foto uit 1985 (?) was er ook toen al een avondactiviteit.[[Afbeelding:Vacantiewerk_005.JPG|thumb]]\nOnderstaande afbeeldingen laten zien hoe het midden jaren \'80 verliep tijdens deze Kindervakantieweek (naast de Orion, waar nog geen kiosk stond).\n\ngallery caption=\"Kinder Vakantiewerk jaren \'80\">\nAfbeelding:Vacantiewerk_001.JPG\nAfbeelding:Vacantiewerk_002.JPG\nAfbeelding:Vacantiewerk_003.JPG\nAfbeelding:Vacantiewerk_004.JPG\n</gallery>\n\n== Koninginnedag ==\n\n== Kerst ==\n\n\n== Nieuwkomersavond ==\n\n\n== Nieuwe pastoor ==\n\n\n== Lennisfist ==', 'utf-8');
insert into `text` values ('93', '\n== Kindervakantiewerk ==\nIeder jaar, al sinds de oprichting in 19??, organiseert het Kindervakantiecomite een aantal activiteiten, waarvan de belangrijkste de jaarlijks terugkerende zomeractiviteiten. In het dorp bekend als Kindervakantiewerk: wat te begrijpen valt als je het enthousiasme ziet van alle deelnemers in de leeftijd van 4 tot 12 jaar.\nTegenwoordig worden er traditioneel hutten gebouwd van oude pallets en hout: blijkens deze foto uit 1985 (?) was er ook toen al een avondactiviteit.[[Afbeelding:Vacantiewerk_005.jpg|thumb]]\nOnderstaande afbeeldingen laten zien hoe het midden jaren \'80 verliep tijdens deze Kindervakantieweek (naast de Orion, waar nog geen kiosk stond).\n\ngallery caption=\"Kinder Vakantiewerk jaren \'80\">\nWie staan er op deze foto\'s???\nAfbeelding:Vacantiewerk_001.jpg\nAfbeelding:Vacantiewerk_002.jpg\nAfbeelding:Vacantiewerk_003.jpg\nAfbeelding:Vacantiewerk_004.jpg\n</gallery>\n\n== Koninginnedag ==\n\n== Kerst ==\n\n\n== Nieuwkomersavond ==\n\n\n== Nieuwe pastoor ==\n\n\n== Lennisfist ==', 'utf-8');
insert into `text` values ('94', '\n== Kindervakantiewerk ==\nIeder jaar, al sinds de oprichting in 19??, organiseert het Kindervakantiecomite een aantal activiteiten, waarvan de belangrijkste de jaarlijks terugkerende zomeractiviteiten. In het dorp bekend als Kindervakantiewerk: wat te begrijpen valt als je het enthousiasme ziet van alle deelnemers in de leeftijd van 4 tot 12 jaar.\nTegenwoordig worden er traditioneel hutten gebouwd van oude pallets en hout: blijkens deze foto uit 1985 (?) was er ook toen al een avondactiviteit.[[Afbeelding:Vacantiewerk_005.jpg|thumb]]\nOnderstaande afbeeldingen laten zien hoe het midden jaren \'80 verliep tijdens deze Kindervakantieweek (naast de Orion, waar nog geen kiosk stond).\n\n<gallery caption=\"Kinder Vakantiewerk jaren \'80\">\nWie staan er op deze foto\'s???\nAfbeelding:Vacantiewerk_001.jpg\nAfbeelding:Vacantiewerk_002.jpg\nAfbeelding:Vacantiewerk_003.jpg\nAfbeelding:Vacantiewerk_004.jpg\n</gallery>\n\n== Koninginnedag ==\n\n== Kerst ==\n\n\n== Nieuwkomersavond ==\n\n\n== Nieuwe pastoor ==\n\n\n== Lennisfist ==', 'utf-8');
insert into `text` values ('95', '\n== Kindervakantiewerk ==\nIeder jaar, al sinds de oprichting in 19??, organiseert het Kindervakantiecomite een aantal activiteiten, waarvan de belangrijkste de jaarlijks terugkerende zomeractiviteiten. In het dorp bekend als Kindervakantiewerk: wat te begrijpen valt als je het enthousiasme ziet van alle deelnemers in de leeftijd van 4 tot 12 jaar.\nTegenwoordig worden er traditioneel hutten gebouwd van oude pallets en hout: blijkens deze foto uit 1985 (?) was er ook toen al een avondactiviteit.[[Afbeelding:Vacantiewerk_005.jpg|thumb]]\nOnderstaande afbeeldingen laten zien hoe het midden jaren \'80 verliep tijdens deze Kindervakantieweek (naast de Orion, waar nog geen kiosk stond).\n\n<gallery caption=\"Kinder Vakantiewerk jaren \'80\">\nAfbeelding:Vacantiewerk_001.jpg\nAfbeelding:Vacantiewerk_002.jpg\nAfbeelding:Vacantiewerk_003.jpg\nAfbeelding:Vacantiewerk_004.jpg\n</gallery>\nWie staan er op deze foto\'s???Wie staan er op deze foto\'s???Wie staan er op deze foto\'s???\n\n== Koninginnedag ==\n\n== Kerst ==\n\n\n== Nieuwkomersavond ==\n\n\n== Nieuwe pastoor ==\n\n\n== Lennisfist ==', 'utf-8');
insert into `text` values ('96', '== Sint Theresia school ==\n\n== Sint Theresia kerk ==\n\n=== Het orgel ===\nGebouwd door Fa. L. Verschueren, Heythuysen 1950; met oud materiaal uit UDEN kl kruisheren; EP II vp: Hw 4-Nw 4-Ped 1. ingespeeld door Huub Hou?t, 1950.\n\nRenovatie Fa. L. Verschueren, Heythuysen 1970; EP II vp: 9\n\n\'\'\'Dispositie\'\'\'<br>\nHoofdwerk (manuaal I)<br>\nPrestant 8, Bourdon 8, Octaaf 4, Nasard 2 2/3\nNevenwerk (manuaal II)<br>\nGamba 8, Holpijp 8, Fl√ªte harmonique 4, Doublette 2\nPedaal<br>\nSubbas 16\n\n== Acht Zaligheden ==\n\n== Gemeenschapshuis Orion ==\nGemeenschapshuis de Orion is het kloppend hart van de gemeenschap Lennisheuvel. Opgericht in 1948 onder bezielende leiding van de toenmalige pastoor Manders. In het archief zijn bijgevoegde twee afbeeldingen gevonden, waarvan de relatie met de Orion niet duidelijk is bij uw schrijver dezes.\n\n[[Afbeelding:Geschiedenis_Orion_003.jpg | 400px|Gezelschap]] [[Afbeelding:Geschiedenis_Orion_004.jpg | 400px|Interieur van de kerk anno?]]\n\nHier links op de foto naast de in 2004? gerealiseerde kiosk.\n\n[[Afbeelding:Centrum_Lennisheuvel.JPG|centre]]\n\nDe Orion is nauw verbonden met mensen, verenigingen en gebeurtenissen in het dorp. Zoals hier bij de start van een wandeltocht van de 7-mijls stappers (later opgegaan in de Keistampers). Het bord met aanduiding Orion is later vervangen.\n[[Afbeelding:Zevenmijlstappers_001.JPG | thumb | Vertrek van jeugdige Zevenmijlsstappers (midden jaren \'80)]]\n\nOver de geschiedenis van Orion is een serie artikelen verschenen in het dorpsorgaan Rond Kerk en Orion (2008-2009).\nHet gebouw is in (jaartal?) uitgebreid. \'\'Hier moet nog het een en ander over worden beschreven. Wie voelt zich geroepen?\'\'\n\nHieronder ziet u de Fanfare Sint Arnoldus die in de kerk een mis opluistert ter ere van het 40-jarig bestaan van de Orion (1988).\nEveneens ter gelegenheid van het 40-jarig bestaan werd er in de toenmalige kiosk een dansje in klederdracht opgevoerd (1988?).\n\n\nOok was er een feestavond in de Orion zelf\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n\n<gallery caption=\"40 jaar Orion (Alle foto\'s gemaakt door C. Willers)\">\nAfbeelding:Geschiedenis_Orion_002.jpg | Boerendans in klederdracht\nAfbeelding:Geschiedenis_Orion_001.JPG | Mis in de Theresiakerk?\nAfbeelding:40jr_Orion_001.JPG | Feestavond \nAfbeelding:40jr_Orion_002.JPG| Gasten tijdens de feestavond\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n</gallery>', 'utf-8');
insert into `text` values ('97', '', 'utf-8');
insert into `text` values ('98', '', 'utf-8');
insert into `text` values ('99', '== Sint Theresia school ==\n\n== Sint Theresia kerk ==\n\n=== Het orgel ===\nGebouwd door Fa. L. Verschueren, Heythuysen 1950; met oud materiaal uit UDEN kl kruisheren; EP II vp: Hw 4-Nw 4-Ped 1. ingespeeld door Huub Hou?t, 1950.\n\nRenovatie Fa. L. Verschueren, Heythuysen 1970; EP II vp: 9\n\n\'\'\'Dispositie\'\'\'<br>\nHoofdwerk (manuaal I)<br>\nPrestant 8, Bourdon 8, Octaaf 4, Nasard 2 2/3\nNevenwerk (manuaal II)<br>\nGamba 8, Holpijp 8, Fl√ªte harmonique 4, Doublette 2\nPedaal<br>\nSubbas 16\n\n== Acht Zaligheden ==\n\n== Gemeenschapshuis Orion ==\nGemeenschapshuis de Orion is het kloppend hart van de gemeenschap Lennisheuvel. Opgericht in 1948 onder bezielende leiding van de toenmalige pastoor Manders. In het archief zijn bijgevoegde twee afbeeldingen gevonden, waarvan de relatie met de Orion niet duidelijk is bij uw schrijver dezes.\n\n[[Afbeelding:Geschiedenis_Orion_003.JPG | 400px|Gezelschap]] [[Afbeelding:Geschiedenis_Orion_004.JPG | 400px|Interieur van de kerk anno?]]\n\nHier links op de foto naast de in 2004? gerealiseerde kiosk.\n\n[[Afbeelding:Centrum_Lennisheuvel.JPG|centre]]\n\nDe Orion is nauw verbonden met mensen, verenigingen en gebeurtenissen in het dorp. Zoals hier bij de start van een wandeltocht van de 7-mijls stappers (later opgegaan in de Keistampers). Het bord met aanduiding Orion is later vervangen.\n[[Afbeelding:Zevenmijlstappers_001.JPG | thumb | Vertrek van jeugdige Zevenmijlsstappers (midden jaren \'80)]]\n\nOver de geschiedenis van Orion is een serie artikelen verschenen in het dorpsorgaan Rond Kerk en Orion (2008-2009).\nHet gebouw is in (jaartal?) uitgebreid. \'\'Hier moet nog het een en ander over worden beschreven. Wie voelt zich geroepen?\'\'\n\nHieronder ziet u de Fanfare Sint Arnoldus die in de kerk een mis opluistert ter ere van het 40-jarig bestaan van de Orion (1988).\nEveneens ter gelegenheid van het 40-jarig bestaan werd er in de toenmalige kiosk een dansje in klederdracht opgevoerd (1988?).\n\n\nOok was er een feestavond in de Orion zelf\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n\n<gallery caption=\"40 jaar Orion (Alle foto\'s gemaakt door C. Willers)\">\nAfbeelding:Geschiedenis_Orion_002.jpg | Boerendans in klederdracht\nAfbeelding:Geschiedenis_Orion_001.JPG | Mis in de Theresiakerk?\nAfbeelding:40jr_Orion_001.JPG | Feestavond \nAfbeelding:40jr_Orion_002.JPG| Gasten tijdens de feestavond\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n</gallery>', 'utf-8');
insert into `text` values ('100', '== Sint Theresia school ==\n\n== Sint Theresia kerk ==\n\n=== Het orgel ===\nGebouwd door Fa. L. Verschueren, Heythuysen 1950; met oud materiaal uit UDEN kl kruisheren; EP II vp: Hw 4-Nw 4-Ped 1. ingespeeld door Huub Hou?t, 1950.\n\nRenovatie Fa. L. Verschueren, Heythuysen 1970; EP II vp: 9\n\n\'\'\'Dispositie\'\'\'<br>\nHoofdwerk (manuaal I)<br>\nPrestant 8, Bourdon 8, Octaaf 4, Nasard 2 2/3\nNevenwerk (manuaal II)<br>\nGamba 8, Holpijp 8, Fl√ªte harmonique 4, Doublette 2\nPedaal<br>\nSubbas 16\n\n== Acht Zaligheden ==\n\n== Gemeenschapshuis Orion ==\nGemeenschapshuis de Orion is het kloppend hart van de gemeenschap Lennisheuvel. Hier links op de foto naast de in 2004? gerealiseerde kiosk.\n\n[[Afbeelding:Centrum_Lennisheuvel.JPG|centre]]\n\nOpgericht in 1948 onder bezielende leiding van de toenmalige pastoor Manders. In het archief zijn bijgevoegde twee afbeeldingen gevonden, waarvan de relatie met de Orion niet duidelijk is bij uw schrijver dezes.\n\n[[Afbeelding:Geschiedenis_Orion_003.JPG | 400px|Gezelschap]] [[Afbeelding:Geschiedenis_Orion_004.JPG | 400px|Interieur van de kerk anno?]]\n\n\n\nDe Orion is nauw verbonden met mensen, verenigingen en gebeurtenissen in het dorp. Zoals hier bij de start van een wandeltocht van de 7-mijls stappers (later opgegaan in de Keistampers). Het bord met aanduiding Orion is later vervangen.\n[[Afbeelding:Zevenmijlstappers_001.JPG | thumb | Vertrek van jeugdige Zevenmijlsstappers (midden jaren \'80)]]\n\nOver de geschiedenis van Orion is een serie artikelen verschenen in het dorpsorgaan Rond Kerk en Orion (2008-2009).\nHet gebouw is in (jaartal?) uitgebreid. \'\'Hier moet nog het een en ander over worden beschreven. Wie voelt zich geroepen?\'\'\n\nHieronder ziet u de Fanfare Sint Arnoldus die in de kerk een mis opluistert ter ere van het 40-jarig bestaan van de Orion (1988).\nEveneens ter gelegenheid van het 40-jarig bestaan werd er in de toenmalige kiosk een dansje in klederdracht opgevoerd (1988?).\n\n\nOok was er een feestavond in de Orion zelf\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n\n<gallery caption=\"40 jaar Orion (Alle foto\'s gemaakt door C. Willers)\">\nAfbeelding:Geschiedenis_Orion_002.jpg | Boerendans in klederdracht\nAfbeelding:Geschiedenis_Orion_001.JPG | Mis in de Theresiakerk?\nAfbeelding:40jr_Orion_001.JPG | Feestavond \nAfbeelding:40jr_Orion_002.JPG| Gasten tijdens de feestavond\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n</gallery>', 'utf-8');
insert into `text` values ('101', '== Sint Theresia school ==\n\n== Sint Theresia kerk ==\n\n=== Het orgel ===\nGebouwd door Fa. L. Verschueren, Heythuysen 1950; met oud materiaal uit UDEN kl kruisheren; EP II vp: Hw 4-Nw 4-Ped 1. ingespeeld door Huub Hou?t, 1950.\n\nRenovatie Fa. L. Verschueren, Heythuysen 1970; EP II vp: 9\n\n\'\'\'Dispositie\'\'\'<br>\nHoofdwerk (manuaal I)<br>\nPrestant 8, Bourdon 8, Octaaf 4, Nasard 2 2/3\nNevenwerk (manuaal II)<br>\nGamba 8, Holpijp 8, Fl√ªte harmonique 4, Doublette 2\nPedaal<br>\nSubbas 16\n\n== Acht Zaligheden ==\n\n== Gemeenschapshuis Orion ==\nGemeenschapshuis de Orion is het kloppend hart van de gemeenschap Lennisheuvel. Hier links op de foto naast de in 2004? gerealiseerde kiosk.\n\n[[Afbeelding:Centrum_Lennisheuvel.JPG|left]]\n\nOpgericht in 1948 onder bezielende leiding van de toenmalige pastoor Manders. In het archief zijn bijgevoegde twee afbeeldingen gevonden, waarvan de relatie met de Orion niet duidelijk is bij uw schrijver dezes.\n\n[[Afbeelding:Geschiedenis_Orion_003.JPG | 400px|Gezelschap]] [[Afbeelding:Geschiedenis_Orion_004.JPG | 400px|Interieur van de kerk anno?]]\n\n\n\nDe Orion is nauw verbonden met mensen, verenigingen en gebeurtenissen in het dorp. Zoals hier bij de start van een wandeltocht van de 7-mijls stappers (later opgegaan in de Keistampers). Het bord met aanduiding Orion is later vervangen.\n[[Afbeelding:Zevenmijlstappers_001.JPG | thumb | Vertrek van jeugdige Zevenmijlsstappers (midden jaren \'80)]]\n\nOver de geschiedenis van Orion is een serie artikelen verschenen in het dorpsorgaan Rond Kerk en Orion (2008-2009).\nHet gebouw is in (jaartal?) uitgebreid. \'\'Hier moet nog het een en ander over worden beschreven. Wie voelt zich geroepen?\'\'\n\nHieronder ziet u de Fanfare Sint Arnoldus die in de kerk een mis opluistert ter ere van het 40-jarig bestaan van de Orion (1988).\nEveneens ter gelegenheid van het 40-jarig bestaan werd er in de toenmalige kiosk een dansje in klederdracht opgevoerd (1988?).\n\n\nOok was er een feestavond in de Orion zelf\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n\n<gallery caption=\"40 jaar Orion (Alle foto\'s gemaakt door C. Willers)\">\nAfbeelding:Geschiedenis_Orion_002.jpg | Boerendans in klederdracht\nAfbeelding:Geschiedenis_Orion_001.JPG | Mis in de Theresiakerk?\nAfbeelding:40jr_Orion_001.JPG | Feestavond \nAfbeelding:40jr_Orion_002.JPG| Gasten tijdens de feestavond\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n</gallery>', 'utf-8');
insert into `text` values ('102', '== Sint Theresia school ==\n\n== Sint Theresia kerk ==\n\n=== Het orgel ===\nGebouwd door Fa. L. Verschueren, Heythuysen 1950; met oud materiaal uit UDEN kl kruisheren; EP II vp: Hw 4-Nw 4-Ped 1. ingespeeld door Huub Hou?t, 1950.\n\nRenovatie Fa. L. Verschueren, Heythuysen 1970; EP II vp: 9\n\n\'\'\'Dispositie\'\'\'<br>\nHoofdwerk (manuaal I)<br>\nPrestant 8, Bourdon 8, Octaaf 4, Nasard 2 2/3\nNevenwerk (manuaal II)<br>\nGamba 8, Holpijp 8, Fl√ªte harmonique 4, Doublette 2\nPedaal<br>\nSubbas 16\n\n== Acht Zaligheden ==\n\n== Gemeenschapshuis Orion ==\nGemeenschapshuis de Orion is het kloppend hart van de gemeenschap Lennisheuvel. Hier links op de foto naast de in 2004? gerealiseerde kiosk.\n\n[[Afbeelding:Centrum_Lennisheuvel.JPG|left]]\n\n\n\n\n\n\nOpgericht in 1948 onder bezielende leiding van de toenmalige pastoor Manders. In het archief zijn bijgevoegde twee afbeeldingen gevonden, waarvan de relatie met de Orion niet duidelijk is bij uw schrijver dezes.\n\n[[Afbeelding:Geschiedenis_Orion_003.JPG | 400px|Gezelschap]] [[Afbeelding:Geschiedenis_Orion_004.JPG | 400px|Interieur van de kerk anno?]]\n\n\n\nDe Orion is nauw verbonden met mensen, verenigingen en gebeurtenissen in het dorp. Zoals hier bij de start van een wandeltocht van de 7-mijls stappers (later opgegaan in de Keistampers). Het bord met aanduiding Orion is later vervangen.\n[[Afbeelding:Zevenmijlstappers_001.JPG | thumb | Vertrek van jeugdige Zevenmijlsstappers (midden jaren \'80)]]\n\nOver de geschiedenis van Orion is een serie artikelen verschenen in het dorpsorgaan Rond Kerk en Orion (2008-2009).\nHet gebouw is in (jaartal?) uitgebreid. \'\'Hier moet nog het een en ander over worden beschreven. Wie voelt zich geroepen?\'\'\n\nHieronder ziet u de Fanfare Sint Arnoldus die in de kerk een mis opluistert ter ere van het 40-jarig bestaan van de Orion (1988).\nEveneens ter gelegenheid van het 40-jarig bestaan werd er in de toenmalige kiosk een dansje in klederdracht opgevoerd (1988?).\n\n\nOok was er een feestavond in de Orion zelf\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n\n<gallery caption=\"40 jaar Orion (Alle foto\'s gemaakt door C. Willers)\">\nAfbeelding:Geschiedenis_Orion_002.jpg | Boerendans in klederdracht\nAfbeelding:Geschiedenis_Orion_001.JPG | Mis in de Theresiakerk?\nAfbeelding:40jr_Orion_001.JPG | Feestavond \nAfbeelding:40jr_Orion_002.JPG| Gasten tijdens de feestavond\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n</gallery>', 'utf-8');
insert into `text` values ('103', '== Sint Theresia school ==\n\n== Sint Theresia kerk ==\n\n=== Het orgel ===\nGebouwd door Fa. L. Verschueren, Heythuysen 1950; met oud materiaal uit UDEN kl kruisheren; EP II vp: Hw 4-Nw 4-Ped 1. ingespeeld door Huub Hou?t, 1950.\n\nRenovatie Fa. L. Verschueren, Heythuysen 1970; EP II vp: 9\n\n\'\'\'Dispositie\'\'\'<br>\nHoofdwerk (manuaal I)<br>\nPrestant 8, Bourdon 8, Octaaf 4, Nasard 2 2/3\nNevenwerk (manuaal II)<br>\nGamba 8, Holpijp 8, Fl√ªte harmonique 4, Doublette 2\nPedaal<br>\nSubbas 16\n\n== Acht Zaligheden ==\n\n== Gemeenschapshuis Orion ==\nGemeenschapshuis de Orion is het kloppend hart van de gemeenschap Lennisheuvel. Hier links op de foto naast de in 2004? gerealiseerde kiosk.\n\n[[Afbeelding:Centrum_Lennisheuvel.JPG|left]]\n\n\n\n\n\n\n\n\n\n\n\n\nOpgericht in 1948 onder bezielende leiding van de toenmalige pastoor Manders. In het archief zijn bijgevoegde twee afbeeldingen gevonden, waarvan de relatie met de Orion niet duidelijk is bij uw schrijver dezes.\n\n[[Afbeelding:Geschiedenis_Orion_003.JPG | 400px|Gezelschap]] [[Afbeelding:Geschiedenis_Orion_004.JPG | 400px|Interieur van de kerk anno?]]\n\n\n\nDe Orion is nauw verbonden met mensen, verenigingen en gebeurtenissen in het dorp. Zoals hier bij de start van een wandeltocht van de 7-mijls stappers (later opgegaan in de Keistampers). Het bord met aanduiding Orion is later vervangen.\n[[Afbeelding:Zevenmijlstappers_001.JPG | thumb | Vertrek van jeugdige Zevenmijlsstappers (midden jaren \'80)]]\n\nOver de geschiedenis van Orion is een serie artikelen verschenen in het dorpsorgaan Rond Kerk en Orion (2008-2009).\nHet gebouw is in (jaartal?) uitgebreid. \'\'Hier moet nog het een en ander over worden beschreven. Wie voelt zich geroepen?\'\'\n\nHieronder ziet u de Fanfare Sint Arnoldus die in de kerk een mis opluistert ter ere van het 40-jarig bestaan van de Orion (1988).\nEveneens ter gelegenheid van het 40-jarig bestaan werd er in de toenmalige kiosk een dansje in klederdracht opgevoerd (1988?).\n\n\nOok was er een feestavond in de Orion zelf\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n\n<gallery caption=\"40 jaar Orion (Alle foto\'s gemaakt door C. Willers)\">\nAfbeelding:Geschiedenis_Orion_002.jpg | Boerendans in klederdracht\nAfbeelding:Geschiedenis_Orion_001.JPG | Mis in de Theresiakerk?\nAfbeelding:40jr_Orion_001.JPG | Feestavond \nAfbeelding:40jr_Orion_002.JPG| Gasten tijdens de feestavond\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n</gallery>', 'utf-8');
insert into `text` values ('104', '== Sint Theresia school ==\n\n== Sint Theresia kerk ==\n\n=== Het orgel ===\nGebouwd door Fa. L. Verschueren, Heythuysen 1950; met oud materiaal uit UDEN kl kruisheren; EP II vp: Hw 4-Nw 4-Ped 1. ingespeeld door Huub Hou?t, 1950.\n\nRenovatie Fa. L. Verschueren, Heythuysen 1970; EP II vp: 9\n\n\'\'\'Dispositie\'\'\'<br>\nHoofdwerk (manuaal I)<br>\nPrestant 8, Bourdon 8, Octaaf 4, Nasard 2 2/3\nNevenwerk (manuaal II)<br>\nGamba 8, Holpijp 8, Fl√ªte harmonique 4, Doublette 2\nPedaal<br>\nSubbas 16\n\n== Acht Zaligheden ==\n\n== Gemeenschapshuis Orion ==\nGemeenschapshuis de Orion is het kloppend hart van de gemeenschap Lennisheuvel. Hier links op de foto naast de in 2004? gerealiseerde kiosk.\n\n[[Afbeelding:Centrum_Lennisheuvel.JPG|left]]\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nDe Orion is opgericht in 1948 onder bezielende leiding van de toenmalige pastoor Manders. In het archief zijn bijgevoegde twee afbeeldingen gevonden, waarvan de relatie met de Orion niet duidelijk is bij uw schrijver dezes.\n\n[[Afbeelding:Geschiedenis_Orion_003.JPG | 400px|Gezelschap]] [[Afbeelding:Geschiedenis_Orion_004.JPG | 400px|Interieur van de kerk anno?]]\n\n\n\nDe Orion is nauw verbonden met mensen, verenigingen en gebeurtenissen in het dorp. Zoals hier bij de start van een wandeltocht van de 7-mijls stappers (later opgegaan in de Keistampers). Het bord met aanduiding Orion is later vervangen.\n[[Afbeelding:Zevenmijlstappers_001.JPG | thumb | Vertrek van jeugdige Zevenmijlsstappers (midden jaren \'80)]]\n\nOver de geschiedenis van Orion is een serie artikelen verschenen in het dorpsorgaan Rond Kerk en Orion (2008-2009).\nHet gebouw is in (jaartal?) uitgebreid. \'\'Hier moet nog het een en ander over worden beschreven. Wie voelt zich geroepen?\'\'\n\nHieronder ziet u de Fanfare Sint Arnoldus die in de kerk een mis opluistert ter ere van het 40-jarig bestaan van de Orion (1988).\nEveneens ter gelegenheid van het 40-jarig bestaan werd er in de toenmalige kiosk een dansje in klederdracht opgevoerd (1988?).\n\n\nOok was er een feestavond in de Orion zelf\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n\n<gallery caption=\"40 jaar Orion (Alle foto\'s gemaakt door C. Willers)\">\nAfbeelding:Geschiedenis_Orion_002.jpg | Boerendans in klederdracht\nAfbeelding:Geschiedenis_Orion_001.JPG | Mis in de Theresiakerk?\nAfbeelding:40jr_Orion_001.JPG | Feestavond \nAfbeelding:40jr_Orion_002.JPG| Gasten tijdens de feestavond\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n</gallery>', 'utf-8');
insert into `text` values ('105', '== Sint Theresia school ==\n\n== Sint Theresia kerk ==\n\n=== Het orgel ===\nGebouwd door Fa. L. Verschueren, Heythuysen 1950; met oud materiaal uit UDEN kl kruisheren; EP II vp: Hw 4-Nw 4-Ped 1. ingespeeld door Huub Hou?t, 1950.\n\nRenovatie Fa. L. Verschueren, Heythuysen 1970; EP II vp: 9\n\n\'\'\'Dispositie\'\'\'<br>\nHoofdwerk (manuaal I)<br>\nPrestant 8, Bourdon 8, Octaaf 4, Nasard 2 2/3\nNevenwerk (manuaal II)<br>\nGamba 8, Holpijp 8, Fl√ªte harmonique 4, Doublette 2\nPedaal<br>\nSubbas 16\n\n== Acht Zaligheden ==\n\n== Gemeenschapshuis Orion ==\nGemeenschapshuis de Orion is het kloppend hart van de gemeenschap Lennisheuvel. Hier links op de foto naast de in 2003 gerealiseerde kiosk.\n\n[[Afbeelding:Centrum_Lennisheuvel.JPG|left]]\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nDe Orion is opgericht in 1948 onder bezielende leiding van de toenmalige pastoor Manders. In het archief zijn bijgevoegde twee afbeeldingen gevonden, waarvan de relatie met de Orion niet duidelijk is bij uw schrijver dezes.\n\n[[Afbeelding:Geschiedenis_Orion_003.JPG | 400px|Gezelschap]] [[Afbeelding:Geschiedenis_Orion_004.JPG | 400px|Interieur van de kerk anno?]]\n\n\n\nDe Orion is nauw verbonden met mensen, verenigingen en gebeurtenissen in het dorp. Zoals hier bij de start van een wandeltocht van de 7-mijls stappers (later opgegaan in de Keistampers). Het bord met aanduiding Orion is later vervangen.\n[[Afbeelding:Zevenmijlstappers_001.JPG | thumb | Vertrek van jeugdige Zevenmijlsstappers (midden jaren \'80)]]\n\nOver de geschiedenis van Orion is een serie artikelen verschenen in het dorpsorgaan Rond Kerk en Orion (2008-2009).\nHet gebouw is in (jaartal?) uitgebreid. \'\'Hier moet nog het een en ander over worden beschreven. Wie voelt zich geroepen?\'\'\n\nHieronder ziet u de Fanfare Sint Arnoldus die in de kerk een mis opluistert ter ere van het 40-jarig bestaan van de Orion (1988).\nEveneens ter gelegenheid van het 40-jarig bestaan werd er in de toenmalige kiosk een dansje in klederdracht opgevoerd (1988?).\n\n\nOok was er een feestavond in de Orion zelf\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n\n<gallery caption=\"40 jaar Orion (Alle foto\'s gemaakt door C. Willers)\">\nAfbeelding:Geschiedenis_Orion_002.jpg | Boerendans in klederdracht\nAfbeelding:Geschiedenis_Orion_001.JPG | Mis in de Theresiakerk?\nAfbeelding:40jr_Orion_001.JPG | Feestavond \nAfbeelding:40jr_Orion_002.JPG| Gasten tijdens de feestavond\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n</gallery>', 'utf-8');
insert into `text` values ('106', '\n== Gescheurd Hemd ==\nHet Gescheurd Hemd is de naam van de aanbouwwijk die vanaf 1990 is gerealiseerd aan de noordoostkant van het dorp. De bouw is gestart aan de straat Lennisheuvel. De naam van de wijk verwijst naar de vorm van de plattegrond, die zou lijken op een hemd met een scheur.\n\nVoordat de wijk werd gebouwd was de aanblik van het dorp Lennisheuvel heel anders dan vandaag. Je keek vanaf de velden achter in de tuinen van de huizen aan de straat Lennisheuvel. Deze foto van C. Willers illustreert dat.\n\n[[Afbeelding:Sneeuw_001.JPG|400px|center|Blik over de velden richting de kerk voor aanbouw van het Gescheurd Hemd]]\n\nAan de huizen is in verschillende fasen gebouwd. De straatnamen verwijzen naar de geschiedenis: Pastoor Tilmanstraat, Pastoor Mandersstraat. In de jaren \'90 zijn daar ploeg, Eg, Greep aan toegevoegd. De laatste uitbreiding dateert van 2005.\n\n<gallery caption=\"Aanbouw Gescheurd Hemd\">\nAfbeelding:Nieuwbouw_001.JPG\nAfbeelding:Nieuwbouw_002.JPG\nAfbeelding:Nieuwbouw_003.JPG\nAfbeelding:Nieuwbouw_005.JPG\n</gallery>\n\n== Mijlstraat ==\n\n== Straat Lennisheuvel ==\n\n== Armehoefstraat ==', 'utf-8');
insert into `text` values ('107', '== Sint Theresia school ==\n\n== Sint Theresia kerk ==\n\n=== Het orgel ===\nGebouwd door Fa. L. Verschueren, Heythuysen 1950; met oud materiaal uit UDEN kl kruisheren; EP II vp: Hw 4-Nw 4-Ped 1. ingespeeld door Huub Hou?t, 1950.\n\nRenovatie Fa. L. Verschueren, Heythuysen 1970; EP II vp: 9\n\n\'\'\'Dispositie\'\'\'<br>\nHoofdwerk (manuaal I)<br>\nPrestant 8, Bourdon 8, Octaaf 4, Nasard 2 2/3\nNevenwerk (manuaal II)<br>\nGamba 8, Holpijp 8, Fl√ªte harmonique 4, Doublette 2\nPedaal<br>\nSubbas 16\n\n== Acht Zaligheden ==\n\n== Gemeenschapshuis Orion ==\nGemeenschapshuis de Orion is het kloppend hart van de gemeenschap Lennisheuvel. Hier links op de foto naast de in 2003 gerealiseerde kiosk.\n\n[[Afbeelding:Centrum_Lennisheuvel.JPG|left]]\n\n<br>\nDe Orion is opgericht in 1948 onder bezielende leiding van de toenmalige pastoor Manders. In het archief zijn bijgevoegde twee afbeeldingen gevonden, waarvan de relatie met de Orion niet duidelijk is bij uw schrijver dezes.\n\n[[Afbeelding:Geschiedenis_Orion_003.JPG | 400px|Gezelschap]] [[Afbeelding:Geschiedenis_Orion_004.JPG | 400px|Interieur van de kerk anno?]]\n\n\n\nDe Orion is nauw verbonden met mensen, verenigingen en gebeurtenissen in het dorp. Zoals hier bij de start van een wandeltocht van de 7-mijls stappers (later opgegaan in de Keistampers). Het bord met aanduiding Orion is later vervangen.\n[[Afbeelding:Zevenmijlstappers_001.JPG | thumb | Vertrek van jeugdige Zevenmijlsstappers (midden jaren \'80)]]\n\nOver de geschiedenis van Orion is een serie artikelen verschenen in het dorpsorgaan Rond Kerk en Orion (2008-2009).\nHet gebouw is in (jaartal?) uitgebreid. \'\'Hier moet nog het een en ander over worden beschreven. Wie voelt zich geroepen?\'\'\n\nHieronder ziet u de Fanfare Sint Arnoldus die in de kerk een mis opluistert ter ere van het 40-jarig bestaan van de Orion (1988).\nEveneens ter gelegenheid van het 40-jarig bestaan werd er in de toenmalige kiosk een dansje in klederdracht opgevoerd (1988?).\n\n\nOok was er een feestavond in de Orion zelf\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n\n<gallery caption=\"40 jaar Orion (Alle foto\'s gemaakt door C. Willers)\">\nAfbeelding:Geschiedenis_Orion_002.jpg | Boerendans in klederdracht\nAfbeelding:Geschiedenis_Orion_001.JPG | Mis in de Theresiakerk?\nAfbeelding:40jr_Orion_001.JPG | Feestavond \nAfbeelding:40jr_Orion_002.JPG| Gasten tijdens de feestavond\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n</gallery>', 'utf-8');
insert into `text` values ('108', '== Sint Theresia school ==\n\n== Sint Theresia kerk ==\n\n=== Het orgel ===\nGebouwd door Fa. L. Verschueren, Heythuysen 1950; met oud materiaal uit UDEN kl kruisheren; EP II vp: Hw 4-Nw 4-Ped 1. ingespeeld door Huub Hou?t, 1950.\n\nRenovatie Fa. L. Verschueren, Heythuysen 1970; EP II vp: 9\n\n\'\'\'Dispositie\'\'\'<br>\nHoofdwerk (manuaal I)<br>\nPrestant 8, Bourdon 8, Octaaf 4, Nasard 2 2/3\nNevenwerk (manuaal II)<br>\nGamba 8, Holpijp 8, Fl√ªte harmonique 4, Doublette 2\nPedaal<br>\nSubbas 16\n\n== Acht Zaligheden ==\n\n== Gemeenschapshuis Orion ==\nGemeenschapshuis de Orion is het kloppend hart van de gemeenschap Lennisheuvel. Hier links op de foto naast de in 2003 gerealiseerde kiosk.\n\n[[Afbeelding:Centrum_Lennisheuvel.JPG|left]]\n\n<p>\nDe Orion is opgericht in 1948 onder bezielende leiding van de toenmalige pastoor Manders. In het archief zijn bijgevoegde twee afbeeldingen gevonden, waarvan de relatie met de Orion niet duidelijk is bij uw schrijver dezes.\n\n[[Afbeelding:Geschiedenis_Orion_003.JPG | 400px|Gezelschap]] [[Afbeelding:Geschiedenis_Orion_004.JPG | 400px|Interieur van de kerk anno?]]\n\n\n\nDe Orion is nauw verbonden met mensen, verenigingen en gebeurtenissen in het dorp. Zoals hier bij de start van een wandeltocht van de 7-mijls stappers (later opgegaan in de Keistampers). Het bord met aanduiding Orion is later vervangen.\n[[Afbeelding:Zevenmijlstappers_001.JPG | thumb | Vertrek van jeugdige Zevenmijlsstappers (midden jaren \'80)]]\n\nOver de geschiedenis van Orion is een serie artikelen verschenen in het dorpsorgaan Rond Kerk en Orion (2008-2009).\nHet gebouw is in (jaartal?) uitgebreid. \'\'Hier moet nog het een en ander over worden beschreven. Wie voelt zich geroepen?\'\'\n\nHieronder ziet u de Fanfare Sint Arnoldus die in de kerk een mis opluistert ter ere van het 40-jarig bestaan van de Orion (1988).\nEveneens ter gelegenheid van het 40-jarig bestaan werd er in de toenmalige kiosk een dansje in klederdracht opgevoerd (1988?).\n\n\nOok was er een feestavond in de Orion zelf\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n\n<gallery caption=\"40 jaar Orion (Alle foto\'s gemaakt door C. Willers)\">\nAfbeelding:Geschiedenis_Orion_002.jpg | Boerendans in klederdracht\nAfbeelding:Geschiedenis_Orion_001.JPG | Mis in de Theresiakerk?\nAfbeelding:40jr_Orion_001.JPG | Feestavond \nAfbeelding:40jr_Orion_002.JPG| Gasten tijdens de feestavond\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n</gallery>', 'utf-8');
insert into `text` values ('109', '== Sint Theresia school ==\n\n== Sint Theresia kerk ==\n\n=== Het orgel ===\nGebouwd door Fa. L. Verschueren, Heythuysen 1950; met oud materiaal uit UDEN kl kruisheren; EP II vp: Hw 4-Nw 4-Ped 1. ingespeeld door Huub Hou?t, 1950.\n\nRenovatie Fa. L. Verschueren, Heythuysen 1970; EP II vp: 9\n\n\'\'\'Dispositie\'\'\'<br>\nHoofdwerk (manuaal I)<br>\nPrestant 8, Bourdon 8, Octaaf 4, Nasard 2 2/3\nNevenwerk (manuaal II)<br>\nGamba 8, Holpijp 8, Fl√ªte harmonique 4, Doublette 2\nPedaal<br>\nSubbas 16\n\n== Acht Zaligheden ==\n\n== Gemeenschapshuis Orion ==\nGemeenschapshuis de Orion is het kloppend hart van de gemeenschap Lennisheuvel. Hier links op de foto naast de in 2003 gerealiseerde kiosk.\n\n[[Afbeelding:Centrum_Lennisheuvel.JPG|left]]\n\n\n\n\n\n\n\n\n\nDe Orion is opgericht in 1948 onder bezielende leiding van de toenmalige pastoor Manders. In het archief zijn bijgevoegde twee afbeeldingen gevonden, waarvan de relatie met de Orion niet duidelijk is bij uw schrijver dezes.\n\n[[Afbeelding:Geschiedenis_Orion_003.JPG | 400px|Gezelschap]] [[Afbeelding:Geschiedenis_Orion_004.JPG | 400px|Interieur van de kerk anno?]]\n\n\n\nDe Orion is nauw verbonden met mensen, verenigingen en gebeurtenissen in het dorp. Zoals hier bij de start van een wandeltocht van de 7-mijls stappers (later opgegaan in de Keistampers). Het bord met aanduiding Orion is later vervangen.\n[[Afbeelding:Zevenmijlstappers_001.JPG | thumb | Vertrek van jeugdige Zevenmijlsstappers (midden jaren \'80)]]\n\nOver de geschiedenis van Orion is een serie artikelen verschenen in het dorpsorgaan Rond Kerk en Orion (2008-2009).\nHet gebouw is in (jaartal?) uitgebreid. \'\'Hier moet nog het een en ander over worden beschreven. Wie voelt zich geroepen?\'\'\n\nHieronder ziet u de Fanfare Sint Arnoldus die in de kerk een mis opluistert ter ere van het 40-jarig bestaan van de Orion (1988).\nEveneens ter gelegenheid van het 40-jarig bestaan werd er in de toenmalige kiosk een dansje in klederdracht opgevoerd (1988?).\n\n\nOok was er een feestavond in de Orion zelf\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n\n<gallery caption=\"40 jaar Orion (Alle foto\'s gemaakt door C. Willers)\">\nAfbeelding:Geschiedenis_Orion_002.jpg | Boerendans in klederdracht\nAfbeelding:Geschiedenis_Orion_001.JPG | Mis in de Theresiakerk?\nAfbeelding:40jr_Orion_001.JPG | Feestavond \nAfbeelding:40jr_Orion_002.JPG| Gasten tijdens de feestavond\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n</gallery>', 'utf-8');
insert into `text` values ('110', '== Sint Theresia school ==\n\n== Sint Theresia kerk ==\n\n=== Het orgel ===\nGebouwd door Fa. L. Verschueren, Heythuysen 1950; met oud materiaal uit UDEN kl kruisheren; EP II vp: Hw 4-Nw 4-Ped 1. ingespeeld door Huub Hou?t, 1950.\n\nRenovatie Fa. L. Verschueren, Heythuysen 1970; EP II vp: 9\n\n\'\'\'Dispositie\'\'\'<br>\nHoofdwerk (manuaal I)<br>\nPrestant 8, Bourdon 8, Octaaf 4, Nasard 2 2/3\nNevenwerk (manuaal II)<br>\nGamba 8, Holpijp 8, Fl√ªte harmonique 4, Doublette 2\nPedaal<br>\nSubbas 16\n\n== Acht Zaligheden ==\n\n== Gemeenschapshuis Orion ==\nGemeenschapshuis de Orion is het kloppend hart van de gemeenschap Lennisheuvel. Hier links op de foto naast de in 2003 gerealiseerde kiosk.\n\n[[Afbeelding:Centrum_Lennisheuvel.JPG|right]]\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nDe Orion is opgericht in 1948 onder bezielende leiding van de toenmalige pastoor Manders. In het archief zijn bijgevoegde twee afbeeldingen gevonden, waarvan de relatie met de Orion niet duidelijk is bij uw schrijver dezes.\n\n[[Afbeelding:Geschiedenis_Orion_003.JPG | 400px|Gezelschap]] [[Afbeelding:Geschiedenis_Orion_004.JPG | 400px|Interieur van de kerk anno?]]\n\n\n\nDe Orion is nauw verbonden met mensen, verenigingen en gebeurtenissen in het dorp. Zoals hier bij de start van een wandeltocht van de 7-mijls stappers (later opgegaan in de Keistampers). Het bord met aanduiding Orion is later vervangen.\n[[Afbeelding:Zevenmijlstappers_001.JPG | thumb | Vertrek van jeugdige Zevenmijlsstappers (midden jaren \'80)]]\n\nOver de geschiedenis van Orion is een serie artikelen verschenen in het dorpsorgaan Rond Kerk en Orion (2008-2009).\nHet gebouw is in (jaartal?) uitgebreid. \'\'Hier moet nog het een en ander over worden beschreven. Wie voelt zich geroepen?\'\'\n\nHieronder ziet u de Fanfare Sint Arnoldus die in de kerk een mis opluistert ter ere van het 40-jarig bestaan van de Orion (1988).\nEveneens ter gelegenheid van het 40-jarig bestaan werd er in de toenmalige kiosk een dansje in klederdracht opgevoerd (1988?).\n\n\nOok was er een feestavond in de Orion zelf\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n\n<gallery caption=\"40 jaar Orion (Alle foto\'s gemaakt door C. Willers)\">\nAfbeelding:Geschiedenis_Orion_002.jpg | Boerendans in klederdracht\nAfbeelding:Geschiedenis_Orion_001.JPG | Mis in de Theresiakerk?\nAfbeelding:40jr_Orion_001.JPG | Feestavond \nAfbeelding:40jr_Orion_002.JPG| Gasten tijdens de feestavond\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n</gallery>', 'utf-8');
insert into `text` values ('111', '== Sint Theresia school ==\n\n== Sint Theresia kerk ==\n\n=== Het orgel ===\nGebouwd door Fa. L. Verschueren, Heythuysen 1950; met oud materiaal uit UDEN kl kruisheren; EP II vp: Hw 4-Nw 4-Ped 1. ingespeeld door Huub Hou?t, 1950.\n\nRenovatie Fa. L. Verschueren, Heythuysen 1970; EP II vp: 9\n\n\'\'\'Dispositie\'\'\'<br>\nHoofdwerk (manuaal I)<br>\nPrestant 8, Bourdon 8, Octaaf 4, Nasard 2 2/3\nNevenwerk (manuaal II)<br>\nGamba 8, Holpijp 8, Fl√ªte harmonique 4, Doublette 2\nPedaal<br>\nSubbas 16\n\n== Acht Zaligheden ==\n\n== Gemeenschapshuis Orion ==\nGemeenschapshuis de Orion is het kloppend hart van de gemeenschap Lennisheuvel. Hier links op de foto naast de in 2003 gerealiseerde kiosk.\n\n[[Afbeelding:Centrum_Lennisheuvel.JPG|left|none]]\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nDe Orion is opgericht in 1948 onder bezielende leiding van de toenmalige pastoor Manders. In het archief zijn bijgevoegde twee afbeeldingen gevonden, waarvan de relatie met de Orion niet duidelijk is bij uw schrijver dezes.\n\n[[Afbeelding:Geschiedenis_Orion_003.JPG | 400px|Gezelschap]] [[Afbeelding:Geschiedenis_Orion_004.JPG | 400px|Interieur van de kerk anno?]]\n\n\n\nDe Orion is nauw verbonden met mensen, verenigingen en gebeurtenissen in het dorp. Zoals hier bij de start van een wandeltocht van de 7-mijls stappers (later opgegaan in de Keistampers). Het bord met aanduiding Orion is later vervangen.\n[[Afbeelding:Zevenmijlstappers_001.JPG | thumb | Vertrek van jeugdige Zevenmijlsstappers (midden jaren \'80)]]\n\nOver de geschiedenis van Orion is een serie artikelen verschenen in het dorpsorgaan Rond Kerk en Orion (2008-2009).\nHet gebouw is in (jaartal?) uitgebreid. \'\'Hier moet nog het een en ander over worden beschreven. Wie voelt zich geroepen?\'\'\n\nHieronder ziet u de Fanfare Sint Arnoldus die in de kerk een mis opluistert ter ere van het 40-jarig bestaan van de Orion (1988).\nEveneens ter gelegenheid van het 40-jarig bestaan werd er in de toenmalige kiosk een dansje in klederdracht opgevoerd (1988?).\n\n\nOok was er een feestavond in de Orion zelf\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n\n<gallery caption=\"40 jaar Orion (Alle foto\'s gemaakt door C. Willers)\">\nAfbeelding:Geschiedenis_Orion_002.jpg | Boerendans in klederdracht\nAfbeelding:Geschiedenis_Orion_001.JPG | Mis in de Theresiakerk?\nAfbeelding:40jr_Orion_001.JPG | Feestavond \nAfbeelding:40jr_Orion_002.JPG| Gasten tijdens de feestavond\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n</gallery>', 'utf-8');
insert into `text` values ('112', '== Sint Theresia school ==\n\n== Sint Theresia kerk ==\n\n=== Het orgel ===\nGebouwd door Fa. L. Verschueren, Heythuysen 1950; met oud materiaal uit UDEN kl kruisheren; EP II vp: Hw 4-Nw 4-Ped 1. ingespeeld door Huub Hou?t, 1950.\n\nRenovatie Fa. L. Verschueren, Heythuysen 1970; EP II vp: 9\n\n\'\'\'Dispositie\'\'\'<br>\nHoofdwerk (manuaal I)<br>\nPrestant 8, Bourdon 8, Octaaf 4, Nasard 2 2/3\nNevenwerk (manuaal II)<br>\nGamba 8, Holpijp 8, Fl√ªte harmonique 4, Doublette 2\nPedaal<br>\nSubbas 16\n\n== Acht Zaligheden ==\n\n== Gemeenschapshuis Orion ==\nGemeenschapshuis de Orion is het kloppend hart van de gemeenschap Lennisheuvel. Hier links op de foto naast de in 2003 gerealiseerde kiosk.\n\n[[Afbeelding:Centrum_Lennisheuvel.JPG|none]]\n\nDe Orion is opgericht in 1948 onder bezielende leiding van de toenmalige pastoor Manders. In het archief zijn bijgevoegde twee afbeeldingen gevonden, waarvan de relatie met de Orion niet duidelijk is bij uw schrijver dezes.\n\n[[Afbeelding:Geschiedenis_Orion_003.JPG | 400px|Gezelschap]] [[Afbeelding:Geschiedenis_Orion_004.JPG | 400px|Interieur van de kerk anno?]]\n\n\n\nDe Orion is nauw verbonden met mensen, verenigingen en gebeurtenissen in het dorp. Zoals hier bij de start van een wandeltocht van de 7-mijls stappers (later opgegaan in de Keistampers). Het bord met aanduiding Orion is later vervangen.\n[[Afbeelding:Zevenmijlstappers_001.JPG | thumb | Vertrek van jeugdige Zevenmijlsstappers (midden jaren \'80)]]\n\nOver de geschiedenis van Orion is een serie artikelen verschenen in het dorpsorgaan Rond Kerk en Orion (2008-2009).\nHet gebouw is in (jaartal?) uitgebreid. \'\'Hier moet nog het een en ander over worden beschreven. Wie voelt zich geroepen?\'\'\n\nHieronder ziet u de Fanfare Sint Arnoldus die in de kerk een mis opluistert ter ere van het 40-jarig bestaan van de Orion (1988).\nEveneens ter gelegenheid van het 40-jarig bestaan werd er in de toenmalige kiosk een dansje in klederdracht opgevoerd (1988?).\n\n\nOok was er een feestavond in de Orion zelf\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n\n<gallery caption=\"40 jaar Orion (Alle foto\'s gemaakt door C. Willers)\">\nAfbeelding:Geschiedenis_Orion_002.jpg | Boerendans in klederdracht\nAfbeelding:Geschiedenis_Orion_001.JPG | Mis in de Theresiakerk?\nAfbeelding:40jr_Orion_001.JPG | Feestavond \nAfbeelding:40jr_Orion_002.JPG| Gasten tijdens de feestavond\n\'\'-> Wie weet nog wie hier op de foto staan? <-\'\'\n</gallery>', 'utf-8');
insert into `text` values ('113', '', 'utf-8');
insert into `text` values ('114', 'De parochiekerk is in 1926 gesticht door pastoor Manders.', 'utf-8');


### structure of table `trackbacks` ###

DROP TABLE IF EXISTS `trackbacks`;

CREATE TABLE `trackbacks` (
  `tb_id` int(11) NOT NULL auto_increment,
  `tb_page` int(11) default NULL,
  `tb_title` varbinary(255) NOT NULL,
  `tb_url` blob NOT NULL,
  `tb_ex` blob,
  `tb_name` varbinary(255) default NULL,
  PRIMARY KEY  (`tb_id`),
  KEY `tb_page` (`tb_page`)
) ENGINE=InnoDB DEFAULT CHARSET=binary AUTO_INCREMENT=1;


### data of table `trackbacks` ###



### structure of table `transcache` ###

DROP TABLE IF EXISTS `transcache`;

CREATE TABLE `transcache` (
  `tc_url` varbinary(255) NOT NULL,
  `tc_contents` blob,
  `tc_time` int(11) NOT NULL,
  UNIQUE KEY `tc_url_idx` (`tc_url`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;


### data of table `transcache` ###



### structure of table `updatelog` ###

DROP TABLE IF EXISTS `updatelog`;

CREATE TABLE `updatelog` (
  `ul_key` varbinary(255) NOT NULL,
  PRIMARY KEY  (`ul_key`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;


### data of table `updatelog` ###



### structure of table `user` ###

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(10) unsigned NOT NULL auto_increment,
  `user_name` varbinary(255) NOT NULL default '',
  `user_real_name` varbinary(255) NOT NULL default '',
  `user_password` tinyblob NOT NULL,
  `user_newpassword` tinyblob NOT NULL,
  `user_newpass_time` binary(14) default NULL,
  `user_email` tinyblob NOT NULL,
  `user_options` blob NOT NULL,
  `user_touched` binary(14) NOT NULL default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `user_token` binary(32) NOT NULL default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `user_email_authenticated` binary(14) default NULL,
  `user_email_token` binary(32) default NULL,
  `user_email_token_expires` binary(14) default NULL,
  `user_registration` binary(14) default NULL,
  `user_editcount` int(11) default NULL,
  PRIMARY KEY  (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  KEY `user_email_token` (`user_email_token`)
) ENGINE=InnoDB DEFAULT CHARSET=binary AUTO_INCREMENT=11;


### data of table `user` ###

insert into `user` values ('1', 'WikiAdmin', '', ':B:5bb5bb66:2d753bc696d6fd804fad14c34ed1af05', '', null, '', 'quickbar=1\nunderline=2\ncols=80\nrows=25\nsearchlimit=20\ncontextlines=5\ncontextchars=50\ndisablesuggest=\najaxsearch=\nskin=lennisskin\nmath=1\nusenewrc=0\nrcdays=7\nrclimit=50\nwllimit=250\nhideminor=0\nhighlightbroken=1\nstubthreshold=0\npreviewontop=1\npreviewonfirst=0\neditsection=1\neditsectiononrightclick=0\neditondblclick=0\neditwidth=0\nshowtoc=1\nshowtoolbar=1\nminordefault=0\ndate=default\nimagesize=2\nthumbsize=2\nrememberpassword=0\nenotifwatchlistpages=0\nenotifusertalkpages=1\nenotifminoredits=0\nenotifrevealaddr=0\nshownumberswatching=0\nfancysig=0\nexternaleditor=0\nexternaldiff=0\nshowjumplinks=1\nnumberheadings=0\nuselivepreview=0\nwatchlistdays=3\nextendwatchlist=0\nwatchlisthideminor=0\nwatchlisthidebots=0\nwatchlisthideown=0\nwatchcreations=0\nwatchdefault=0\nwatchmoves=0\nwatchdeletion=0\nvariant=\nlanguage=nl\nsearchNs0=1\nnickname=\ntimecorrection=\nsearchNs1=0\nsearchNs2=0\nsearchNs3=0\nsearchNs4=0\nsearchNs5=0\nsearchNs6=0\nsearchNs7=0\nsearchNs8=0\nsearchNs9=0\nsearchNs10=0\nsearchNs11=0\nsearchNs12=0\nsearchNs13=0\nsearchNs14=0\nsearchNs15=0\ndisablemail=0\njustify=0\nnocache=0\nforceeditsummary=0\nccmeonemails=0\ndiffonly=0\nshowhiddencats=0', '20090306201042', 'c9e3522e84a8cb7b2728339684f750ff', null, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', null, '20090114161437', '35');
insert into `user` values ('2', 'JeroenSchuyt', 'Jeroen', ':B:4393fded:91cda388accf7428de8b9699863d766a', '', null, 'jerotonk@home.nl', 'quickbar=1\nunderline=2\ncols=80\nrows=25\nsearchlimit=20\ncontextlines=5\ncontextchars=50\ndisablesuggest=\najaxsearch=\nskin=lennisskin\nmath=1\nusenewrc=0\nrcdays=7\nrclimit=50\nwllimit=250\nhideminor=0\nhighlightbroken=1\nstubthreshold=0\npreviewontop=1\npreviewonfirst=0\neditsection=1\neditsectiononrightclick=0\neditondblclick=0\neditwidth=0\nshowtoc=1\nshowtoolbar=1\nminordefault=0\ndate=default\nimagesize=2\nthumbsize=2\nrememberpassword=0\nenotifwatchlistpages=0\nenotifusertalkpages=0\nenotifminoredits=0\nenotifrevealaddr=0\nshownumberswatching=0\nfancysig=0\nexternaleditor=0\nexternaldiff=0\nshowjumplinks=1\nnumberheadings=0\nuselivepreview=0\nwatchlistdays=3\nextendwatchlist=0\nwatchlisthideminor=0\nwatchlisthidebots=0\nwatchlisthideown=0\nwatchcreations=0\nwatchdefault=0\nwatchmoves=0\nwatchdeletion=0\nvariant=\nlanguage=nl\nsearchNs0=1\nnickname=\ntimecorrection=\nsearchNs1=0\nsearchNs2=0\nsearchNs3=0\nsearchNs4=0\nsearchNs5=0\nsearchNs6=0\nsearchNs7=0\nsearchNs8=0\nsearchNs9=0\nsearchNs10=0\nsearchNs11=0\nsearchNs12=0\nsearchNs13=0\nsearchNs14=0\nsearchNs15=0\ndisablemail=1\njustify=0\nnocache=0\nforceeditsummary=0\nccmeonemails=0\ndiffonly=0\nshowhiddencats=0', '20090207141543', '87b60819c03e18ac73d3f747c1d72a65', null, '8c3c768975de5cfa9e0bab5989e9b05e', '20090214140502', '20090207140502', '0');
insert into `user` values ('3', 'User1', 'User1', ':B:c2f5c5cf:c5123679fec51870e806fea0371bd465', ':B:addb69de:e23265bd4b62f588d111ad45113f8ad3', '20090218193716', 'jerotonk@home.nl', 'quickbar=1\nunderline=2\ncols=80\nrows=25\nsearchlimit=20\ncontextlines=5\ncontextchars=50\ndisablesuggest=0\najaxsearch=0\nskin=\nmath=1\nusenewrc=0\nrcdays=7\nrclimit=50\nwllimit=250\nhideminor=0\nhighlightbroken=1\nstubthreshold=0\npreviewontop=1\npreviewonfirst=0\neditsection=1\neditsectiononrightclick=0\neditondblclick=0\neditwidth=0\nshowtoc=1\nshowtoolbar=1\nminordefault=0\ndate=default\nimagesize=2\nthumbsize=2\nrememberpassword=0\nenotifwatchlistpages=0\nenotifusertalkpages=1\nenotifminoredits=0\nenotifrevealaddr=0\nshownumberswatching=1\nfancysig=0\nexternaleditor=0\nexternaldiff=0\nshowjumplinks=1\nnumberheadings=0\nuselivepreview=0\nwatchlistdays=3\nextendwatchlist=0\nwatchlisthideminor=0\nwatchlisthidebots=0\nwatchlisthideown=0\nwatchcreations=0\nwatchdefault=0\nwatchmoves=0\nwatchdeletion=0\nvariant=nl\nlanguage=nl\nsearchNs0=1', '20090218193721', 'a1aeb3678ebf2ca65613aa6f6a3e16e6', null, 'b101e9e5f6ff3032514f6cc0cac9bf0b', '20090217193335', '20090210193335', '0');
insert into `user` values ('4', 'User2', '', ':B:e09dc774:eff3686d6e867ec7efc10a6019984ad2', '', null, 'jojo76@hotmail.com', 'quickbar=1\nunderline=2\ncols=80\nrows=25\nsearchlimit=20\ncontextlines=5\ncontextchars=50\ndisablesuggest=0\najaxsearch=0\nskin=\nmath=1\nusenewrc=0\nrcdays=7\nrclimit=50\nwllimit=250\nhideminor=0\nhighlightbroken=1\nstubthreshold=0\npreviewontop=1\npreviewonfirst=0\neditsection=1\neditsectiononrightclick=0\neditondblclick=0\neditwidth=0\nshowtoc=1\nshowtoolbar=1\nminordefault=0\ndate=default\nimagesize=2\nthumbsize=2\nrememberpassword=0\nenotifwatchlistpages=0\nenotifusertalkpages=1\nenotifminoredits=0\nenotifrevealaddr=0\nshownumberswatching=1\nfancysig=0\nexternaleditor=0\nexternaldiff=0\nshowjumplinks=1\nnumberheadings=0\nuselivepreview=0\nwatchlistdays=3\nextendwatchlist=0\nwatchlisthideminor=0\nwatchlisthidebots=0\nwatchlisthideown=0\nwatchcreations=0\nwatchdefault=0\nwatchmoves=0\nwatchdeletion=0\nvariant=nl\nlanguage=nl\nsearchNs0=1', '20090210203822', 'ca6c7d4f13d38c6eca93c3f6a2e14f21', null, '5dfbf9839e2f4530f8977d9ba0386d0f', '20090217203817', '20090210203817', '0');
insert into `user` values ('5', 'User3', '', ':B:abc05b7d:adee41a83044300062857a27da879909', '', null, 'klm12311@gmail.com', 'quickbar=1\nunderline=2\ncols=80\nrows=25\nsearchlimit=20\ncontextlines=5\ncontextchars=50\ndisablesuggest=0\najaxsearch=0\nskin=\nmath=1\nusenewrc=0\nrcdays=7\nrclimit=50\nwllimit=250\nhideminor=0\nhighlightbroken=1\nstubthreshold=0\npreviewontop=1\npreviewonfirst=0\neditsection=1\neditsectiononrightclick=0\neditondblclick=0\neditwidth=0\nshowtoc=1\nshowtoolbar=1\nminordefault=0\ndate=default\nimagesize=2\nthumbsize=2\nrememberpassword=0\nenotifwatchlistpages=0\nenotifusertalkpages=1\nenotifminoredits=0\nenotifrevealaddr=0\nshownumberswatching=1\nfancysig=0\nexternaleditor=0\nexternaldiff=0\nshowjumplinks=1\nnumberheadings=0\nuselivepreview=0\nwatchlistdays=3\nextendwatchlist=0\nwatchlisthideminor=0\nwatchlisthidebots=0\nwatchlisthideown=0\nwatchcreations=0\nwatchdefault=0\nwatchmoves=0\nwatchdeletion=0\nvariant=nl\nlanguage=nl\nsearchNs0=1', '20090210204430', '03df09878410eb673c3287ace2934430', '20090210204425', '43a0e0a0fbf91b8d90df43db537f9d01', '20090217204348', '20090210204348', '0');
insert into `user` values ('6', 'User4', '', ':B:7cc49472:f9c1a067401d43326f5f6d065bc1df49', '', null, 'klm12311@gmail.com', 'quickbar=1\nunderline=2\ncols=80\nrows=25\nsearchlimit=20\ncontextlines=5\ncontextchars=50\ndisablesuggest=0\najaxsearch=0\nskin=\nmath=1\nusenewrc=0\nrcdays=7\nrclimit=50\nwllimit=250\nhideminor=0\nhighlightbroken=1\nstubthreshold=0\npreviewontop=1\npreviewonfirst=0\neditsection=1\neditsectiononrightclick=0\neditondblclick=0\neditwidth=0\nshowtoc=1\nshowtoolbar=1\nminordefault=0\ndate=default\nimagesize=2\nthumbsize=2\nrememberpassword=0\nenotifwatchlistpages=0\nenotifusertalkpages=1\nenotifminoredits=0\nenotifrevealaddr=0\nshownumberswatching=1\nfancysig=0\nexternaleditor=0\nexternaldiff=0\nshowjumplinks=1\nnumberheadings=0\nuselivepreview=0\nwatchlistdays=3\nextendwatchlist=0\nwatchlisthideminor=0\nwatchlisthidebots=0\nwatchlisthideown=0\nwatchcreations=0\nwatchdefault=0\nwatchmoves=0\nwatchdeletion=0\nvariant=nl\nlanguage=nl\nsearchNs0=1', '20090210204600', 'f4878c5b6cba46e63f23a5246209ac39', null, 'a93be659a9ffd5f329e9ea7ce442aacf', '20090217204555', '20090210204554', '0');
insert into `user` values ('7', 'Twan', 'Twan Tiebosch', ':B:0f4324e4:3470aec23c1d68343b9859683ea31eeb', '', null, 't.tiebosch@planet.nl', 'quickbar=1\nunderline=2\ncols=80\nrows=25\nsearchlimit=20\ncontextlines=5\ncontextchars=50\ndisablesuggest=0\najaxsearch=0\nskin=\nmath=1\nusenewrc=0\nrcdays=7\nrclimit=50\nwllimit=250\nhideminor=0\nhighlightbroken=1\nstubthreshold=0\npreviewontop=1\npreviewonfirst=0\neditsection=1\neditsectiononrightclick=0\neditondblclick=0\neditwidth=0\nshowtoc=1\nshowtoolbar=1\nminordefault=0\ndate=default\nimagesize=2\nthumbsize=2\nrememberpassword=0\nenotifwatchlistpages=0\nenotifusertalkpages=1\nenotifminoredits=0\nenotifrevealaddr=0\nshownumberswatching=1\nfancysig=0\nexternaleditor=0\nexternaldiff=0\nshowjumplinks=1\nnumberheadings=0\nuselivepreview=0\nwatchlistdays=3\nextendwatchlist=0\nwatchlisthideminor=0\nwatchlisthidebots=0\nwatchlisthideown=0\nwatchcreations=0\nwatchdefault=0\nwatchmoves=0\nwatchdeletion=0\nvariant=nl\nlanguage=nl\nsearchNs0=1', '20090222204955', 'a2eb84b65d0ff8079c69dff3f02ed72a', '20090219193402', '777de1e1c3dc305e4f44a7c81aab3f0d', '20090226193302', '20090219193302', '69');
insert into `user` values ('8', 'Toonvangrinsven', 'Toon van Grinsven', ':B:fc85ff4e:b69c5dac4951dff96a21d49c9bc8977e', '', null, 'acv.grinsven@12move.nl', 'quickbar=1\nunderline=2\ncols=80\nrows=25\nsearchlimit=20\ncontextlines=5\ncontextchars=50\ndisablesuggest=0\najaxsearch=0\nskin=\nmath=1\nusenewrc=0\nrcdays=7\nrclimit=50\nwllimit=250\nhideminor=0\nhighlightbroken=1\nstubthreshold=0\npreviewontop=1\npreviewonfirst=0\neditsection=1\neditsectiononrightclick=0\neditondblclick=0\neditwidth=0\nshowtoc=1\nshowtoolbar=1\nminordefault=0\ndate=default\nimagesize=2\nthumbsize=2\nrememberpassword=0\nenotifwatchlistpages=0\nenotifusertalkpages=1\nenotifminoredits=0\nenotifrevealaddr=0\nshownumberswatching=1\nfancysig=0\nexternaleditor=0\nexternaldiff=0\nshowjumplinks=1\nnumberheadings=0\nuselivepreview=0\nwatchlistdays=3\nextendwatchlist=0\nwatchlisthideminor=0\nwatchlisthidebots=0\nwatchlisthideown=0\nwatchcreations=0\nwatchdefault=0\nwatchmoves=0\nwatchdeletion=0\nvariant=nl\nlanguage=nl\nsearchNs0=1', '20090225224658', '6a2825963b937c69f438328256eb87a8', '20090223224224', '6326122ef798e1daffeda655a0678e8b', '20090302191400', '20090223191400', '8');
insert into `user` values ('9', 'Heijden01', 'Gerard van der Heijden', ':B:3aca3c98:68403e053710cb5e471b0f547c81338c', '', null, 'gerardvanderheijden@logistancy.nl', 'quickbar=1\nunderline=2\ncols=80\nrows=25\nsearchlimit=20\ncontextlines=5\ncontextchars=50\ndisablesuggest=\najaxsearch=\nskin=lennisskin\nmath=1\nusenewrc=0\nrcdays=7\nrclimit=50\nwllimit=250\nhideminor=0\nhighlightbroken=1\nstubthreshold=0\npreviewontop=1\npreviewonfirst=0\neditsection=1\neditsectiononrightclick=0\neditondblclick=0\neditwidth=0\nshowtoc=1\nshowtoolbar=1\nminordefault=0\ndate=default\nimagesize=2\nthumbsize=2\nrememberpassword=0\nenotifwatchlistpages=0\nenotifusertalkpages=0\nenotifminoredits=0\nenotifrevealaddr=0\nshownumberswatching=0\nfancysig=0\nexternaleditor=0\nexternaldiff=0\nshowjumplinks=1\nnumberheadings=0\nuselivepreview=0\nwatchlistdays=3\nextendwatchlist=0\nwatchlisthideminor=0\nwatchlisthidebots=0\nwatchlisthideown=0\nwatchcreations=0\nwatchdefault=0\nwatchmoves=0\nwatchdeletion=0\nvariant=\nlanguage=nl\nsearchNs0=1\nnickname=\ntimecorrection=\nsearchNs1=0\nsearchNs2=0\nsearchNs3=0\nsearchNs4=0\nsearchNs5=0\nsearchNs6=0\nsearchNs7=0\nsearchNs8=0\nsearchNs9=0\nsearchNs10=0\nsearchNs11=0\nsearchNs12=0\nsearchNs13=0\nsearchNs14=0\nsearchNs15=0\ndisablemail=1\njustify=0\nnocache=0\nforceeditsummary=0\nccmeonemails=0\ndiffonly=0\nshowhiddencats=0', '20090306202917', 'c70b45f2d88a7f42d941e9c9fd36092f', null, '819caa9a5ea3015738eae64196fb9c33', '20090313200555', '20090306200555', '0');
insert into `user` values ('10', 'Mannien01', 'Peter Manni√´n', ':B:a9cc87f5:002dc5fcd3496f0feb3fe025dc8e6e04', '', null, 'p.mannien@planet.nl', 'quickbar=1\nunderline=2\ncols=80\nrows=25\nsearchlimit=20\ncontextlines=5\ncontextchars=50\ndisablesuggest=\najaxsearch=\nskin=lennisskin\nmath=1\nusenewrc=0\nrcdays=7\nrclimit=50\nwllimit=250\nhideminor=0\nhighlightbroken=1\nstubthreshold=0\npreviewontop=1\npreviewonfirst=0\neditsection=1\neditsectiononrightclick=0\neditondblclick=0\neditwidth=0\nshowtoc=1\nshowtoolbar=1\nminordefault=0\ndate=default\nimagesize=2\nthumbsize=2\nrememberpassword=1\nenotifwatchlistpages=0\nenotifusertalkpages=0\nenotifminoredits=0\nenotifrevealaddr=0\nshownumberswatching=0\nfancysig=0\nexternaleditor=0\nexternaldiff=0\nshowjumplinks=1\nnumberheadings=0\nuselivepreview=0\nwatchlistdays=3\nextendwatchlist=0\nwatchlisthideminor=0\nwatchlisthidebots=0\nwatchlisthideown=0\nwatchcreations=0\nwatchdefault=0\nwatchmoves=0\nwatchdeletion=0\nvariant=\nlanguage=nl\nsearchNs0=1\nnickname=\ntimecorrection=\nsearchNs1=0\nsearchNs2=0\nsearchNs3=0\nsearchNs4=0\nsearchNs5=0\nsearchNs6=0\nsearchNs7=0\nsearchNs8=0\nsearchNs9=0\nsearchNs10=0\nsearchNs11=0\nsearchNs12=0\nsearchNs13=0\nsearchNs14=0\nsearchNs15=0\ndisablemail=1\njustify=0\nnocache=0\nforceeditsummary=0\nccmeonemails=0\ndiffonly=0\nshowhiddencats=0', '20090307070327', 'fae837f228c4c1d6bf19e3d946999c95', '20090306214159', 'c2e81a000bc2d9873291215a08c36cae', '20090313200731', '20090306200731', '0');


### structure of table `user_groups` ###

DROP TABLE IF EXISTS `user_groups`;

CREATE TABLE `user_groups` (
  `ug_user` int(10) unsigned NOT NULL default '0',
  `ug_group` varbinary(16) NOT NULL default '',
  PRIMARY KEY  (`ug_user`,`ug_group`),
  KEY `ug_group` (`ug_group`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;


### data of table `user_groups` ###

insert into `user_groups` values ('1', 'bureaucrat');
insert into `user_groups` values ('1', 'sysop');


### structure of table `user_newtalk` ###

DROP TABLE IF EXISTS `user_newtalk`;

CREATE TABLE `user_newtalk` (
  `user_id` int(11) NOT NULL default '0',
  `user_ip` varbinary(40) NOT NULL default '',
  `user_last_timestamp` binary(14) NOT NULL default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  KEY `user_id` (`user_id`),
  KEY `user_ip` (`user_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;


### data of table `user_newtalk` ###



### structure of table `watchlist` ###

DROP TABLE IF EXISTS `watchlist`;

CREATE TABLE `watchlist` (
  `wl_user` int(10) unsigned NOT NULL,
  `wl_namespace` int(11) NOT NULL default '0',
  `wl_title` varbinary(255) NOT NULL default '',
  `wl_notificationtimestamp` varbinary(14) default NULL,
  UNIQUE KEY `wl_user` (`wl_user`,`wl_namespace`,`wl_title`),
  KEY `namespace_title` (`wl_namespace`,`wl_title`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;


### data of table `watchlist` ###

insert into `watchlist` values ('1', '8', 'Sidebar', null);
insert into `watchlist` values ('1', '9', 'Sidebar', null);
insert into `watchlist` values ('10', '0', 'Historische_Kamer', null);
insert into `watchlist` values ('10', '1', 'Historische_Kamer', null);
