/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50636
Source Host           : localhost:3306
Source Database       : cvss

Target Server Type    : MYSQL
Target Server Version : 50636
File Encoding         : 65001

Date: 2017-04-18 09:33:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cv
-- ----------------------------
DROP TABLE IF EXISTS `cv`;
CREATE TABLE `cv` (
  `cv_id` int(11) NOT NULL AUTO_INCREMENT,
  `internal_models` varchar(36) NOT NULL,
  `external_models` varchar(36) NOT NULL,
  `series_id` int(11) NOT NULL,
  `retail_price` int(11) NOT NULL,
  `parts1` int(11) DEFAULT NULL,
  `parts2` int(11) DEFAULT NULL,
  `parts3` int(11) DEFAULT NULL,
  `parts4` int(11) DEFAULT NULL,
  `parts5` int(11) DEFAULT NULL,
  `parts6` int(11) DEFAULT NULL,
  `parts7` int(11) DEFAULT NULL,
  `parts8` int(11) DEFAULT NULL,
  `parts9` int(11) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`cv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cv
-- ----------------------------

-- ----------------------------
-- Table structure for cv_parts
-- ----------------------------
DROP TABLE IF EXISTS `cv_parts`;
CREATE TABLE `cv_parts` (
  `parts_id` int(11) NOT NULL AUTO_INCREMENT,
  `parts_name` varchar(36) NOT NULL,
  `type_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`parts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cv_parts
-- ----------------------------

-- ----------------------------
-- Table structure for cv_parts_add
-- ----------------------------
DROP TABLE IF EXISTS `cv_parts_add`;
CREATE TABLE `cv_parts_add` (
  `add_id` int(11) NOT NULL AUTO_INCREMENT,
  `add_name` varchar(36) NOT NULL,
  `unit` varchar(18) DEFAULT NULL,
  `tax_price` decimal(11,0) NOT NULL,
  `remarks` varchar(36) DEFAULT NULL,
  `type_id` int(11) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`add_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cv_parts_add
-- ----------------------------

-- ----------------------------
-- Table structure for cv_parts_replace
-- ----------------------------
DROP TABLE IF EXISTS `cv_parts_replace`;
CREATE TABLE `cv_parts_replace` (
  `replaceId` int(11) NOT NULL,
  `replace_before` int(11) NOT NULL,
  `replace_after` int(11) NOT NULL,
  `unit` varchar(18) DEFAULT NULL,
  `tax_price` decimal(11,0) NOT NULL,
  `remarks` varchar(36) DEFAULT NULL,
  `type_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`replaceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cv_parts_replace
-- ----------------------------

-- ----------------------------
-- Table structure for cv_parts_type
-- ----------------------------
DROP TABLE IF EXISTS `cv_parts_type`;
CREATE TABLE `cv_parts_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(36) NOT NULL,
  `create_time` datetime NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cv_parts_type
-- ----------------------------

-- ----------------------------
-- Table structure for cv_settlement
-- ----------------------------
DROP TABLE IF EXISTS `cv_settlement`;
CREATE TABLE `cv_settlement` (
  `settlement_id` int(11) NOT NULL AUTO_INCREMENT,
  `cv_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_price` decimal(11,0) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`settlement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cv_settlement
-- ----------------------------

-- ----------------------------
-- Table structure for cv_type
-- ----------------------------
DROP TABLE IF EXISTS `cv_type`;
CREATE TABLE `cv_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(36) NOT NULL,
  `create_time` datetime NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cv_type
-- ----------------------------

-- ----------------------------
-- Table structure for cv_type_series
-- ----------------------------
DROP TABLE IF EXISTS `cv_type_series`;
CREATE TABLE `cv_type_series` (
  `series_id` int(11) NOT NULL AUTO_INCREMENT,
  `series_name` varchar(36) NOT NULL,
  `type_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`series_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cv_type_series
-- ----------------------------

-- ----------------------------
-- Table structure for search_history
-- ----------------------------
DROP TABLE IF EXISTS `search_history`;
CREATE TABLE `search_history` (
  `search_id` int(11) NOT NULL AUTO_INCREMENT,
  `cv_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`search_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of search_history
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(36) NOT NULL,
  `menu_parent` int(11) DEFAULT NULL,
  `menu_url` varchar(36) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_code` varchar(11) NOT NULL,
  `role_name` varchar(36) NOT NULL,
  `role_describe` varchar(36) NOT NULL,
  `valid_time` datetime DEFAULT NULL,
  `dead_time` datetime DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`role_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('ADMIN', '管理员', '系统最高权限管理员', '2017-04-18 09:30:41', null, '1');

-- ----------------------------
-- Table structure for sys_set
-- ----------------------------
DROP TABLE IF EXISTS `sys_set`;
CREATE TABLE `sys_set` (
  `sys_logo` varchar(255) DEFAULT NULL,
  `sys_title` varchar(255) DEFAULT NULL,
  `sys_mc` varchar(255) DEFAULT NULL,
  `sys_oc` varchar(255) DEFAULT NULL,
  `comany_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_set
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(36) NOT NULL,
  `password` varchar(18) NOT NULL,
  `user_email` varchar(36) DEFAULT NULL,
  `user_tel` varchar(11) DEFAULT NULL,
  `role_code` varchar(11) NOT NULL,
  `valid_time` datetime DEFAULT NULL,
  `dead_time` datetime DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'admin', 'xiaoxin_liu@foxmail.com', '17602110267', 'ADMIN', '2017-04-18 09:30:06', null, '1');
