/*
 Navicat Premium Data Transfer

 Source Server         : CurtDev
 Source Server Type    : MySQL
 Source Server Version : 50617
 Source Host           : 173.255.114.206
 Source Database       : CurtDev

 Target Server Type    : MySQL
 Target Server Version : 50617
 File Encoding         : utf-8

 Date: 09/18/2014 11:07:06 AM
*/

CREATE DATABASE IF NOT EXISTS CurtDev;

USE CurtDev;

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

GRANT USAGE ON *.* TO curtDuser2 IDENTIFIED BY 'eC0mm3rc3';
GRANT ALL PRIVILEGES ON CurtDev.* TO curtDuser2;

-- ----------------------------
--  Table structure for `AcesType`
-- ----------------------------
DROP TABLE IF EXISTS `AcesType`;
CREATE TABLE `AcesType` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ActivatedWarranties`
-- ----------------------------
DROP TABLE IF EXISTS `ActivatedWarranties`;
CREATE TABLE `ActivatedWarranties` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `part` int(11) DEFAULT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `Part_FK` (`part`),
  CONSTRAINT `Part_FK` FOREIGN KEY (`part`) REFERENCES `Part` (`partID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ApiAccess`
-- ----------------------------
DROP TABLE IF EXISTS `ApiAccess`;
CREATE TABLE `ApiAccess` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `key_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_id` (`key_id`),
  KEY `key_id_2` (`key_id`),
  CONSTRAINT `FK_ApiKey` FOREIGN KEY (`key_id`) REFERENCES `ApiKey` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ApiKey`
-- ----------------------------
DROP TABLE IF EXISTS `ApiKey`;
CREATE TABLE `ApiKey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `api_key` varchar(64) NOT NULL,
  `type_id` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `id` (`id`),
  KEY `FK__ApiKey__type_id__5AEE1AF6` (`type_id`),
  KEY `FK__ApiKey__user_id__5BE23F2F` (`user_id`),
  KEY `api_key` (`api_key`),
  CONSTRAINT `FK__ApiKey__type_id__5AEE1AF6` FOREIGN KEY (`type_id`) REFERENCES `ApiKeyType` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__ApiKey__user_id__5BE23F2F` FOREIGN KEY (`user_id`) REFERENCES `CustomerUser` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8751 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `ApiKeyType`
