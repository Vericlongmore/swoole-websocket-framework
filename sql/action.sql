/*
SQLyog Ultimate v11.27 (32 bit)
MySQL - 5.7.16-log : Database - db_dfw_action
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `tbl_action_log_14` */

CREATE TABLE `tbl_action_log_14` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL COMMENT '玩家id',
  `action_id` int(11) DEFAULT NULL COMMENT '行为id',
  `extra` varchar(300) DEFAULT '[]' COMMENT '行为扩展',
  `create_ts` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_action_log_15` */

CREATE TABLE `tbl_action_log_15` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL COMMENT '玩家id',
  `action_id` int(11) DEFAULT NULL COMMENT '行为id',
  `extra` varchar(300) DEFAULT '[]' COMMENT '行为扩展',
  `create_ts` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_action_log_18` */

CREATE TABLE `tbl_action_log_18` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL COMMENT '玩家id',
  `action_id` int(11) DEFAULT NULL COMMENT '行为id',
  `extra` varchar(300) DEFAULT '[]' COMMENT '行为扩展',
  `create_ts` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_action_log_19` */

CREATE TABLE `tbl_action_log_19` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL COMMENT '玩家id',
  `action_id` int(11) DEFAULT NULL COMMENT '行为id',
  `extra` varchar(300) DEFAULT '[]' COMMENT '行为扩展',
  `create_ts` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_action_log_201619` */

CREATE TABLE `tbl_action_log_201619` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL COMMENT '玩家id',
  `action_id` int(11) DEFAULT NULL COMMENT '行为id',
  `extra` varchar(300) DEFAULT '[]' COMMENT '行为扩展',
  `create_ts` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_action_log_201620` */

CREATE TABLE `tbl_action_log_201620` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL COMMENT '玩家id',
  `action_id` int(11) DEFAULT NULL COMMENT '行为id',
  `extra` varchar(300) DEFAULT '[]' COMMENT '行为扩展',
  `create_ts` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_action_log_201621` */

CREATE TABLE `tbl_action_log_201621` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL COMMENT '玩家id',
  `action_id` int(11) DEFAULT NULL COMMENT '行为id',
  `extra` varchar(300) DEFAULT '[]' COMMENT '行为扩展',
  `create_ts` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_action_log_201622` */

CREATE TABLE `tbl_action_log_201622` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL COMMENT '玩家id',
  `action_id` int(11) DEFAULT NULL COMMENT '行为id',
  `extra` varchar(300) DEFAULT '[]' COMMENT '行为扩展',
  `create_ts` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_action_log_201623` */

CREATE TABLE `tbl_action_log_201623` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL COMMENT '玩家id',
  `action_id` int(11) DEFAULT NULL COMMENT '行为id',
  `extra` varchar(300) DEFAULT '[]' COMMENT '行为扩展',
  `create_ts` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_action_log_201624` */

CREATE TABLE `tbl_action_log_201624` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL COMMENT '玩家id',
  `action_id` int(11) DEFAULT NULL COMMENT '行为id',
  `extra` varchar(300) DEFAULT '[]' COMMENT '行为扩展',
  `create_ts` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_action_log_201625` */

CREATE TABLE `tbl_action_log_201625` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL COMMENT '玩家id',
  `action_id` int(11) DEFAULT NULL COMMENT '行为id',
  `extra` varchar(300) DEFAULT '[]' COMMENT '行为扩展',
  `create_ts` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_action_log_201626` */

CREATE TABLE `tbl_action_log_201626` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL COMMENT '玩家id',
  `action_id` int(11) DEFAULT NULL COMMENT '行为id',
  `extra` varchar(300) DEFAULT '[]' COMMENT '行为扩展',
  `create_ts` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=675 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_action_log_201627` */

CREATE TABLE `tbl_action_log_201627` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL COMMENT '玩家id',
  `action_id` int(11) DEFAULT NULL COMMENT '行为id',
  `extra` varchar(300) DEFAULT '[]' COMMENT '行为扩展',
  `create_ts` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_action_log_201628` */

CREATE TABLE `tbl_action_log_201628` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL COMMENT '玩家id',
  `action_id` int(11) DEFAULT NULL COMMENT '行为id',
  `extra` varchar(300) DEFAULT '[]' COMMENT '行为扩展',
  `create_ts` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_action_log_201629` */

