/*
SQLyog Ultimate v11.27 (32 bit)
MySQL - 5.6.34 : Database - test_dfw2_log
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`test_dfw2_log` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `test_dfw2_log`;

/*Table structure for table `dtb_log_diamond` */

CREATE TABLE `dtb_log_diamond` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `player_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `diamond` int(10) NOT NULL DEFAULT '0' COMMENT '钻石',
  `action_type` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '类型',
  `ccreate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  `extra` varchar(64) NOT NULL DEFAULT '',
  `extra_2` varchar(64) NOT NULL DEFAULT '',
  `extra_1` varchar(64) NOT NULL DEFAULT '',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品Id(泛指一切)',
  PRIMARY KEY (`id`),
  KEY `uid` (`player_id`) USING BTREE,
  KEY `type` (`action_type`) USING BTREE,
  KEY `ts` (`ccreate_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;

/*Table structure for table `dtb_log_gold` */

CREATE TABLE `dtb_log_gold` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `player_id` int(11) unsigned NOT NULL COMMENT '用户id',
  `gold` int(10) NOT NULL DEFAULT '0' COMMENT '钻石',
  `action_type` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '类型',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  `extra` varchar(64) DEFAULT '0',
  `extra_2` int(10) DEFAULT '0',
  `extra_1` varchar(32) DEFAULT '0',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0',
  `free_diamond` int(10) DEFAULT '0',
  `order_id` varchar(64) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`player_id`) USING BTREE,
  KEY `type` (`action_type`) USING BTREE,
  KEY `ts` (`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_account_action_log` */

CREATE TABLE `tbl_account_action_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL COMMENT '玩家id',
  `account_type` tinyint(3) DEFAULT NULL COMMENT '账号类型1自动生成,2注册账号',
  `ip` varchar(16) DEFAULT NULL COMMENT '玩家ip',
  `action_type` tinyint(3) DEFAULT NULL COMMENT '1登录,2创建,3绑定手机,4修改密码,5绑定第三方',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_code_email_log` */

CREATE TABLE `tbl_code_email_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(64) NOT NULL DEFAULT '' COMMENT '邮箱',
  `action_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'log类型: 1.注册, 2.修改密码, 3.找回密码5:金币兑换',
  `res_code` int(11) NOT NULL DEFAULT '0' COMMENT '邮箱发送状态: 0,成功.',
  `res_fee` int(11) NOT NULL DEFAULT '0' COMMENT '邮箱收费',
  `res_sid` varchar(15) NOT NULL DEFAULT '0' COMMENT '邮箱id',
  `create_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mobile` (`email`) USING BTREE,
  KEY `type` (`action_type`) USING BTREE,
  KEY `ts` (`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_code_mobile_log` */

CREATE TABLE `tbl_code_mobile_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mobile` varchar(16) NOT NULL COMMENT '手机号码',
  `action_type` tinyint(4) NOT NULL COMMENT 'log类型: 1.注册, 2.修改密码, 3.找回密码5:金币兑换',
  `res_code` int(11) unsigned NOT NULL COMMENT '短信发送状态: 0,成功.',
  `res_fee` int(11) NOT NULL COMMENT '短信收费',
  `res_sid` varchar(15) NOT NULL COMMENT '短信id',
  `create_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mobile` (`mobile`) USING BTREE,
  KEY `type` (`action_type`) USING BTREE,
  KEY `ts` (`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_login_log` */

CREATE TABLE `tbl_login_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL COMMENT '用户编号',
  `channel_id` tinyint(4) DEFAULT NULL COMMENT '渠道',
  `device_id` varchar(50) DEFAULT NULL COMMENT '设备id',
  `device_type` tinyint(3) DEFAULT NULL COMMENT '设备类型',
  `client_version` varchar(30) DEFAULT NULL COMMENT '客户端版本',
  `login_type` tinyint(3) DEFAULT NULL COMMENT '登录类型1游客登录,2注册登录,3qq登录,4wx,5新浪,6token',
  `login_ip` varchar(16) DEFAULT NULL COMMENT 'ip',
  `login_time` int(11) DEFAULT NULL COMMENT '上线时间',
  `logout_time` int(11) DEFAULT '0' COMMENT '下线时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