-- ----------------------------
DROP TABLE IF EXISTS `ApiKeyType`;
CREATE TABLE `ApiKeyType` (
  `id` varchar(64) NOT NULL,
  `type` varchar(500) DEFAULT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ApiModules`
-- ----------------------------
DROP TABLE IF EXISTS `ApiModules`;
CREATE TABLE `ApiModules` (
  `id` varchar(64) NOT NULL,
  `name` varchar(500) DEFAULT NULL,
  `access_level` varchar(64) DEFAULT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ApplicationGuides`
-- ----------------------------
DROP TABLE IF EXISTS `ApplicationGuides`;

CREATE TABLE `ApplicationGuides` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL DEFAULT '',
  `websiteID` int(11) NOT NULL,
  `fileType` varchar(15) DEFAULT NULL,
  `catID` int(11) NOT NULL,
  `icon` varchar(255) NOT NULL DEFAULT '',
  `brandID` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- ----------------------------
--  Table structure for `AuthAccess`
-- ----------------------------
DROP TABLE IF EXISTS `AuthAccess`;
CREATE TABLE `AuthAccess` (
  `id` varchar(64) NOT NULL,
  `userID` varchar(64) NOT NULL,
  `AreaID` varchar(64) NOT NULL,
  `dateAdded` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `authArea_ref_idx` (`AreaID`),
  KEY `custUser_ref_idx` (`userID`),
  CONSTRAINT `custUserAuthAccess_ref` FOREIGN KEY (`userID`) REFERENCES `CustomerUser` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `AuthAreas`
-- ----------------------------
DROP TABLE IF EXISTS `AuthAreas`;
CREATE TABLE `AuthAreas` (
  `id` varchar(64) NOT NULL,
  `path` varchar(50) NOT NULL,
  `DomainID` varchar(64) NOT NULL,
  `name` varchar(50) NOT NULL,
  `parentAreaID` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `authDomain_ref_idx` (`DomainID`),
  CONSTRAINT `authDomains` FOREIGN KEY (`DomainID`) REFERENCES `AuthDomains` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `AuthDomains`
-- ----------------------------
DROP TABLE IF EXISTS `AuthDomains`;
CREATE TABLE `AuthDomains` (
  `id` varchar(64) NOT NULL,
  `url` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `AuthorizedTracking`
-- ----------------------------
DROP TABLE IF EXISTS `AuthorizedTracking`;
CREATE TABLE `AuthorizedTracking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `property` varchar(500) NOT NULL,
  `view_count` int(11) NOT NULL,
  `authorized_id` varchar(500) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Authors`
-- ----------------------------
DROP TABLE IF EXISTS `Authors`;
CREATE TABLE `Authors` (
  `authorID` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(510) DEFAULT NULL,
  `last_name` varchar(510) DEFAULT NULL,
  `email` varchar(510) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`authorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Banners`
-- ----------------------------
DROP TABLE IF EXISTS `Banners`;
CREATE TABLE `Banners` (
  `bannerID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `link` varchar(400) DEFAULT NULL,
  `starts` datetime DEFAULT NULL,
  `ends` datetime DEFAULT NULL,
  `path` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`bannerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `BaseVehicle`
-- ----------------------------
DROP TABLE IF EXISTS `BaseVehicle`;
CREATE TABLE `BaseVehicle` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AAIABaseVehicleID` int(11) DEFAULT NULL,
  `YearID` int(11) NOT NULL,
  `MakeID` int(11) NOT NULL,
  `ModelID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `AAIA_BaseVehicle_IX` (`AAIABaseVehicleID`),
  KEY `FK__BaseVehic__MakeI__75B5891D` (`MakeID`),
  KEY `FK__BaseVehic__Model__76A9AD56` (`ModelID`),
  KEY `FK_BaseVehicle_Year` (`YearID`),
  CONSTRAINT `FK_BaseVehicle_Year` FOREIGN KEY (`YearID`) REFERENCES `vcdb_Year` (`YearID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__BaseVehic__MakeI__75B5891D` FOREIGN KEY (`MakeID`) REFERENCES `vcdb_Make` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__BaseVehic__Model__76A9AD56` FOREIGN KEY (`ModelID`) REFERENCES `vcdb_Model` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22856 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `BlogCategories`
-- ----------------------------
DROP TABLE IF EXISTS `BlogCategories`;
CREATE TABLE `BlogCategories` (
  `blogCategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `brandID` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`blogCategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `BlogPost_BlogCategory`
-- ----------------------------
DROP TABLE IF EXISTS `BlogPost_BlogCategory`;
CREATE TABLE `BlogPost_BlogCategory` (
  `postCategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `blogPostID` int(11) NOT NULL,
  `blogCategoryID` int(11) NOT NULL,
  PRIMARY KEY (`postCategoryID`),
  KEY `FK__BlogPost___blogC__57DD0BE4` (`blogCategoryID`),
  KEY `FK__BlogPost___blogP__58D1301D` (`blogPostID`),
  CONSTRAINT `FK__BlogPost___blogC__57DD0BE4` FOREIGN KEY (`blogCategoryID`) REFERENCES `BlogCategories` (`blogCategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__BlogPost___blogP__58D1301D` FOREIGN KEY (`blogPostID`) REFERENCES `BlogPosts` (`blogPostID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `BlogPosts`
-- ----------------------------
DROP TABLE IF EXISTS `BlogPosts`;
CREATE TABLE `BlogPosts` (
  `blogPostID` int(11) NOT NULL AUTO_INCREMENT,
  `post_title` varchar(500) NOT NULL,
  `slug` varchar(500) NOT NULL,
  `post_text` longtext,
  `publishedDate` datetime DEFAULT NULL,
  `createdDate` datetime NOT NULL,
  `lastModified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `userID` int(11) NOT NULL,
  `meta_title` varchar(510) DEFAULT NULL,
  `meta_description` varchar(510) DEFAULT NULL,
  `keywords` longtext,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `thumbnail` varchar(255) NOT NULL,
  `brandID` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`blogPostID`),
  KEY `BlogPostAuthorID` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Brand`
-- ----------------------------
DROP TABLE IF EXISTS `Brand`;
CREATE TABLE `Brand` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `logo` varchar(255),
  `logoAlt` varchar(255),
  `formalName` varchar(255),
  `longName` varchar(255),
  `primaryColor` varchar(10),
  `autocareID` varchar(4),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `BrandPart`
-- ----------------------------
DROP TABLE IF EXISTS `BrandPart`;
CREATE TABLE `BrandPart` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `brandID` int(11) NOT NULL,
  `brandPartID` int(11) NOT NULL,
  `partID` int(11) NOT NULL,
  `interchangeType` char(1) NOT NULL,
  `dateAdded` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `BusinessClass`
-- ----------------------------
DROP TABLE IF EXISTS `BusinessClass`;
CREATE TABLE `BusinessClass` (
  `BusinessClassID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `showOnWebsite` tinyint(1) NOT NULL DEFAULT '0',
  `brandID` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`BusinessClassID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Cabelas`
-- ----------------------------
DROP TABLE IF EXISTS `Cabelas`;
CREATE TABLE `Cabelas` (
  `cabelasID` int(11) NOT NULL AUTO_INCREMENT,
  `priceCode` int(11) DEFAULT NULL,
  `cabelasPart` varchar(50) NOT NULL,
  PRIMARY KEY (`cabelasID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `CartIntegration`
-- ----------------------------
DROP TABLE IF EXISTS `CartIntegration`;
CREATE TABLE `CartIntegration` (
  `referenceID` int(11) NOT NULL AUTO_INCREMENT,
  `partID` int(11) NOT NULL,
  `custPartID` int(11) NOT NULL,
  `custID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`referenceID`),
  KEY `partID` (`partID`),
  KEY `custID` (`custID`)
) ENGINE=InnoDB AUTO_INCREMENT=97340 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `CatPart`
-- ----------------------------
DROP TABLE IF EXISTS `CatPart`;
CREATE TABLE `CatPart` (
  `catPartID` int(11) NOT NULL AUTO_INCREMENT,
  `catID` int(11) NOT NULL,
  `partID` int(11) NOT NULL,
  PRIMARY KEY (`catPartID`),
  KEY `IX_CatPart_Cat_Part` (`catID`,`partID`),
  KEY `FK__CatPart__partID__54945AAA` (`partID`),
  CONSTRAINT `FK__CatPart__catID__55887EE3` FOREIGN KEY (`catID`) REFERENCES `Categories` (`catID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__CatPart__partID__54945AAA` FOREIGN KEY (`partID`) REFERENCES `Part` (`partID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5722 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Categories`
-- ----------------------------
DROP TABLE IF EXISTS `Categories`;
CREATE TABLE `Categories` (
  `catID` int(11) NOT NULL AUTO_INCREMENT,
  `dateAdded` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `parentID` int(11) NOT NULL,
  `catTitle` varchar(100) DEFAULT NULL,
  `shortDesc` varchar(255) DEFAULT NULL,
  `longDesc` longtext,
  `image` varchar(255) DEFAULT NULL,
  `isLifestyle` int(11) NOT NULL,
  `codeID` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '1',
  `vehicleSpecific` tinyint(1) NOT NULL DEFAULT '0',
  `vehicleRequired` tinyint(1) NOT NULL DEFAULT '0',
  `metaTitle` text,
  `metaDesc` text,
  `metaKeywords` text,
  `icon` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `brandID` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`catID`),
  KEY `IX_Categories_ParentID` (`parentID`),
  KEY `IX_Categories_Sort` (`sort`),
  KEY `brandID` (`brandID`)
) ENGINE=InnoDB AUTO_INCREMENT=292 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `CategoryVideo`
-- ----------------------------
DROP TABLE IF EXISTS `CategoryVideo`;
CREATE TABLE `CategoryVideo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `videoID` varchar(45) NOT NULL,
  `catID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `CdnFile`
-- ----------------------------
DROP TABLE IF EXISTS `CdnFile`;
CREATE TABLE `CdnFile` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `typeID` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateModified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastUploaded` varchar(255) DEFAULT NULL,
  `bucket` varchar(255) DEFAULT NULL,
  `objectName` varchar(255) DEFAULT NULL,
  `fileSize` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_CdnFile_CdnFileType` (`typeID`),
  CONSTRAINT `FK_CdnFile_CdnFileType` FOREIGN KEY (`typeID`) REFERENCES `CdnFileType` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `CdnFileType`
-- ----------------------------
DROP TABLE IF EXISTS `CdnFileType`;
CREATE TABLE `CdnFileType` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `mimeType` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Channel`
-- ----------------------------
DROP TABLE IF EXISTS `Channel`;
CREATE TABLE `Channel` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `typeID` int(11) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `embedCode` text,
  `foriegnID` varchar(255) DEFAULT NULL COMMENT 'This would be the ID of the video provided by the host of the channel. For example this would be the youtubeID, such as C2XK9JDoY0o or the vimeo ID.',
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateModified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `title` varchar(255) DEFAULT NULL,
  `desc` text,
  `duration` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Channel_ChannelType` (`typeID`),
  CONSTRAINT `FK_Channel_ChannelType` FOREIGN KEY (`typeID`) REFERENCES `ChannelType` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `ChannelType`
-- ----------------------------
DROP TABLE IF EXISTS `ChannelType`;
CREATE TABLE `ChannelType` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Class`
-- ----------------------------
DROP TABLE IF EXISTS `Class`;
CREATE TABLE `Class` (
  `classID` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`classID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ColorCode`
-- ----------------------------
DROP TABLE IF EXISTS `ColorCode`;
CREATE TABLE `ColorCode` (
  `codeID` int(11) NOT NULL,
  `code` varchar(100) DEFAULT NULL,
  `font` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Comments`
-- ----------------------------
DROP TABLE IF EXISTS `Comments`;
CREATE TABLE `Comments` (
  `commentID` int(11) NOT NULL AUTO_INCREMENT,
  `blogPostID` int(11) NOT NULL,
  `name` varchar(510) NOT NULL,
  `email` varchar(510) DEFAULT NULL,
  `comment_text` longtext,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`commentID`),
  KEY `FK__Comments__blogPo__56E8E7AB` (`blogPostID`),
  CONSTRAINT `FK__Comments__blogPo__56E8E7AB` FOREIGN KEY (`blogPostID`) REFERENCES `BlogPosts` (`blogPostID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Company`
-- ----------------------------
DROP TABLE IF EXISTS `Company`;
CREATE TABLE `Company` (
  `companyID` int(11) NOT NULL AUTO_INCREMENT,
  `company_image` varchar(500) DEFAULT NULL,
  `logo_image` varchar(500) DEFAULT NULL,
  `tagline` varchar(255) DEFAULT NULL,
  `youtube_link` varchar(255) DEFAULT NULL,
  `facebook_link` varchar(255) DEFAULT NULL,
  `twitter_link` varchar(255) DEFAULT NULL,
  `contact_email` varchar(300) DEFAULT NULL,
  `name` varchar(500) DEFAULT NULL,
  `homepage_lookup` int(11) NOT NULL DEFAULT '0',
  `adwords` varchar(500) DEFAULT NULL,
  `merchant_provider` varchar(100) DEFAULT NULL,
  `merchant_id` varchar(200) DEFAULT NULL,
  `analytics_id` varchar(200) NOT NULL DEFAULT '',
  `testimonial_submission` varchar(100) NOT NULL DEFAULT 'Closed',
  `moderate_blog` tinyint(1) NOT NULL DEFAULT '0',
  `stylesheet` varchar(200) NOT NULL DEFAULT 'light_layout.css',
  PRIMARY KEY (`companyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ConfigAttribute`
-- ----------------------------
DROP TABLE IF EXISTS `ConfigAttribute`;
CREATE TABLE `ConfigAttribute` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ConfigAttributeTypeID` int(11) NOT NULL,
  `parentID` int(11) NOT NULL,
  `vcdbID` int(11) DEFAULT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `AAIA_ConfigAttribute_IX` (`ConfigAttributeTypeID`,`parentID`),
  KEY `value` (`value`),
  CONSTRAINT `FK__ConfigAtt__Confi__07D43958` FOREIGN KEY (`ConfigAttributeTypeID`) REFERENCES `ConfigAttributeType` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=396 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `ConfigAttributeType`
-- ----------------------------
DROP TABLE IF EXISTS `ConfigAttributeType`;
CREATE TABLE `ConfigAttributeType` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `AcesTypeID` int(11) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK__ConfigAtt__AcesT__030F843B` (`AcesTypeID`),
  KEY `name` (`name`),
  CONSTRAINT `FK__ConfigAtt__AcesT__030F843B` FOREIGN KEY (`AcesTypeID`) REFERENCES `AcesType` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `Contact`
-- ----------------------------
DROP TABLE IF EXISTS `Contact`;
CREATE TABLE `Contact` (
  `contactID` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `subject` varchar(500) DEFAULT NULL,
  `message` longtext,
  `createdDate` datetime NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `address1` varchar(500) DEFAULT NULL,
  `address2` varchar(500) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `postalcode` varchar(20) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `brandID` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`contactID`)
) ENGINE=InnoDB AUTO_INCREMENT=15147 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ContactReceiver`
-- ----------------------------
DROP TABLE IF EXISTS `ContactReceiver`;
CREATE TABLE `ContactReceiver` (
  `contactReceiverID` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`contactReceiverID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ContactReceiver_ContactType`
-- ----------------------------
DROP TABLE IF EXISTS `ContactReceiver_ContactType`;
CREATE TABLE `ContactReceiver_ContactType` (
  `receiverTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `contactReceiverID` int(11) NOT NULL,
  `contactTypeID` int(11) NOT NULL,
  PRIMARY KEY (`receiverTypeID`),
  KEY `FK__ContactRe__conta__6FB49575` (`contactReceiverID`),
  KEY `FK__ContactRe__conta__70A8B9AE` (`contactTypeID`),
  CONSTRAINT `FK__ContactRe__conta__6FB49575` FOREIGN KEY (`contactReceiverID`) REFERENCES `ContactReceiver` (`contactReceiverID`) ON DELETE CASCADE,
  CONSTRAINT `FK__ContactRe__conta__70A8B9AE` FOREIGN KEY (`contactTypeID`) REFERENCES `ContactType` (`contactTypeID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ContactType`
-- ----------------------------
DROP TABLE IF EXISTS `ContactType`;
CREATE TABLE `ContactType` (
  `contactTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `showOnWebsite` tinyint(1) NOT NULL DEFAULT '1',
  `brandID` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`contactTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Content`
-- ----------------------------
DROP TABLE IF EXISTS `Content`;
CREATE TABLE `Content` (
  `contentID` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext,
  `cTypeID` int(11) NOT NULL,
  `userID` varchar(64) NOT NULL DEFAULT '',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`contentID`),
  KEY `FK__Content__cTypeID__0B457116` (`cTypeID`),
  CONSTRAINT `FK__Content__cTypeID__0B457116` FOREIGN KEY (`cTypeID`) REFERENCES `ContentType` (`cTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=300800 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ContentBridge`
-- ----------------------------
DROP TABLE IF EXISTS `ContentBridge`;
CREATE TABLE `ContentBridge` (
  `cBridgeID` int(11) NOT NULL AUTO_INCREMENT,
  `catID` int(11) DEFAULT NULL,
  `partID` int(11) DEFAULT NULL,
  `contentID` int(11) NOT NULL,
  PRIMARY KEY (`cBridgeID`),
  KEY `IX_ContentBridge_catIDContent` (`catID`,`contentID`),
  KEY `IX_ContentBridge_partIDContent` (`partID`,`contentID`),
  KEY `FK__ContentBr__conte__390C3BC6` (`contentID`),
  CONSTRAINT `FK__ContentBr__catID__3A005FFF` FOREIGN KEY (`catID`) REFERENCES `Categories` (`catID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__ContentBr__conte__390C3BC6` FOREIGN KEY (`contentID`) REFERENCES `Content` (`contentID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__ContentBr__partI__3AF48438` FOREIGN KEY (`partID`) REFERENCES `Part` (`partID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31453 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ContentType`
-- ----------------------------
DROP TABLE IF EXISTS `ContentType`;
CREATE TABLE `ContentType` (
  `cTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `allowHTML` tinyint(1) NOT NULL DEFAULT '0',
  `isPrivate` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cTypeID`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `Content_Revisions`
-- ----------------------------
DROP TABLE IF EXISTS `Content_Revisions`;
CREATE TABLE `Content_Revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` varchar(64) NOT NULL,
  `old_text` longtext,
  `new_text` longtext,
  `date` datetime NOT NULL,
  `changeType` enum('NEW','EDIT','DELETE') NOT NULL,
  `contentID` int(11) NOT NULL,
  `old_type` int(11) NOT NULL DEFAULT '0',
  `new_type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `id_idx` (`contentID`),
  KEY `cTypeID_idx` (`old_type`),
  KEY `cTypeID_idx1` (`new_type`)
) ENGINE=InnoDB AUTO_INCREMENT=467370 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Country`
-- ----------------------------
DROP TABLE IF EXISTS `Country`;
CREATE TABLE `Country` (
  `countryID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `abbr` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`countryID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `CronTasks`
-- ----------------------------
DROP TABLE IF EXISTS `CronTasks`;
CREATE TABLE `CronTasks` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `FormData` blob,
  `Schedule` varchar(255) DEFAULT NULL,
  `Type` int(11) NOT NULL,
  `UserID` varchar(64) NOT NULL,
  `Active` tinyint(1) NOT NULL DEFAULT '0',
  `Started` tinyint(1) NOT NULL DEFAULT '0',
  `LastRunDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `CustUserWebProperties`
-- ----------------------------
DROP TABLE IF EXISTS `CustUserWebProperties`;
CREATE TABLE `CustUserWebProperties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` varchar(64) NOT NULL,
  `webPropID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webProp_ref_idx` (`webPropID`),
  KEY `custUser_ref_idx` (`userID`),
  CONSTRAINT `custUser_ref` FOREIGN KEY (`userID`) REFERENCES `CustomerUser` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `webProps_ref` FOREIGN KEY (`webPropID`) REFERENCES `WebProperties` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Customer`
-- ----------------------------
DROP TABLE IF EXISTS `Customer`;
CREATE TABLE `Customer` (
  `cust_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `city` varchar(150) DEFAULT NULL,
  `stateID` int(11) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `contact_person` varchar(300) DEFAULT NULL,
  `dealer_type` int(11) NOT NULL,
  `latitude` varchar(200) DEFAULT NULL,
  `longitude` varchar(200) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `website` varchar(500) DEFAULT NULL,
  `customerID` int(11) DEFAULT NULL,
  `isDummy` tinyint(1) NOT NULL DEFAULT '0',
  `parentID` int(11) DEFAULT NULL,
  `searchURL` varchar(500) DEFAULT NULL,
  `eLocalURL` varchar(500) DEFAULT NULL,
  `logo` varchar(500) DEFAULT NULL,
  `address2` varchar(500) DEFAULT NULL,
  `postal_code` varchar(25) DEFAULT NULL,
  `mCodeID` int(11) NOT NULL DEFAULT '1',
  `salesRepID` int(11) DEFAULT NULL,
  `APIKey` varchar(64) DEFAULT NULL,
  `tier` int(11) NOT NULL DEFAULT '1',
  `showWebsite` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cust_id`),
  KEY `CustomerCustomerID` (`customerID`),
  KEY `IX_CustomerID` (`customerID`)
) ENGINE=InnoDB AUTO_INCREMENT=10443675 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `CustomerContent`
-- ----------------------------
DROP TABLE IF EXISTS `CustomerContent`;
CREATE TABLE `CustomerContent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `custID` int(11) NOT NULL,
  `added` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `userID` varchar(64) NOT NULL,
  `typeID` int(11) NOT NULL,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `cTypeID_idx` (`typeID`),
  KEY `cust_id_idx` (`custID`),
  KEY `id_idx` (`userID`),
  KEY `deleted_idx` (`deleted`),
  CONSTRAINT `cTypeID` FOREIGN KEY (`typeID`) REFERENCES `ContentType` (`cTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cust_id` FOREIGN KEY (`custID`) REFERENCES `Customer` (`cust_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id` FOREIGN KEY (`userID`) REFERENCES `CustomerUser` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `CustomerContentBridge`
-- ----------------------------
DROP TABLE IF EXISTS `CustomerContentBridge`;
CREATE TABLE `CustomerContentBridge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catID` int(11) NOT NULL,
  `partID` int(11) NOT NULL,
  `contentID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_idx` (`contentID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `CustomerContent_Revisions`
-- ----------------------------
DROP TABLE IF EXISTS `CustomerContent_Revisions`;
CREATE TABLE `CustomerContent_Revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` varchar(64) NOT NULL,
  `custID` int(11) NOT NULL,
  `old_text` longtext,
  `new_text` longtext,
  `date` datetime NOT NULL,
  `changeType` enum('NEW','EDIT','DELETE') NOT NULL,
  `contentID` int(11) NOT NULL,
  `old_type` int(11) NOT NULL DEFAULT '0',
  `new_type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `id_idx` (`contentID`),
  KEY `cTypeID_idx` (`old_type`),
  KEY `cTypeID_idx1` (`new_type`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `CustomerCost`
-- ----------------------------
DROP TABLE IF EXISTS `CustomerCost`;
CREATE TABLE `CustomerCost` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `cust_id` int(11) NOT NULL,
  `partID` int(11) NOT NULL,
  `cost` decimal(18,2) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4599 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `CustomerLoadsheetFields`
-- ----------------------------
DROP TABLE IF EXISTS `CustomerLoadsheetFields`;
CREATE TABLE `CustomerLoadsheetFields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loadsheedID` int(11) NOT NULL,
  `fieldID` int(11) NOT NULL,
  `displayOrder` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=373 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `CustomerLoadsheets`
-- ----------------------------
DROP TABLE IF EXISTS `CustomerLoadsheets`;
CREATE TABLE `CustomerLoadsheets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_ID` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `CustomerLocations`
-- ----------------------------
DROP TABLE IF EXISTS `CustomerLocations`;
CREATE TABLE `CustomerLocations` (
  `locationID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `city` varchar(500) DEFAULT NULL,
  `stateID` int(11) NOT NULL,
  `email` varchar(500) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `cust_id` int(11) NOT NULL DEFAULT '0',
  `contact_person` varchar(300) DEFAULT NULL,
  `isprimary` tinyint(1) NOT NULL DEFAULT '0',
  `postalCode` varchar(30) DEFAULT NULL,
  `ShippingDefault` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`locationID`),
  KEY `IX_CustomerLocations_Customer` (`cust_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8765 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `CustomerPartAttributeFields`
-- ----------------------------
DROP TABLE IF EXISTS `CustomerPartAttributeFields`;
CREATE TABLE `CustomerPartAttributeFields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field` varchar(255) DEFAULT NULL,
  `dataType` int(11) NOT NULL,
  `added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `id_idx` (`dataType`),
  CONSTRAINT `datatype_id` FOREIGN KEY (`dataType`) REFERENCES `DataTypes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `CustomerPartAttributeValues`
-- ----------------------------
DROP TABLE IF EXISTS `CustomerPartAttributeValues`;
CREATE TABLE `CustomerPartAttributeValues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) NOT NULL,
  `added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `CustomerPartAttributes`
-- ----------------------------
DROP TABLE IF EXISTS `CustomerPartAttributes`;
CREATE TABLE `CustomerPartAttributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldID` int(11) NOT NULL,
  `valueID` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `custID` int(11) NOT NULL,
  `userID` varchar(64) NOT NULL,
  `added` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `deleted` tinyint(1) unsigned zerofill NOT NULL,
  `partID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `id_idx` (`fieldID`),
  KEY `id_idx1` (`valueID`),
  KEY `cust_id_idx` (`custID`),
  KEY `id_idx2` (`userID`),
  KEY `partID_idx` (`partID`),
  CONSTRAINT `CustomerPartAttributeFields_id` FOREIGN KEY (`fieldID`) REFERENCES `CustomerPartAttributeFields` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `CustomerPartAttributeValues_id` FOREIGN KEY (`valueID`) REFERENCES `CustomerPartAttributeValues` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `CustomerUser_id` FOREIGN KEY (`userID`) REFERENCES `CustomerUser` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Customer_cust_id` FOREIGN KEY (`custID`) REFERENCES `Customer` (`cust_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Part_partID` FOREIGN KEY (`partID`) REFERENCES `Part` (`partID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `CustomerPartAttributes_Revisions`
-- ----------------------------
DROP TABLE IF EXISTS `CustomerPartAttributes_Revisions`;
CREATE TABLE `CustomerPartAttributes_Revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` varchar(64) NOT NULL,
  `custID` int(11) DEFAULT NULL,
  `old_field` int(11) NOT NULL,
  `new_field` int(11) NOT NULL,
  `old_value` int(11) NOT NULL,
  `new_value` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `changeType` enum('NEW','EDIT','DELETE') NOT NULL,
  `attributeID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `id_idx` (`userID`),
  KEY `cust_id_idx` (`custID`),
  KEY `id_idx1` (`old_field`),
  KEY `id_idx2` (`new_field`),
  KEY `id_idx3` (`old_value`),
  KEY `id_idx4` (`new_value`),
  KEY `id_idx5` (`attributeID`),
  CONSTRAINT `CustomerPartAttributeFields_Revisions_new_id` FOREIGN KEY (`new_field`) REFERENCES `CustomerPartAttributeFields` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `CustomerPartAttributeFields_Revisions_old_id` FOREIGN KEY (`old_field`) REFERENCES `CustomerPartAttributeFields` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `CustomerPartAttributes_Revisions_id` FOREIGN KEY (`attributeID`) REFERENCES `CustomerPartAttributes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `CustomerPartAttributeValues_Revisions_new_id` FOREIGN KEY (`new_value`) REFERENCES `CustomerPartAttributeValues` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `CustomerPartAttributeValues_Revisions_old_id` FOREIGN KEY (`old_value`) REFERENCES `CustomerPartAttributeValues` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `CustomerUser_Revisions_id` FOREIGN KEY (`userID`) REFERENCES `CustomerUser` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Customer_Revisions_cust_id` FOREIGN KEY (`custID`) REFERENCES `Customer` (`cust_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `CustomerPricing`
-- ----------------------------
DROP TABLE IF EXISTS `CustomerPricing`;
CREATE TABLE `CustomerPricing` (
  `cust_price_id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_id` int(11) NOT NULL,
  `partID` int(11) NOT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `isSale` int(11) NOT NULL DEFAULT '0',
  `sale_start` date DEFAULT NULL,
  `sale_end` date DEFAULT NULL,
  PRIMARY KEY (`cust_price_id`),
  KEY `partID` (`partID`),
  KEY `cust_id` (`cust_id`)
) ENGINE=InnoDB AUTO_INCREMENT=545621 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `CustomerReport`
-- ----------------------------
DROP TABLE IF EXISTS `CustomerReport`;
CREATE TABLE `CustomerReport` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `customerID` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `ReportTypeID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK__CustomerR__Repor__0F604C87` (`ReportTypeID`),
  CONSTRAINT `FK__CustomerR__Repor__0F604C87` FOREIGN KEY (`ReportTypeID`) REFERENCES `ReportType` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `CustomerReportPart`
-- ----------------------------
DROP TABLE IF EXISTS `CustomerReportPart`;
CREATE TABLE `CustomerReportPart` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `customerID` int(11) NOT NULL,
  `partID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=279 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `CustomerUser`
-- ----------------------------
DROP TABLE IF EXISTS `CustomerUser`;
CREATE TABLE `CustomerUser` (
  `id` varchar(64) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `customerID` int(11) DEFAULT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `locationID` int(11) NOT NULL DEFAULT '0',
  `isSudo` tinyint(1) NOT NULL DEFAULT '0',
  `cust_ID` int(11) NOT NULL,
  `NotCustomer` tinyint(1) DEFAULT NULL,
  `passwordConverted` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `DataTypes`
-- ----------------------------
DROP TABLE IF EXISTS `DataTypes`;
CREATE TABLE `DataTypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `DealerTiers`
-- ----------------------------
DROP TABLE IF EXISTS `DealerTiers`;
CREATE TABLE `DealerTiers` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `tier` varchar(255) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `brandID` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `DealerTypes`
-- ----------------------------
DROP TABLE IF EXISTS `DealerTypes`;
CREATE TABLE `DealerTypes` (
  `dealer_type` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) DEFAULT NULL,
  `online` tinyint(1) NOT NULL DEFAULT '0',
  `show` tinyint(1) NOT NULL DEFAULT '1',
  `label` varchar(300) DEFAULT NULL,
  `brandID` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`dealer_type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `FAQ`
-- ----------------------------
DROP TABLE IF EXISTS `FAQ`;
CREATE TABLE `FAQ` (
  `faqID` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(500) DEFAULT NULL,
  `answer` longtext,
  `brandID` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`faqID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `File`
-- ----------------------------
DROP TABLE IF EXISTS `File`;
CREATE TABLE `File` (
  `fileID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `path` varchar(500) NOT NULL,
  `height` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fileGalleryID` int(11) NOT NULL,
  `fileExtID` int(11) NOT NULL DEFAULT '1',
  `size` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fileID`),
  KEY `FK__File__fileExtID__6C390A4C` (`fileExtID`),
  CONSTRAINT `FK__File__fileExtID__6C390A4C` FOREIGN KEY (`fileExtID`) REFERENCES `FileExt` (`fileExtID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2356 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `FileExt`
-- ----------------------------
DROP TABLE IF EXISTS `FileExt`;
CREATE TABLE `FileExt` (
  `fileExtID` int(11) NOT NULL AUTO_INCREMENT,
  `fileExt` varchar(10) NOT NULL,
  `fileExtIcon` varchar(1000) DEFAULT NULL,
  `fileTypeID` int(11) NOT NULL,
  PRIMARY KEY (`fileExtID`),
  KEY `FK__FileExt__fileTyp__6A50C1DA` (`fileTypeID`),
  CONSTRAINT `FK__FileExt__fileTyp__6A50C1DA` FOREIGN KEY (`fileTypeID`) REFERENCES `FileType` (`fileTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `FileGallery`
-- ----------------------------
DROP TABLE IF EXISTS `FileGallery`;
CREATE TABLE `FileGallery` (
  `fileGalleryID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(4000) DEFAULT NULL,
  `parentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fileGalleryID`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `FileType`
-- ----------------------------
DROP TABLE IF EXISTS `FileType`;
CREATE TABLE `FileType` (
  `fileTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `fileType` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`fileTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ForumGroup`
-- ----------------------------
DROP TABLE IF EXISTS `ForumGroup`;
CREATE TABLE `ForumGroup` (
  `forumGroupID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext,
  `createdDate` datetime NOT NULL,
  `websiteID` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`forumGroupID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ForumPost`
-- ----------------------------
DROP TABLE IF EXISTS `ForumPost`;
CREATE TABLE `ForumPost` (
  `postID` int(11) NOT NULL AUTO_INCREMENT,
  `parentID` int(11) NOT NULL,
  `threadID` int(11) NOT NULL,
  `createdDate` datetime NOT NULL,
  `title` varchar(255) NOT NULL,
  `post` longtext NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `notify` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `IPAddress` varchar(255) NOT NULL,
  `flag` tinyint(1) NOT NULL,
  `sticky` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`postID`),
  KEY `FK__ForumPost__threa__22B5E1E5` (`threadID`),
  CONSTRAINT `FK__ForumPost__threa__22B5E1E5` FOREIGN KEY (`threadID`) REFERENCES `ForumThread` (`threadID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ForumThread`
-- ----------------------------
DROP TABLE IF EXISTS `ForumThread`;
CREATE TABLE `ForumThread` (
  `threadID` int(11) NOT NULL AUTO_INCREMENT,
  `topicID` int(11) NOT NULL,
  `createdDate` datetime NOT NULL,
  `active` tinyint(1) NOT NULL,
  `closed` tinyint(1) NOT NULL,
  PRIMARY KEY (`threadID`),
  KEY `FK__ForumThre__topic__1DF12CC8` (`topicID`),
  CONSTRAINT `FK__ForumThre__topic__1DF12CC8` FOREIGN KEY (`topicID`) REFERENCES `ForumTopic` (`topicID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ForumTopic`
-- ----------------------------
DROP TABLE IF EXISTS `ForumTopic`;
CREATE TABLE `ForumTopic` (
  `topicID` int(11) NOT NULL AUTO_INCREMENT,
  `TopicGroupID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext,
  `image` varchar(255) DEFAULT NULL,
  `createdDate` datetime NOT NULL,
  `active` tinyint(1) NOT NULL,
  `closed` tinyint(1) NOT NULL,
  PRIMARY KEY (`topicID`),
  KEY `FK__ForumTopi__Topic__192C77AB` (`TopicGroupID`),
  CONSTRAINT `FK__ForumTopi__Topic__192C77AB` FOREIGN KEY (`TopicGroupID`) REFERENCES `ForumGroup` (`forumGroupID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Gallery`
-- ----------------------------
DROP TABLE IF EXISTS `Gallery`;
CREATE TABLE `Gallery` (
  `imgID` int(11) NOT NULL AUTO_INCREMENT,
  `img_path` varchar(500) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`imgID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `IPBlock`
-- ----------------------------
DROP TABLE IF EXISTS `IPBlock`;
CREATE TABLE `IPBlock` (
  `blockID` int(11) NOT NULL AUTO_INCREMENT,
  `IPAddress` varchar(255) NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `createdDate` datetime NOT NULL,
  `userID` int(11) NOT NULL,
  PRIMARY KEY (`blockID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `IncludedPart`
-- ----------------------------
DROP TABLE IF EXISTS `IncludedPart`;
CREATE TABLE `IncludedPart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partID` int(11) NOT NULL,
  `includedID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__IncludedP__partI__33DF3ACD` (`partID`),
  KEY `FK__IncludedP__inclu__34D35F06` (`includedID`),
  CONSTRAINT `FK__IncludedP__inclu__34D35F06` FOREIGN KEY (`includedID`) REFERENCES `Part` (`partID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__IncludedP__partI__33DF3ACD` FOREIGN KEY (`partID`) REFERENCES `Part` (`partID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Inventory`
-- ----------------------------
DROP TABLE IF EXISTS `Inventory`;
CREATE TABLE `Inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `warehouseID` int(11) NOT NULL,
  `partID` int(11) NOT NULL,
  `available` int(11) NOT NULL,
  `dateUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `partID` (`partID`),
  KEY `warehouseID` (`warehouseID`),
  CONSTRAINT `InventoryTopart` FOREIGN KEY (`partID`) REFERENCES `Part` (`partID`),
  CONSTRAINT `InventoryToWarehouse` FOREIGN KEY (`warehouseID`) REFERENCES `Warehouses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `KioskOrderItems`
-- ----------------------------
DROP TABLE IF EXISTS `KioskOrderItems`;
CREATE TABLE `KioskOrderItems` (
  `itemID` int(11) NOT NULL AUTO_INCREMENT,
  `orderID` int(11) NOT NULL,
  `partID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(19,4) NOT NULL,
  `isFulfilled` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `KioskOrders`
-- ----------------------------
DROP TABLE IF EXISTS `KioskOrders`;
CREATE TABLE `KioskOrders` (
  `orderID` int(11) NOT NULL AUTO_INCREMENT,
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `vehicleID` int(11) DEFAULT NULL,
  `acctID` int(11) DEFAULT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(500) DEFAULT NULL,
  `email` varchar(300) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `isProcessed` int(11) NOT NULL DEFAULT '0',
  `isHidden` int(11) NOT NULL DEFAULT '0',
  `address` varchar(600) DEFAULT NULL,
  `city` varchar(500) DEFAULT NULL,
  `stateID` int(11) NOT NULL DEFAULT '0',
  `zip` varchar(100) DEFAULT NULL,
  `locationID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`orderID`)
) ENGINE=InnoDB AUTO_INCREMENT=10000123 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `LandingPage`
-- ----------------------------
DROP TABLE IF EXISTS `LandingPage`;
CREATE TABLE `LandingPage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `startDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  `url` varchar(255) NOT NULL,
  `pageContent` longtext,
  `linkClasses` varchar(255) DEFAULT NULL,
  `conversionID` varchar(150) DEFAULT NULL,
  `conversionLabel` varchar(150) DEFAULT NULL,
  `newWindow` tinyint(1) NOT NULL DEFAULT '0',
  `menuPosition` varchar(15) NOT NULL DEFAULT 'top',
  `websiteID` int(11) NOT NULL Default '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `LandingPageData`
-- ----------------------------
DROP TABLE IF EXISTS `LandingPageData`;
CREATE TABLE `LandingPageData` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `landingPageID` int(11) NOT NULL,
  `dataKey` varchar(100) NOT NULL,
  `dataValue` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__LandingPa__landi__5A2413EF` (`landingPageID`),
  CONSTRAINT `FK__LandingPa__landi__5A2413EF` FOREIGN KEY (`landingPageID`) REFERENCES `LandingPage` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `LandingPageImages`
-- ----------------------------
DROP TABLE IF EXISTS `LandingPageImages`;
CREATE TABLE `LandingPageImages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `landingPageID` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__LandingPa__landi__555F5ED2` (`landingPageID`),
  CONSTRAINT `FK__LandingPa__landi__555F5ED2` FOREIGN KEY (`landingPageID`) REFERENCES `LandingPage` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Lifestyle_Trailer`
-- ----------------------------
DROP TABLE IF EXISTS `Lifestyle_Trailer`;
CREATE TABLE `Lifestyle_Trailer` (
  `lifestyleTrailerID` int(11) NOT NULL AUTO_INCREMENT,
  `catID` int(11) NOT NULL,
  `trailerID` int(11) NOT NULL,
  PRIMARY KEY (`lifestyleTrailerID`),
  KEY `FK__Lifestyle__catID__0869046B` (`catID`),
  KEY `FK__Lifestyle__trail__095D28A4` (`trailerID`),
  CONSTRAINT `FK__Lifestyle__catID__0869046B` FOREIGN KEY (`catID`) REFERENCES `Categories` (`catID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__Lifestyle__trail__095D28A4` FOREIGN KEY (`trailerID`) REFERENCES `Trailer` (`trailerID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `LoadsheetFields`
-- ----------------------------
DROP TABLE IF EXISTS `LoadsheetFields`;
CREATE TABLE `LoadsheetFields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `defaultValue` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `loadsheetID` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Location_Services`
-- ----------------------------
DROP TABLE IF EXISTS `Location_Services`;
CREATE TABLE `Location_Services` (
  `loc_service_id` int(11) NOT NULL AUTO_INCREMENT,
  `serviceID` int(11) NOT NULL,
  `locationID` int(11) NOT NULL,
  PRIMARY KEY (`loc_service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Locations`
-- ----------------------------
DROP TABLE IF EXISTS `Locations`;
CREATE TABLE `Locations` (
  `locationID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `fax` varchar(15) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `stateID` int(11) NOT NULL,
  `zip` int(11) DEFAULT NULL,
  `isPrimary` int(11) NOT NULL DEFAULT '0',
  `latitude` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `longitude` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `places_status` varchar(10) DEFAULT NULL,
  `places_reference` varchar(300) DEFAULT NULL,
  `places_id` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`locationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Logger`
-- ----------------------------
DROP TABLE IF EXISTS `Logger`;
CREATE TABLE `Logger` (
  `id` varchar(64) NOT NULL,
  `Message` varchar(500) DEFAULT NULL,
  `Source` longtext,
  `StackTrace` longtext,
  `TargetSite` varchar(500) DEFAULT NULL,
  `loggedType` varchar(64) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK_Logger_LoggerTypes` (`loggedType`),
  CONSTRAINT `FK_Logger_LoggerTypes` FOREIGN KEY (`loggedType`) REFERENCES `LoggerTypes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `LoggerTypes`
-- ----------------------------
DROP TABLE IF EXISTS `LoggerTypes`;
CREATE TABLE `LoggerTypes` (
  `id` varchar(64) NOT NULL,
  `type` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Make`
-- ----------------------------
DROP TABLE IF EXISTS `Make`;
CREATE TABLE `Make` (
  `makeID` int(11) NOT NULL AUTO_INCREMENT,
  `make` varchar(255) NOT NULL,
  PRIMARY KEY (`makeID`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `MakeModel`
-- ----------------------------
DROP TABLE IF EXISTS `MakeModel`;
CREATE TABLE `MakeModel` (
  `mmID` int(11) NOT NULL AUTO_INCREMENT,
  `makeID` int(11) NOT NULL,
  `modelID` int(11) NOT NULL,
  PRIMARY KEY (`mmID`),
  KEY `IX_MakeModel` (`makeID`,`modelID`),
  KEY `FK__MakeModel__model__4977ADB9` (`modelID`),
  CONSTRAINT `FK__MakeModel__makeI__48838980` FOREIGN KEY (`makeID`) REFERENCES `Make` (`makeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__MakeModel__model__4977ADB9` FOREIGN KEY (`modelID`) REFERENCES `Model` (`modelID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=769 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `MapIcons`
-- ----------------------------
DROP TABLE IF EXISTS `MapIcons`;
CREATE TABLE `MapIcons` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `tier` int(11) NOT NULL,
  `dealer_type` int(11) NOT NULL,
  `mapicon` varchar(300) NOT NULL,
  `mapiconshadow` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK__MapIcons__tier__4F707E31` (`tier`),
  KEY `FK__MapIcons__dealer__5064A26A` (`dealer_type`),
  CONSTRAINT `FK__MapIcons__dealer__5064A26A` FOREIGN KEY (`dealer_type`) REFERENCES `DealerTypes` (`dealer_type`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__MapIcons__tier__4F707E31` FOREIGN KEY (`tier`) REFERENCES `DealerTiers` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `MapPolygon`
-- ----------------------------
DROP TABLE IF EXISTS `MapPolygon`;
CREATE TABLE `MapPolygon` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `stateID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `MapPolygonCoordinates`
-- ----------------------------
DROP TABLE IF EXISTS `MapPolygonCoordinates`;
CREATE TABLE `MapPolygonCoordinates` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MapPolygonID` int(11) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16225 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `MapixCode`
-- ----------------------------
DROP TABLE IF EXISTS `MapixCode`;
CREATE TABLE `MapixCode` (
  `mCodeID` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`mCodeID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Menu`
-- ----------------------------
DROP TABLE IF EXISTS `Menu`;
CREATE TABLE `Menu` (
  `menuID` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(255) NOT NULL,
  `isPrimary` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `display_name` varchar(255) DEFAULT NULL,
  `requireAuthentication` tinyint(1) NOT NULL DEFAULT '0',
  `showOnSitemap` tinyint(1) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '1',
  `websiteID` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`menuID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Menu_SiteContent`
-- ----------------------------
DROP TABLE IF EXISTS `Menu_SiteContent`;
CREATE TABLE `Menu_SiteContent` (
  `menuContentID` int(11) NOT NULL AUTO_INCREMENT,
  `menuID` int(11) NOT NULL,
  `contentID` int(11) DEFAULT NULL,
  `menuSort` int(11) NOT NULL,
  `menuTitle` varchar(255) DEFAULT NULL,
  `menuLink` varchar(500) DEFAULT NULL,
  `parentID` int(11) DEFAULT NULL,
  `linkTarget` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`menuContentID`),
  KEY `FK__Menu_Site__menuI__208CD6FA` (`menuID`),
  KEY `FK__Menu_Site__conte__2180FB33` (`contentID`),
  KEY `FK__Menu_Site__paren__22751F6C` (`parentID`),
  CONSTRAINT `FK__Menu_Site__menuI__208CD6FA` FOREIGN KEY (`menuID`) REFERENCES `Menu` (`menuID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Model`
-- ----------------------------
DROP TABLE IF EXISTS `Model`;
CREATE TABLE `Model` (
  `modelID` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(255) NOT NULL,
  PRIMARY KEY (`modelID`)
) ENGINE=InnoDB AUTO_INCREMENT=743 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ModelStyle`
-- ----------------------------
DROP TABLE IF EXISTS `ModelStyle`;
CREATE TABLE `ModelStyle` (
  `msID` int(11) NOT NULL AUTO_INCREMENT,
  `modelID` int(11) NOT NULL,
  `styleID` int(11) NOT NULL,
  PRIMARY KEY (`msID`),
  KEY `IX_ModelStyle` (`modelID`,`styleID`),
  KEY `FK__ModelStyl__style__4B5FF62B` (`styleID`),
  CONSTRAINT `FK__ModelStyl__model__4A6BD1F2` FOREIGN KEY (`modelID`) REFERENCES `Model` (`modelID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__ModelStyl__style__4B5FF62B` FOREIGN KEY (`styleID`) REFERENCES `Style` (`styleID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1447 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Modules`
-- ----------------------------
DROP TABLE IF EXISTS `Modules`;
CREATE TABLE `Modules` (
  `moduleID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `path` varchar(100) DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`moduleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `NewsItem`
-- ----------------------------
DROP TABLE IF EXISTS `NewsItem`;
CREATE TABLE `NewsItem` (
  `newsItemID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) DEFAULT NULL,
  `lead` longtext,
  `content` longtext,
  `publishStart` datetime DEFAULT NULL,
  `publishEnd` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `slug` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`newsItemID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Note`
-- ----------------------------
DROP TABLE IF EXISTS `Note`;
CREATE TABLE `Note` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `vehiclePartID` int(11) NOT NULL,
  `note` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `AAIA_Note_IX` (`vehiclePartID`),
  CONSTRAINT `FK__Note__vehiclePar__2BFEED3A` FOREIGN KEY (`vehiclePartID`) REFERENCES `vcdb_VehiclePart` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=487062 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `PackageType`
-- ----------------------------
DROP TABLE IF EXISTS `PackageType`;
CREATE TABLE `PackageType` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Part`
-- ----------------------------
DROP TABLE IF EXISTS `Part`;
CREATE TABLE `Part` (
  `partID` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `dateModified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `dateAdded` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `shortDesc` varchar(255) DEFAULT NULL,
  `oldPartNumber` varchar(100) DEFAULT NULL,
  `priceCode` int(11) DEFAULT NULL,
  `classID` int(11) NOT NULL DEFAULT '0',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `ACESPartTypeID` int(11) DEFAULT NULL,
  `replacedBy` int(11) DEFAULT NULL,
  `brandID` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`partID`),
  KEY `IX_Part_status` (`status`),
  KEY `IX_Part_Class` (`classID`),
  KEY `shortDesc` (`shortDesc`),
  KEY `shortDesc_2` (`shortDesc`),
  KEY `brandID` (`brandID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `PartAttribute`
-- ----------------------------
DROP TABLE IF EXISTS `PartAttribute`;
CREATE TABLE `PartAttribute` (
  `pAttrID` int(11) NOT NULL AUTO_INCREMENT,
  `partID` int(11) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '1',
  `canFilter` tinyint NOT NULL DEFAULT 0,
  `public` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`pAttrID`),
  KEY `IX_PartAttribute_Part` (`partID`),
  CONSTRAINT `FK__PartAttri__partI__4C541A64` FOREIGN KEY (`partID`) REFERENCES `Part` (`partID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=69090 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `PartGroup`
-- ----------------------------
DROP TABLE IF EXISTS `PartGroup`;
CREATE TABLE `PartGroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=552 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `PartGroupPart`
-- ----------------------------
DROP TABLE IF EXISTS `PartGroupPart`;
CREATE TABLE `PartGroupPart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partGroupID` int(11) NOT NULL,
  `partID` int(11) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK__PartGroup__partG__2D323D3E` (`partGroupID`),
  KEY `FK__PartGroup__partI__2E266177` (`partID`),
  CONSTRAINT `FK__PartGroup__partG__2D323D3E` FOREIGN KEY (`partGroupID`) REFERENCES `PartGroup` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__PartGroup__partI__2E266177` FOREIGN KEY (`partID`) REFERENCES `Part` (`partID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2202 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `PartImageSizes`
-- ----------------------------
DROP TABLE IF EXISTS `PartImageSizes`;
CREATE TABLE `PartImageSizes` (
  `sizeID` int(11) NOT NULL AUTO_INCREMENT,
  `size` varchar(25) DEFAULT NULL,
  `dimensions` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`sizeID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `PartImages`
-- ----------------------------
DROP TABLE IF EXISTS `PartImages`;
CREATE TABLE `PartImages` (
  `imageID` int(11) NOT NULL AUTO_INCREMENT,
  `sizeID` int(11) NOT NULL,
  `sort` char(2) NOT NULL,
  `path` varchar(500) NOT NULL,
  `height` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  `partID` int(11) NOT NULL,
  PRIMARY KEY (`imageID`),
  KEY `IX_PartImages_Part` (`partID`),
  KEY `IX_PartImages_Size` (`sizeID`),
  CONSTRAINT `FK__PartImage__partI__0E21DDC1` FOREIGN KEY (`partID`) REFERENCES `Part` (`partID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__PartImage__sizeI__0D2DB988` FOREIGN KEY (`sizeID`) REFERENCES `PartImageSizes` (`sizeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3848888 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `PartIndex`
-- ----------------------------
DROP TABLE IF EXISTS `PartIndex`;
CREATE TABLE `PartIndex` (
  `partIndexID` bigint(20) NOT NULL AUTO_INCREMENT,
  `partID` int(11) NOT NULL,
  `partIndex` longtext,
  PRIMARY KEY (`partIndexID`)
) ENGINE=InnoDB AUTO_INCREMENT=84240 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `PartPackage`
-- ----------------------------
DROP TABLE IF EXISTS `PartPackage`;
CREATE TABLE `PartPackage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `partID` int(11) NOT NULL,
  `height` double DEFAULT NULL,
  `width` double DEFAULT NULL,
  `length` double DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `dimensionUOM` int(11) NOT NULL,
  `weightUOM` int(11) NOT NULL,
  `packageUOM` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `typeID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `dimUnit_idx` (`dimensionUOM`),
  KEY `weightUnit_idx` (`weightUOM`),
  KEY `packageUnit_idx` (`packageUOM`),
  KEY `typeUnit_FK_idx` (`typeID`),
  KEY `partID` (`partID`),
  CONSTRAINT `dimUinit_FK` FOREIGN KEY (`dimensionUOM`) REFERENCES `UnitOfMeasure` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `packageUnit_FK` FOREIGN KEY (`packageUOM`) REFERENCES `UnitOfMeasure` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `typeUnit_FK` FOREIGN KEY (`typeID`) REFERENCES `PackageType` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `weightUnit_FK` FOREIGN KEY (`weightUOM`) REFERENCES `UnitOfMeasure` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5051 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `PartVideo`
-- ----------------------------
DROP TABLE IF EXISTS `PartVideo`;
CREATE TABLE `PartVideo` (
  `pVideoID` int(11) NOT NULL AUTO_INCREMENT,
  `partID` int(11) NOT NULL,
  `video` varchar(255) NOT NULL,
  `vTypeID` int(11) NOT NULL,
  `isPrimary` tinyint(1) NOT NULL,
  PRIMARY KEY (`pVideoID`),
  KEY `FK__PartVideo__vType__3723F354` (`vTypeID`),
  KEY `FK__PartVideo__partI__3818178D` (`partID`),
  CONSTRAINT `FK__PartVideo__partI__3818178D` FOREIGN KEY (`partID`) REFERENCES `Part` (`partID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__PartVideo__vType__3723F354` FOREIGN KEY (`vTypeID`) REFERENCES `videoType` (`vTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6514 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Post_Category`
-- ----------------------------
DROP TABLE IF EXISTS `Post_Category`;
CREATE TABLE `Post_Category` (
  `postCategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `postID` int(11) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  PRIMARY KEY (`postCategoryID`),
  KEY `FK__Post_Cate__postI__2BC97F7C` (`postID`),
  CONSTRAINT `FK__Post_Cate__postI__2BC97F7C` FOREIGN KEY (`postID`) REFERENCES `Posts` (`postID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Posts`
-- ----------------------------
DROP TABLE IF EXISTS `Posts`;
CREATE TABLE `Posts` (
  `postID` int(11) NOT NULL AUTO_INCREMENT,
  `siteContentID` int(11) DEFAULT NULL,
  `publishedDate` datetime DEFAULT NULL,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lastModified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `authorID` int(11) NOT NULL,
  `meta_title` varchar(510) DEFAULT NULL,
  `meta_description` varchar(510) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`postID`),
  KEY `FK__Posts__authorID__28ED12D1` (`authorID`),
  KEY `FK__Posts__siteConte__29E1370A` (`siteContentID`),
  CONSTRAINT `FK__Posts__authorID__28ED12D1` FOREIGN KEY (`authorID`) REFERENCES `Authors` (`authorID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__Posts__siteConte__29E1370A` FOREIGN KEY (`siteContentID`) REFERENCES `SiteContent` (`contentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Price`
-- ----------------------------
DROP TABLE IF EXISTS `Price`;
CREATE TABLE `Price` (
  `priceID` int(11) NOT NULL AUTO_INCREMENT,
  `partID` int(11) NOT NULL,
  `priceType` varchar(255) DEFAULT NULL,
  `price` decimal(8,2) NOT NULL,
  `enforced` tinyint(1) NOT NULL DEFAULT '0',
  `dateModified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`priceID`),
  KEY `IX_Price_Part` (`partID`),
  KEY `priceType` (`priceType`),
  CONSTRAINT `FK__Price__partID__0A514CDD` FOREIGN KEY (`partID`) REFERENCES `Part` (`partID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31689 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `Region`
-- ----------------------------
DROP TABLE IF EXISTS `Region`;
CREATE TABLE `Region` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `RelatedPart`
-- ----------------------------
DROP TABLE IF EXISTS `RelatedPart`;
CREATE TABLE `RelatedPart` (
  `relPartID` int(11) NOT NULL AUTO_INCREMENT,
  `partID` int(11) NOT NULL,
  `relatedID` bigint(20) NOT NULL,
  `rTypeID` int(11) NOT NULL,
  PRIMARY KEY (`relPartID`),
  KEY `IX_RelatedPart_Part` (`partID`,`relatedID`)
) ENGINE=InnoDB AUTO_INCREMENT=26343 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `RelatedType`
-- ----------------------------
DROP TABLE IF EXISTS `RelatedType`;
CREATE TABLE `RelatedType` (
  `rTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ReportType`
-- ----------------------------
DROP TABLE IF EXISTS `ReportType`;
CREATE TABLE `ReportType` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Review`
-- ----------------------------
DROP TABLE IF EXISTS `Review`;
CREATE TABLE `Review` (
  `reviewID` int(11) NOT NULL AUTO_INCREMENT,
  `partID` int(11) DEFAULT NULL,
  `rating` int(11) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `review_text` longtext,
  `name` varchar(500) DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `cust_id` int(11) NOT NULL,
  PRIMARY KEY (`reviewID`),
  KEY `ReviewPartID` (`partID`),
  KEY `IX_Review_Part` (`partID`,`createdDate`),
  CONSTRAINT `FK__Review__partID__0C39954F` FOREIGN KEY (`partID`) REFERENCES `Part` (`partID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=634 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `SalesRepresentative`
-- ----------------------------
DROP TABLE IF EXISTS `SalesRepresentative`;
CREATE TABLE `SalesRepresentative` (
  `salesRepID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`salesRepID`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Services`
-- ----------------------------
DROP TABLE IF EXISTS `Services`;
CREATE TABLE `Services` (
  `serviceID` int(11) NOT NULL AUTO_INCREMENT,
  `service_title` varchar(255) DEFAULT NULL,
  `description` longtext,
  `service_price` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `hourly` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`serviceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `SiteContent`
-- ----------------------------
DROP TABLE IF EXISTS `SiteContent`;
CREATE TABLE `SiteContent` (
  `contentID` int(11) NOT NULL AUTO_INCREMENT,
  `content_type` varchar(255) DEFAULT NULL,
  `page_title` varchar(500) DEFAULT NULL,
  `createdDate` datetime NOT NULL,
  `lastModified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `keywords` longtext,
  `isPrimary` tinyint(1) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `slug` varchar(500) DEFAULT NULL,
  `requireAuthentication` tinyint(1) NOT NULL DEFAULT '0',
  `canonical` varchar(255) DEFAULT NULL,
  `websiteID` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`contentID`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `SiteContentRevision`
-- ----------------------------
DROP TABLE IF EXISTS `SiteContentRevision`;
CREATE TABLE `SiteContentRevision` (
  `revisionID` int(11) NOT NULL AUTO_INCREMENT,
  `contentID` int(11) NOT NULL DEFAULT '1',
  `content_text` longtext,
  `createdOn` datetime NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`revisionID`),
  KEY `FK__SiteConte__conte__151B244E` (`contentID`),
  CONSTRAINT `FK__SiteConte__conte__151B244E` FOREIGN KEY (`contentID`) REFERENCES `SiteContent` (`contentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `State`
-- ----------------------------
DROP TABLE IF EXISTS `State`;
CREATE TABLE `State` (
  `state` varchar(128) NOT NULL,
  `abbr` varchar(128) NOT NULL,
  `stateID` int(11) NOT NULL,
  `countryID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `States`
-- ----------------------------
DROP TABLE IF EXISTS `States`;
CREATE TABLE `States` (
  `stateID` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(100) NOT NULL,
  `abbr` varchar(3) NOT NULL,
  `countryID` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`stateID`),
  KEY `FK__States__countryI__607251E5` (`countryID`),
  CONSTRAINT `FK__States__countryI__607251E5` FOREIGN KEY (`countryID`) REFERENCES `Country` (`countryID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Style`
-- ----------------------------
DROP TABLE IF EXISTS `Style`;
CREATE TABLE `Style` (
  `styleID` int(11) NOT NULL AUTO_INCREMENT,
  `style` varchar(255) NOT NULL,
  `aaiaID` int(11) NOT NULL,
  PRIMARY KEY (`styleID`)
) ENGINE=InnoDB AUTO_INCREMENT=644 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Submodel`
-- ----------------------------
DROP TABLE IF EXISTS `Submodel`;
CREATE TABLE `Submodel` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AAIASubmodelID` int(11) DEFAULT NULL,
  `SubmodelName` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `AAIA_Submodel_IX` (`AAIASubmodelID`)
) ENGINE=InnoDB AUTO_INCREMENT=1781 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Survey`
-- ----------------------------
DROP TABLE IF EXISTS `Survey`;
CREATE TABLE `Survey` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `date_modifed` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userID` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `brandID` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `SurveyAnswer`
-- ----------------------------
DROP TABLE IF EXISTS `SurveyAnswer`;
CREATE TABLE `SurveyAnswer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `answer` varchar(500) NOT NULL,
  `data_type` varchar(100) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `questionID` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `SurveyQuestion_FK` (`questionID`),
  CONSTRAINT `SurveyQuestion_FK` FOREIGN KEY (`questionID`) REFERENCES `SurveyQuestion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `SurveyAnswer_Revisions`
-- ----------------------------
DROP TABLE IF EXISTS `SurveyAnswer_Revisions`;
CREATE TABLE `SurveyAnswer_Revisions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `new_answer` varchar(500) DEFAULT NULL,
  `old_answer` varchar(500) DEFAULT NULL,
  `date` datetime NOT NULL,
  `changeType` enum('NEW','EDIT','DELETE') NOT NULL,
  `answerID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `SurveyPrize`
-- ----------------------------
DROP TABLE IF EXISTS `SurveyPrize`;
CREATE TABLE `SurveyPrize` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(500) DEFAULT NULL,
  `part` int(11) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  `winner` int(11) unsigned DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userID` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `current` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `SurveyPrize_Revisions`
-- ----------------------------
DROP TABLE IF EXISTS `SurveyPrize_Revisions`;
CREATE TABLE `SurveyPrize_Revisions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `new_title` varchar(500) DEFAULT NULL,
  `old_title` varchar(500) DEFAULT NULL,
  `new_description` varchar(1000) DEFAULT NULL,
  `old_description` varchar(1000) DEFAULT NULL,
  `new_image` varchar(500) DEFAULT NULL,
  `old_image` varchar(500) DEFAULT NULL,
  `date` datetime NOT NULL,
  `changeType` enum('NEW','EDIT','DELETE') NOT NULL,
  `prizeID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `SurveyQuestion`
-- ----------------------------
DROP TABLE IF EXISTS `SurveyQuestion`;
CREATE TABLE `SurveyQuestion` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(500) NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_added` datetime NOT NULL,
  `userID` int(11) NOT NULL,
  `surveyID` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `SurveyQuestion_Revisions`
-- ----------------------------
DROP TABLE IF EXISTS `SurveyQuestion_Revisions`;
CREATE TABLE `SurveyQuestion_Revisions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `new_question` varchar(500) DEFAULT NULL,
  `old_question` varchar(500) DEFAULT NULL,
  `date` datetime NOT NULL,
  `changeType` enum('NEW','EDIT','DELETE') NOT NULL,
  `questionID` int(10) DEFAULT NULL,
  `new_answer` int(11) NOT NULL DEFAULT '0',
  `old_answer` int(11) NOT NULL DEFAULT '0',
  `new_survey` int(11) NOT NULL DEFAULT '0',
  `old_survey` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `SurveyUser`
-- ----------------------------
DROP TABLE IF EXISTS `SurveyUser`;
CREATE TABLE `SurveyUser` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fname` varchar(500) DEFAULT NULL,
  `lname` varchar(500) DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `SurveyUserAnswer`
-- ----------------------------
DROP TABLE IF EXISTS `SurveyUserAnswer`;
CREATE TABLE `SurveyUserAnswer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `surveyID` int(11) unsigned NOT NULL,
  `questionID` int(11) unsigned NOT NULL,
  `answer` varchar(500) DEFAULT NULL,
  `date_answered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `Survey_FK` (`surveyID`),
  KEY `SurveyQuestionAnswer_FK` (`questionID`),
  CONSTRAINT `SurveyQuestionAnswer_FK` FOREIGN KEY (`questionID`) REFERENCES `SurveyQuestion` (`id`),
  CONSTRAINT `Survey_FK` FOREIGN KEY (`surveyID`) REFERENCES `Survey` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Survey_Revisions`
-- ----------------------------
DROP TABLE IF EXISTS `Survey_Revisions`;
CREATE TABLE `Survey_Revisions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `new_name` varchar(500) DEFAULT NULL,
  `old_name` varchar(500) DEFAULT NULL,
  `date` datetime NOT NULL,
  `changeType` enum('NEW','EDIT','DELETE') NOT NULL,
  `surveyID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `TechNews`
-- ----------------------------
DROP TABLE IF EXISTS `TechNews`;
CREATE TABLE `TechNews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pageContent` text,
  `showDealers` tinyint(1) NOT NULL,
  `showPublic` tinyint(1) NOT NULL,
  `dateModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `displayOrder` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `title` varchar(500) NOT NULL,
  `subTitle` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `TechSupport`
-- ----------------------------
DROP TABLE IF EXISTS `TechSupport`;

CREATE TABLE `TechSupport` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vehicleMake` varchar(100) NOT NULL DEFAULT '',
  `vehicleModel` varchar(100) NOT NULL DEFAULT '',
  `vehicleYear` int(4) NOT NULL,
  `purchaseDate` date NOT NULL,
  `purchasedFrom` varchar(255) NOT NULL DEFAULT '',
  `dealerName` varchar(255) NOT NULL DEFAULT '',
  `productCode` varchar(100) NOT NULL DEFAULT '',
  `dateCode` varchar(100) NOT NULL DEFAULT '',
  `issue` text NOT NULL,
  `contactID` int(11) NOT NULL,
  `brandID` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `ContactID` (`contactID`),
  CONSTRAINT `ContactID` FOREIGN KEY (`contactID`) REFERENCES `Contact` (`contactID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
--  Table structure for `TempCustomer`
-- ----------------------------
DROP TABLE IF EXISTS `TempCustomer`;
CREATE TABLE `TempCustomer` (
  `customerID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Testimonial`
-- ----------------------------
DROP TABLE IF EXISTS `Testimonial`;
CREATE TABLE `Testimonial` (
  `testimonialID` int(11) NOT NULL AUTO_INCREMENT,
  `rating` double NOT NULL,
  `title` varchar(500) DEFAULT NULL,
  `testimonial` longtext,
  `dateAdded` datetime NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `brandID` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`testimonialID`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Testimonials`
-- ----------------------------
DROP TABLE IF EXISTS `Testimonials`;
CREATE TABLE `Testimonials` (
  `reviewID` int(11) NOT NULL AUTO_INCREMENT,
  `reviewer` varchar(400) DEFAULT NULL,
  `review` longtext,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_new` int(11) NOT NULL DEFAULT '0',
  `is_hidden` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`reviewID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Trailer`
-- ----------------------------
DROP TABLE IF EXISTS `Trailer`;
CREATE TABLE `Trailer` (
  `trailerID` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `TW` int(11) DEFAULT NULL,
  `GTW` int(11) DEFAULT NULL,
  `hitchClass` varchar(255) DEFAULT NULL,
  `shortDesc` varchar(1000) DEFAULT NULL,
  `message` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`trailerID`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Tweets`
-- ----------------------------
DROP TABLE IF EXISTS `Tweets`;
CREATE TABLE `Tweets` (
  `tweetID` int(11) NOT NULL AUTO_INCREMENT,
  `twitterTweetID` varchar(500) NOT NULL,
  `tweet` varchar(150) NOT NULL,
  `postDate` datetime NOT NULL,
  `twitterUserID` varchar(500) NOT NULL,
  `screenName` varchar(100) NOT NULL,
  `profilePhoto` varchar(500) NOT NULL,
  `brandID` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`tweetID`),
  UNIQUE KEY `tweetID_UNIQUE` (`tweetID`)
) ENGINE=InnoDB AUTO_INCREMENT=755 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `TwitterLog`
-- ----------------------------
DROP TABLE IF EXISTS `TwitterLog`;
CREATE TABLE `TwitterLog` (
  `tweetLogID` int(11) NOT NULL AUTO_INCREMENT,
  `lastUpdated` datetime NOT NULL,
  `tweets` int(11) NOT NULL,
  PRIMARY KEY (`tweetLogID`)
) ENGINE=InnoDB AUTO_INCREMENT=404219 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `UnitOfMeasure`
-- ----------------------------
DROP TABLE IF EXISTS `UnitOfMeasure`;
CREATE TABLE `UnitOfMeasure` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(5) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `UserProfiles`
-- ----------------------------
DROP TABLE IF EXISTS `UserProfiles`;
CREATE TABLE `UserProfiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerID` int(11) DEFAULT NULL,
  `custID` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `IP` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=851 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Vehicle`
-- ----------------------------
DROP TABLE IF EXISTS `Vehicle`;
CREATE TABLE `Vehicle` (
  `vehicleID` int(11) NOT NULL AUTO_INCREMENT,
  `yearID` int(11) NOT NULL,
  `makeID` int(11) NOT NULL,
  `modelID` int(11) NOT NULL,
  `styleID` int(11) NOT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`vehicleID`),
  KEY `IX_Vehicle_Filter` (`yearID`,`makeID`,`modelID`,`styleID`),
  KEY `FK__Vehicle__makeID__4E3C62D6` (`makeID`),
  KEY `FK__Vehicle__modelID__4F30870F` (`modelID`),
  KEY `FK__Vehicle__styleID__5024AB48` (`styleID`),
  CONSTRAINT `FK__Vehicle__makeID__4E3C62D6` FOREIGN KEY (`makeID`) REFERENCES `Make` (`makeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__Vehicle__modelID__4F30870F` FOREIGN KEY (`modelID`) REFERENCES `Model` (`modelID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__Vehicle__styleID__5024AB48` FOREIGN KEY (`styleID`) REFERENCES `Style` (`styleID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__Vehicle__yearID__4D483E9D` FOREIGN KEY (`yearID`) REFERENCES `Year` (`yearID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=249131 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `VehicleConfig`
-- ----------------------------
DROP TABLE IF EXISTS `VehicleConfig`;
CREATE TABLE `VehicleConfig` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AAIAVehicleConfigID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `AAIA_VehicleConfig_IX` (`AAIAVehicleConfigID`)
) ENGINE=InnoDB AUTO_INCREMENT=32386 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `VehicleConfigAttribute`
-- ----------------------------
DROP TABLE IF EXISTS `VehicleConfigAttribute`;
CREATE TABLE `VehicleConfigAttribute` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AttributeID` int(11) NOT NULL,
  `VehicleConfigID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK__VehicleCo__Attri__19E03CFF` (`AttributeID`),
  KEY `FK__VehicleCo__Vehic__1AD46138` (`VehicleConfigID`),
  CONSTRAINT `FK__VehicleCo__Attri__19E03CFF` FOREIGN KEY (`AttributeID`) REFERENCES `ConfigAttribute` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__VehicleCo__Vehic__1AD46138` FOREIGN KEY (`VehicleConfigID`) REFERENCES `VehicleConfig` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=46347 DEFAULT CHARSET=utf8;


-- ----------------------------
--  Table structure for `VehicleInquiry`
-- ----------------------------
DROP TABLE IF EXISTS `VehicleInquiry`;
CREATE TABLE `VehicleInquiry` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `category` int(11) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `vehicle` varchar(255) NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `VehiclePart`
-- ----------------------------
DROP TABLE IF EXISTS `VehiclePart`;
CREATE TABLE `VehiclePart` (
  `vPartID` int(11) NOT NULL AUTO_INCREMENT,
  `vehicleID` int(11) NOT NULL,
  `partID` int(11) NOT NULL,
  `drilling` varchar(100) DEFAULT NULL,
  `exposed` varchar(100) DEFAULT NULL,
  `installTime` int(11) DEFAULT NULL,
  PRIMARY KEY (`vPartID`),
  KEY `IX_VehiclePart_Part` (`vehicleID`,`partID`),
  KEY `FK__VehiclePa__partI__0F1601FA` (`partID`),
  CONSTRAINT `FK__VehiclePa__partI__0F1601FA` FOREIGN KEY (`partID`) REFERENCES `Part` (`partID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__VehiclePa__vehic__5118CF81` FOREIGN KEY (`vehicleID`) REFERENCES `Vehicle` (`vehicleID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=45438 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Triggers structure for table VehiclePart
-- ----------------------------
CREATE TRIGGER `ModifyPart` AFTER INSERT ON `VehiclePart` FOR EACH ROW update Part set dateModified = NOW()
where partID = NEW.partID;

-- ----------------------------
--  Table structure for `VehiclePartAttribute`
-- ----------------------------
DROP TABLE IF EXISTS `VehiclePartAttribute`;
CREATE TABLE `VehiclePartAttribute` (
  `vpAttrID` int(11) NOT NULL AUTO_INCREMENT,
  `vPartID` int(11) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`vpAttrID`),
  KEY `IX_VehiclePartAttr_VPart` (`vPartID`),
  CONSTRAINT `FK__VehiclePa__vPart__520CF3BA` FOREIGN KEY (`vPartID`) REFERENCES `VehiclePart` (`vPartID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=106256 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `VehicleType`
-- ----------------------------
DROP TABLE IF EXISTS `VehicleType`;
CREATE TABLE `VehicleType` (
  `VehicleTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `VehicleTypeName` varchar(50) NOT NULL,
  `VehicleTypeGroupID` int(11) DEFAULT NULL,
  PRIMARY KEY (`VehicleTypeID`),
  KEY `FK__VehicleTy__Vehic__648AFD1B` (`VehicleTypeGroupID`),
  CONSTRAINT `FK__VehicleTy__Vehic__648AFD1B` FOREIGN KEY (`VehicleTypeGroupID`) REFERENCES `VehicleTypeGroup` (`VehicleTypeGroupID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `VehicleTypeGroup`
-- ----------------------------
DROP TABLE IF EXISTS `VehicleTypeGroup`;
CREATE TABLE `VehicleTypeGroup` (
  `VehicleTypeGroupID` int(11) NOT NULL AUTO_INCREMENT,
  `VehicleTypeGroupName` varchar(50) NOT NULL,
  PRIMARY KEY (`VehicleTypeGroupID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Video`
-- ----------------------------
DROP TABLE IF EXISTS `Video`;
CREATE TABLE `Video` (
  `videoID` int(11) NOT NULL AUTO_INCREMENT,
  `embed_link` varchar(200) DEFAULT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sort` int(11) NOT NULL DEFAULT '1',
  `title` varchar(255) DEFAULT NULL,
  `description` longtext,
  `youtubeID` varchar(255) DEFAULT NULL,
  `watchpage` varchar(255) DEFAULT NULL,
  `screenshot` varchar(255) DEFAULT NULL,
  `brandID` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`videoID`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `VideoCdnFiles`
-- ----------------------------
DROP TABLE IF EXISTS `VideoCdnFiles`;
CREATE TABLE `VideoCdnFiles` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `cdnID` int(11) NOT NULL,
  `videoID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_VideoCdnFiles_CdnFiles` (`cdnID`),
  KEY `FK_VideoCdnFiles_VideoNew` (`videoID`),
  CONSTRAINT `FK_VideoCdnFiles_CdnFiles` FOREIGN KEY (`cdnID`) REFERENCES `CdnFile` (`ID`),
  CONSTRAINT `FK_VideoCdnFiles_VideoNew` FOREIGN KEY (`videoID`) REFERENCES `VideoNew` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `VideoChannels`
-- ----------------------------
DROP TABLE IF EXISTS `VideoChannels`;
CREATE TABLE `VideoChannels` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `videoID` int(11) NOT NULL,
  `channelID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_VideoChannels_Channels` (`channelID`),
  KEY `FK_VideoChannels_Video` (`videoID`),
  CONSTRAINT `FK_VideoChannels_Channels` FOREIGN KEY (`channelID`) REFERENCES `Channel` (`ID`),
  CONSTRAINT `FK_VideoChannels_Video` FOREIGN KEY (`videoID`) REFERENCES `VideoNew` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `VideoJoin`
-- ----------------------------
DROP TABLE IF EXISTS `VideoJoin`;
CREATE TABLE `VideoJoin` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `videoID` int(11) NOT NULL,
  `partID` int(11) NOT NULL,
  `catID` int(11) NOT NULL,
  `websiteID` int(11) NOT NULL DEFAULT '0',
  `isPrimary` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `FK_VideoJoin_Part` (`videoID`),
  KEY `partID` (`partID`),
  KEY `catID` (`catID`),
  CONSTRAINT `FK_VideoJoin_Part` FOREIGN KEY (`videoID`) REFERENCES `VideoNew` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6507 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `VideoNew`
-- ----------------------------
DROP TABLE IF EXISTS `VideoNew`;
CREATE TABLE `VideoNew` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `subjectTypeID` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateModified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isPrimary` tinyint(1) NOT NULL DEFAULT '0',
  `thumbnail` varchar(255) NOT NULL,
  `isPrivate` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Warehouses`
-- ----------------------------
DROP TABLE IF EXISTS `Warehouses`;
CREATE TABLE `Warehouses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(10),
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `stateID` int(11) NOT NULL,
  `postalCode` varchar(255) NOT NULL,
  `tollFreePhone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `localPhone` varchar(255) DEFAULT NULL,
  `manager` varchar(255) DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Warehouses`
-- ----------------------------

DROP TABLE IF EXISTS `Warranty`;

CREATE TABLE `Warranty` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `partNumber` int(11) NOT NULL,
  `date` date NOT NULL,
  `serialNumber` varchar(100) NOT NULL DEFAULT '',
  `approved` tinyint(1) NOT NULL,
  `contactID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ContactIDWarranty` (`contactID`),
  CONSTRAINT `ContactIDWarranty` FOREIGN KEY (`contactID`) REFERENCES `Contact` (`contactID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WebinarSessions`
-- ----------------------------
DROP TABLE IF EXISTS `WebinarSessions`;
CREATE TABLE `WebinarSessions` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`startTime` datetime NOT NULL,
	`endTime` datetime NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=`InnoDB` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT='';

-- ----------------------------
--  Table structure for `WebinarSessionSignups`
-- ----------------------------
DROP TABLE IF EXISTS `WebinarSessionSignups`;
CREATE TABLE `WebinarSessionSignups` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`email` varchar(255) NOT NULL,
	`sessionID` int(11) NOT NULL,
	PRIMARY KEY (`id`),
	CONSTRAINT `SessionRef` FOREIGN KEY (`sessionID`) REFERENCES `CurtDev`.`WebinarSessions` (`id`)
) ENGINE=`InnoDB` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT='';

-- ----------------------------
--  Table structure for `WebPropNotes`
-- ----------------------------
DROP TABLE IF EXISTS `WebPropNotes`;
CREATE TABLE `WebPropNotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `webPropID` int(11) NOT NULL,
  `text` varchar(255) NOT NULL,
  `dateAdded` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WebPropRequirementCheck`
-- ----------------------------
DROP TABLE IF EXISTS `WebPropRequirementCheck`;
CREATE TABLE `WebPropRequirementCheck` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `WebPropertiesID` int(11) DEFAULT NULL,
  `Compliance` tinyint(1) DEFAULT NULL,
  `WebPropRequirementsID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `webPropID_ref_idx` (`WebPropertiesID`),
  KEY `webPropReqID_ref_idx` (`WebPropRequirementsID`),
  CONSTRAINT `webPropID_ref` FOREIGN KEY (`WebPropertiesID`) REFERENCES `WebProperties` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `webPropReqID_ref` FOREIGN KEY (`WebPropRequirementsID`) REFERENCES `WebPropRequirements` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=886 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WebPropRequirements`
-- ----------------------------
DROP TABLE IF EXISTS `WebPropRequirements`;
CREATE TABLE `WebPropRequirements` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ReqType` varchar(255) DEFAULT NULL,
  `Requirement` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WebProperties`
-- ----------------------------
DROP TABLE IF EXISTS `WebProperties`;
CREATE TABLE `WebProperties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(75) NOT NULL,
  `cust_ID` int(11) NOT NULL,
  `badgeID` varchar(64) NOT NULL,
  `url` longtext,
  `isEnabled` tinyint(1) NOT NULL,
  `sellerID` varchar(50) DEFAULT NULL,
  `typeID` int(11) DEFAULT NULL,
  `isFinalApproved` tinyint(1) NOT NULL,
  `isEnabledDate` datetime DEFAULT NULL,
  `isDenied` tinyint(1) NOT NULL,
  `requestedDate` datetime DEFAULT NULL,
  `addedDate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `badgeID` (`badgeID`),
  KEY `type_ref_idx` (`typeID`),
  CONSTRAINT `type_ref` FOREIGN KEY (`typeID`) REFERENCES `WebPropertyTypes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WebPropertyTypes`
-- ----------------------------
DROP TABLE IF EXISTS `WebPropertyTypes`;
CREATE TABLE `WebPropertyTypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeID` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Website`
-- ----------------------------
DROP TABLE IF EXISTS `Website`;
CREATE TABLE `Website` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WidgetDeployments`
-- ----------------------------
DROP TABLE IF EXISTS `WidgetDeployments`;
CREATE TABLE `WidgetDeployments` (
  `trackerID` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(400) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`trackerID`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Year`
-- ----------------------------
DROP TABLE IF EXISTS `Year`;
CREATE TABLE `Year` (
  `yearID` int(11) NOT NULL AUTO_INCREMENT,
  `year` double NOT NULL,
  PRIMARY KEY (`yearID`)
) ENGINE=InnoDB AUTO_INCREMENT=284 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `YearMake`
-- ----------------------------
DROP TABLE IF EXISTS `YearMake`;
CREATE TABLE `YearMake` (
  `ymID` int(11) NOT NULL AUTO_INCREMENT,
  `yearID` int(11) DEFAULT NULL,
  `makeID` int(11) NOT NULL,
  PRIMARY KEY (`ymID`),
  KEY `IX_YearMake` (`yearID`,`makeID`),
  KEY `FK__YearMake__makeID__478F6547` (`makeID`),
  CONSTRAINT `FK__YearMake__makeID__478F6547` FOREIGN KEY (`makeID`) REFERENCES `Make` (`makeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__YearMake__yearID__469B410E` FOREIGN KEY (`yearID`) REFERENCES `Year` (`yearID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1354 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `vcdb_Make`
-- ----------------------------
DROP TABLE IF EXISTS `vcdb_Make`;
CREATE TABLE `vcdb_Make` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AAIAMakeID` int(11) DEFAULT NULL,
  `MakeName` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `AAIA_Make_IX` (`AAIAMakeID`),
  KEY `MakeName` (`MakeName`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `vcdb_Model`
-- ----------------------------
DROP TABLE IF EXISTS `vcdb_Model`;
CREATE TABLE `vcdb_Model` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AAIAModelID` int(11) DEFAULT NULL,
  `ModelName` varchar(100) DEFAULT NULL,
  `VehicleTypeID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `AAIA_Model_IX` (`AAIAModelID`),
  KEY `ModelName` (`ModelName`)
) ENGINE=InnoDB AUTO_INCREMENT=3915 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `vcdb_Vehicle`
-- ----------------------------
DROP TABLE IF EXISTS `vcdb_Vehicle`;
CREATE TABLE `vcdb_Vehicle` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BaseVehicleID` int(11) NOT NULL,
  `SubModelID` int(11) DEFAULT NULL,
  `ConfigID` int(11) DEFAULT NULL,
  `AppID` int(11) DEFAULT NULL,
  `RegionID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `AAIA_Vehicle_IX` (`BaseVehicleID`,`SubModelID`,`ConfigID`),
  KEY `FK__vcdb_Vehi__SubMo__208D3A8E` (`SubModelID`),
  KEY `FK__vcdb_Vehi__Confi__21815EC7` (`ConfigID`),
  CONSTRAINT `FK__vcdb_Vehi__BaseV__1F991655` FOREIGN KEY (`BaseVehicleID`) REFERENCES `BaseVehicle` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__vcdb_Vehi__Confi__21815EC7` FOREIGN KEY (`ConfigID`) REFERENCES `VehicleConfig` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__vcdb_Vehi__SubMo__208D3A8E` FOREIGN KEY (`SubModelID`) REFERENCES `Submodel` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=44041 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `vcdb_VehiclePart`
-- ----------------------------
DROP TABLE IF EXISTS `vcdb_VehiclePart`;
CREATE TABLE `vcdb_VehiclePart` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VehicleID` int(11) NOT NULL,
  `PartNumber` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `AAIA_VehiclePart_Part_IX` (`VehicleID`,`PartNumber`),
  KEY `FK__vcdb_Vehi__PartN__273A381D` (`PartNumber`),
  CONSTRAINT `FK__vcdb_Vehi__PartN__273A381D` FOREIGN KEY (`PartNumber`) REFERENCES `Part` (`partID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__vcdb_Vehi__Vehic__264613E4` FOREIGN KEY (`VehicleID`) REFERENCES `vcdb_Vehicle` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=225533 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `vcdb_Year`
-- ----------------------------
DROP TABLE IF EXISTS `vcdb_Year`;
CREATE TABLE `vcdb_Year` (
  `YearID` int(11) NOT NULL,
  PRIMARY KEY (`YearID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `videoType`
-- ----------------------------
DROP TABLE IF EXISTS `videoType`;
CREATE TABLE `videoType` (
  `vTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`vTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `VideoNewToBrand`
-- ----------------------------
DROP TABLE IF EXISTS `VideoNewToBrand`;
CREATE TABLE `VideoNewToBrand` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `videoID` int(11) NOT NULL,
  `brandID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_VideoNewToBrand_Video` (`videoID`),
  KEY `FK_VideoNewToBrand_Brand` (`brandID`),
  CONSTRAINT `FK_VideoNewToBrand_Brand` FOREIGN KEY (`brandID`) REFERENCES `Brand` (`ID`),
  CONSTRAINT `FK_VideoNewToBrand_Video` FOREIGN KEY (`videoID`) REFERENCES `VideoNew` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1509 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

SET FOREIGN_KEY_CHECKS = 1;

-- ----------------------------
--  Table structure for `CompanyToBrand`
-- ----------------------------
DROP TABLE IF EXISTS `CompanyToBrand`;
CREATE TABLE `CompanyToBrand` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `companyID` int(11) NOT NULL,
  `brandID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `NewsItemToBrand`
-- ----------------------------
DROP TABLE IF EXISTS `NewsItemToBrand`;
CREATE TABLE `NewsItemToBrand` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `newsItemID` int(11) NOT NULL,
  `brandID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `CustomerToBrand`
-- ----------------------------
DROP TABLE IF EXISTS `CustomerToBrand`;
CREATE TABLE `CustomerToBrand` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `cust_id` int(11) NOT NULL,
  `brandID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- ----------------------------
--  Table structure for `WarehousesToBrand`
-- ----------------------------
DROP TABLE IF EXISTS `WarehousesToBrand`;
CREATE TABLE `WarehousesToBrand` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `WarehouseID` int(11) NOT NULL,
  `brandID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- ----------------------------
--  Table structure for `WebsiteToBrand`
-- ----------------------------
DROP TABLE IF EXISTS `WebsiteToBrand`;
CREATE TABLE `WebsiteToBrand` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `WebsiteID` int(11) NOT NULL,
  `brandID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `WebinarSessionsToBrand`
-- ----------------------------
DROP TABLE IF EXISTS `WebinarSessionsToBrand`;
CREATE TABLE `WebinarSessionsToBrand` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `WebinarID` int(11) NOT NULL,
  `brandID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `ApiKeyToBrand`
-- ----------------------------
DROP TABLE IF EXISTS `ApiKeyToBrand`;
CREATE TABLE `ApiKeyToBrand` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `keyID` int(11) NOT NULL,
  `brandID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_ApiKeyToBrand_ApiKey` (`keyID`),
  KEY `FK_ApiKeyToBrand_Brand` (`brandID`),
  CONSTRAINT `FK_ApiKeyToBrand_ApiKey` FOREIGN KEY (`keyID`) REFERENCES `ApiKey` (`id`),
  CONSTRAINT `FK_ApiKeyToBrand_Brand` FOREIGN KEY (`brandID`) REFERENCES `Brand` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25444 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

SET FOREIGN_KEY_CHECKS = 1;

--
-- Dumping routines (PROCEDURE) for database 'CurtDev'
--
DELIMITER ;;

# Dump of PROCEDURE active_parts_proc
# ------------------------------------------------------------

/*!50003 SET @OLD_FOREIGN_KEY_CHECKS=(select @@SESSION.FOREIGN_KEY_CHECKS) */;;
/*!50003 SET @OLD_SQL_NOTES=(select @@SESSION.SQL_NOTES) */;;
/*!50003 SET @OLD_CHARACTER_SET_CLIENT=(select @@SESSION.CHARACTER_SET_CLIENT) */;;
/*!50003 SET @OLD_CHARACTER_SET_RESULTS=(select @@SESSION.CHARACTER_SET_RESULTS) */;;
/*!50003 SET @OLD_COLLATION_CONNECTION=(select @@SESSION.COLLATION_CONNECTION) */;;

/*!50003 SET @OLD_SQL_MODE=(select @@SESSION.sql_mode) */;;
/*!50003 DROP PROCEDURE IF EXISTS `active_parts_proc` */;;
/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`curtDuser2`@`%`*/ /*!50003 PROCEDURE `active_parts_proc`()
BEGIN

	DROP TEMPORARY TABLE IF EXISTS temp;
	CREATE TEMPORARY TABLE IF NOT EXISTS temp (
		tempID INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
		partID INTEGER NULL,
		AcesID INTEGER NULL,
		shortDesc VARCHAR(500) NULL,
		listDesc LONGTEXT NULL,
		jobberPrice DECIMAL(12,2) NULL,
		listPrice DECIMAL(12,2) NULL,
		height DECIMAL(12,2) NULL,
		width DECIMAL(12,2) NULL,
		length DECIMAL(12,2) NULL,
		weight DECIMAL(12,2) NULL
	);

	INSERT INTO temp (partID)
	SELECT p.partID
	FROM Part p
	WHERE p.status = 800;

	UPDATE temp as t, Part as pt
	SET t.AcesID = pt.ACESPartTypeID
	WHERE t.partID = pt.partID
	AND	pt.status = 800;

	UPDATE temp as t, Part as pt
	SET t.shortDesc = pt.shortDesc
	WHERE t.partID = pt.partID
	AND	pt.status = 800;

	UPDATE temp as t, Content as c, ContentBridge as cb
	SET t.listDesc = c.text
	WHERE t.partID = cb.partID
	AND	  cb.contentID = c.contentID
	AND c.cTypeID = 11;

	UPDATE temp as t, Price as pr
	SET t.jobberPrice = pr.price
	WHERE t.partID = pr.partID
	AND	pr.priceType = "Jobber";

	UPDATE temp as t, Price as pr
	SET t.listPrice = pr.price
	WHERE t.partID = pr.partID
	AND	pr.priceType = "List";

	UPDATE temp as t, PartPackage pk
	SET t.length = pk.length,
		t.width = pk.width,
		t.height = pk.height,
		t.weight = pk.weight
	WHERE t.partID = pk.partID;

	SELECT * FROM temp;
	DROP TEMPORARY TABLE IF EXISTS temp;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE global_indust_proc
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `global_indust_proc` */;;
/*!50003 SET @OLD_SQL_MODE=(select @@SESSION.sql_mode) */;;
/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`curtDuser2`@`%`*/ /*!50003 PROCEDURE `global_indust_proc`()
BEGIN

	DECLARE cnt INT DEFAULT 1;
	DECLARE catName VARCHAR(50);

	DROP TEMPORARY TABLE IF EXISTS temp;
	CREATE TEMPORARY TABLE IF NOT EXISTS temp (
		tempID INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
		partID INTEGER NULL,
		shortDesc VARCHAR(500) NULL,
		listDesc LONGTEXT NULL,
		listPrice DECIMAL(12,2) NULL,
		UPC VARCHAR(255) NULL,
		length DECIMAL(12,2) NULL,
		width DECIMAL(12,2) NULL,
		height DECIMAL(12,2) NULL,
		weight DECIMAL(12,2) NULL,
		parentCategory VARCHAR(50) NULL DEFAULT "",
		material VARCHAR(50) NULL DEFAULT "",
		finish VARCHAR(50) NULL DEFAULT "",
		ballDiameter VARCHAR(50) NULL DEFAULT "",
		hitchDrop VARCHAR(50) NULL DEFAULT "",
		rise VARCHAR(50) NULL DEFAULT "",
		ballHole VARCHAR(50) NULL DEFAULT "",
		shankLength VARCHAR(50) NULL DEFAULT "",
		shankDiameter VARCHAR(50) NULL DEFAULT "",
		recTubeSize VARCHAR(50) NULL DEFAULT ""
	);

	INSERT INTO temp (partID)
	SELECT p.partID
	FROM Part p
	WHERE p.status = 800;

	UPDATE temp as t, Part as pt
	SET t.shortDesc = pt.shortDesc
	WHERE t.partID = pt.partID
	AND	pt.status = 800;

	UPDATE temp as t, Content as c, ContentBridge as cb
	SET t.listDesc = c.text
	WHERE t.partID = cb.partID
	AND	  cb.contentID = c.contentID
	AND c.cTypeID = 11;

	UPDATE temp as t, Price as pr
	SET t.listPRice = pr.price
	WHERE t.partID = pr.partID
	AND	pr.priceType = "List";

	UPDATE temp as t, PartAttribute pa
	SET t.UPC = pa.value
	WHERE t.partID = pa.partID
	AND pa.field = "UPC";

	UPDATE temp as t, PartPackage pk
	SET t.length = pk.length,
		t.width = pk.width,
		t.height = pk.height,
		t.weight = pk.weight
	WHERE t.partID = pk.partID;

	UPDATE temp as t, PartAttribute pa
	SET t.material = pa.value
	WHERE t.partID = pa.partID
	AND pa.field = "Material";

	UPDATE temp as t, PartAttribute pa
	SET t.finish = pa.value
	WHERE t.partID = pa.partID
	AND pa.field = "Finish";

	UPDATE temp as t, PartAttribute pa
	SET t.ballDiameter = pa.value
	WHERE t.partID = pa.partID
	AND pa.field = "Ball Diameter";

	UPDATE temp as t, PartAttribute pa
	SET t.hitchDrop = pa.value
	WHERE t.partID = pa.partID
	AND pa.field = "Drop";

	UPDATE temp as t, PartAttribute pa
	SET t.rise = pa.value
	WHERE t.partID = pa.partID
	AND pa.field = "Rise";

	UPDATE temp as t, PartAttribute pa
	SET t.ballHole = pa.value
	WHERE t.partID = pa.partID
	AND pa.field = "Ball Hole";

	UPDATE temp as t, PartAttribute pa
	SET t.shankLength = pa.value
	WHERE t.partID = pa.partID
	AND pa.field = "Shank Length";

	UPDATE temp as t, PartAttribute pa
	SET t.shankDiameter = pa.value
	WHERE t.partID = pa.partID
	AND pa.field = "Shank Diameter";

	UPDATE temp as t, PartAttribute pa
	SET t.recTubeSize = pa.value
	WHERE t.partID = pa.partID
	AND pa.field = "Receiver Tube Size";

	UPDATE temp as t, Part as p
	SET t.parentCategory = (SELECT parent_cat_func(p.partID))
	WHERE t.partID = p.partID;

	SELECT * FROM temp;
	DROP TEMPORARY TABLE IF EXISTS temp;

END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
DELIMITER ;

--
-- Dumping routines (FUNCTION) for database 'CurtDev'
--
DELIMITER ;;

# Dump of FUNCTION bottom_category_ids
# ------------------------------------------------------------

/*!50003 DROP FUNCTION IF EXISTS `bottom_category_ids` */;;
/*!50003 SET @OLD_SQL_MODE=(select @@SESSION.sql_mode) */;;
/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`curtDuser2`@`%`*/ /*!50003 FUNCTION `bottom_category_ids`(id int) RETURNS varchar(255) CHARSET latin1 COLLATE latin1_general_ci
    DETERMINISTIC
BEGIN

	declare IDS varchar(255);
	declare tmpIDS varchar(255);
	declare currentIDS varchar(255);
	declare catCount int(11);
	set @IDS = '';
	set @tmpIDS = '';
	set @currentIDS = '';
	set @catCount = 0;

	select group_concat(distinct c1.catID), count(catID) into @tmpIDS, @catCount from Categories as c1
	where parentID = id || catID = id;

	set @IDS = @tmpIDS;
	while @catCount != 0 do

		set @currentIDS = @tmpIDS;
		select group_concat(distinct catID), count(distinct catID) into @tmpIDS, @catCount from Categories
		where FIND_IN_SET(parentID, @currentIDS);

		if @catCount != 0 then
			set @IDS = CONCAT(@tmpIDS, ',',@IDS);
		end if;

	end while;

	return @IDS;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of FUNCTION categoryLoop
# ------------------------------------------------------------

/*!50003 DROP FUNCTION IF EXISTS `categoryLoop` */;;
/*!50003 SET @OLD_SQL_MODE=(select @@SESSION.sql_mode) */;;
/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`curtDuser2`@`%`*/ /*!50003 FUNCTION `categoryLoop`(categoryID int) RETURNS varchar(255) CHARSET latin1 COLLATE latin1_general_ci
BEGIN

	declare cats varchar(255);
	declare parentID int;

	declare title varchar(255);
	set cats = "";

	select c1.parentID, c1.catTitle into parentID, title from Categories as c1
	where c1.catID = categoryID
	limit 1;


	set cats = title;
	WHILE parentID > 0 do


		select c2.catTitle, c2.parentID into title, parentID from Categories as c2
		where catID = parentID
		limit 1;

		set cats = CONCAT(title,'/',cats);
	END WHILE;


	return (cats);
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of FUNCTION parent_cat_func
# ------------------------------------------------------------

/*!50003 DROP FUNCTION IF EXISTS `parent_cat_func` */;;
/*!50003 SET @OLD_SQL_MODE=(select @@SESSION.sql_mode) */;;
/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`curtDuser2`@`%`*/ /*!50003 FUNCTION `parent_cat_func`(partNum INT) RETURNS varchar(100) CHARSET latin1 COLLATE latin1_general_ci
BEGIN

	DECLARE cid INT;
	DECLARE pid INT;
	DECLARE catName VARCHAR(100);

	-- Seed the variables - BAS 7/24/14
	SELECT 	MIN(c.catID), c.parentID
	INTO	cid, pid
	FROM	Categories c
	JOIN 	CatPart cp
	ON		c.catID = cp.catID
	WHERE	cp.partID = partNum;

	-- Reduce to parentID - BAS 7/25/14
	numLoop: LOOP
		IF pid = 0 THEN
			LEAVE numLoop;
		ELSE
			SELECT 	c.catID, c.parentID
			INTO	cid, pid
			FROM	Categories c
			WHERE	c.catID = pid;
			ITERATE numLoop;
		END IF;
	END LOOP numLoop;

	SELECT 	c.catTitle
	INTO	catName
	FROM 	Categories c
	WHERE	catID = cid;

	return catName;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of FUNCTION partCategoryLoop
# ------------------------------------------------------------

/*!50003 DROP FUNCTION IF EXISTS `partCategoryLoop` */;;
/*!50003 SET @OLD_SQL_MODE=(select @@SESSION.sql_mode) */;;
/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`curtDuser2`@`%`*/ /*!50003 FUNCTION `partCategoryLoop`(partID int) RETURNS varchar(255) CHARSET latin1 COLLATE latin1_general_ci
BEGIN
	declare cats varchar(255);
	declare parentID int;

	declare title varchar(255);
	set cats = "";

	select c1.parentID, c1.catTitle into parentID, title from Categories as c1
	join CatPart as cp on c1.catID = cp.catID
	where cp.partID = partID
	limit 1;


	set cats = title;
	WHILE parentID > 0 do


		select c2.catTitle, c2.parentID into title, parentID from Categories as c2
		where catID = parentID
		limit 1;

		set cats = CONCAT(title,'/',cats);
	END WHILE;


	return (cats);
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
