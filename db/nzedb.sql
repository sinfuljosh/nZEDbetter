-- phpMyAdmin SQL Dump
-- version 3.5.8.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 16, 2013 at 01:41 PM
-- Server version: 5.6.12-rc60.4-log
-- PHP Version: 5.4.9-4ubuntu2.2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `nzedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `anidb`
--

DROP TABLE IF EXISTS `anidb`;
CREATE TABLE IF NOT EXISTS `anidb` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `anidbID` int(7) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `startdate` date NOT NULL,
  `enddate` date NOT NULL,
  `related` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `creators` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `rating` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `picture` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `categories` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `characters` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `epnos` varchar(2048) COLLATE utf8_unicode_ci NOT NULL,
  `airdates` text COLLATE utf8_unicode_ci NOT NULL,
  `episodetitles` text COLLATE utf8_unicode_ci NOT NULL,
  `unixtime` int(12) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `anidbID` (`anidbID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `animetitles`
--

DROP TABLE IF EXISTS `animetitles`;
CREATE TABLE IF NOT EXISTS `animetitles` (
  `anidbID` int(7) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `unixtime` int(12) unsigned NOT NULL,
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `binaries`
--

DROP TABLE IF EXISTS `binaries`;
CREATE TABLE IF NOT EXISTS `binaries` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `collectionID` int(11) unsigned NOT NULL DEFAULT '0',
  `filenumber` int(10) unsigned NOT NULL DEFAULT '0',
  `totalParts` int(11) unsigned NOT NULL DEFAULT '0',
  `binaryhash` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `partcheck` int(11) unsigned NOT NULL DEFAULT '0',
  `partsize` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ix_binary_binaryhash` (`binaryhash`),
  KEY `ix_binary_partcheck` (`partcheck`),
  KEY `ix_binary_collection` (`collectionID`),
  KEY `filenumber` (`filenumber`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6496853 ;

-- --------------------------------------------------------

--
-- Table structure for table `binaryblacklist`
--

DROP TABLE IF EXISTS `binaryblacklist`;
CREATE TABLE IF NOT EXISTS `binaryblacklist` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `groupname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `regex` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `msgcol` int(11) unsigned NOT NULL DEFAULT '1',
  `optype` int(11) unsigned NOT NULL DEFAULT '1',
  `status` int(11) unsigned NOT NULL DEFAULT '1',
  `description` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

-- --------------------------------------------------------

--
-- Table structure for table `bookinfo`
--

DROP TABLE IF EXISTS `bookinfo`;
CREATE TABLE IF NOT EXISTS `bookinfo` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `asin` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isbn` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ean` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salesrank` int(10) unsigned DEFAULT NULL,
  `publisher` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publishdate` datetime DEFAULT NULL,
  `pages` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `overview` varchar(3000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `genre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cover` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `createddate` datetime NOT NULL,
  `updateddate` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3918 ;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parentID` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `disablepreview` tinyint(1) NOT NULL DEFAULT '0',
  `minsize` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ix_category_status` (`status`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8061 ;

-- --------------------------------------------------------

--
-- Table structure for table `collections`
--

DROP TABLE IF EXISTS `collections`;
CREATE TABLE IF NOT EXISTS `collections` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fromname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date` datetime DEFAULT NULL,
  `xref` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `totalFiles` int(11) unsigned NOT NULL DEFAULT '0',
  `groupID` int(11) unsigned NOT NULL DEFAULT '0',
  `collectionhash` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `dateadded` datetime DEFAULT NULL,
  `filecheck` int(11) unsigned NOT NULL DEFAULT '0',
  `filesize` bigint(20) unsigned NOT NULL DEFAULT '0',
  `releaseID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `collectionhash` (`collectionhash`),
  KEY `fromname` (`fromname`),
  KEY `date` (`date`),
  KEY `groupID` (`groupID`),
  KEY `ix_collection_filecheck` (`filecheck`),
  KEY `ix_collection_dateadded` (`dateadded`),
  KEY `ix_collection_releaseID` (`releaseID`),
  KEY `filesize` (`filesize`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1153797 ;

-- --------------------------------------------------------

--
-- Table structure for table `consoleinfo`
--

DROP TABLE IF EXISTS `consoleinfo`;
CREATE TABLE IF NOT EXISTS `consoleinfo` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `asin` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salesrank` int(10) unsigned DEFAULT NULL,
  `platform` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publisher` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `genreID` int(10) DEFAULT NULL,
  `esrb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `releasedate` datetime DEFAULT NULL,
  `review` varchar(3000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cover` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `createddate` datetime NOT NULL,
  `updateddate` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1667 ;

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
CREATE TABLE IF NOT EXISTS `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `metadescription` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `metakeywords` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `contenttype` int(11) NOT NULL,
  `showinmenu` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `ordinal` int(11) DEFAULT NULL,
  `role` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `forumpost`
--

DROP TABLE IF EXISTS `forumpost`;
CREATE TABLE IF NOT EXISTS `forumpost` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `forumID` int(11) NOT NULL DEFAULT '1',
  `parentID` int(11) NOT NULL DEFAULT '0',
  `userID` int(11) unsigned NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `replies` int(11) unsigned NOT NULL DEFAULT '0',
  `createddate` datetime NOT NULL,
  `updateddate` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `parentID` (`parentID`),
  KEY `userID` (`userID`),
  KEY `createddate` (`createddate`),
  KEY `updateddate` (`updateddate`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
CREATE TABLE IF NOT EXISTS `genres` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(4) DEFAULT NULL,
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=175 ;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE IF NOT EXISTS `groups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `backfill_target` int(4) NOT NULL DEFAULT '1',
  `first_record` bigint(20) unsigned NOT NULL DEFAULT '0',
  `first_record_postdate` datetime DEFAULT NULL,
  `last_record` bigint(20) unsigned NOT NULL DEFAULT '0',
  `last_record_postdate` datetime DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  `minfilestoformrelease` int(4) DEFAULT NULL,
  `minsizetoformrelease` bigint(20) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `backfill` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `name` (`name`),
  KEY `active` (`active`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=555 ;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `href` varchar(2000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(2000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `newwindow` int(1) unsigned NOT NULL DEFAULT '0',
  `tooltip` varchar(2000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `role` int(11) unsigned NOT NULL,
  `ordinal` int(11) unsigned NOT NULL,
  `menueval` varchar(2000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=22 ;

-- --------------------------------------------------------

--
-- Table structure for table `movieinfo`
--

DROP TABLE IF EXISTS `movieinfo`;
CREATE TABLE IF NOT EXISTS `movieinfo` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `imdbID` mediumint(7) unsigned zerofill NOT NULL,
  `tmdbID` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tagline` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `rating` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `plot` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `year` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `genre` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `director` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `actors` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `cover` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `backdrop` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `createddate` datetime NOT NULL,
  `updateddate` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `imdbID` (`imdbID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3029 ;

-- --------------------------------------------------------

--
-- Table structure for table `musicinfo`
--

DROP TABLE IF EXISTS `musicinfo`;
CREATE TABLE IF NOT EXISTS `musicinfo` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `asin` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salesrank` int(10) unsigned DEFAULT NULL,
  `artist` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publisher` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `releasedate` datetime DEFAULT NULL,
  `review` varchar(3000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `genreID` int(10) DEFAULT NULL,
  `tracks` varchar(3000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cover` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `createddate` datetime NOT NULL,
  `updateddate` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=86885 ;

-- --------------------------------------------------------

--
-- Table structure for table `nzbs`
--

DROP TABLE IF EXISTS `nzbs`;
CREATE TABLE IF NOT EXISTS `nzbs` (
  `message_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `group` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `article-number` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `collectionhash` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `filesize` bigint(20) unsigned NOT NULL DEFAULT '0',
  `partnumber` int(10) unsigned NOT NULL DEFAULT '0',
  `totalparts` int(10) unsigned NOT NULL DEFAULT '0',
  `postdate` datetime DEFAULT NULL,
  `dateadded` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `partrepair`
--

DROP TABLE IF EXISTS `partrepair`;
CREATE TABLE IF NOT EXISTS `partrepair` (
  `ID` int(16) unsigned NOT NULL AUTO_INCREMENT,
  `numberID` bigint(20) unsigned NOT NULL,
  `groupID` int(11) unsigned NOT NULL,
  `attempts` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_partrepair_numberID_groupID` (`numberID`,`groupID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5694504 ;

-- --------------------------------------------------------

--
-- Table structure for table `parts`
--

DROP TABLE IF EXISTS `parts`;
CREATE TABLE IF NOT EXISTS `parts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `binaryID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `messageID` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `number` bigint(20) unsigned NOT NULL DEFAULT '0',
  `partnumber` int(10) unsigned NOT NULL DEFAULT '0',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `binaryID` (`binaryID`),
  KEY `partnumber` (`partnumber`),
  KEY `number` (`number`),
  KEY `ix_binaryID_partnumber` (`binaryID`,`partnumber`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DATA DIRECTORY='/mnt/external2tb/var/mysql/' AUTO_INCREMENT=727174054 ;

-- --------------------------------------------------------

--
-- Table structure for table `predb`
--

DROP TABLE IF EXISTS `predb`;
CREATE TABLE IF NOT EXISTS `predb` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `nfo` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `predate` datetime DEFAULT NULL,
  `adddate` datetime DEFAULT NULL,
  `source` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `md5` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `releaseID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_predb_title` (`title`),
  KEY `ix_predb_predate` (`predate`),
  KEY `ix_predb_adddate` (`adddate`),
  KEY `ix_predb_source` (`source`),
  KEY `ix_predb_md5` (`md5`),
  KEY `ix_predb_releaseID` (`releaseID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1698475 ;

-- --------------------------------------------------------

--
-- Table structure for table `releaseaudio`
--

DROP TABLE IF EXISTS `releaseaudio`;
CREATE TABLE IF NOT EXISTS `releaseaudio` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `releaseID` int(11) unsigned NOT NULL,
  `audioID` int(2) unsigned NOT NULL,
  `audioformat` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `audiomode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `audiobitratemode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `audiobitrate` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `audiochannels` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `audiosamplerate` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `audiolibrary` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `audiolanguage` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `audiotitle` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `releaseID` (`releaseID`,`audioID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=179329 ;

-- --------------------------------------------------------

--
-- Table structure for table `releasecomment`
--

DROP TABLE IF EXISTS `releasecomment`;
CREATE TABLE IF NOT EXISTS `releasecomment` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `releaseID` int(11) unsigned NOT NULL,
  `text` varchar(2000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userID` int(11) unsigned NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `host` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_releasecomment_releaseID` (`releaseID`),
  KEY `ix_releasecomment_userID` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `releaseextrafull`
--

DROP TABLE IF EXISTS `releaseextrafull`;
CREATE TABLE IF NOT EXISTS `releaseextrafull` (
  `releaseID` int(11) unsigned NOT NULL,
  `mediainfo` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`releaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `releasefiles`
--

DROP TABLE IF EXISTS `releasefiles`;
CREATE TABLE IF NOT EXISTS `releasefiles` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `releaseID` int(11) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` bigint(20) unsigned NOT NULL DEFAULT '0',
  `createddate` datetime DEFAULT NULL,
  `passworded` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ix_releasefiles_releaseID` (`releaseID`),
  KEY `ix_releasefiles_name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=713535 ;

-- --------------------------------------------------------

--
-- Table structure for table `releasenfo`
--

DROP TABLE IF EXISTS `releasenfo`;
CREATE TABLE IF NOT EXISTS `releasenfo` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `releaseID` int(11) unsigned NOT NULL,
  `nfo` blob,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_releasenfo_releaseID` (`releaseID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=358408 ;

-- --------------------------------------------------------

--
-- Table structure for table `releases`
--

DROP TABLE IF EXISTS `releases`;
CREATE TABLE IF NOT EXISTS `releases` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `searchname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `totalpart` int(11) DEFAULT '0',
  `groupID` int(10) unsigned NOT NULL DEFAULT '0',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0',
  `postdate` datetime DEFAULT NULL,
  `adddate` datetime DEFAULT NULL,
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `guid` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `fromname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `completion` float NOT NULL DEFAULT '0',
  `categoryID` int(11) DEFAULT '0',
  `rageID` int(11) DEFAULT NULL,
  `seriesfull` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `season` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `episode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tvtitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tvairdate` datetime DEFAULT NULL,
  `imdbID` mediumint(7) unsigned zerofill DEFAULT NULL,
  `musicinfoID` int(11) DEFAULT NULL,
  `consoleinfoID` int(11) DEFAULT NULL,
  `bookinfoID` int(11) DEFAULT NULL,
  `anidbID` int(11) DEFAULT NULL,
  `grabs` int(10) unsigned NOT NULL DEFAULT '0',
  `comments` int(11) NOT NULL DEFAULT '0',
  `passwordstatus` tinyint(4) NOT NULL DEFAULT '0',
  `rarinnerfilecount` int(11) NOT NULL DEFAULT '0',
  `haspreview` tinyint(4) NOT NULL DEFAULT '0',
  `nzbstatus` tinyint(4) NOT NULL DEFAULT '0',
  `nfostatus` tinyint(4) NOT NULL DEFAULT '0',
  `relnamestatus` tinyint(4) NOT NULL DEFAULT '0',
  `jpgstatus` tinyint(1) NOT NULL DEFAULT '0',
  `videostatus` tinyint(1) NOT NULL DEFAULT '0',
  `audiostatus` tinyint(1) NOT NULL DEFAULT '0',
  `dehashstatus` tinyint(1) NOT NULL DEFAULT '0',
  `relstatus` tinyint(4) NOT NULL DEFAULT '0',
  `reqidstatus` tinyint(1) NOT NULL DEFAULT '0',
  `nzb_guid` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_releases_adddate` (`adddate`),
  KEY `ix_releases_postdate` (`postdate`),
  KEY `ix_releases_categoryID` (`categoryID`),
  KEY `ix_releases_rageID` (`rageID`),
  KEY `ix_releases_imdbID` (`imdbID`),
  KEY `ix_releases_guid` (`guid`),
  KEY `ix_releases_nzbstatus` (`nzbstatus`),
  KEY `ix_release_name` (`name`),
  KEY `ix_releases_relnamestatus` (`relnamestatus`),
  KEY `ix_releases_passwordstatus` (`passwordstatus`),
  KEY `ix_releases_dehashstatus` (`dehashstatus`),
  KEY `ix_releases_reqidstatus` (`reqidstatus`) USING HASH,
  KEY `ix_releases_nfostatus` (`nfostatus`) USING HASH,
  KEY `ix_releases_musicinfoID` (`musicinfoID`),
  KEY `ix_releases_consoleinfoID` (`consoleinfoID`),
  KEY `ix_releases_bookinfoID` (`bookinfoID`),
  KEY `ix_releases_haspreview` (`haspreview`) USING HASH
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=727278 ;

-- --------------------------------------------------------

--
-- Table structure for table `releasesubs`
--

DROP TABLE IF EXISTS `releasesubs`;
CREATE TABLE IF NOT EXISTS `releasesubs` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `releaseID` int(11) unsigned NOT NULL,
  `subsID` int(2) unsigned NOT NULL,
  `subslanguage` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `releaseID` (`releaseID`,`subsID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11956 ;

-- --------------------------------------------------------

--
-- Table structure for table `releasevideo`
--

DROP TABLE IF EXISTS `releasevideo`;
CREATE TABLE IF NOT EXISTS `releasevideo` (
  `releaseID` int(11) unsigned NOT NULL,
  `containerformat` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `overallbitrate` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `videoduration` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `videoformat` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `videocodec` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `videowidth` int(10) DEFAULT NULL,
  `videoheight` int(10) DEFAULT NULL,
  `videoaspect` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `videoframerate` float(7,4) DEFAULT NULL,
  `videolibrary` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`releaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
CREATE TABLE IF NOT EXISTS `site` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `setting` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(19000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updateddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `setting` (`setting`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=111 ;

-- --------------------------------------------------------

--
-- Table structure for table `tmux`
--

DROP TABLE IF EXISTS `tmux`;
CREATE TABLE IF NOT EXISTS `tmux` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `setting` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(19000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updateddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `setting` (`setting`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=65 ;

-- --------------------------------------------------------

--
-- Table structure for table `tvrage`
--

DROP TABLE IF EXISTS `tvrage`;
CREATE TABLE IF NOT EXISTS `tvrage` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `rageID` int(11) NOT NULL,
  `tvdbID` int(11) NOT NULL DEFAULT '0',
  `releasetitle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(10000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `genre` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `imgdata` longblob,
  `createddate` datetime DEFAULT NULL,
  `prevdate` datetime DEFAULT NULL,
  `previnfo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nextdate` datetime DEFAULT NULL,
  `nextinfo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_tvrage_rageID` (`rageID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12084 ;

-- --------------------------------------------------------

--
-- Table structure for table `tvrageepisodes`
--

DROP TABLE IF EXISTS `tvrageepisodes`;
CREATE TABLE IF NOT EXISTS `tvrageepisodes` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `rageID` int(11) unsigned NOT NULL,
  `showtitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `airdate` datetime NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullep` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `eptitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `rageID` (`rageID`,`fullep`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=43756 ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `UniqueCollections`
--
DROP VIEW IF EXISTS `UniqueCollections`;
CREATE TABLE IF NOT EXISTS `UniqueCollections` (
`ID` int(11) unsigned
,`subject` varchar(255)
,`fromname` varchar(255)
,`date` datetime
,`xref` varchar(255)
,`totalFiles` int(11) unsigned
,`groupID` int(11) unsigned
,`collectionhash` varchar(255)
,`dateadded` datetime
,`filecheck` int(11) unsigned
,`filesize` bigint(20) unsigned
,`releaseID` int(11)
);
-- --------------------------------------------------------

--
-- Table structure for table `upcoming`
--

DROP TABLE IF EXISTS `upcoming`;
CREATE TABLE IF NOT EXISTS `upcoming` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `source` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `typeID` int(10) NOT NULL,
  `info` text COLLATE utf8_unicode_ci,
  `updateddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `source` (`source`,`typeID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- Table structure for table `usercart`
--

DROP TABLE IF EXISTS `usercart`;
CREATE TABLE IF NOT EXISTS `usercart` (
  `ID` int(16) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `releaseID` int(11) NOT NULL,
  `createddate` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_usercart_userrelease` (`userID`,`releaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `userdownloads`
--

DROP TABLE IF EXISTS `userdownloads`;
CREATE TABLE IF NOT EXISTS `userdownloads` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(16) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `userID` (`userID`),
  KEY `timestamp` (`timestamp`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=20 ;

-- --------------------------------------------------------

--
-- Table structure for table `userexcat`
--

DROP TABLE IF EXISTS `userexcat`;
CREATE TABLE IF NOT EXISTS `userexcat` (
  `ID` int(16) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `categoryID` int(11) NOT NULL,
  `createddate` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_userexcat_usercat` (`userID`,`categoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `userinvite`
--

DROP TABLE IF EXISTS `userinvite`;
CREATE TABLE IF NOT EXISTS `userinvite` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `guid` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `userID` int(11) unsigned NOT NULL,
  `createddate` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `usermovies`
--

DROP TABLE IF EXISTS `usermovies`;
CREATE TABLE IF NOT EXISTS `usermovies` (
  `ID` int(16) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(16) NOT NULL,
  `imdbID` mediumint(7) unsigned zerofill DEFAULT NULL,
  `categoryID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createddate` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_usermovies_userID` (`userID`,`imdbID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `userrequests`
--

DROP TABLE IF EXISTS `userrequests`;
CREATE TABLE IF NOT EXISTS `userrequests` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(16) NOT NULL,
  `request` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `userID` (`userID`),
  KEY `timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `userroles`
--

DROP TABLE IF EXISTS `userroles`;
CREATE TABLE IF NOT EXISTS `userroles` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `apirequests` int(10) unsigned NOT NULL,
  `downloadrequests` int(10) unsigned NOT NULL,
  `defaultinvites` int(10) unsigned NOT NULL,
  `isdefault` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `canpreview` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `ID` int(16) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role` int(11) NOT NULL DEFAULT '1',
  `host` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `grabs` int(11) NOT NULL DEFAULT '0',
  `rsstoken` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `createddate` datetime NOT NULL,
  `resetguid` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `apiaccess` datetime DEFAULT NULL,
  `invites` int(11) NOT NULL DEFAULT '0',
  `invitedby` int(11) DEFAULT NULL,
  `movieview` int(11) NOT NULL DEFAULT '1',
  `musicview` int(11) NOT NULL DEFAULT '1',
  `consoleview` int(11) NOT NULL DEFAULT '1',
  `bookview` int(11) NOT NULL DEFAULT '1',
  `saburl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sabapikey` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sabapikeytype` tinyint(1) DEFAULT NULL,
  `sabpriority` tinyint(1) DEFAULT NULL,
  `userseed` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `userseries`
--

DROP TABLE IF EXISTS `userseries`;
CREATE TABLE IF NOT EXISTS `userseries` (
  `ID` int(16) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(16) NOT NULL,
  `rageID` int(16) NOT NULL,
  `categoryID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createddate` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_userseries_userID` (`userID`,`rageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure for view `UniqueCollections`
--
DROP TABLE IF EXISTS `UniqueCollections`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `UniqueCollections` AS select `collections`.`ID` AS `ID`,`collections`.`subject` AS `subject`,`collections`.`fromname` AS `fromname`,`collections`.`date` AS `date`,`collections`.`xref` AS `xref`,`collections`.`totalFiles` AS `totalFiles`,`collections`.`groupID` AS `groupID`,`collections`.`collectionhash` AS `collectionhash`,`collections`.`dateadded` AS `dateadded`,`collections`.`filecheck` AS `filecheck`,`collections`.`filesize` AS `filesize`,`collections`.`releaseID` AS `releaseID` from `collections` group by `collections`.`collectionhash` order by `collections`.`dateadded` desc;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