CREATE TABLE `tbl_action_log_201629` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL COMMENT '玩家id',
  `action_id` int(11) DEFAULT NULL COMMENT '行为id',
  `extra` varchar(300) DEFAULT '[]' COMMENT '行为扩展',
  `create_ts` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_action_log_201630` */

CREATE TABLE `tbl_action_log_201630` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL COMMENT '玩家id',
  `action_id` int(11) DEFAULT NULL COMMENT '行为id',
  `extra` varchar(300) DEFAULT '[]' COMMENT '行为扩展',
  `create_ts` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_action_log_201631` */

CREATE TABLE `tbl_action_log_201631` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL COMMENT '玩家id',
  `action_id` int(11) DEFAULT NULL COMMENT '行为id',
  `extra` varchar(300) DEFAULT '[]' COMMENT '行为扩展',
  `create_ts` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_action_log_201632` */

CREATE TABLE `tbl_action_log_201632` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL COMMENT '玩家id',
  `action_id` int(11) DEFAULT NULL COMMENT '行为id',
  `extra` varchar(300) DEFAULT '[]' COMMENT '行为扩展',
  `create_ts` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_action_log_201633` */

CREATE TABLE `tbl_action_log_201633` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL COMMENT '玩家id',
  `action_id` int(11) DEFAULT NULL COMMENT '行为id',
  `extra` varchar(300) DEFAULT '[]' COMMENT '行为扩展',
  `create_ts` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_action_log_201634` */

CREATE TABLE `tbl_action_log_201634` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL COMMENT '玩家id',
  `action_id` int(11) DEFAULT NULL COMMENT '行为id',
  `extra` varchar(300) DEFAULT '[]' COMMENT '行为扩展',
  `create_ts` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_action_log_201635` */

CREATE TABLE `tbl_action_log_201635` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL COMMENT '玩家id',
  `action_id` int(11) DEFAULT NULL COMMENT '行为id',
  `extra` varchar(300) DEFAULT '[]' COMMENT '行为扩展',
  `create_ts` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_action_log_201636` */

CREATE TABLE `tbl_action_log_201636` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL COMMENT '玩家id',
  `action_id` int(11) DEFAULT NULL COMMENT '行为id',
  `extra` varchar(300) DEFAULT '[]' COMMENT '行为扩展',
  `create_ts` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_action_log_201637` */

CREATE TABLE `tbl_action_log_201637` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL COMMENT '玩家id',
  `action_id` int(11) DEFAULT NULL COMMENT '行为id',
  `extra` varchar(300) DEFAULT '[]' COMMENT '行为扩展',
  `create_ts` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_action_log_201638` */

CREATE TABLE `tbl_action_log_201638` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL COMMENT '玩家id',
  `action_id` int(11) DEFAULT NULL COMMENT '行为id',
  `extra` varchar(300) DEFAULT '[]' COMMENT '行为扩展',
  `create_ts` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_action_log_201639` */

CREATE TABLE `tbl_action_log_201639` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL COMMENT '玩家id',
  `action_id` int(11) DEFAULT NULL COMMENT '行为id',
  `extra` varchar(300) DEFAULT '[]' COMMENT '行为扩展',
  `create_ts` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_action_log_201640` */

CREATE TABLE `tbl_action_log_201640` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL COMMENT '玩家id',
  `action_id` int(11) DEFAULT NULL COMMENT '行为id',
  `extra` varchar(300) DEFAULT '[]' COMMENT '行为扩展',
  `create_ts` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_action_log_201641` */

CREATE TABLE `tbl_action_log_201641` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL COMMENT '玩家id',
  `action_id` int(11) DEFAULT NULL COMMENT '行为id',
  `extra` varchar(300) DEFAULT '[]' COMMENT '行为扩展',
  `create_ts` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_action_log_201642` */

CREATE TABLE `tbl_action_log_201642` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL COMMENT '玩家id',
  `action_id` int(11) DEFAULT NULL COMMENT '行为id',
  `extra` varchar(300) DEFAULT '[]' COMMENT '行为扩展',
  `create_ts` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_action_log_201643` */

CREATE TABLE `tbl_action_log_201643` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL COMMENT '玩家id',
  `action_id` int(11) DEFAULT NULL COMMENT '行为id',
  `extra` varchar(300) DEFAULT '[]' COMMENT '行为扩展',
  `create_ts` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_action_log_201644` */

CREATE TABLE `tbl_action_log_201644` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL COMMENT '玩家id',
  `action_id` int(11) DEFAULT NULL COMMENT '行为id',
  `extra` varchar(300) DEFAULT '[]' COMMENT '行为扩展',
  `create_ts` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_action_log_201645` */

