/*
 Navicat MySQL Data Transfer

 Source Server         : workspace
 Source Server Version : 50615
 Source Host           : localhost
 Source Database       : diagnose

 Target Server Version : 50615
 File Encoding         : utf-8

 Date: 04/06/2015 23:24:22 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `acl`
-- ----------------------------
DROP TABLE IF EXISTS `acl`;
CREATE TABLE `acl` (
  `acl_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `acl_name` varchar(50) NOT NULL,
  `acl_controller` varchar(50) NOT NULL,
  `acl_action` varchar(50) NOT NULL,
  `acl_role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`acl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(50) NOT NULL,
  `admin_real_name` varchar(50) NOT NULL,
  `admin_pwd` varchar(32) NOT NULL,
  `admin_role` int(10) unsigned NOT NULL,
  `admin_remain_times` tinyint(2) unsigned DEFAULT '15',
  `admin_lock` tinyint(1) unsigned DEFAULT '0',
  `admin_email` varchar(50) DEFAULT NULL,
  `admin_login_time` int(10) unsigned DEFAULT NULL,
  `admin_login_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 4096 kB';

-- ----------------------------
--  Records of `admin`
-- ----------------------------
BEGIN;
INSERT INTO `admin` VALUES ('1', 'admin', '戴建豪', '=76ES', '1', '88', '0', 'toruneko@163.com', '1402769439', '127.0.0.1');
COMMIT;

-- ----------------------------
--  Table structure for `diagnose_log`
-- ----------------------------
DROP TABLE IF EXISTS `diagnose_log`;
CREATE TABLE `diagnose_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `office` int(11) DEFAULT NULL,
  `updated_at` varchar(25) DEFAULT NULL,
  `created_at` varchar(25) DEFAULT NULL,
  `words` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `office` (`office`),
  CONSTRAINT `office` FOREIGN KEY (`office`) REFERENCES `office` (`office_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `diagnose_log`
-- ----------------------------
BEGIN;
INSERT INTO `diagnose_log` VALUES ('3', '我发热，无力，眼花', null, '2015-01-12 14:38:07', '2015-01-12 14:38:07', ''), ('7', '我头晕，无力，困倦', null, '2015-01-14 06:35:43', '2015-01-14 06:35:43', ''), ('9', '我发热，头痛，眼花', null, '2015-01-14 06:37:06', '2015-01-14 06:37:06', ''), ('10', '我腰酸,腿软,肩膀痛', null, '2015-01-26 10:31:31', '2015-01-26 10:31:31', ''), ('11', '我腰酸', null, '2015-01-26 10:32:05', '2015-01-26 10:32:05', ''), ('12', '我腰酸，腿软，肩膀痛', null, '2015-01-26 10:32:34', '2015-01-26 10:32:34', ''), ('13', '我腰酸，腿软，肩膀痛', null, '2015-01-26 10:33:05', '2015-01-26 10:33:05', ''), ('14', '我头晕', null, '2015-01-26 10:33:35', '2015-01-26 10:33:35', ''), ('15', '我头痛', null, '2015-01-26 10:34:08', '2015-01-26 10:34:08', ''), ('16', '我头痛，还乏力，并且恶心，伴随呕吐', null, '2015-01-26 10:42:53', '2015-01-26 10:42:53', ''), ('17', '我呕吐，还鼻塞，而且咳嗽，伴随发热', null, '2015-01-26 10:43:35', '2015-01-26 10:43:35', ''), ('18', '我腰酸，背痛', null, '2015-01-26 15:04:03', '2015-01-26 15:04:03', ''), ('19', '我腰酸', null, '2015-01-26 15:24:59', '2015-01-26 15:24:59', ''), ('21', '我腿部酸软', null, '2015-03-27 13:50:51', '2015-03-27 13:50:51', ''), ('22', '我膝盖酸痛', null, '2015-03-27 13:53:48', '2015-03-27 13:53:48', ''), ('23', '我膝盖酸痛', null, '2015-03-27 13:54:14', '2015-03-27 13:54:14', ''), ('24', '我疲乏，气短，还眩晕', null, '2015-03-27 13:57:21', '2015-03-27 13:57:21', ''), ('25', '我疲乏，气短，还眩晕', null, '2015-03-27 13:58:33', '2015-03-27 13:58:33', ''), ('26', '我目眩，气短，还头痛', null, '2015-03-27 13:59:05', '2015-03-27 13:59:05', ''), ('27', '我目眩，气短，还头痛', null, '2015-03-27 13:59:47', '2015-03-27 13:59:47', ''), ('28', '我目眩，气短，还头痛', '1', '2015-04-02 07:22:32', '2015-03-27 14:07:20', '目眩,气短,头痛'), ('29', '我腹泻，腿软，头晕', '5', '2015-04-02 07:03:13', '2015-04-01 13:25:06', '腹泻,腿,软,头晕');
COMMIT;

-- ----------------------------
--  Table structure for `diagnose_log_match`
-- ----------------------------
DROP TABLE IF EXISTS `diagnose_log_match`;
CREATE TABLE `diagnose_log_match` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `l_id` int(11) unsigned NOT NULL,
  `m_id` int(5) unsigned NOT NULL,
  `created_at` varchar(25) DEFAULT NULL,
  `updated_at` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `l_id` (`l_id`),
  KEY `m_id` (`m_id`),
  CONSTRAINT `log` FOREIGN KEY (`l_id`) REFERENCES `diagnose_log` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `symptom` FOREIGN KEY (`m_id`) REFERENCES `symptom` (`symptom_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `diagnose_log_match`
-- ----------------------------
BEGIN;
INSERT INTO `diagnose_log_match` VALUES ('1', '27', '14', '2015-03-27 13:59:47', '2015-03-27 13:59:47'), ('2', '27', '1', '2015-03-27 13:59:47', '2015-03-27 13:59:47'), ('3', '28', '14', '2015-03-27 14:07:20', '2015-03-27 14:07:20'), ('4', '28', '1', '2015-03-27 14:07:20', '2015-03-27 14:07:20'), ('5', '29', '54', '2015-04-01 13:25:06', '2015-04-01 13:25:06');
COMMIT;

-- ----------------------------
--  Table structure for `dialog`
-- ----------------------------
DROP TABLE IF EXISTS `dialog`;
CREATE TABLE `dialog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `controller` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `time` int(11) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `user` varchar(50) DEFAULT NULL,
  `message` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `dialog`
-- ----------------------------
BEGIN;
INSERT INTO `dialog` VALUES ('1', 'login', 'login', '1', '1392796829', '127.0.0.1', 'admin', '登录成功'), ('2', 'login', 'login', '1', '1402769439', '127.0.0.1', 'admin', '登录成功');
COMMIT;

-- ----------------------------
--  Table structure for `doctors`
-- ----------------------------
DROP TABLE IF EXISTS `doctors`;
CREATE TABLE `doctors` (
  `doctor_id` int(5) NOT NULL AUTO_INCREMENT,
  `doctor_name` varchar(10) NOT NULL,
  `doctor_office_id` int(5) NOT NULL,
  PRIMARY KEY (`doctor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `lm_office_symptom`
-- ----------------------------
DROP TABLE IF EXISTS `lm_office_symptom`;
CREATE TABLE `lm_office_symptom` (
  `lm_office_id` int(5) NOT NULL,
  `lm_symptom_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `lm_office_symptom`
-- ----------------------------
BEGIN;
INSERT INTO `lm_office_symptom` VALUES ('1', '1'), ('1', '2'), ('1', '3'), ('1', '4'), ('1', '5'), ('1', '6'), ('1', '7'), ('1', '8'), ('1', '9'), ('1', '10'), ('1', '11'), ('1', '12'), ('1', '14'), ('1', '15'), ('1', '16'), ('2', '17'), ('2', '18'), ('2', '16'), ('2', '21'), ('2', '20'), ('2', '19'), ('2', '22'), ('2', '3'), ('2', '4'), ('2', '23'), ('2', '24'), ('2', '2'), ('2', '25'), ('2', '26'), ('2', '27'), ('2', '28'), ('2', '29'), ('3', '15'), ('3', '27'), ('3', '2'), ('3', '16'), ('3', '1'), ('3', '30'), ('3', '31'), ('3', '32'), ('3', '33'), ('3', '34'), ('3', '35'), ('3', '36'), ('3', '37'), ('3', '39'), ('3', '40'), ('3', '41'), ('3', '43'), ('4', '26'), ('4', '12'), ('4', '15'), ('4', '44'), ('4', '45'), ('4', '46'), ('4', '47'), ('4', '2'), ('4', '48'), ('4', '1'), ('5', '49'), ('5', '12'), ('5', '50'), ('5', '2'), ('5', '51'), ('5', '52'), ('5', '53'), ('5', '54'), ('5', '55'), ('5', '40'), ('5', '16'), ('5', '3'), ('5', '4'), ('5', '56'), ('6', '1'), ('6', '7'), ('6', '3'), ('6', '4'), ('6', '25'), ('6', '57'), ('6', '58'), ('6', '59'), ('6', '60'), ('6', '51'), ('7', '8'), ('7', '1'), ('7', '7'), ('7', '61'), ('7', '62'), ('7', '63'), ('7', '64'), ('7', '65'), ('7', '66'), ('7', '67'), ('7', '68');
COMMIT;

-- ----------------------------
--  Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `menu_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(50) NOT NULL,
  `menu_controller` varchar(50) DEFAULT NULL,
  `menu_action` varchar(50) DEFAULT NULL,
  `menu_father_id` int(10) unsigned DEFAULT '0',
  `menu_order` tinyint(2) DEFAULT '0',
  `menu_shortcut` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`menu_id`),
  UNIQUE KEY `id` (`menu_id`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `menu`
-- ----------------------------
BEGIN;
INSERT INTO `menu` VALUES ('1', '后台管理', '', '', '0', '0', '0'), ('2', '管理菜单', 'menu', 'index', '1', '0', '0'), ('3', '管理员管理', '', '', '0', '1', '0'), ('4', '管理员账户', 'user', 'index', '3', '0', '0'), ('5', '管理员角色', 'department', 'index', '3', '1', '0'), ('6', '管理员权限', 'administrator', 'index', '3', '2', '0'), ('7', '个人信息', 'person', 'index', '3', '3', '0'), ('8', '操作日志', 'dialog', 'index', '1', '1', '0'), ('15', '后台公告', 'announce', 'index', '1', '2', '0'), ('40', '挂号管理', '', '', '0', '2', '0'), ('41', '挂号信息', 'register', 'index', '40', '0', '0'), ('42', '医生信息', 'doctor', 'index', '40', '1', '0'), ('43', '科室信息', 'office', 'index', '40', '3', '0');
COMMIT;

-- ----------------------------
--  Table structure for `notice`
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `message` text,
  `time` int(10) unsigned NOT NULL,
  `user` varchar(50) NOT NULL,
  `lock` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `office`
-- ----------------------------
DROP TABLE IF EXISTS `office`;
CREATE TABLE `office` (
  `office_id` int(11) NOT NULL AUTO_INCREMENT,
  `office_name` varchar(20) NOT NULL,
  `office_matching` int(20) DEFAULT '0',
  PRIMARY KEY (`office_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `office`
-- ----------------------------
BEGIN;
INSERT INTO `office` VALUES ('1', '心血管内科', '0'), ('2', '呼吸内科', '0'), ('3', '肾内科', '0'), ('4', '内分泌科', '0'), ('5', '肛肠外科', '0'), ('6', '妇产科', '0'), ('7', '神经内科', '0');
COMMIT;

-- ----------------------------
--  Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL,
  `role_power` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `role`
-- ----------------------------
BEGIN;
INSERT INTO `role` VALUES ('1', '网站开发者', '0'), ('2', '系统管理员', '1'), ('4', '普通管理员', '2');
COMMIT;

-- ----------------------------
--  Table structure for `symptom`
-- ----------------------------
DROP TABLE IF EXISTS `symptom`;
CREATE TABLE `symptom` (
  `symptom_id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `symptom_name` varchar(20) NOT NULL,
  PRIMARY KEY (`symptom_id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `symptom`
-- ----------------------------
BEGIN;
INSERT INTO `symptom` VALUES ('1', '头痛'), ('2', '乏力'), ('3', '恶心'), ('4', '呕吐'), ('5', '气促'), ('6', '烦躁'), ('7', '眼花'), ('8', '晕厥'), ('9', '虚弱'), ('10', '多汗'), ('11', '冷汗'), ('12', '眩晕'), ('14', '气短'), ('15', '疲乏'), ('16', '发热'), ('17', '鼻塞'), ('18', '喷嚏'), ('19', '咽痛'), ('20', '声嘶'), ('21', '咳嗽'), ('22', '畏寒'), ('23', '气急'), ('25', '胸闷'), ('26', '紫绀'), ('27', '厌食'), ('28', '咽干'), ('29', '咽痒'), ('30', '浮肿'), ('31', '血尿'), ('32', '水肿'), ('33', '尿少'), ('34', '苍白'), ('35', '萎靡'), ('36', '腰痛'), ('37', '水肿'), ('39', '骨痛'), ('40', '寒战'), ('41', '多尿'), ('43', '尿痛'), ('44', '嘴歪'), ('45', '口水'), ('46', '失语'), ('47', '难咽'), ('48', '摔倒'), ('49', '便血'), ('50', '气喘'), ('51', '腹痛'), ('52', '便秘'), ('53', '脱肛'), ('54', '腹泻'), ('55', '腹满'), ('56', '贫血'), ('57', '抽搐'), ('58', '痛经'), ('59', '腰酸'), ('60', '乳胀'), ('61', '幻视'), ('62', '盲点'), ('63', '眼胀'), ('64', '颤抖'), ('65', '流涎'), ('66', '失眠'), ('67', '抑郁'), ('68', '痴呆');
COMMIT;

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `user_sex` int(1) NOT NULL,
  `user_tel` varchar(20) NOT NULL,
  `user_adress` varchar(100) NOT NULL,
  `user_message` varchar(200) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
