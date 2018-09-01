/*
SQLyog Ultimate v11.27 (32 bit)
MySQL - 5.7.17 : Database - test_dfw2_account
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`test_dfw2_account` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `test_dfw2_account`;

/*Table structure for table `tbl_account_info` */

CREATE TABLE `tbl_account_info` (
  `player_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '玩家id',
  `device_id` varchar(50) NOT NULL DEFAULT '' COMMENT '设备id',
  `device_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '设备类型1ios, 2android, 3winphone, 4windows, 5browser',
  `qq` varchar(40) NOT NULL DEFAULT '' COMMENT 'qq平台openid',
  `weixin` varchar(100) NOT NULL DEFAULT '' COMMENT '微信',
  `sina` varchar(100) NOT NULL DEFAULT '' COMMENT '微博openid',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号码',
  `email` varchar(64) NOT NULL DEFAULT '' COMMENT '邮箱',
  `is_verify` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否验证（0未验证,1手机,2邮箱,3全部验证）',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `account_type` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '账号类型1:游客账号, 2:非游客号',
  `create_ts` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_ts` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`player_id`),
  UNIQUE KEY `index` (`qq`,`weixin`,`sina`,`mobile`,`email`,`device_id`,`device_type`),
  KEY `ct` (`create_ts`) USING BTREE,
  KEY `mobile` (`mobile`),
  KEY `email` (`email`),
  KEY `qq` (`qq`),
  KEY `weixin` (`weixin`),
  KEY `sina` (`sina`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_email_code` */

CREATE TABLE `tbl_email_code` (
  `email` varchar(64) NOT NULL COMMENT '邮箱',
  `code` varchar(6) NOT NULL COMMENT '验证码',
  `expire_ts` int(10) unsigned NOT NULL COMMENT '到期时间',
  `update_ts` int(10) unsigned NOT NULL COMMENT '更新时间',
  `today_times` tinyint(2) unsigned NOT NULL COMMENT '今日发送次数',
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_mobile_code` */

CREATE TABLE `tbl_mobile_code` (
  `mobile` varchar(16) NOT NULL COMMENT '手机号码',
  `code` varchar(6) NOT NULL DEFAULT '' COMMENT '验证码',
  `expire_ts` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '到期时间',
  `update_ts` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `today_times` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '今日发送次数',
  PRIMARY KEY (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_oauth` */

CREATE TABLE `tbl_oauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL COMMENT '玩家id',
  `openid` varchar(100) DEFAULT NULL COMMENT 'openid',
  `nickname` varchar(30) DEFAULT NULL COMMENT '昵称',
  `sex` tinyint(2) DEFAULT NULL COMMENT '性别（1男，2女）',
  `avatar` varchar(200) DEFAULT NULL COMMENT '头像',
  `city` varchar(20) DEFAULT NULL COMMENT '城市',
  `oauth_type` tinyint(3) DEFAULT NULL COMMENT '类型（3:qq登录,4:wx登录,5新浪）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `openid_index` (`openid`,`oauth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
