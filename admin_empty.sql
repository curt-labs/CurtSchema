/*
 Navicat Premium Data Transfer

 Source Server         : CurtDev
 Source Server Type    : MySQL
 Source Server Version : 50617
 Source Host           : 173.255.114.206
 Source Database       : admin

 Target Server Type    : MySQL
 Target Server Version : 50617
 File Encoding         : utf-8

 Date: 09/18/2014 15:19:23 PM
*/

CREATE DATABASE IF NOT EXISTS admin_empty;

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `OAuthConfigurations`
-- ----------------------------
DROP TABLE IF EXISTS `OAuthConfigurations`;
CREATE TABLE `OAuthConfigurations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `clientSecret` varchar(500) NOT NULL,
  `clientID` varchar(500) NOT NULL,
  `authUrl` varchar(500) NOT NULL,
  `tokenUrl` varchar(500) NOT NULL,
  `scope` varchar(500) NOT NULL,
  `sessionKey` varchar(200) NOT NULL,
  `devSecret` varchar(500) NOT NULL,
  `devID` varchar(500) NOT NULL,
  `devRedirect` varchar(500) NOT NULL,
  `redirectUrl` varchar(500) NOT NULL,
  `service` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `OAuthModuleConfigs`
-- ----------------------------
DROP TABLE IF EXISTS `OAuthModuleConfigs`;
CREATE TABLE `OAuthModuleConfigs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `configID` int(11) NOT NULL,
  `moduleID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `configID` (`configID`),
  KEY `moduleID` (`moduleID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `module`
-- ----------------------------
DROP TABLE IF EXISTS `module`;
CREATE TABLE `module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(150) NOT NULL,
  `module_path` varchar(255) NOT NULL,
  `img_path` varchar(255) DEFAULT NULL,
  `display` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isActive` tinyint(4) NOT NULL,
  `superUser` tinyint(4) NOT NULL,
  `biography` text,
  `photo` varchar(500) DEFAULT NULL,
  `encpassword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `user_module`
-- ----------------------------
DROP TABLE IF EXISTS `user_module`;
CREATE TABLE `user_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `moduleID` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1526 DEFAULT CHARSET=latin1;

SET FOREIGN_KEY_CHECKS = 1;