CREATE TABLE `tbl_action_log_201645` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL COMMENT '玩家id',
  `action_id` int(11) DEFAULT NULL COMMENT '行为id',
  `extra` varchar(300) DEFAULT '[]' COMMENT '行为扩展',
  `create_ts` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_action_log_201646` */

CREATE TABLE `tbl_action_log_201646` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL COMMENT '玩家id',
  `action_id` int(11) DEFAULT NULL COMMENT '行为id',
  `extra` varchar(300) DEFAULT '[]' COMMENT '行为扩展',
  `create_ts` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_action_log_201647` */

CREATE TABLE `tbl_action_log_201647` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL COMMENT '玩家id',
  `action_id` int(11) DEFAULT NULL COMMENT '行为id',
  `extra` varchar(300) DEFAULT '[]' COMMENT '行为扩展',
  `create_ts` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_action_log_201648` */

CREATE TABLE `tbl_action_log_201648` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL COMMENT '玩家id',
  `action_id` int(11) DEFAULT NULL COMMENT '行为id',
  `extra` varchar(300) DEFAULT '[]' COMMENT '行为扩展',
  `create_ts` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_action_log_201649` */

CREATE TABLE `tbl_action_log_201649` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL COMMENT '玩家id',
  `action_id` int(11) DEFAULT NULL COMMENT '行为id',
  `extra` varchar(300) DEFAULT '[]' COMMENT '行为扩展',
  `create_ts` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_action_log_201650` */

CREATE TABLE `tbl_action_log_201650` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL COMMENT '玩家id',
  `action_id` int(11) DEFAULT NULL COMMENT '行为id',
  `extra` varchar(300) DEFAULT '[]' COMMENT '行为扩展',
  `create_ts` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_action_log_201651` */

CREATE TABLE `tbl_action_log_201651` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL COMMENT '玩家id',
  `action_id` int(11) DEFAULT NULL COMMENT '行为id',
  `extra` varchar(300) DEFAULT '[]' COMMENT '行为扩展',
  `create_ts` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_action_log_201652` */

CREATE TABLE `tbl_action_log_201652` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL COMMENT '玩家id',
  `action_id` int(11) DEFAULT NULL COMMENT '行为id',
  `extra` varchar(300) DEFAULT '[]' COMMENT '行为扩展',
  `create_ts` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_action_log_201707` */

CREATE TABLE `tbl_action_log_201707` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL COMMENT '玩家id',
  `action_id` int(11) DEFAULT NULL COMMENT '行为id',
  `extra` varchar(300) DEFAULT '[]' COMMENT '行为扩展',
  `create_ts` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_action_log_201708` */

CREATE TABLE `tbl_action_log_201708` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL COMMENT '玩家id',
  `action_id` int(11) DEFAULT NULL COMMENT '行为id',
  `extra` varchar(300) DEFAULT '[]' COMMENT '行为扩展',
  `create_ts` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_action_log_201710` */

CREATE TABLE `tbl_action_log_201710` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL COMMENT '玩家id',
  `action_id` int(11) DEFAULT NULL COMMENT '行为id',
  `extra` varchar(300) DEFAULT '[]' COMMENT '行为扩展',
  `create_ts` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_action_log_201711` */

CREATE TABLE `tbl_action_log_201711` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL COMMENT '玩家id',
  `action_id` int(11) DEFAULT NULL COMMENT '行为id',
  `extra` varchar(300) DEFAULT '[]' COMMENT '行为扩展',
  `create_ts` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_action_log_201712` */

CREATE TABLE `tbl_action_log_201712` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL COMMENT '玩家id',
  `action_id` int(11) DEFAULT NULL COMMENT '行为id',
  `extra` varchar(300) DEFAULT '[]' COMMENT '行为扩展',
  `create_ts` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_action_log_201713` */

CREATE TABLE `tbl_action_log_201713` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL COMMENT '玩家id',
  `action_id` int(11) DEFAULT NULL COMMENT '行为id',
  `extra` varchar(300) DEFAULT '[]' COMMENT '行为扩展',
  `create_ts` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
