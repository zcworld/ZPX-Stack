/*
MySQL Data Transfer
Source Host: localhost
Source Database: zpanel_hmail
Target Host: localhost
Target Database: zpanel_hmail
Date: 3/7/2012 16:07:23
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for hm_accounts
-- ----------------------------
DROP TABLE IF EXISTS `hm_accounts`;
CREATE TABLE `hm_accounts` (
  `accountid` int(11) NOT NULL AUTO_INCREMENT,
  `accountdomainid` int(11) NOT NULL,
  `accountadminlevel` tinyint(4) NOT NULL,
  `accountaddress` varchar(255) NOT NULL,
  `accountpassword` varchar(255) NOT NULL,
  `accountactive` tinyint(4) NOT NULL,
  `accountisad` tinyint(4) NOT NULL,
  `accountaddomain` varchar(255) NOT NULL,
  `accountadusername` varchar(255) NOT NULL,
  `accountmaxsize` int(11) NOT NULL,
  `accountvacationmessageon` tinyint(4) NOT NULL,
  `accountvacationmessage` text NOT NULL,
  `accountvacationsubject` varchar(200) NOT NULL,
  `accountpwencryption` tinyint(4) NOT NULL,
  `accountforwardenabled` tinyint(4) NOT NULL,
  `accountforwardaddress` varchar(255) NOT NULL,
  `accountforwardkeeporiginal` tinyint(4) NOT NULL,
  `accountenablesignature` tinyint(4) NOT NULL,
  `accountsignatureplaintext` text NOT NULL,
  `accountsignaturehtml` text NOT NULL,
  `accountlastlogontime` datetime NOT NULL,
  `accountvacationexpires` tinyint(3) unsigned NOT NULL,
  `accountvacationexpiredate` datetime NOT NULL,
  `accountpersonfirstname` varchar(60) NOT NULL,
  `accountpersonlastname` varchar(60) NOT NULL,
  PRIMARY KEY (`accountid`),
  UNIQUE KEY `accountid` (`accountid`),
  UNIQUE KEY `accountaddress` (`accountaddress`),
  KEY `idx_hm_accounts` (`accountaddress`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hm_acl
-- ----------------------------
DROP TABLE IF EXISTS `hm_acl`;
CREATE TABLE `hm_acl` (
  `aclid` bigint(20) NOT NULL AUTO_INCREMENT,
  `aclsharefolderid` bigint(20) NOT NULL,
  `aclpermissiontype` tinyint(4) NOT NULL,
  `aclpermissiongroupid` bigint(20) NOT NULL,
  `aclpermissionaccountid` bigint(20) NOT NULL,
  `aclvalue` bigint(20) NOT NULL,
  PRIMARY KEY (`aclid`),
  UNIQUE KEY `aclid` (`aclid`),
  UNIQUE KEY `aclsharefolderid` (`aclsharefolderid`,`aclpermissiontype`,`aclpermissiongroupid`,`aclpermissionaccountid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hm_aliases
-- ----------------------------
DROP TABLE IF EXISTS `hm_aliases`;
CREATE TABLE `hm_aliases` (
  `aliasid` int(11) NOT NULL AUTO_INCREMENT,
  `aliasdomainid` int(11) NOT NULL,
  `aliasname` varchar(255) NOT NULL,
  `aliasvalue` varchar(255) NOT NULL,
  `aliasactive` tinyint(4) NOT NULL,
  PRIMARY KEY (`aliasid`),
  UNIQUE KEY `aliasid` (`aliasid`),
  UNIQUE KEY `aliasname` (`aliasname`),
  KEY `idx_hm_aliases` (`aliasdomainid`,`aliasname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hm_blocked_attachments
-- ----------------------------
DROP TABLE IF EXISTS `hm_blocked_attachments`;
CREATE TABLE `hm_blocked_attachments` (
  `baid` bigint(20) NOT NULL AUTO_INCREMENT,
  `bawildcard` varchar(255) NOT NULL,
  `badescription` varchar(255) NOT NULL,
  PRIMARY KEY (`baid`),
  UNIQUE KEY `baid` (`baid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hm_dbversion
-- ----------------------------
DROP TABLE IF EXISTS `hm_dbversion`;
CREATE TABLE `hm_dbversion` (
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hm_distributionlists
-- ----------------------------
DROP TABLE IF EXISTS `hm_distributionlists`;
CREATE TABLE `hm_distributionlists` (
  `distributionlistid` int(11) NOT NULL AUTO_INCREMENT,
  `distributionlistdomainid` int(11) NOT NULL,
  `distributionlistaddress` varchar(255) NOT NULL,
  `distributionlistenabled` tinyint(4) NOT NULL,
  `distributionlistrequireauth` tinyint(4) NOT NULL,
  `distributionlistrequireaddress` varchar(255) NOT NULL,
  `distributionlistmode` tinyint(4) NOT NULL,
  PRIMARY KEY (`distributionlistid`),
  UNIQUE KEY `distributionlistid` (`distributionlistid`),
  UNIQUE KEY `distributionlistaddress` (`distributionlistaddress`),
  KEY `idx_hm_distributionlists` (`distributionlistdomainid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hm_distributionlistsrecipients
-- ----------------------------
DROP TABLE IF EXISTS `hm_distributionlistsrecipients`;
CREATE TABLE `hm_distributionlistsrecipients` (
  `distributionlistrecipientid` int(11) NOT NULL AUTO_INCREMENT,
  `distributionlistrecipientlistid` int(11) NOT NULL,
  `distributionlistrecipientaddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`distributionlistrecipientid`),
  UNIQUE KEY `distributionlistrecipientid` (`distributionlistrecipientid`),
  KEY `idx_hm_distributionlistsrecipients` (`distributionlistrecipientlistid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hm_dnsbl
-- ----------------------------
DROP TABLE IF EXISTS `hm_dnsbl`;
CREATE TABLE `hm_dnsbl` (
  `sblid` int(11) NOT NULL AUTO_INCREMENT,
  `sblactive` tinyint(4) NOT NULL,
  `sbldnshost` varchar(255) NOT NULL,
  `sblresult` varchar(255) NOT NULL,
  `sblrejectmessage` varchar(255) NOT NULL,
  `sblscore` int(11) NOT NULL,
  PRIMARY KEY (`sblid`),
  UNIQUE KEY `sblid` (`sblid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hm_domain_aliases
-- ----------------------------
DROP TABLE IF EXISTS `hm_domain_aliases`;
CREATE TABLE `hm_domain_aliases` (
  `daid` int(11) NOT NULL AUTO_INCREMENT,
  `dadomainid` int(11) NOT NULL,
  `daalias` varchar(255) NOT NULL,
  PRIMARY KEY (`daid`),
  UNIQUE KEY `daid` (`daid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hm_domains
-- ----------------------------
DROP TABLE IF EXISTS `hm_domains`;
CREATE TABLE `hm_domains` (
  `domainid` int(11) NOT NULL AUTO_INCREMENT,
  `domainname` varchar(80) NOT NULL,
  `domainactive` tinyint(4) NOT NULL,
  `domainpostmaster` varchar(80) NOT NULL,
  `domainmaxsize` int(11) NOT NULL,
  `domainaddomain` varchar(255) NOT NULL,
  `domainmaxmessagesize` int(11) NOT NULL,
  `domainuseplusaddressing` tinyint(4) NOT NULL,
  `domainplusaddressingchar` varchar(1) NOT NULL,
  `domainantispamoptions` int(11) NOT NULL,
  `domainenablesignature` tinyint(4) NOT NULL,
  `domainsignaturemethod` tinyint(4) NOT NULL,
  `domainsignatureplaintext` text NOT NULL,
  `domainsignaturehtml` text NOT NULL,
  `domainaddsignaturestoreplies` tinyint(4) NOT NULL,
  `domainaddsignaturestolocalemail` tinyint(4) NOT NULL,
  `domainmaxnoofaccounts` int(11) NOT NULL,
  `domainmaxnoofaliases` int(11) NOT NULL,
  `domainmaxnoofdistributionlists` int(11) NOT NULL,
  `domainlimitationsenabled` int(11) NOT NULL,
  `domainmaxaccountsize` int(11) NOT NULL,
  `domaindkimselector` varchar(255) NOT NULL,
  `domaindkimprivatekeyfile` varchar(255) NOT NULL,
  PRIMARY KEY (`domainid`),
  UNIQUE KEY `domainid` (`domainid`),
  UNIQUE KEY `domainname` (`domainname`),
  KEY `idx_hm_domains` (`domainname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hm_fetchaccounts
-- ----------------------------
DROP TABLE IF EXISTS `hm_fetchaccounts`;
CREATE TABLE `hm_fetchaccounts` (
  `faid` int(11) NOT NULL AUTO_INCREMENT,
  `faactive` tinyint(4) NOT NULL,
  `faaccountid` int(11) NOT NULL,
  `faaccountname` varchar(255) NOT NULL,
  `faserveraddress` varchar(255) NOT NULL,
  `faserverport` int(11) NOT NULL,
  `faservertype` tinyint(4) NOT NULL,
  `fausername` varchar(255) NOT NULL,
  `fapassword` varchar(255) NOT NULL,
  `faminutes` int(11) NOT NULL,
  `fanexttry` datetime NOT NULL,
  `fadaystokeep` int(11) NOT NULL,
  `falocked` tinyint(4) NOT NULL,
  `faprocessmimerecipients` tinyint(4) NOT NULL,
  `faprocessmimedate` tinyint(4) NOT NULL,
  `fausessl` tinyint(4) NOT NULL,
  `fauseantispam` tinyint(4) NOT NULL,
  `fauseantivirus` tinyint(4) NOT NULL,
  `faenablerouterecipients` tinyint(4) NOT NULL,
  PRIMARY KEY (`faid`),
  UNIQUE KEY `faid` (`faid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hm_fetchaccounts_uids
-- ----------------------------
DROP TABLE IF EXISTS `hm_fetchaccounts_uids`;
CREATE TABLE `hm_fetchaccounts_uids` (
  `uidid` int(11) NOT NULL AUTO_INCREMENT,
  `uidfaid` int(11) NOT NULL,
  `uidvalue` varchar(255) NOT NULL,
  `uidtime` datetime NOT NULL,
  PRIMARY KEY (`uidid`),
  UNIQUE KEY `uidid` (`uidid`),
  KEY `idx_hm_fetchaccounts_uids` (`uidfaid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hm_greylisting_triplets
-- ----------------------------
DROP TABLE IF EXISTS `hm_greylisting_triplets`;
CREATE TABLE `hm_greylisting_triplets` (
  `glid` bigint(20) NOT NULL AUTO_INCREMENT,
  `glcreatetime` datetime NOT NULL,
  `glblockendtime` datetime NOT NULL,
  `gldeletetime` datetime NOT NULL,
  `glipaddress1` bigint(20) NOT NULL,
  `glipaddress2` bigint(20) DEFAULT NULL,
  `glsenderaddress` varchar(255) NOT NULL,
  `glrecipientaddress` varchar(255) NOT NULL,
  `glblockedcount` int(11) NOT NULL,
  `glpassedcount` int(11) NOT NULL,
  PRIMARY KEY (`glid`),
  UNIQUE KEY `glid` (`glid`),
  KEY `idx_greylisting_triplets` (`glipaddress1`,`glipaddress2`,`glsenderaddress`(40),`glrecipientaddress`(40))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hm_greylisting_whiteaddresses
-- ----------------------------
DROP TABLE IF EXISTS `hm_greylisting_whiteaddresses`;
CREATE TABLE `hm_greylisting_whiteaddresses` (
  `whiteid` bigint(20) NOT NULL AUTO_INCREMENT,
  `whiteipaddress` varchar(255) NOT NULL,
  `whiteipdescription` varchar(255) NOT NULL,
  PRIMARY KEY (`whiteid`),
  UNIQUE KEY `whiteid` (`whiteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hm_group_members
-- ----------------------------
DROP TABLE IF EXISTS `hm_group_members`;
CREATE TABLE `hm_group_members` (
  `memberid` bigint(20) NOT NULL AUTO_INCREMENT,
  `membergroupid` bigint(20) NOT NULL,
  `memberaccountid` bigint(20) NOT NULL,
  PRIMARY KEY (`memberid`),
  UNIQUE KEY `memberid` (`memberid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hm_groups
-- ----------------------------
DROP TABLE IF EXISTS `hm_groups`;
CREATE TABLE `hm_groups` (
  `groupid` bigint(20) NOT NULL AUTO_INCREMENT,
  `groupname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`groupid`),
  UNIQUE KEY `groupid` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hm_imapfolders
-- ----------------------------
DROP TABLE IF EXISTS `hm_imapfolders`;
CREATE TABLE `hm_imapfolders` (
  `folderid` int(11) NOT NULL AUTO_INCREMENT,
  `folderaccountid` int(10) unsigned NOT NULL,
  `folderparentid` int(11) NOT NULL,
  `foldername` varchar(255) NOT NULL,
  `folderissubscribed` tinyint(3) unsigned NOT NULL,
  `foldercreationtime` datetime NOT NULL,
  `foldercurrentuid` bigint(20) NOT NULL,
  PRIMARY KEY (`folderid`),
  UNIQUE KEY `folderid` (`folderid`),
  UNIQUE KEY `idx_hm_imapfolders_unique` (`folderaccountid`,`folderparentid`,`foldername`),
  KEY `idx_hm_imapfolders` (`folderaccountid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hm_incoming_relays
-- ----------------------------
DROP TABLE IF EXISTS `hm_incoming_relays`;
CREATE TABLE `hm_incoming_relays` (
  `relayid` int(11) NOT NULL AUTO_INCREMENT,
  `relayname` varchar(100) NOT NULL,
  `relaylowerip1` bigint(20) NOT NULL,
  `relaylowerip2` bigint(20) DEFAULT NULL,
  `relayupperip1` bigint(20) NOT NULL,
  `relayupperip2` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`relayid`),
  UNIQUE KEY `relayid` (`relayid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hm_logon_failures
-- ----------------------------
DROP TABLE IF EXISTS `hm_logon_failures`;
CREATE TABLE `hm_logon_failures` (
  `ipaddress1` bigint(20) NOT NULL,
  `ipaddress2` bigint(20) DEFAULT NULL,
  `failuretime` datetime NOT NULL,
  KEY `idx_hm_logon_failures_ipaddress` (`ipaddress1`,`ipaddress2`),
  KEY `idx_hm_logon_failures_failuretime` (`failuretime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hm_message_metadata
-- ----------------------------
DROP TABLE IF EXISTS `hm_message_metadata`;
CREATE TABLE `hm_message_metadata` (
  `metadata_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `metadata_accountid` int(11) NOT NULL,
  `metadata_folderid` int(11) NOT NULL,
  `metadata_messageid` bigint(20) NOT NULL,
  `metadata_dateutc` datetime DEFAULT NULL,
  `metadata_from` varchar(255) NOT NULL,
  `metadata_subject` varchar(255) NOT NULL,
  `metadata_to` varchar(255) NOT NULL,
  `metadata_cc` varchar(255) NOT NULL,
  PRIMARY KEY (`metadata_id`),
  UNIQUE KEY `idx_message_metadata_unique` (`metadata_accountid`,`metadata_folderid`,`metadata_messageid`),
  KEY `idx_message_metadata_id` (`metadata_messageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hm_messagerecipients
-- ----------------------------
DROP TABLE IF EXISTS `hm_messagerecipients`;
CREATE TABLE `hm_messagerecipients` (
  `recipientid` bigint(20) NOT NULL AUTO_INCREMENT,
  `recipientmessageid` bigint(20) NOT NULL,
  `recipientaddress` varchar(255) NOT NULL,
  `recipientlocalaccountid` int(11) NOT NULL,
  `recipientoriginaladdress` varchar(255) NOT NULL,
  PRIMARY KEY (`recipientid`),
  UNIQUE KEY `recipientid` (`recipientid`),
  KEY `idx_hm_messagerecipients` (`recipientmessageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hm_messages
-- ----------------------------
DROP TABLE IF EXISTS `hm_messages`;
CREATE TABLE `hm_messages` (
  `messageid` bigint(20) NOT NULL AUTO_INCREMENT,
  `messageaccountid` int(11) NOT NULL,
  `messagefolderid` int(11) NOT NULL DEFAULT '0',
  `messagefilename` varchar(255) NOT NULL,
  `messagetype` tinyint(4) NOT NULL,
  `messagefrom` varchar(255) NOT NULL,
  `messagesize` bigint(20) NOT NULL,
  `messagecurnooftries` int(11) NOT NULL,
  `messagenexttrytime` datetime NOT NULL,
  `messageflags` tinyint(4) NOT NULL,
  `messagecreatetime` datetime NOT NULL,
  `messagelocked` tinyint(4) NOT NULL,
  `messageuid` bigint(20) NOT NULL,
  PRIMARY KEY (`messageid`),
  UNIQUE KEY `messageid` (`messageid`),
  KEY `idx_hm_messages` (`messageaccountid`,`messagefolderid`),
  KEY `idx_hm_messages_type` (`messagetype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hm_routeaddresses
-- ----------------------------
DROP TABLE IF EXISTS `hm_routeaddresses`;
CREATE TABLE `hm_routeaddresses` (
  `routeaddressid` mediumint(9) NOT NULL AUTO_INCREMENT,
  `routeaddressrouteid` int(11) NOT NULL,
  `routeaddressaddress` varchar(255) NOT NULL,
  PRIMARY KEY (`routeaddressid`),
  UNIQUE KEY `routeaddressid` (`routeaddressid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hm_routes
-- ----------------------------
DROP TABLE IF EXISTS `hm_routes`;
CREATE TABLE `hm_routes` (
  `routeid` int(11) NOT NULL AUTO_INCREMENT,
  `routedomainname` varchar(255) NOT NULL,
  `routedescription` varchar(255) NOT NULL,
  `routetargetsmthost` varchar(255) NOT NULL,
  `routetargetsmtport` int(11) NOT NULL,
  `routenooftries` int(11) NOT NULL,
  `routeminutesbetweentry` int(11) NOT NULL,
  `routealladdresses` tinyint(3) unsigned NOT NULL,
  `routeuseauthentication` tinyint(4) NOT NULL,
  `routeauthenticationusername` varchar(255) NOT NULL,
  `routeauthenticationpassword` varchar(255) NOT NULL,
  `routetreatsecurityaslocal` tinyint(4) NOT NULL,
  `routeusessl` tinyint(4) NOT NULL,
  `routetreatsenderaslocaldomain` tinyint(4) NOT NULL,
  PRIMARY KEY (`routeid`),
  UNIQUE KEY `routeid` (`routeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hm_rule_actions
-- ----------------------------
DROP TABLE IF EXISTS `hm_rule_actions`;
CREATE TABLE `hm_rule_actions` (
  `actionid` int(11) NOT NULL AUTO_INCREMENT,
  `actionruleid` int(11) NOT NULL,
  `actiontype` tinyint(4) NOT NULL,
  `actionimapfolder` varchar(255) NOT NULL,
  `actionsubject` varchar(255) NOT NULL,
  `actionfromname` varchar(255) NOT NULL,
  `actionfromaddress` varchar(255) NOT NULL,
  `actionto` varchar(255) NOT NULL,
  `actionbody` text NOT NULL,
  `actionfilename` varchar(255) NOT NULL,
  `actionsortorder` int(11) NOT NULL,
  `actionscriptfunction` varchar(255) NOT NULL,
  `actionheader` varchar(80) NOT NULL,
  `actionvalue` varchar(255) NOT NULL,
  `actionrouteid` int(11) NOT NULL,
  PRIMARY KEY (`actionid`),
  UNIQUE KEY `actionid` (`actionid`),
  KEY `idx_rules_actions` (`actionruleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hm_rule_criterias
-- ----------------------------
DROP TABLE IF EXISTS `hm_rule_criterias`;
CREATE TABLE `hm_rule_criterias` (
  `criteriaid` int(11) NOT NULL AUTO_INCREMENT,
  `criteriaruleid` int(11) NOT NULL,
  `criteriausepredefined` tinyint(4) NOT NULL,
  `criteriapredefinedfield` tinyint(4) NOT NULL,
  `criteriaheadername` varchar(255) NOT NULL,
  `criteriamatchtype` tinyint(4) NOT NULL,
  `criteriamatchvalue` varchar(255) NOT NULL,
  PRIMARY KEY (`criteriaid`),
  UNIQUE KEY `criteriaid` (`criteriaid`),
  KEY `idx_rules_criterias` (`criteriaruleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hm_rules
-- ----------------------------
DROP TABLE IF EXISTS `hm_rules`;
CREATE TABLE `hm_rules` (
  `ruleid` int(11) NOT NULL AUTO_INCREMENT,
  `ruleaccountid` int(11) NOT NULL,
  `rulename` varchar(100) NOT NULL,
  `ruleactive` tinyint(4) NOT NULL,
  `ruleuseand` tinyint(4) NOT NULL,
  `rulesortorder` int(11) NOT NULL,
  PRIMARY KEY (`ruleid`),
  UNIQUE KEY `ruleid` (`ruleid`),
  KEY `idx_rules` (`ruleaccountid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hm_securityranges
-- ----------------------------
DROP TABLE IF EXISTS `hm_securityranges`;
CREATE TABLE `hm_securityranges` (
  `rangeid` int(11) NOT NULL AUTO_INCREMENT,
  `rangepriorityid` int(11) NOT NULL,
  `rangelowerip1` bigint(20) NOT NULL,
  `rangelowerip2` bigint(20) DEFAULT NULL,
  `rangeupperip1` bigint(20) NOT NULL,
  `rangeupperip2` bigint(20) DEFAULT NULL,
  `rangeoptions` int(11) NOT NULL,
  `rangename` varchar(100) NOT NULL,
  `rangeexpires` tinyint(4) NOT NULL,
  `rangeexpirestime` datetime NOT NULL,
  PRIMARY KEY (`rangeid`),
  UNIQUE KEY `rangeid` (`rangeid`),
  UNIQUE KEY `rangename` (`rangename`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hm_servermessages
-- ----------------------------
DROP TABLE IF EXISTS `hm_servermessages`;
CREATE TABLE `hm_servermessages` (
  `smid` int(11) NOT NULL AUTO_INCREMENT,
  `smname` varchar(255) NOT NULL,
  `smtext` text NOT NULL,
  PRIMARY KEY (`smid`),
  UNIQUE KEY `smid` (`smid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hm_settings
-- ----------------------------
DROP TABLE IF EXISTS `hm_settings`;
CREATE TABLE `hm_settings` (
  `settingid` int(11) NOT NULL AUTO_INCREMENT,
  `settingname` varchar(30) NOT NULL,
  `settingstring` varchar(255) NOT NULL,
  `settinginteger` int(11) NOT NULL,
  PRIMARY KEY (`settingid`),
  UNIQUE KEY `settingid` (`settingid`),
  UNIQUE KEY `settingname` (`settingname`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hm_sslcertificates
-- ----------------------------
DROP TABLE IF EXISTS `hm_sslcertificates`;
CREATE TABLE `hm_sslcertificates` (
  `sslcertificateid` bigint(20) NOT NULL AUTO_INCREMENT,
  `sslcertificatename` varchar(255) NOT NULL,
  `sslcertificatefile` varchar(255) NOT NULL,
  `sslprivatekeyfile` varchar(255) NOT NULL,
  PRIMARY KEY (`sslcertificateid`),
  UNIQUE KEY `sslcertificateid` (`sslcertificateid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hm_surblservers
-- ----------------------------
DROP TABLE IF EXISTS `hm_surblservers`;
CREATE TABLE `hm_surblservers` (
  `surblid` int(11) NOT NULL AUTO_INCREMENT,
  `surblactive` tinyint(4) NOT NULL,
  `surblhost` varchar(255) NOT NULL,
  `surblrejectmessage` varchar(255) NOT NULL,
  `surblscore` int(11) NOT NULL,
  PRIMARY KEY (`surblid`),
  UNIQUE KEY `surblid` (`surblid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hm_tcpipports
-- ----------------------------
DROP TABLE IF EXISTS `hm_tcpipports`;
CREATE TABLE `hm_tcpipports` (
  `portid` bigint(20) NOT NULL AUTO_INCREMENT,
  `portprotocol` tinyint(4) NOT NULL,
  `portnumber` int(11) NOT NULL,
  `portaddress1` bigint(20) NOT NULL,
  `portaddress2` bigint(20) DEFAULT NULL,
  `portusessl` tinyint(4) NOT NULL,
  `portsslcertificateid` bigint(20) NOT NULL,
  PRIMARY KEY (`portid`),
  UNIQUE KEY `portid` (`portid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hm_whitelist
-- ----------------------------
DROP TABLE IF EXISTS `hm_whitelist`;
CREATE TABLE `hm_whitelist` (
  `whiteid` bigint(20) NOT NULL AUTO_INCREMENT,
  `whiteloweripaddress1` bigint(20) NOT NULL,
  `whiteloweripaddress2` bigint(20) DEFAULT NULL,
  `whiteupperipaddress1` bigint(20) NOT NULL,
  `whiteupperipaddress2` bigint(20) DEFAULT NULL,
  `whiteemailaddress` varchar(255) NOT NULL,
  `whitedescription` varchar(255) NOT NULL,
  PRIMARY KEY (`whiteid`),
  UNIQUE KEY `whiteid` (`whiteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `hm_blocked_attachments` VALUES ('1', '*.bat', 'Batch processing file');
INSERT INTO `hm_blocked_attachments` VALUES ('2', '*.cmd', 'Command file for Windows NT');
INSERT INTO `hm_blocked_attachments` VALUES ('3', '*.com', 'Command');
INSERT INTO `hm_blocked_attachments` VALUES ('4', '*.cpl', 'Windows Control Panel extension');
INSERT INTO `hm_blocked_attachments` VALUES ('5', '*.csh', 'CSH script');
INSERT INTO `hm_blocked_attachments` VALUES ('6', '*.exe', 'Executable file');
INSERT INTO `hm_blocked_attachments` VALUES ('7', '*.inf', 'Setup file');
INSERT INTO `hm_blocked_attachments` VALUES ('8', '*.lnk', 'Windows link file');
INSERT INTO `hm_blocked_attachments` VALUES ('9', '*.msi', 'Windows Installer file');
INSERT INTO `hm_blocked_attachments` VALUES ('10', '*.msp', 'Windows Installer patch');
INSERT INTO `hm_blocked_attachments` VALUES ('11', '*.reg', 'Registration key');
INSERT INTO `hm_blocked_attachments` VALUES ('12', '*.scf', 'Windows Explorer command');
INSERT INTO `hm_blocked_attachments` VALUES ('13', '*.scr', 'Windows Screen saver');
INSERT INTO `hm_dbversion` VALUES ('5320');
INSERT INTO `hm_dnsbl` VALUES ('1', '0', 'zen.spamhaus.org', '127.0.0.2-8|127.0.0.10-11', 'Rejected by Spamhaus.', '3');
INSERT INTO `hm_dnsbl` VALUES ('2', '0', 'bl.spamcop.net', '127.0.0.2', 'Rejected by SpamCop.', '3');
INSERT INTO `hm_securityranges` VALUES ('1', '10', '0', null, '4294967295', null, '96203', 'Internet', '0', '2001-01-01 00:00:00');
INSERT INTO `hm_securityranges` VALUES ('2', '15', '2130706433', null, '2130706433', null, '71627', 'My computer', '0', '2001-01-01 00:00:00');
INSERT INTO `hm_servermessages` VALUES ('1', 'VIRUS_FOUND', 'Virus found');
INSERT INTO `hm_servermessages` VALUES ('2', 'VIRUS_ATTACHMENT_REMOVED', 'Virus found:\r\nThe attachment(s) of this message was removed since a virus was detected in at least one of them.\r\n\r\n');
INSERT INTO `hm_servermessages` VALUES ('3', 'VIRUS_NOTIFICATION', 'The message below contained a virus and did not\r\nreach some or all of the intended recipients.\r\n\r\n   From: %MACRO_FROM%\r\n   To: %MACRO_TO%\r\n   Sent: %MACRO_SENT%\r\n   Subject: %MACRO_SUBJECT%\r\n\r\nhMailServer\r\n');
INSERT INTO `hm_servermessages` VALUES ('4', 'SEND_FAILED_NOTIFICATION', 'Your message did not reach some or all of the intended recipients.\r\n\r\n   Sent: %MACRO_SENT%\r\n   Subject: %MACRO_SUBJECT%\r\n\r\nThe following recipient(s) could not be reached:\r\n\r\n%MACRO_RECIPIENTS%\r\n\r\nhMailServer\r\n');
INSERT INTO `hm_servermessages` VALUES ('5', 'MESSAGE_UNDELIVERABLE', 'Message undeliverable');
INSERT INTO `hm_servermessages` VALUES ('6', 'MESSAGE_FILE_MISSING', 'The mail server could not deliver the message to you since the file %MACRO_FILE% does not exist on the server.\r\n\r\nThe file may have been deleted by anti virus software running on the server.\r\n\r\nhMailServer');
INSERT INTO `hm_servermessages` VALUES ('7', 'ATTACHMENT_REMOVED', 'The attachment %MACRO_FILE% was blocked for delivery by the e-mail server. Please contact your system administrator if you have any questions regarding this.\r\n\r\nhMailServer\r\n');
INSERT INTO `hm_settings` VALUES ('1', 'maxpop3connections', '', '0');
INSERT INTO `hm_settings` VALUES ('2', 'maxsmtpconnections', '', '0');
INSERT INTO `hm_settings` VALUES ('3', 'mirroremailaddress', '', '0');
INSERT INTO `hm_settings` VALUES ('4', 'relaymode', '', '2');
INSERT INTO `hm_settings` VALUES ('5', 'authallowplaintext', '', '0');
INSERT INTO `hm_settings` VALUES ('6', 'allowmailfromnull', '', '1');
INSERT INTO `hm_settings` VALUES ('7', 'logging', '', '0');
INSERT INTO `hm_settings` VALUES ('8', 'logdevice', '', '0');
INSERT INTO `hm_settings` VALUES ('9', 'tarpitdelay', '', '0');
INSERT INTO `hm_settings` VALUES ('10', 'tarpitcount', '', '0');
INSERT INTO `hm_settings` VALUES ('11', 'smtpnoofretries', '', '4');
INSERT INTO `hm_settings` VALUES ('12', 'smtpminutesbetweenretries', '', '60');
INSERT INTO `hm_settings` VALUES ('13', 'protocolimap', '', '1');
INSERT INTO `hm_settings` VALUES ('14', 'protocolsmtp', '', '1');
INSERT INTO `hm_settings` VALUES ('15', 'protocolpop3', '', '1');
INSERT INTO `hm_settings` VALUES ('16', 'welcomeimap', '', '0');
INSERT INTO `hm_settings` VALUES ('17', 'welcomepop3', '', '0');
INSERT INTO `hm_settings` VALUES ('18', 'welcomesmtp', '', '0');
INSERT INTO `hm_settings` VALUES ('19', 'smtprelayer', '', '0');
INSERT INTO `hm_settings` VALUES ('20', 'maxdelivertythreads', '', '10');
INSERT INTO `hm_settings` VALUES ('21', 'logformat', '', '0');
INSERT INTO `hm_settings` VALUES ('22', 'avclamwinenable', '', '0');
INSERT INTO `hm_settings` VALUES ('23', 'avclamwinexec', '', '0');
INSERT INTO `hm_settings` VALUES ('24', 'avclamwindb', '', '0');
INSERT INTO `hm_settings` VALUES ('25', 'avnotifysender', '', '0');
INSERT INTO `hm_settings` VALUES ('26', 'avnotifyreceiver', '', '0');
INSERT INTO `hm_settings` VALUES ('27', 'avaction', '', '0');
INSERT INTO `hm_settings` VALUES ('28', 'sendstatistics', '', '0');
INSERT INTO `hm_settings` VALUES ('29', 'hostname', '', '0');
INSERT INTO `hm_settings` VALUES ('30', 'smtprelayerusername', '', '0');
INSERT INTO `hm_settings` VALUES ('31', 'smtprelayerpassword', '', '0');
INSERT INTO `hm_settings` VALUES ('32', 'usesmtprelayerauthentication', '', '0');
INSERT INTO `hm_settings` VALUES ('33', 'smtprelayerport', '', '25');
INSERT INTO `hm_settings` VALUES ('34', 'usecustomvirusscanner', '', '0');
INSERT INTO `hm_settings` VALUES ('35', 'customvirusscannerexecutable', '', '0');
INSERT INTO `hm_settings` VALUES ('36', 'customviursscannerreturnvalue', '', '0');
INSERT INTO `hm_settings` VALUES ('37', 'usespf', '', '0');
INSERT INTO `hm_settings` VALUES ('38', 'usemxchecks', '', '0');
INSERT INTO `hm_settings` VALUES ('39', 'usescriptserver', '', '0');
INSERT INTO `hm_settings` VALUES ('40', 'scriptlanguage', 'VBScript', '0');
INSERT INTO `hm_settings` VALUES ('41', 'maxmessagesize', '', '20480');
INSERT INTO `hm_settings` VALUES ('42', 'usecache', '', '1');
INSERT INTO `hm_settings` VALUES ('43', 'domaincachettl', '', '60');
INSERT INTO `hm_settings` VALUES ('44', 'accountcachettl', '', '60');
INSERT INTO `hm_settings` VALUES ('45', 'awstatsenabled', '', '0');
INSERT INTO `hm_settings` VALUES ('46', 'rulelooplimit', '', '5');
INSERT INTO `hm_settings` VALUES ('47', 'backupoptions', '', '0');
INSERT INTO `hm_settings` VALUES ('48', 'backupdestination', '', '0');
INSERT INTO `hm_settings` VALUES ('49', 'defaultdomain', '', '0');
INSERT INTO `hm_settings` VALUES ('50', 'avmaxmsgsize', '', '0');
INSERT INTO `hm_settings` VALUES ('51', 'smtpdeliverybindtoip', '', '0');
INSERT INTO `hm_settings` VALUES ('52', 'enableimapquota', '', '1');
INSERT INTO `hm_settings` VALUES ('53', 'enableimapidle', '', '1');
INSERT INTO `hm_settings` VALUES ('54', 'enableimapacl', '', '1');
INSERT INTO `hm_settings` VALUES ('55', 'maximapconnections', '', '0');
INSERT INTO `hm_settings` VALUES ('56', 'enableimapsort', '', '1');
INSERT INTO `hm_settings` VALUES ('57', 'workerthreadpriority', '', '0');
INSERT INTO `hm_settings` VALUES ('58', 'ascheckhostinhelo', '', '0');
INSERT INTO `hm_settings` VALUES ('59', 'tcpipthreads', '', '15');
INSERT INTO `hm_settings` VALUES ('60', 'smtpallowincorrectlineendings', '', '1');
INSERT INTO `hm_settings` VALUES ('61', 'usegreylisting', '', '0');
INSERT INTO `hm_settings` VALUES ('62', 'greylistinginitialdelay', '', '30');
INSERT INTO `hm_settings` VALUES ('63', 'greylistinginitialdelete', '', '24');
INSERT INTO `hm_settings` VALUES ('64', 'greylistingfinaldelete', '', '864');
INSERT INTO `hm_settings` VALUES ('65', 'antispamaddheaderspam', '', '1');
INSERT INTO `hm_settings` VALUES ('66', 'antispamaddheaderreason', '', '1');
INSERT INTO `hm_settings` VALUES ('67', 'antispamprependsubject', '', '0');
INSERT INTO `hm_settings` VALUES ('68', 'antispamprependsubjecttext', '[SPAM]', '0');
INSERT INTO `hm_settings` VALUES ('69', 'enableattachmentblocking', '', '0');
INSERT INTO `hm_settings` VALUES ('70', 'maxsmtprecipientsinbatch', '', '100');
INSERT INTO `hm_settings` VALUES ('71', 'disconnectinvalidclients', '', '0');
INSERT INTO `hm_settings` VALUES ('72', 'maximumincorrectcommands', '', '100');
INSERT INTO `hm_settings` VALUES ('73', 'aliascachettl', '', '60');
INSERT INTO `hm_settings` VALUES ('74', 'distributionlistcachettl', '', '60');
INSERT INTO `hm_settings` VALUES ('75', 'smtprelayerusessl', '', '0');
INSERT INTO `hm_settings` VALUES ('76', 'adddeliveredtoheader', '', '0');
INSERT INTO `hm_settings` VALUES ('77', 'groupcachettl', '', '60');
INSERT INTO `hm_settings` VALUES ('78', 'imappublicfoldername', '#Public', '0');
INSERT INTO `hm_settings` VALUES ('79', 'antispamenabled', '', '0');
INSERT INTO `hm_settings` VALUES ('80', 'usespfscore', '', '3');
INSERT INTO `hm_settings` VALUES ('81', 'ascheckhostinheloscore', '', '2');
INSERT INTO `hm_settings` VALUES ('82', 'usemxchecksscore', '', '2');
INSERT INTO `hm_settings` VALUES ('83', 'spammarkthreshold', '', '5');
INSERT INTO `hm_settings` VALUES ('84', 'spamdeletethreshold', '', '20');
INSERT INTO `hm_settings` VALUES ('85', 'spamassassinenabled', '', '0');
INSERT INTO `hm_settings` VALUES ('86', 'spamassassinscore', '', '5');
INSERT INTO `hm_settings` VALUES ('87', 'spamassassinmergescore', '', '0');
INSERT INTO `hm_settings` VALUES ('88', 'spamassassinhost', '127.0.0.1', '0');
INSERT INTO `hm_settings` VALUES ('89', 'spamassassinport', '', '783');
INSERT INTO `hm_settings` VALUES ('90', 'antispammaxsize', '', '1024');
INSERT INTO `hm_settings` VALUES ('91', 'ASDKIMVerificationEnabled', '', '0');
INSERT INTO `hm_settings` VALUES ('92', 'ASDKIMVerificationFailureScore', '', '5');
INSERT INTO `hm_settings` VALUES ('93', 'AutoBanOnLogonFailureEnabled', '', '1');
INSERT INTO `hm_settings` VALUES ('94', 'MaxInvalidLogonAttempts', '', '3');
INSERT INTO `hm_settings` VALUES ('95', 'LogonAttemptsWithinMinutes', '', '30');
INSERT INTO `hm_settings` VALUES ('96', 'AutoBanMinutes', '', '60');
INSERT INTO `hm_settings` VALUES ('97', 'IMAPHierarchyDelimiter', '.', '0');
INSERT INTO `hm_settings` VALUES ('98', 'MaxNumberOfAsynchronousTasks', '', '15');
INSERT INTO `hm_settings` VALUES ('99', 'MessageIndexing', '', '0');
INSERT INTO `hm_settings` VALUES ('100', 'BypassGreylistingOnSPFSuccess', '', '1');
INSERT INTO `hm_settings` VALUES ('101', 'BypassGreylistingOnMailFromMX', '', '0');
INSERT INTO `hm_surblservers` VALUES ('1', '0', 'multi.surbl.org', 'Rejected by SURBL.', '3');
INSERT INTO `hm_tcpipports` VALUES ('1', '1', '25', '0', null, '0', '0');
INSERT INTO `hm_tcpipports` VALUES ('2', '3', '110', '0', null, '0', '0');
INSERT INTO `hm_tcpipports` VALUES ('3', '5', '143', '0', null, '0', '0');
