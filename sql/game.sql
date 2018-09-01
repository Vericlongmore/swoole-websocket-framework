/*
SQLyog Ultimate v11.27 (32 bit)
MySQL - 5.7.17 : Database - test_dfw2_game
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`test_dfw2_game` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `test_dfw2_game`;

/*Table structure for table `tbl_match_list` */

CREATE TABLE `tbl_match_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `match_list` varchar(2048) NOT NULL DEFAULT '' COMMENT '比赛列表',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_match_team_score` */

CREATE TABLE `tbl_match_team_score` (
  `match_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '比赛id',
  `team_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '球队Id',
  `type` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '类型id',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '次数',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`match_id`,`team_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Table structure for table `tbl_message` */

CREATE TABLE `tbl_message` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(1024) NOT NULL DEFAULT '' COMMENT '标题',
  `content` varchar(2048) NOT NULL DEFAULT '' COMMENT '内容',
  `send_player_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发送者',
  `is_read` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否已读',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_player_info` */

CREATE TABLE `tbl_player_info` (
  `player_id` int(11) unsigned NOT NULL COMMENT '玩家id',
  `nickname` varchar(30) NOT NULL COMMENT '昵称',
  `avatar` smallint(6) unsigned NOT NULL DEFAULT '1' COMMENT '头像',
  `power` smallint(4) unsigned NOT NULL COMMENT '体力',
  `level` smallint(4) unsigned NOT NULL DEFAULT '1' COMMENT '等级',
  `exp` smallint(4) unsigned NOT NULL DEFAULT '0' COMMENT '经验',
  `vip_level` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT 'vip等级',
  `vip_exp` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT 'vip经验',
  `diamond` int(11) NOT NULL DEFAULT '0' COMMENT '钻石',
  `gold` int(11) NOT NULL DEFAULT '0' COMMENT '金币',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '状态（1正常,2封号）',
  `create_ts` int(11) unsigned NOT NULL COMMENT '创建时间',
  `update_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `guide` varchar(128) NOT NULL DEFAULT '{}' COMMENT '新手引导步骤',
  PRIMARY KEY (`player_id`),
  UNIQUE KEY `nickname` (`nickname`),
  KEY `create_ts` (`create_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_player_match_info` */

CREATE TABLE `tbl_player_match_info` (
  `player_id` int(10) unsigned NOT NULL COMMENT '玩家id',
  `join_times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '参加次数',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_room_list` */

CREATE TABLE `tbl_room_list` (
  `room_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '房间id',
  `type` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '类型',
  `rule` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则',
  `bonus` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '奖励',
  `fee` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '入场费',
  `max_users` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大人数',
  `current_users` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '当前人数',
  `total_bonus` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '总奖金',
  `top_bonus` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '第一名奖金',
  `closed_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关闭时间',
  `team_number` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '球队数量',
  `team_salarycap` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '球队工资帽',
  `player_number` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '球员数量',
  `player_salarycap` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '球员工资帽',
  `status` int(10) NOT NULL DEFAULT '-1' COMMENT '状态(房间状态-1:创建中;1:报名中;2:已截止;3:已结算;4-取消;0-无效;5-延期状态)',
  `room_name` varchar(128) NOT NULL DEFAULT '' COMMENT '房间名称',
  `copy_room_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '拷贝房间Id',
  `match_insert_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '比赛列表',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `create_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建人id',
  `recommend_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '房间推荐类型',
  `desc` varchar(128) NOT NULL DEFAULT '' COMMENT '描述',
  `odds_call_fun` varchar(64) NOT NULL DEFAULT 'calcSalary3' COMMENT '赔率计算公式',
  PRIMARY KEY (`room_id`),
  KEY `status` (`status`),
  KEY `rule` (`rule`),
  KEY `type` (`type`),
  KEY `bonus` (`bonus`),
  KEY `closed_time` (`closed_time`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_room_rank` */

CREATE TABLE `tbl_room_rank` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '房间id',
  `rank` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排名',
  `player_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '玩家Id',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '玩家得分',
  `total_score` varchar(128) NOT NULL DEFAULT '0' COMMENT '玩家得分+工资',
  `grade` int(11) NOT NULL DEFAULT '0' COMMENT '奖励档次',
  `bonus` int(11) NOT NULL DEFAULT '0' COMMENT '奖励值',
  `upadte_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `room_id` (`room_id`,`player_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_room_rank_detail` */

CREATE TABLE `tbl_room_rank_detail` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `room_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '房间id',
  `rule` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '子规则',
  `player_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '玩家id',
  `match_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '比赛Id',
  `team_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '球队id',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '该规则得分',
  `offset` int(11) NOT NULL DEFAULT '0' COMMENT '偏离值',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_room_recommend` */

CREATE TABLE `tbl_room_recommend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` int(11) NOT NULL DEFAULT '0' COMMENT '房间id',
  `info1` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '描述1',
  `info2` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '描述2',
  `info3` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '描述3',
  `type` smallint(6) NOT NULL DEFAULT '0' COMMENT '类型',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `close_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关闭时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `room_id` (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

/*Table structure for table `tbl_room_users` */

CREATE TABLE `tbl_room_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '房间id',
  `player_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '玩家id',
  `salary` int(11) NOT NULL DEFAULT '0' COMMENT '工资帽',
  `create_ts` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '有效',
  PRIMARY KEY (`id`),
  UNIQUE KEY `room_id` (`room_id`,`player_id`),
  KEY `create_ts` (`create_ts`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_room_users_detail` */

CREATE TABLE `tbl_room_users_detail` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_insert_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '自增张房间id',
  `teamId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '球队id',
  `matchId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '比赛id',
  `salary` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '工资帽',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '竞猜球队得分',
  `obj` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '对象(1-工资,2-进球数)',
  `value` int(10) NOT NULL DEFAULT '0' COMMENT '值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `room_insert_id` (`room_insert_id`,`teamId`,`matchId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;