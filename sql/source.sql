/*
SQLyog Ultimate v11.27 (32 bit)
MySQL - 5.7.17 : Database - test_dfw2_source
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`test_dfw2_source` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `test_dfw2_source`;

/*Table structure for table `dtb_config_bonus` */

CREATE TABLE `dtb_config_bonus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rate` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '获奖人数比例',
  `reward1` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '一档奖金权重',
  `reward2` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '二档奖金权重',
  `reward3` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '三档奖金权重',
  `reward4` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '四档奖金权重',
  `reward_person_type` int(11) NOT NULL DEFAULT '0' COMMENT '奖励人数分档类型',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `dtb_config_bonus` */

insert  into `dtb_config_bonus`(`id`,`rate`,`reward1`,`reward2`,`reward3`,`reward4`,`reward_person_type`,`name`,`desc`) values (1,100,100,0,0,0,1,'冠军全拿','有且只有一位优胜者，可以拿走全部奖金。'),(2,50,35,30,20,15,1,'50%获奖','有一半人可赢得奖金，按排名档次分配奖金。'),(3,20,35,30,20,15,1,'20%获奖','20%参与者可赢得奖金，按排名档次分配奖金。'),(4,50,100,0,0,0,2,'50%获奖,奖金均分','有一半人可赢得奖金，奖金均分。');

/*Table structure for table `dtb_config_rules` */

CREATE TABLE `dtb_config_rules` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `type_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '子分类id',
  `score` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '每项得分',
  `base_score` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '基础分',
  PRIMARY KEY (`id`,`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dtb_config_rules` */

insert  into `dtb_config_rules`(`id`,`type_id`,`score`,`base_score`) values (1,1,100,0),(1,8,90,0),(101,1,100,0),(101,8,90,0),(102,10,100,300),(104,8,1,0),(201,1,100,0),(201,8,1,0);

/*Table structure for table `dtb_config_rules_type` */

CREATE TABLE `dtb_config_rules_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '名称',
  `desc` varchar(128) DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `dtb_config_rules_type` */

insert  into `dtb_config_rules_type`(`id`,`name`,`desc`) values (1,'欧赔','所选球队获胜'),(2,'进球','所选球队至少打进2球'),(3,'角球','所选球队至少获得3个角球'),(4,'先进球','所选球队先进球'),(5,'不失球','所选球队零封对手'),(6,'半全场','所选球队半场&全场结束时领先'),(7,'半场进球','所选球队上下半场均有进球'),(8,'每个进球数','每个进球得分'),(9,'每个角球数','每个角球得分'),(10,'猜进球数','预测进球数与赛果吻合，+300分；预测进球数与赛果偏差1，+200分；预测进球数与赛果偏差2，+100分；');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
