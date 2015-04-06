/*
 Navicat MySQL Data Transfer

 Source Server         : boshang
 Source Server Version : 50173
 Source Host           : 120.25.217.173
 Source Database       : boshang

 Target Server Version : 50173
 File Encoding         : utf-8

 Date: 04/03/2015 15:05:35 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `debt`
-- ----------------------------
DROP TABLE IF EXISTS `debt`;
CREATE TABLE `debt` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '债券编号',
  `title` varchar(50) DEFAULT NULL COMMENT '债券标题',
  `content` varchar(255) DEFAULT NULL COMMENT '债券详情',
  `risk_keep` int(5) NOT NULL COMMENT '风险保障金',
  `net_value` decimal(6,2) NOT NULL COMMENT '净值',
  `interest` decimal(4,2) NOT NULL COMMENT '利息',
  `add_time` int(20) NOT NULL COMMENT '债券添加时间',
  `dates` int(5) NOT NULL DEFAULT '0' COMMENT '债券时长',
  `total` int(8) NOT NULL DEFAULT '0' COMMENT '债券总值',
  `move` int(1) NOT NULL DEFAULT '0' COMMENT '趋势，0-趋平，1-盈利，2-亏损',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '还款情况 0-未还 1-已还',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `debt`
-- ----------------------------
BEGIN;
INSERT INTO `debt` VALUES ('1', '电影进击的巨人债券', '进击的巨人进击的巨人进击的巨人进击的巨人进击的巨人进击的巨人', '20', '1.50', '12.00', '1423109401', '90', '150000', '0', '0'), ('2', '电影奔跑吧兄弟债券', '奔跑吧兄弟奔跑吧兄弟奔跑吧兄弟奔跑吧兄弟奔跑吧兄弟奔跑吧兄弟', '55', '0.70', '12.00', '1426409401', '90', '200000', '0', '0');
COMMIT;

-- ----------------------------
--  Table structure for `debtBuy`
-- ----------------------------
DROP TABLE IF EXISTS `debtBuy`;
CREATE TABLE `debtBuy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '债券编号',
  `did` int(10) unsigned NOT NULL COMMENT '债券id',
  `uid` int(10) NOT NULL COMMENT '购买用户id',
  `add_time` int(20) NOT NULL COMMENT '债券添加时间',
  `dates` int(5) NOT NULL COMMENT '债券时长',
  `total_buy` int(10) NOT NULL COMMENT '购买债券总金额',
  `buy_month` int(2) NOT NULL DEFAULT '1' COMMENT '购买月份',
  `buy_year` int(4) DEFAULT '2014' COMMENT '购买年份',
  PRIMARY KEY (`id`),
  KEY `did` (`did`),
  CONSTRAINT `debt` FOREIGN KEY (`did`) REFERENCES `debt` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='债券购买总表';

-- ----------------------------
--  Records of `debtBuy`
-- ----------------------------
BEGIN;
INSERT INTO `debtBuy` VALUES ('1', '1', '1', '21313123', '90', '10000', '3', '2015'), ('2', '2', '1', '22232323', '90', '50000', '3', '2015');
COMMIT;

-- ----------------------------
--  Table structure for `debtBuyList`
-- ----------------------------
DROP TABLE IF EXISTS `debtBuyList`;
CREATE TABLE `debtBuyList` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT COMMENT '债券修改记录编号',
  `bid` int(10) unsigned NOT NULL COMMENT '债券购买记录编号',
  `risk_keep` int(5) NOT NULL COMMENT '风险保障金',
  `net_value` decimal(6,2) NOT NULL COMMENT '净值',
  `interest` decimal(4,2) NOT NULL COMMENT '利息',
  `month` int(5) NOT NULL COMMENT '修改时间(月份)',
  `year` int(5) NOT NULL COMMENT '修改年份',
  `move` int(1) DEFAULT '0' COMMENT '趋势，0-趋平，1-盈利，2-亏损',
  PRIMARY KEY (`id`),
  KEY `bid` (`bid`),
  KEY `months` (`month`) USING BTREE,
  KEY `years` (`year`) USING BTREE,
  CONSTRAINT `buy_id` FOREIGN KEY (`bid`) REFERENCES `debtBuy` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='债券修改记录';

-- ----------------------------
--  Records of `debtBuyList`
-- ----------------------------
BEGIN;
INSERT INTO `debtBuyList` VALUES ('3', '1', '5000', '1.20', '10.00', '2', '2014', '0'), ('4', '1', '5500', '1.20', '12.00', '3', '2014', '0'), ('5', '2', '6000', '1.20', '12.00', '2', '2014', '0'), ('6', '2', '5700', '1.20', '12.00', '3', '2014', '0');
COMMIT;

-- ----------------------------
--  Table structure for `frontUser`
-- ----------------------------
DROP TABLE IF EXISTS `frontUser`;
CREATE TABLE `frontUser` (
  `front_uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `real_name` varchar(8) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `email` varchar(25) DEFAULT NULL COMMENT '用户邮箱',
  PRIMARY KEY (`front_uid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `password` varchar(50) DEFAULT NULL,
  `last_login_ip` varchar(15) DEFAULT NULL,
  `last_login_time` int(11) DEFAULT NULL,
  `lock` int(1) NOT NULL DEFAULT '1' COMMENT '0-未锁定，1-用户被锁定',
  `created_at` varchar(25) DEFAULT NULL,
  `updated_at` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
