/*
SQLyog Ultimate v11.27 (32 bit)
MySQL - 5.6.34 : Database - test_dfw2_admin
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`test_dfw2_admin` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `test_dfw2_admin`;

/*Table structure for table `tbl_action` */

CREATE TABLE `tbl_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text COMMENT '行为规则',
  `log` text COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表';

/*Data for the table `tbl_action` */

insert  into `tbl_action`(`id`,`name`,`title`,`remark`,`rule`,`log`,`type`,`status`,`update_time`) values (1,'user_login','用户登录','积分+10，每天一次','table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;','[user|get_nickname]在[time|time_format]登录了后台',1,1,1387181220),(2,'add_article','发布文章','积分+5，每天上限5次','table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5','',2,0,1380173180),(3,'review','评论','评论积分+1，无限制','table:member|field:score|condition:uid={$self}|rule:score+1','',2,1,1383285646),(4,'add_document','发表文档','积分+10，每天上限5次','table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5','[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。',2,0,1386139726),(5,'add_document_topic','发表讨论','积分+5，每天上限10次','table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10','',2,0,1383285551),(6,'update_config','更新配置','新增或修改或删除配置','','',1,1,1383294988),(7,'update_model','更新模型','新增或修改模型','','',1,1,1383295057),(8,'update_attribute','更新属性','新增或更新或删除属性','','',1,1,1383295963),(9,'update_channel','更新导航','新增或修改或删除导航','','',1,1,1383296301),(10,'update_menu','更新菜单','新增或修改或删除菜单','','',1,1,1383296392),(11,'update_category','更新分类','新增或修改或删除分类','','',1,1,1383296765);

/*Table structure for table `tbl_action_log` */

CREATE TABLE `tbl_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户名字',
  `action_ip` varchar(20) NOT NULL COMMENT '执行行为者ip',
  `method` varchar(50) DEFAULT NULL COMMENT '执行方法',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='行为日志表';

/*Data for the table `tbl_action_log` */

insert  into `tbl_action_log`(`id`,`action_id`,`user_id`,`user_name`,`action_ip`,`method`,`model`,`record_id`,`remark`,`status`,`create_time`) values (1,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=162',1,1493032213),(2,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=163',1,1493032213),(3,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=164',1,1493032213),(4,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=165',1,1493032213),(5,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=166',1,1493032213),(6,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=167',1,1493103399),(7,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=168',1,1493103399),(8,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=169',1,1493103399),(9,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=170',1,1493103399),(10,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=171',1,1493103399),(11,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=172',1,1493105795),(12,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=173',1,1493105795),(13,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=174',1,1493105795),(14,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=175',1,1493105795),(15,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=176',1,1493105795),(16,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=178',1,1493200163),(17,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=179',1,1493200163),(18,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=180',1,1493200163),(19,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=181',1,1493200163),(20,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=182',1,1493200163),(21,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=183',1,1493200163),(22,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=184',1,1493200163),(23,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=185',1,1493200163),(24,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=186',1,1493285443),(25,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=187',1,1493285443),(26,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=188',1,1493285443),(27,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=189',1,1493285443),(28,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=190',1,1493285443),(29,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_recommend的一行id=165',1,1493285858),(30,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_recommend的一行id=166',1,1493285858),(31,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_recommend的一行id=167',1,1493285858),(32,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_recommend的一行id=168',1,1493285858),(33,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_recommend的一行id=169',1,1493285858),(34,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_recommend的一行id=170',1,1493285858),(35,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=192',1,1493346903),(36,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=193',1,1493346903),(37,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=194',1,1493346903),(38,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=195',1,1493346903),(39,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=196',1,1493346903),(40,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=197',1,1493347163),(41,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=198',1,1493347163),(42,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=199',1,1493347163),(43,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=200',1,1493347163),(44,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=201',1,1493347163),(45,0,1,'admin','101.81.227.23','AbstractController::_save','',0,'修改了表tbl_room_recommend的一行id=168',1,1493364794),(46,0,1,'admin','101.81.227.23','AbstractController::_save','',0,'修改了表tbl_room_recommend的一行id=169',1,1493364805),(47,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=202',1,1493364844),(48,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=203',1,1493364844),(49,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=204',1,1493364844),(50,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=205',1,1493364844),(51,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=206',1,1493364844),(52,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=207',1,1493364844),(53,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=208',1,1493364844),(54,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=209',1,1493364844),(55,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=210',1,1493364844),(56,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=211',1,1493364844),(57,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_recommend的一行id=171',1,1493364907),(58,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_recommend的一行id=172',1,1493364907),(59,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_recommend的一行id=173',1,1493364907),(60,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_recommend的一行id=174',1,1493364907),(61,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_recommend的一行id=175',1,1493364907),(62,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_recommend的一行id=176',1,1493364907),(63,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_recommend的一行id=177',1,1493364907),(64,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_recommend的一行id=178',1,1493364907),(65,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_recommend的一行id=179',1,1493364907),(66,0,1,'admin','101.81.227.23','AbstractController::_insert','',0,'添加了表tbl_room_recommend的一行id=180',1,1493364907),(67,0,1,'admin','101.81.227.23','AbstractController::_save','',0,'修改了表tbl_room_list的一行room_id=211',1,1493375206),(68,0,1,'admin','101.81.227.23','AbstractController::_save','',0,'修改了表tbl_room_list的一行room_id=209',1,1493375211),(69,0,1,'admin','101.81.227.23','AbstractController::_save','',0,'修改了表tbl_room_list的一行room_id=207',1,1493375216),(70,0,1,'admin','101.81.227.23','AbstractController::_save','',0,'修改了表tbl_room_list的一行room_id=206',1,1493375221),(71,0,1,'admin','101.81.227.23','AbstractController::_save','',0,'修改了表tbl_room_list的一行room_id=205',1,1493375226),(72,0,1,'admin','101.81.227.23','AbstractController::_save','',0,'修改了表tbl_room_list的一行room_id=203',1,1493375236),(73,0,1,'admin','101.81.227.23','AbstractController::_save','',0,'修改了表tbl_room_list的一行room_id=201',1,1493375249),(74,0,1,'admin','101.81.227.23','AbstractController::_save','',0,'修改了表tbl_room_list的一行room_id=197',1,1493375256),(75,0,1,'admin','101.81.227.23','AbstractController::_save','',0,'修改了表tbl_room_list的一行room_id=189',1,1493375271),(76,0,1,'admin','101.81.227.23','AbstractController::_save','',0,'修改了表tbl_room_list的一行room_id=188',1,1493375278),(77,0,1,'admin','101.81.227.23','AbstractController::_save','',0,'修改了表tbl_room_list的一行room_id=187',1,1493375288),(78,0,1,'admin','122.84.90.71','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=214',1,1493607724),(79,0,1,'admin','122.84.90.71','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=215',1,1493607724),(80,0,1,'admin','122.84.90.71','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=216',1,1493607724),(81,0,1,'admin','122.84.90.71','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=217',1,1493607724),(82,0,1,'admin','122.84.90.71','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=218',1,1493607724),(83,0,1,'admin','122.84.90.71','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=219',1,1493607724),(84,0,1,'admin','122.84.90.71','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=220',1,1493607724),(85,0,1,'admin','122.84.90.71','AbstractController::_insert','',0,'添加了表tbl_room_recommend的一行id=181',1,1493607993),(86,0,1,'admin','122.84.90.71','AbstractController::_insert','',0,'添加了表tbl_room_recommend的一行id=182',1,1493607993),(87,0,1,'admin','122.84.90.71','AbstractController::_insert','',0,'添加了表tbl_room_recommend的一行id=183',1,1493607993),(88,0,1,'admin','122.84.90.71','AbstractController::_insert','',0,'添加了表tbl_room_recommend的一行id=184',1,1493607993),(89,0,1,'admin','122.84.90.71','AbstractController::_insert','',0,'添加了表tbl_room_recommend的一行id=185',1,1493607993),(90,0,1,'admin','116.231.54.53','AbstractController::_save','',0,'修改了表tbl_room_list的一行room_id=220',1,1493691496),(91,0,1,'admin','116.231.54.53','AbstractController::_save','',0,'修改了表tbl_room_list的一行room_id=219',1,1493691581),(92,0,1,'admin','116.231.54.53','AbstractController::_save','',0,'修改了表tbl_room_list的一行room_id=216',1,1493691626),(93,0,1,'admin','116.231.54.53','AbstractController::_save','',0,'修改了表tbl_room_list的一行room_id=218',1,1493691647),(94,0,1,'admin','116.231.54.53','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=221',1,1493691919),(95,0,1,'admin','116.231.54.53','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=222',1,1493692138),(96,0,1,'admin','116.231.54.53','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=223',1,1493692226),(97,0,1,'admin','116.231.54.53','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=224',1,1493692685),(98,0,1,'admin','116.231.54.53','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=225',1,1493692822),(99,0,1,'admin','116.231.54.53','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=226',1,1493692926),(100,0,1,'admin','116.231.54.53','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=227',1,1493693128),(101,0,1,'admin','116.231.54.53','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=228',1,1493693135),(102,0,1,'admin','116.231.54.53','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=229',1,1493693274),(103,0,1,'admin','116.231.54.53','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=230',1,1493693362),(104,0,1,'admin','116.231.54.53','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=231',1,1493693509),(105,0,1,'admin','116.231.54.53','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=232',1,1493693517),(106,0,1,'admin','116.231.54.53','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=233',1,1493693517),(107,0,1,'admin','116.231.54.53','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=234',1,1493693555),(108,0,1,'admin','116.231.54.53','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=235',1,1493693555),(109,0,1,'admin','116.231.54.53','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=236',1,1493693615),(110,0,1,'admin','116.231.54.53','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=237',1,1493693615),(111,0,1,'admin','116.231.54.53','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=238',1,1493693615),(112,0,1,'admin','116.231.54.53','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=239',1,1493693615),(113,0,1,'admin','116.231.54.53','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=240',1,1493693615),(114,0,1,'admin','116.231.54.53','AbstractController::_insert','',0,'添加了表tbl_room_recommend的一行id=186',1,1493693895),(115,0,1,'admin','116.231.54.53','AbstractController::_insert','',0,'添加了表tbl_room_recommend的一行id=187',1,1493693895),(116,0,1,'admin','116.231.54.53','AbstractController::_insert','',0,'添加了表tbl_room_recommend的一行id=188',1,1493693895),(117,0,1,'admin','116.231.54.53','AbstractController::_insert','',0,'添加了表tbl_room_recommend的一行id=189',1,1493693895),(118,0,1,'admin','116.231.54.53','AbstractController::_insert','',0,'添加了表tbl_room_recommend的一行id=190',1,1493693895),(119,0,1,'admin','116.231.54.53','AbstractController::_save','',0,'修改了表tbl_room_list的一行room_id=231',1,1493693949),(120,0,1,'admin','116.231.54.53','AbstractController::_save','',0,'修改了表tbl_room_recommend的一行id=190',1,1493694019),(121,0,1,'admin','116.231.54.53','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=241',1,1493717362),(122,0,1,'admin','116.231.54.53','AbstractController::_save','',0,'修改了表tbl_room_list的一行room_id=241',1,1493717372),(123,0,1,'admin','116.231.54.53','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=242',1,1493720263),(124,0,1,'admin','116.231.54.53','AbstractController::_save','',0,'修改了表tbl_room_list的一行room_id=242',1,1493720274),(125,0,1,'admin','116.231.54.53','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=243',1,1493777896),(126,0,1,'admin','116.231.54.53','AbstractController::_insert','',0,'添加了表tbl_room_list的一行room_id=244',1,1493777926),(127,0,1,'admin','116.231.54.53','AbstractController::_save','',0,'修改了表tbl_room_list的一行room_id=243',1,1493777971);

/*Table structure for table `tbl_addons` */

CREATE TABLE `tbl_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='插件表';

/*Data for the table `tbl_addons` */

insert  into `tbl_addons`(`id`,`name`,`title`,`description`,`status`,`config`,`author`,`version`,`create_time`,`has_adminlist`) values (4,'SystemInfo','系统环境信息','用于显示一些服务器的信息',1,'{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"2\",\"display\":\"1\"}','thinkphp','0.1',1379512036,0),(5,'Editor','前台编辑器','用于增强整站长文本的输入和显示',1,'{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"300px\",\"editor_resize_type\":\"1\"}','thinkphp','0.1',1379830910,0),(6,'Attachment','附件','用于文档模型上传附件',1,'null','thinkphp','0.1',1379842319,1),(15,'EditorForAdmin','后台编辑器','用于增强整站长文本的输入和显示',1,'{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"500px\",\"editor_resize_type\":\"1\"}','thinkphp','0.1',1383126253,0),(16,'SiteStat','站点统计信息','统计站点的基础信息',1,'{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"2\",\"display\":\"1\"}','thinkphp','0.1',1460106356,0);

/*Table structure for table `tbl_attachment` */

CREATE TABLE `tbl_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='附件表';

/*Data for the table `tbl_attachment` */

/*Table structure for table `tbl_attribute` */

CREATE TABLE `tbl_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL DEFAULT '',
  `validate_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `error_info` varchar(100) NOT NULL DEFAULT '',
  `validate_type` varchar(25) NOT NULL DEFAULT '',
  `auto_rule` varchar(100) NOT NULL DEFAULT '',
  `auto_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `auto_type` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='模型属性表';

/*Data for the table `tbl_attribute` */

insert  into `tbl_attribute`(`id`,`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) values (1,'uid','用户ID','int(10) unsigned NOT NULL ','num','0','',0,'',1,0,1,1384508362,1383891233,'',0,'','','',0,''),(2,'name','标识','char(40) NOT NULL ','string','','同一根节点下标识不重复',1,'',1,0,1,1383894743,1383891233,'',0,'','','',0,''),(3,'title','标题','char(80) NOT NULL ','string','','文档标题',1,'',1,0,1,1383894778,1383891233,'',0,'','','',0,''),(4,'category_id','所属分类','int(10) unsigned NOT NULL ','string','','',0,'',1,0,1,1384508336,1383891233,'',0,'','','',0,''),(5,'description','描述','char(140) NOT NULL ','textarea','','',1,'',1,0,1,1383894927,1383891233,'',0,'','','',0,''),(6,'root','根节点','int(10) unsigned NOT NULL ','num','0','该文档的顶级文档编号',0,'',1,0,1,1384508323,1383891233,'',0,'','','',0,''),(7,'pid','所属ID','int(10) unsigned NOT NULL ','num','0','父文档编号',0,'',1,0,1,1384508543,1383891233,'',0,'','','',0,''),(8,'model_id','内容模型ID','tinyint(3) unsigned NOT NULL ','num','0','该文档所对应的模型',0,'',1,0,1,1384508350,1383891233,'',0,'','','',0,''),(9,'type','内容类型','tinyint(3) unsigned NOT NULL ','select','2','',1,'1:目录\r\n2:主题\r\n3:段落',1,0,1,1384511157,1383891233,'',0,'','','',0,''),(10,'position','推荐位','smallint(5) unsigned NOT NULL ','checkbox','0','多个推荐则将其推荐值相加',1,'[DOCUMENT_POSITION]',1,0,1,1383895640,1383891233,'',0,'','','',0,''),(11,'link_id','外链','int(10) unsigned NOT NULL ','num','0','0-非外链，大于0-外链ID,需要函数进行链接与编号的转换',1,'',1,0,1,1383895757,1383891233,'',0,'','','',0,''),(12,'cover_id','封面','int(10) unsigned NOT NULL ','picture','0','0-无封面，大于0-封面图片ID，需要函数处理',1,'',1,0,1,1384147827,1383891233,'',0,'','','',0,''),(13,'display','可见性','tinyint(3) unsigned NOT NULL ','radio','1','',1,'0:不可见\r\n1:所有人可见',1,0,1,1386662271,1383891233,'',0,'','regex','',0,'function'),(14,'deadline','截至时间','int(10) unsigned NOT NULL ','datetime','0','0-永久有效',1,'',1,0,1,1387163248,1383891233,'',0,'','regex','',0,'function'),(15,'attach','附件数量','tinyint(3) unsigned NOT NULL ','num','0','',0,'',1,0,1,1387260355,1383891233,'',0,'','regex','',0,'function'),(16,'view','浏览量','int(10) unsigned NOT NULL ','num','0','',1,'',1,0,1,1383895835,1383891233,'',0,'','','',0,''),(17,'comment','评论数','int(10) unsigned NOT NULL ','num','0','',1,'',1,0,1,1383895846,1383891233,'',0,'','','',0,''),(18,'extend','扩展统计字段','int(10) unsigned NOT NULL ','num','0','根据需求自行使用',0,'',1,0,1,1384508264,1383891233,'',0,'','','',0,''),(19,'level','优先级','int(10) unsigned NOT NULL ','num','0','越高排序越靠前',1,'',1,0,1,1383895894,1383891233,'',0,'','','',0,''),(20,'create_time','创建时间','int(10) unsigned NOT NULL ','datetime','0','',1,'',1,0,1,1383895903,1383891233,'',0,'','','',0,''),(21,'update_time','更新时间','int(10) unsigned NOT NULL ','datetime','0','',0,'',1,0,1,1384508277,1383891233,'',0,'','','',0,''),(22,'status','数据状态','tinyint(4) NOT NULL ','radio','0','',0,'-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿',1,0,1,1384508496,1383891233,'',0,'','','',0,''),(23,'parse','内容解析类型','tinyint(3) unsigned NOT NULL ','select','0','',0,'0:html\r\n1:ubb\r\n2:markdown',2,0,1,1384511049,1383891243,'',0,'','','',0,''),(24,'content','文章内容','text NOT NULL ','editor','','',1,'',2,0,1,1383896225,1383891243,'',0,'','','',0,''),(25,'template','详情页显示模板','varchar(100) NOT NULL ','string','','参照display方法参数的定义',1,'',2,0,1,1383896190,1383891243,'',0,'','','',0,''),(26,'bookmark','收藏数','int(10) unsigned NOT NULL ','num','0','',1,'',2,0,1,1383896103,1383891243,'',0,'','','',0,''),(27,'parse','内容解析类型','tinyint(3) unsigned NOT NULL ','select','0','',0,'0:html\r\n1:ubb\r\n2:markdown',3,0,1,1387260461,1383891252,'',0,'','regex','',0,'function'),(28,'content','下载详细描述','text NOT NULL ','editor','','',1,'',3,0,1,1383896438,1383891252,'',0,'','','',0,''),(29,'template','详情页显示模板','varchar(100) NOT NULL ','string','','',1,'',3,0,1,1383896429,1383891252,'',0,'','','',0,''),(30,'file_id','文件ID','int(10) unsigned NOT NULL ','file','0','需要函数处理',1,'',3,0,1,1383896415,1383891252,'',0,'','','',0,''),(31,'download','下载次数','int(10) unsigned NOT NULL ','num','0','',1,'',3,0,1,1383896380,1383891252,'',0,'','','',0,''),(32,'size','文件大小','bigint(20) unsigned NOT NULL ','num','0','单位bit',1,'',3,0,1,1383896371,1383891252,'',0,'','','',0,'');

/*Table structure for table `tbl_auth_extend` */

CREATE TABLE `tbl_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户组与分类的对应关系表';

/*Data for the table `tbl_auth_extend` */

insert  into `tbl_auth_extend`(`group_id`,`extend_id`,`type`) values (1,1,1),(1,1,2),(1,2,1),(1,2,2),(1,3,1),(1,3,2),(1,4,1),(1,37,1);

/*Table structure for table `tbl_auth_group` */

CREATE TABLE `tbl_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL DEFAULT '' COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` text NOT NULL COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tbl_auth_group` */

insert  into `tbl_auth_group`(`id`,`module`,`type`,`title`,`description`,`status`,`rules`) values (1,'admin',1,'超级管理员','获得整站全部功能的授权',1,'1,3,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,88,94,95,219,220,244,245,334,335,336,337,338,339,340,345,346,347,348,349'),(2,'admin',1,'游客','只能查看每个模块的日志',-1,'219,220,334,334,335,336,337,338'),(3,'admin',1,'内容管理','游戏内容管理，不能对后台管理用户进行操作',-1,'1,107,108,109,110,195,219,220,223,225,235,239,244,245,247,248,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,282,283,284,285,286,287,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,311,312,313,314,315,316,334,335,336,337,338'),(4,'admin',1,'数据','',-1,'1,220,223,239,251,255,256,259,261,262,263,264,265,266,280,282,283,287,298,299,302,334,335,336,337,338'),(5,'admin',1,'财务审核','',-1,'1'),(6,'admin',1,'管理员','',1,'1,219,220,244,245,334,335,336,337,338,339,340,345,346,347,348,349');

/*Table structure for table `tbl_auth_group_access` */

CREATE TABLE `tbl_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tbl_auth_group_access` */

insert  into `tbl_auth_group_access`(`uid`,`group_id`) values (1,1),(6,1),(9,1),(10,1),(11,1),(14,1),(17,1),(2,2),(17,2),(3,3),(4,3),(5,3),(6,3),(7,3),(8,3),(12,3),(16,3),(17,3),(13,4),(14,4),(15,5),(13,6),(19,6);

/*Table structure for table `tbl_auth_rule` */

CREATE TABLE `tbl_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=350 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tbl_auth_rule` */

insert  into `tbl_auth_rule`(`id`,`module`,`type`,`name`,`title`,`status`,`condition`) values (1,'admin',2,'Admin/Index/index','首页',1,''),(2,'admin',2,'Admin/Article/index','内容',-1,''),(3,'admin',2,'Admin/User/index','用户',1,''),(4,'admin',2,'Admin/Addons/index','扩展',-1,''),(5,'admin',2,'Admin/Config/group','系统',-1,''),(7,'admin',1,'Admin/article/add','新增',1,''),(8,'admin',1,'Admin/article/edit','编辑',1,''),(9,'admin',1,'Admin/article/setStatus','改变状态',1,''),(10,'admin',1,'Admin/article/update','保存',1,''),(11,'admin',1,'Admin/article/autoSave','保存草稿',1,''),(12,'admin',1,'Admin/article/move','移动',1,''),(13,'admin',1,'Admin/article/copy','复制',1,''),(14,'admin',1,'Admin/article/paste','粘贴',1,''),(15,'admin',1,'Admin/article/permit','还原',1,''),(16,'admin',1,'Admin/article/clear','清空',1,''),(17,'admin',1,'Admin/Article/examine','审核列表',-1,''),(18,'admin',1,'Admin/article/recycle','回收站',1,''),(19,'admin',1,'Admin/User/addaction','新增用户行为',1,''),(20,'admin',1,'Admin/User/editaction','编辑用户行为',1,''),(21,'admin',1,'Admin/User/saveAction','保存用户行为',1,''),(22,'admin',1,'Admin/User/setStatus','变更行为状态',1,''),(23,'admin',1,'Admin/User/changeStatus?method=forbidUser','禁用会员',1,''),(24,'admin',1,'Admin/User/changeStatus?method=resumeUser','启用会员',1,''),(25,'admin',1,'Admin/User/changeStatus?method=deleteUser','删除会员',1,''),(26,'admin',1,'Admin/User/index','用户信息',1,''),(27,'admin',1,'Admin/User/action','用户行为',1,''),(28,'admin',1,'Admin/AuthManager/changeStatus?method=deleteGroup','删除',1,''),(29,'admin',1,'Admin/AuthManager/changeStatus?method=forbidGroup','禁用',1,''),(30,'admin',1,'Admin/AuthManager/changeStatus?method=resumeGroup','恢复',1,''),(31,'admin',1,'Admin/AuthManager/createGroup','新增',1,''),(32,'admin',1,'Admin/AuthManager/editGroup','编辑',1,''),(33,'admin',1,'Admin/AuthManager/writeGroup','保存用户组',1,''),(34,'admin',1,'Admin/AuthManager/group','授权',1,''),(35,'admin',1,'Admin/AuthManager/access','访问授权',1,''),(36,'admin',1,'Admin/AuthManager/user','成员授权',1,''),(37,'admin',1,'Admin/AuthManager/removeFromGroup','解除授权',1,''),(38,'admin',1,'Admin/AuthManager/addToGroup','保存成员授权',1,''),(39,'admin',1,'Admin/AuthManager/category','分类授权',1,''),(40,'admin',1,'Admin/AuthManager/addToCategory','保存分类授权',1,''),(41,'admin',1,'Admin/AuthManager/index','权限管理',1,''),(42,'admin',1,'Admin/Addons/create','创建',1,''),(43,'admin',1,'Admin/Addons/checkForm','检测创建',1,''),(44,'admin',1,'Admin/Addons/preview','预览',1,''),(45,'admin',1,'Admin/Addons/build','快速生成插件',1,''),(46,'admin',1,'Admin/Addons/config','设置',1,''),(47,'admin',1,'Admin/Addons/disable','禁用',1,''),(48,'admin',1,'Admin/Addons/enable','启用',1,''),(49,'admin',1,'Admin/Addons/install','安装',1,''),(50,'admin',1,'Admin/Addons/uninstall','卸载',1,''),(51,'admin',1,'Admin/Addons/saveconfig','更新配置',1,''),(52,'admin',1,'Admin/Addons/adminList','插件后台列表',1,''),(53,'admin',1,'Admin/Addons/execute','URL方式访问插件',1,''),(54,'admin',1,'Admin/Addons/index','插件管理',-1,''),(55,'admin',1,'Admin/Addons/hooks','钩子管理',-1,''),(56,'admin',1,'Admin/model/add','新增',1,''),(57,'admin',1,'Admin/model/edit','编辑',1,''),(58,'admin',1,'Admin/model/setStatus','改变状态',1,''),(59,'admin',1,'Admin/model/update','保存数据',1,''),(60,'admin',1,'Admin/Model/index','模型管理',1,''),(61,'admin',1,'Admin/Config/edit','编辑',-1,''),(62,'admin',1,'Admin/Config/del','删除',-1,''),(63,'admin',1,'Admin/Config/add','新增',-1,''),(64,'admin',1,'Admin/Config/save','保存',-1,''),(65,'admin',1,'Admin/Config/group','网站设置',-1,''),(66,'admin',1,'Admin/Config/index','配置管理',-1,''),(67,'admin',1,'Admin/Channel/add','新增',-1,''),(68,'admin',1,'Admin/Channel/edit','编辑',-1,''),(69,'admin',1,'Admin/Channel/del','删除',-1,''),(70,'admin',1,'Admin/Channel/index','导航管理',-1,''),(71,'admin',1,'Admin/Category/edit','编辑',-1,''),(72,'admin',1,'Admin/Category/add','新增',-1,''),(73,'admin',1,'Admin/Category/remove','删除',-1,''),(74,'admin',1,'Admin/Category/index','分类管理',-1,''),(75,'admin',1,'Admin/file/upload','上传控件',-1,''),(76,'admin',1,'Admin/file/uploadPicture','上传图片',-1,''),(77,'admin',1,'Admin/file/download','下载',-1,''),(79,'admin',1,'Admin/article/batchOperate','导入',1,''),(80,'admin',1,'Admin/Database/index?type=export','备份数据库',-1,''),(81,'admin',1,'Admin/Database/index?type=import','还原数据库',-1,''),(82,'admin',1,'Admin/Database/export','备份',-1,''),(83,'admin',1,'Admin/Database/optimize','优化表',-1,''),(84,'admin',1,'Admin/Database/repair','修复表',-1,''),(86,'admin',1,'Admin/Database/import','恢复',-1,''),(87,'admin',1,'Admin/Database/del','删除',-1,''),(88,'admin',1,'Admin/User/add','新增用户',1,''),(89,'admin',1,'Admin/Attribute/index','属性管理',1,''),(90,'admin',1,'Admin/Attribute/add','新增',1,''),(91,'admin',1,'Admin/Attribute/edit','编辑',1,''),(92,'admin',1,'Admin/Attribute/setStatus','改变状态',1,''),(93,'admin',1,'Admin/Attribute/update','保存数据',1,''),(94,'admin',1,'Admin/AuthManager/modelauth','模型授权',1,''),(95,'admin',1,'Admin/AuthManager/addToModel','保存模型授权',1,''),(96,'admin',1,'Admin/Category/move','移动',-1,''),(97,'admin',1,'Admin/Category/merge','合并',-1,''),(98,'admin',1,'Admin/Config/menu','后台菜单管理',-1,''),(99,'admin',1,'Admin/Article/mydocument','内容',-1,''),(100,'admin',1,'Admin/Menu/index','菜单管理',-1,''),(101,'admin',1,'Admin/other','其他',-1,''),(102,'admin',1,'Admin/Menu/add','新增',-1,''),(103,'admin',1,'Admin/Menu/edit','编辑',-1,''),(104,'admin',1,'Admin/Think/lists?model=article','文章管理',-1,''),(105,'admin',1,'Admin/Think/lists?model=download','下载管理',-1,''),(106,'admin',1,'Admin/Think/lists?model=config','配置管理',-1,''),(107,'admin',1,'Admin/Action/actionlog','行为日志',-1,''),(108,'admin',1,'Admin/User/updatePassword','修改密码',-1,''),(109,'admin',1,'Admin/User/updateNickname','修改昵称',-1,''),(110,'admin',1,'Admin/action/edit','查看行为日志',-1,''),(111,'admin',2,'Admin/article/index','文档列表',-1,''),(112,'admin',2,'Admin/article/add','新增',-1,''),(113,'admin',2,'Admin/article/edit','编辑',-1,''),(114,'admin',2,'Admin/article/setStatus','改变状态',-1,''),(115,'admin',2,'Admin/article/update','保存',-1,''),(116,'admin',2,'Admin/article/autoSave','保存草稿',-1,''),(117,'admin',2,'Admin/article/move','移动',-1,''),(118,'admin',2,'Admin/article/copy','复制',-1,''),(119,'admin',2,'Admin/article/paste','粘贴',-1,''),(120,'admin',2,'Admin/article/batchOperate','导入',-1,''),(121,'admin',2,'Admin/article/recycle','回收站',-1,''),(122,'admin',2,'Admin/article/permit','还原',-1,''),(123,'admin',2,'Admin/article/clear','清空',-1,''),(124,'admin',2,'Admin/User/add','新增用户',-1,''),(125,'admin',2,'Admin/User/action','用户行为',-1,''),(126,'admin',2,'Admin/User/addAction','新增用户行为',-1,''),(127,'admin',2,'Admin/User/editAction','编辑用户行为',-1,''),(128,'admin',2,'Admin/User/saveAction','保存用户行为',-1,''),(129,'admin',2,'Admin/User/setStatus','变更行为状态',-1,''),(130,'admin',2,'Admin/User/changeStatus?method=forbidUser','禁用会员',-1,''),(131,'admin',2,'Admin/User/changeStatus?method=resumeUser','启用会员',-1,''),(132,'admin',2,'Admin/User/changeStatus?method=deleteUser','删除会员',-1,''),(133,'admin',2,'Admin/AuthManager/index','权限管理',-1,''),(134,'admin',2,'Admin/AuthManager/changeStatus?method=deleteGroup','删除',-1,''),(135,'admin',2,'Admin/AuthManager/changeStatus?method=forbidGroup','禁用',-1,''),(136,'admin',2,'Admin/AuthManager/changeStatus?method=resumeGroup','恢复',-1,''),(137,'admin',2,'Admin/AuthManager/createGroup','新增',-1,''),(138,'admin',2,'Admin/AuthManager/editGroup','编辑',-1,''),(139,'admin',2,'Admin/AuthManager/writeGroup','保存用户组',-1,''),(140,'admin',2,'Admin/AuthManager/group','授权',-1,''),(141,'admin',2,'Admin/AuthManager/access','访问授权',-1,''),(142,'admin',2,'Admin/AuthManager/user','成员授权',-1,''),(143,'admin',2,'Admin/AuthManager/removeFromGroup','解除授权',-1,''),(144,'admin',2,'Admin/AuthManager/addToGroup','保存成员授权',-1,''),(145,'admin',2,'Admin/AuthManager/category','分类授权',-1,''),(146,'admin',2,'Admin/AuthManager/addToCategory','保存分类授权',-1,''),(147,'admin',2,'Admin/AuthManager/modelauth','模型授权',-1,''),(148,'admin',2,'Admin/AuthManager/addToModel','保存模型授权',-1,''),(149,'admin',2,'Admin/Addons/create','创建',-1,''),(150,'admin',2,'Admin/Addons/checkForm','检测创建',-1,''),(151,'admin',2,'Admin/Addons/preview','预览',-1,''),(152,'admin',2,'Admin/Addons/build','快速生成插件',-1,''),(153,'admin',2,'Admin/Addons/config','设置',-1,''),(154,'admin',2,'Admin/Addons/disable','禁用',-1,''),(155,'admin',2,'Admin/Addons/enable','启用',-1,''),(156,'admin',2,'Admin/Addons/install','安装',-1,''),(157,'admin',2,'Admin/Addons/uninstall','卸载',-1,''),(158,'admin',2,'Admin/Addons/saveconfig','更新配置',-1,''),(159,'admin',2,'Admin/Addons/adminList','插件后台列表',-1,''),(160,'admin',2,'Admin/Addons/execute','URL方式访问插件',-1,''),(161,'admin',2,'Admin/Addons/hooks','钩子管理',-1,''),(162,'admin',2,'Admin/Model/index','模型管理',-1,''),(163,'admin',2,'Admin/model/add','新增',-1,''),(164,'admin',2,'Admin/model/edit','编辑',-1,''),(165,'admin',2,'Admin/model/setStatus','改变状态',-1,''),(166,'admin',2,'Admin/model/update','保存数据',-1,''),(167,'admin',2,'Admin/Attribute/index','属性管理',-1,''),(168,'admin',2,'Admin/Attribute/add','新增',-1,''),(169,'admin',2,'Admin/Attribute/edit','编辑',-1,''),(170,'admin',2,'Admin/Attribute/setStatus','改变状态',-1,''),(171,'admin',2,'Admin/Attribute/update','保存数据',-1,''),(172,'admin',2,'Admin/Config/index','配置管理',-1,''),(173,'admin',2,'Admin/Config/edit','编辑',-1,''),(174,'admin',2,'Admin/Config/del','删除',-1,''),(175,'admin',2,'Admin/Config/add','新增',-1,''),(176,'admin',2,'Admin/Config/save','保存',-1,''),(177,'admin',2,'Admin/Menu/index','菜单管理',-1,''),(178,'admin',2,'Admin/Channel/index','导航管理',-1,''),(179,'admin',2,'Admin/Channel/add','新增',-1,''),(180,'admin',2,'Admin/Channel/edit','编辑',-1,''),(181,'admin',2,'Admin/Channel/del','删除',-1,''),(182,'admin',2,'Admin/Category/index','分类管理',-1,''),(183,'admin',2,'Admin/Category/edit','编辑',-1,''),(184,'admin',2,'Admin/Category/add','新增',-1,''),(185,'admin',2,'Admin/Category/remove','删除',-1,''),(186,'admin',2,'Admin/Category/move','移动',-1,''),(187,'admin',2,'Admin/Category/merge','合并',-1,''),(188,'admin',2,'Admin/Database/index?type=export','备份数据库',-1,''),(189,'admin',2,'Admin/Database/export','备份',-1,''),(190,'admin',2,'Admin/Database/optimize','优化表',-1,''),(191,'admin',2,'Admin/Database/repair','修复表',-1,''),(192,'admin',2,'Admin/Database/index?type=import','还原数据库',-1,''),(193,'admin',2,'Admin/Database/import','恢复',-1,''),(194,'admin',2,'Admin/Database/del','删除',-1,''),(195,'admin',2,'Admin/other','其他',-1,''),(196,'admin',2,'Admin/Menu/add','新增',-1,''),(197,'admin',2,'Admin/Menu/edit','编辑',-1,''),(198,'admin',2,'Admin/Think/lists?model=article','应用',-1,''),(199,'admin',2,'Admin/Think/lists?model=download','下载管理',-1,''),(200,'admin',2,'Admin/Think/lists?model=config','应用',-1,''),(201,'admin',2,'Admin/Action/actionlog','行为日志',-1,''),(202,'admin',2,'Admin/User/updatePassword','修改密码',-1,''),(203,'admin',2,'Admin/User/updateNickname','修改昵称',-1,''),(204,'admin',2,'Admin/action/edit','查看行为日志',-1,''),(205,'admin',1,'Admin/think/add','新增数据',-1,''),(206,'admin',1,'Admin/think/edit','编辑数据',-1,''),(207,'admin',1,'Admin/Menu/import','导入',-1,''),(208,'admin',1,'Admin/Model/generate','生成',-1,''),(209,'admin',1,'Admin/Addons/addHook','新增钩子',-1,''),(210,'admin',1,'Admin/Addons/edithook','编辑钩子',-1,''),(211,'admin',1,'Admin/Article/sort','文档排序',-1,''),(212,'admin',1,'Admin/Config/sort','排序',-1,''),(213,'admin',1,'Admin/Menu/sort','排序',-1,''),(214,'admin',1,'Admin/Channel/sort','排序',-1,''),(215,'admin',1,'Admin/Category/operate/type/move','移动',-1,''),(216,'admin',1,'Admin/Category/operate/type/merge','合并',-1,''),(217,'admin',1,'Admin/article/index','文档列表',1,''),(218,'admin',1,'Admin/think/lists','数据列表',-1,''),(219,'admin',1,'Admin/Player/index','玩家管理',1,''),(220,'admin',2,'Admin/Player/index','游戏管理',1,''),(221,'admin',1,'Admin/Notice/jpushList','推送日志',-1,''),(222,'admin',1,'Admin/Notice/push','发起推送',-1,''),(223,'admin',1,'Admin/Actionlog/loglist','客户端行为',-1,''),(224,'admin',1,'Admin/Source/item','item道具配置',-1,''),(225,'admin',1,'Admin/Source/pay','pay支付配置',-1,''),(226,'admin',1,'Admin/Source/giftbag','礼包配置',-1,''),(227,'admin',1,'Admin/Source/matchchina','比赛-中超',-1,''),(228,'admin',1,'Admin/Source/matchcontry','比赛-国家队',-1,''),(229,'admin',1,'Admin/Source/matchfrance','比赛-法甲',-1,''),(230,'admin',1,'Admin/Source/matchgerman','比赛-德甲',-1,''),(231,'admin',1,'Admin/Source/matchitaly','比赛-意甲',-1,''),(232,'admin',1,'Admin/Source/matchspain','比赛-西甲',-1,''),(233,'admin',1,'Admin/Actionlog/clienterr','客户端错误',-1,''),(234,'admin',1,'Admin/Monitor/swooleStatus','swoole服务器',-1,''),(235,'admin',1,'Admin/Monitor/serverStatus','服务器管理',-1,''),(236,'admin',1,'Admin/Source/matchuk','比赛-英超',-1,''),(237,'admin',1,'Admin/HonorMatch/index','联赛查询',-1,''),(238,'admin',1,'Admin/Player/loginlog','登录日志',-1,''),(239,'admin',1,'Admin/Player/accountaction','账号行为',-1,''),(240,'admin',1,'Admin/Pay/index','充值记录',-1,''),(241,'admin',1,'Admin/HonorMatch/statistic','联赛统计',-1,''),(242,'admin',1,'Admin/Source/amecup','比赛-美洲杯',-1,''),(243,'admin',1,'Admin/Source/europecup','比赛-欧洲杯',-1,''),(244,'admin',1,'Admin/Player/setDisable','封号',1,''),(245,'admin',1,'Admin/Player/setEnable','解封',1,''),(246,'admin',1,'Admin/Notice/pushSubmit','发起推送-提交',-1,''),(247,'admin',1,'Admin/Source/edit','source库修改',-1,''),(248,'admin',1,'Admin/Monitor/showStatus','服务器监控-提交',-1,''),(249,'admin',1,'Admin/Notice/submitPush','发起推送-提交',-1,''),(250,'admin',1,'Admin/Source/save','source库修改-提交',-1,''),(251,'admin',1,'Admin/Pay/orderPay','支付订单',-1,''),(252,'admin',1,'Admin/Source/questionOption','问题选项',-1,''),(253,'admin',1,'Admin/Source/optaMatch','opta赛程列表',-1,''),(254,'admin',1,'Admin/Source/configTeam','球队配置',-1,''),(255,'admin',1,'Admin/Player/wxSubscribe','微信关注',-1,''),(256,'admin',1,'Admin/Pay/orderHhb','欢呼币兑换',-1,''),(257,'admin',1,'Admin/Match/matchList','赛程列表',-1,''),(258,'admin',1,'Admin/Source/person','球员名配置',-1,''),(259,'admin',1,'Admin/Tongji/rankLose','比赛逆袭榜',-1,''),(260,'admin',1,'Admin/Match/matchAdd','添加比赛',-1,''),(261,'admin',1,'Admin/Tongji/rankWin','比赛名帅榜',-1,''),(262,'admin',1,'Admin/Tongji/rankSingle','单场最高榜',-1,''),(263,'admin',1,'Admin/Tongji/rankMatch','比赛排行榜',-1,''),(264,'admin',1,'Admin/Tongji/matchUserNum','参赛用户数',-1,''),(265,'admin',1,'Admin/Tongji/quesChoseNum','问题选项人数',-1,''),(266,'admin',1,'Admin/Tongji/accountLog','账号行为统计',-1,''),(267,'admin',1,'Admin/Source/question','赛前问题模板',-1,''),(268,'admin',1,'Admin/Source/postquestion','赛后问题模板',-1,''),(269,'admin',1,'Admin/Source/historyMatchSchedule','历史赛程配置',-1,''),(270,'admin',1,'Admin/Form/delete','通用表单删除-提交',-1,''),(271,'admin',1,'Admin/Form/editformpost','通用表单编辑-提交',-1,''),(272,'admin',1,'Admin/Form/addformpost','通用表单添加-提交',-1,''),(273,'admin',1,'Admin/Form/editform','通用编辑表单',-1,''),(274,'admin',1,'Admin/Form/addform','通用添加表单',-1,''),(275,'admin',1,'Admin/Match/save','比赛修改-提交',-1,''),(276,'admin',1,'Admin/Match/matchAddPost','比赛添加-提交',-1,''),(277,'admin',1,'Admin/Match/matchRemovePost','比赛移除-提交',-1,''),(278,'admin',1,'Admin/Match/question','问题列表',-1,''),(279,'admin',1,'Admin/Match/questionAddPost','问题添加-提交',-1,''),(280,'admin',1,'Admin/Actionlog/logTongji','行为统计',-1,''),(282,'admin',1,'Admin/Match/calcQuestion','问题结算',-1,''),(283,'admin',1,'Admin/Match/calcMatch','比赛结算',-1,''),(284,'admin',1,'Admin/Match/setTop','比赛置顶-提交',-1,''),(285,'admin',1,'Admin/Source/pmd','滚动公告',-1,''),(286,'admin',1,'Admin/Tongji/getOptionList','卡牌操作查询-提交',-1,''),(287,'admin',1,'Admin/Tongji/rechargeUser','充值玩家统计',-1,''),(288,'admin',1,'Admin/Tongji/playerNum','新增玩家',-1,''),(289,'admin',1,'Admin/Tongji/recharge','充值总金额',-1,''),(290,'admin',1,'Admin/Match/addSimpleRobotPost','添加机器人(简单模式)',-1,''),(291,'admin',1,'Admin/Match/matchAddHistoryPost','添加历史比赛',-1,''),(292,'admin',1,'Admin/GoldExchange/exchangeOrder','玩家兑换列表',-1,''),(293,'admin',1,'Admin/GoldExchange/changeExchangeOrderDetail','订单查看',-1,''),(294,'admin',1,'Admin/GoldExchange/changeExchangeOrderStatus','订单审核',-1,''),(295,'admin',1,'Admin/GoldExchange/changeExchangeOrderSendStatus','订单发放状态修改',-1,''),(296,'admin',1,'Admin/GoldExchange/changeOrderStatusSave','订单发放状态-提交',-1,''),(297,'admin',1,'Admin/GoldExchange/changeExchangeOrderCheckSucess','订单审核通过',-1,''),(298,'admin',1,'Admin/Tongji/playerFrom','用户来源统计',-1,''),(299,'admin',1,'Admin/Pay/logHonor','体力日志',-1,''),(300,'admin',1,'Admin/Match/tagUpdate','修改标识',-1,''),(301,'admin',1,'Admin/TongjiUser/playerNum','新增玩家',-1,''),(302,'admin',1,'Admin/TongjiBuy/tongji','充值总金额',-1,''),(303,'admin',1,'Admin/Tongji/ribao','日报',-1,''),(304,'admin',1,'Admin/Tongji/getUserProfit','玩家收益',-1,''),(305,'admin',1,'Admin/GongGao/dataList','页面公告',-1,''),(306,'admin',1,'Admin/GongGao/edit','公告编辑',-1,''),(307,'admin',1,'Admin/GongGao/save','公告保存',-1,''),(308,'admin',1,'Admin/Tongji/dayMatchLadderTotal','天梯统计',-1,''),(309,'admin',1,'Admin/PlayerController/editform','体力修改表单',-1,''),(310,'admin',1,'Admin/PlayerController/editformpost','体力修改提交',-1,''),(311,'admin',1,'Admin/StartView/dataList','开启图',-1,''),(312,'admin',1,'Admin/GoldExchange/dataList','金币兑换列表',-1,''),(313,'admin',1,'Admin/GoldExchange/edit','金币兑换修改',-1,''),(314,'admin',1,'Admin/GoldExchange/save','金币修改保存',-1,''),(315,'admin',1,'Admin/StartView/edit','开机图修改',-1,''),(316,'admin',1,'Admin/StartView/save','开机图保存',-1,''),(317,'admin',1,'Admin/Pix/dataList','大奖赛房间管理',-1,''),(318,'admin',1,'Admin/Source/prixList','大奖赛房间类型',-1,''),(319,'admin',1,'Admin/Source/pixExchangeList','大奖赛兑换物品',-1,''),(320,'admin',1,'Admin/PixMatchTurn/dataList','大奖赛轮次',-1,''),(321,'admin',1,'Admin/Pix/addform','大奖赛添加房间',-1,''),(322,'admin',1,'Admin/Pix/editform','大奖赛房间修改',-1,''),(323,'admin',1,'Admin/Pix/addformpost','大奖赛房间添加提交',-1,''),(324,'admin',1,'Admin/Pix/editformpost','大奖赛房间修改提交',-1,''),(325,'admin',1,'Admin/Pix/calcMatch','大奖赛结算比赛',-1,''),(326,'admin',1,'Admin/Pix/cancelMatch','大奖赛取消比赛',-1,''),(327,'admin',1,'Admin/ConfigExchange/pixExchangeList','大奖赛兑换物品',-1,''),(328,'admin',1,'Admin/ConfigExchange/flowExchangeList','流量兑换配置',-1,''),(329,'admin',1,'Admin/Tongji/dayMatchPrixTotal','大奖赛统计',-1,''),(330,'admin',1,'Admin/pix/getMatchList','大奖赛获取比赛',-1,''),(331,'admin',1,'Admin//Admin/chatting','聊天信息',-1,''),(332,'admin',1,'Admin/chatting','聊天信息',-1,''),(333,'admin',1,'Admin/chatting/index','聊天信息',-1,''),(334,'admin',1,'Admin/Room/dataList','房间管理',1,''),(335,'admin',1,'Admin/Room/addform','添加房间',1,''),(336,'admin',1,'Admin/Room/editform','修改房间',1,''),(337,'admin',1,'Admin/Room/addformpost','添加房间模型',1,''),(338,'admin',1,'Admin/Room/editformpost','修改房间模型',1,''),(339,'admin',1,'Admin/Room/import','导入房间csv',1,''),(340,'admin',1,'Admin/RoomRecommend/dataList','推荐房间管理',1,''),(341,'admin',2,'Admin/RoomRecommend/addform','添加房间',-1,''),(342,'admin',2,'Admin/RoomRecommend/editform','修改房间',-1,''),(343,'admin',2,'Admin/RoomRecommend/addformpost','添加房间模型',-1,''),(344,'admin',2,'Admin/RoomRecommend/editformpost','修改房间模型',-1,''),(345,'admin',1,'Admin/RoomRecommend/addform','添加推荐房间',1,''),(346,'admin',1,'Admin/RoomRecommend/editform','修改推荐房间',1,''),(347,'admin',1,'Admin/RoomRecommend/addformpost','添加推荐房间模型',1,''),(348,'admin',1,'Admin/RoomRecommend/editformpost','修改推荐房间模型',1,''),(349,'admin',1,'Admin/RoomRecommend/import','导入推荐房间csv',1,'');

/*Table structure for table `tbl_category` */

CREATE TABLE `tbl_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL DEFAULT '' COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL DEFAULT '' COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '列表绑定模型',
  `model_sub` varchar(100) NOT NULL DEFAULT '' COMMENT '子文档绑定模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  `groups` varchar(255) NOT NULL DEFAULT '' COMMENT '分组定义',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='分类表';

/*Data for the table `tbl_category` */

insert  into `tbl_category`(`id`,`name`,`title`,`pid`,`sort`,`list_row`,`meta_title`,`keywords`,`description`,`template_index`,`template_lists`,`template_detail`,`template_edit`,`model`,`model_sub`,`type`,`link_id`,`allow_publish`,`display`,`reply`,`check`,`reply_model`,`extend`,`create_time`,`update_time`,`status`,`icon`,`groups`) values (1,'blog','博客',0,0,10,'','','','','','','','2,3','2','2,1',0,0,1,0,0,'1','',1379474947,1382701539,1,0,''),(2,'default_blog','默认分类',1,1,10,'','','','','','','','2,3','2','2,1,3',0,1,1,0,1,'1','',1379475028,1386839751,1,0,'');

/*Table structure for table `tbl_channel` */

CREATE TABLE `tbl_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tbl_channel` */

insert  into `tbl_channel`(`id`,`pid`,`title`,`url`,`sort`,`create_time`,`update_time`,`status`,`target`) values (1,0,'首页','Index/index',1,1379475111,1379923177,1,0),(2,0,'博客','Article/index?category=blog',2,1379475131,1379483713,1,0),(3,0,'官网','http://www.onethink.cn',3,1379475154,1387163458,1,0);

/*Table structure for table `tbl_config` */

CREATE TABLE `tbl_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tbl_config` */

insert  into `tbl_config`(`id`,`name`,`type`,`title`,`group`,`extra`,`remark`,`create_time`,`update_time`,`status`,`value`,`sort`) values (1,'WEB_SITE_TITLE',1,'网站标题',1,'','网站标题前台显示标题',1378898976,1379235274,1,'梦幻足球世界',0),(2,'WEB_SITE_DESCRIPTION',2,'网站描述',1,'','网站搜索引擎描述',1378898976,1379235841,1,'',1),(3,'WEB_SITE_KEYWORD',2,'网站关键字',1,'','网站搜索引擎关键字',1378898976,1381390100,1,'',8),(4,'WEB_SITE_CLOSE',4,'关闭站点',1,'0:关闭,1:开启','站点关闭后其他用户不能访问，管理员可以正常访问',1378898976,1379235296,1,'0',1),(9,'CONFIG_TYPE_LIST',3,'配置类型列表',4,'','主要用于数据解析和页面表单的生成',1378898976,1379235348,1,'0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举',2),(10,'WEB_SITE_ICP',1,'网站备案号',1,'','设置在网站底部显示的备案号，如“沪ICP备12007941号-2',1378900335,1379235859,1,'',9),(13,'COLOR_STYLE',4,'后台色系',1,'default_color:默认\r\nblue_color:紫罗兰','后台颜色风格',1379122533,1379235904,1,'blue_color',10),(20,'CONFIG_GROUP_LIST',3,'配置分组',4,'','配置分组',1379228036,1384418383,1,'1:基本\r\n2:内容\r\n3:用户\r\n4:系统',4),(21,'HOOKS_TYPE',3,'钩子的类型',4,'','类型 1-用于扩展显示内容，2-用于扩展业务处理',1379313397,1379313407,1,'1:视图\r\n2:控制器',6),(22,'AUTH_CONFIG',3,'Auth配置',4,'','自定义Auth.class.php类配置',1379409310,1379409564,1,'AUTH_ON:1\r\nAUTH_TYPE:2',8),(26,'USER_ALLOW_REGISTER',4,'是否允许用户注册',3,'0:关闭注册\r\n1:允许注册','是否开放用户注册',1379504487,1379504580,1,'0',3),(27,'CODEMIRROR_THEME',4,'预览插件的CodeMirror主题',4,'3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight','详情见CodeMirror官网',1379814385,1384740813,1,'ambiance',3),(28,'DATA_BACKUP_PATH',1,'数据库备份根路径',4,'','路径必须以 / 结尾',1381482411,1381482411,1,'./Data/',5),(29,'DATA_BACKUP_PART_SIZE',0,'数据库备份卷大小',4,'','该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M',1381482488,1381729564,1,'20971520',7),(30,'DATA_BACKUP_COMPRESS',4,'数据库备份文件是否启用压缩',4,'0:不压缩\r\n1:启用压缩','压缩备份文件需要PHP环境支持gzopen,gzwrite函数',1381713345,1381729544,1,'1',9),(31,'DATA_BACKUP_COMPRESS_LEVEL',4,'数据库备份文件压缩级别',4,'1:普通\r\n4:一般\r\n9:最高','数据库备份文件的压缩级别，该配置在开启压缩时生效',1381713408,1381713408,1,'9',10),(32,'DEVELOP_MODE',4,'开启开发者模式',4,'0:关闭\r\n1:开启','是否开启开发者模式',1383105995,1383291877,1,'1',11),(33,'ALLOW_VISIT',3,'不受限控制器方法',0,'','',1386644047,1386644741,1,'0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture',0),(34,'DENY_VISIT',3,'超管专限控制器方法',0,'','仅超级管理员可访问的控制器方法',1386644141,1386644659,1,'0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree',0),(36,'ADMIN_ALLOW_IP',2,'后台允许访问IP',4,'','多个用逗号分隔，如果不配置表示不限制IP访问',1387165454,1387165553,1,'',12),(37,'SHOW_PAGE_TRACE',4,'是否显示页面Trace',4,'0:关闭\r\n1:开启','是否显示页面Trace信息',1387165685,1387165685,1,'0',1);

/*Table structure for table `tbl_document` */

CREATE TABLE `tbl_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `group_id` smallint(3) unsigned NOT NULL COMMENT '所属分组',
  `description` char(140) NOT NULL DEFAULT '' COMMENT '描述',
  `root` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '根节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属ID',
  `model_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容模型ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '内容类型',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '推荐位',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `cover_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '封面',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '可见性',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '截至时间',
  `attach` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件数量',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '扩展统计字段',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '优先级',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  PRIMARY KEY (`id`),
  KEY `idx_category_status` (`category_id`,`status`),
  KEY `idx_status_type_pid` (`status`,`uid`,`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文档模型基础表';

/*Data for the table `tbl_document` */

insert  into `tbl_document`(`id`,`uid`,`name`,`title`,`category_id`,`group_id`,`description`,`root`,`pid`,`model_id`,`type`,`position`,`link_id`,`cover_id`,`display`,`deadline`,`attach`,`view`,`comment`,`extend`,`level`,`create_time`,`update_time`,`status`) values (1,1,'','OneThink1.1开发版发布',2,0,'期待已久的OneThink最新版发布',0,0,2,2,0,0,0,1,0,0,8,0,0,0,1406001413,1406001413,1);

/*Table structure for table `tbl_document_article` */

CREATE TABLE `tbl_document_article` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '文章内容',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `bookmark` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文档模型文章表';

/*Data for the table `tbl_document_article` */

insert  into `tbl_document_article`(`id`,`parse`,`content`,`template`,`bookmark`) values (1,0,'<h1>\r\n	OneThink1.1开发版发布&nbsp;\r\n</h1>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink是一个开源的内容管理框架，基于最新的ThinkPHP3.2版本开发，提供更方便、更安全的WEB应用开发体验，采用了全新的架构设计和命名空间机制，融合了模块化、驱动化和插件化的设计理念于一体，开启了国内WEB应用傻瓜式开发的新潮流。&nbsp;</strong> \r\n</p>\r\n<h2>\r\n	主要特性：\r\n</h2>\r\n<p>\r\n	1. 基于ThinkPHP最新3.2版本。\r\n</p>\r\n<p>\r\n	2. 模块化：全新的架构和模块化的开发机制，便于灵活扩展和二次开发。&nbsp;\r\n</p>\r\n<p>\r\n	3. 文档模型/分类体系：通过和文档模型绑定，以及不同的文档类型，不同分类可以实现差异化的功能，轻松实现诸如资讯、下载、讨论和图片等功能。\r\n</p>\r\n<p>\r\n	4. 开源免费：OneThink遵循Apache2开源协议,免费提供使用。&nbsp;\r\n</p>\r\n<p>\r\n	5. 用户行为：支持自定义用户行为，可以对单个用户或者群体用户的行为进行记录及分享，为您的运营决策提供有效参考数据。\r\n</p>\r\n<p>\r\n	6. 云端部署：通过驱动的方式可以轻松支持平台的部署，让您的网站无缝迁移，内置已经支持SAE和BAE3.0。\r\n</p>\r\n<p>\r\n	7. 云服务支持：即将启动支持云存储、云安全、云过滤和云统计等服务，更多贴心的服务让您的网站更安心。\r\n</p>\r\n<p>\r\n	8. 安全稳健：提供稳健的安全策略，包括备份恢复、容错、防止恶意攻击登录，网页防篡改等多项安全管理功能，保证系统安全，可靠、稳定的运行。&nbsp;\r\n</p>\r\n<p>\r\n	9. 应用仓库：官方应用仓库拥有大量来自第三方插件和应用模块、模板主题，有众多来自开源社区的贡献，让您的网站“One”美无缺。&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>&nbsp;OneThink集成了一个完善的后台管理体系和前台模板标签系统，让你轻松管理数据和进行前台网站的标签式开发。&nbsp;</strong> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<h2>\r\n	后台主要功能：\r\n</h2>\r\n<p>\r\n	1. 用户Passport系统\r\n</p>\r\n<p>\r\n	2. 配置管理系统&nbsp;\r\n</p>\r\n<p>\r\n	3. 权限控制系统\r\n</p>\r\n<p>\r\n	4. 后台建模系统&nbsp;\r\n</p>\r\n<p>\r\n	5. 多级分类系统&nbsp;\r\n</p>\r\n<p>\r\n	6. 用户行为系统&nbsp;\r\n</p>\r\n<p>\r\n	7. 钩子和插件系统\r\n</p>\r\n<p>\r\n	8. 系统日志系统&nbsp;\r\n</p>\r\n<p>\r\n	9. 数据备份和还原\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;[ 官方下载：&nbsp;<a href=\"http://www.onethink.cn/download.html\" target=\"_blank\">http://www.onethink.cn/download.html</a>&nbsp;&nbsp;开发手册：<a href=\"http://document.onethink.cn/\" target=\"_blank\">http://document.onethink.cn/</a>&nbsp;]&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink开发团队 2013~2014</strong> \r\n</p>','',0);

/*Table structure for table `tbl_document_download` */

CREATE TABLE `tbl_document_download` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '下载详细描述',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文档模型下载表';

/*Data for the table `tbl_document_download` */

/*Table structure for table `tbl_file` */

CREATE TABLE `tbl_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '远程地址',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`md5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文件表';

/*Data for the table `tbl_file` */

/*Table structure for table `tbl_hooks` */

CREATE TABLE `tbl_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tbl_hooks` */

insert  into `tbl_hooks`(`id`,`name`,`description`,`type`,`update_time`,`addons`,`status`) values (1,'pageHeader','页面header钩子，一般用于加载插件CSS文件和代码',1,0,'',1),(2,'pageFooter','页面footer钩子，一般用于加载插件JS文件和JS代码',1,0,'ReturnTop',1),(3,'documentEditForm','添加编辑表单的 扩展内容钩子',1,0,'Attachment',1),(4,'documentDetailAfter','文档末尾显示',1,0,'Attachment',1),(5,'documentDetailBefore','页面内容前显示用钩子',1,0,'',1),(6,'documentSaveComplete','保存文档数据后的扩展钩子',2,0,'Attachment',1),(7,'documentEditFormContent','添加编辑表单的内容显示钩子',1,0,'Editor',1),(8,'adminArticleEdit','后台内容编辑页编辑器',1,1378982734,'EditorForAdmin',1),(13,'AdminIndex','首页小格子个性化显示',1,1382596073,'SystemInfo,SiteStat',1),(14,'topicComment','评论提交方式扩展钩子。',1,1380163518,'Editor',1),(16,'app_begin','应用开始',2,1384481614,'',1);

/*Table structure for table `tbl_member` */

CREATE TABLE `tbl_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` char(10) NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  PRIMARY KEY (`uid`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='会员表';

/*Data for the table `tbl_member` */

insert  into `tbl_member`(`uid`,`nickname`,`sex`,`birthday`,`qq`,`score`,`login`,`reg_ip`,`reg_time`,`last_login_ip`,`last_login_time`,`status`) values (1,'admin',0,'0000-00-00','',140,279,0,1460105303,1961309749,1493777875,1),(2,'游客1',0,'0000-00-00','',10,2,0,0,2130706433,1460518067,-1),(3,'content',0,'0000-00-00','',0,6,0,0,2130706433,1463388744,-1),(4,'ballack',0,'0000-00-00','',0,182,0,0,1699865998,1479266808,-1),(5,'kaka',0,'0000-00-00','',0,8,0,0,1699825671,1466155527,-1),(6,'kahn',0,'0000-00-00','',0,33,0,0,1699825967,1475985055,-1),(7,'mikel',0,'0000-00-00','',0,195,0,0,1961016599,1473757522,-1),(8,'alba',0,'0000-00-00','',0,279,0,0,1961308800,1479262555,-1),(9,'dybala',0,'0000-00-00','',0,72,0,0,2130706433,1487647436,-1),(10,'forest',0,'0000-00-00','',0,126,0,0,1699865065,1489981498,-1),(11,'rondo',0,'0000-00-00','',0,103,0,0,1961308597,1474860779,-1),(12,'klose',0,'0000-00-00','',0,41,0,0,1961308990,1478142697,-1),(13,'nicky',0,'0000-00-00','',0,128,0,0,1699826735,1479261307,-1),(14,'henin',0,'0000-00-00','',0,1,0,0,1961017059,1467687900,-1),(15,'fran',0,'0000-00-00','',0,30,0,0,1918787338,1476847694,-1),(16,'mkll',0,'0000-00-00','',0,30,0,0,1699865065,1488423191,-1),(17,'canavalo',0,'0000-00-00','',0,4,0,0,1699865998,1479815194,-1),(18,'ffmadmin',0,'0000-00-00','',0,0,0,0,0,0,-1),(19,'alex',0,'0000-00-00','',0,20,0,0,2886730107,1493020187,-1);

/*Table structure for table `tbl_menu` */

CREATE TABLE `tbl_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tbl_menu` */

insert  into `tbl_menu`(`id`,`title`,`pid`,`sort`,`url`,`hide`,`tip`,`group`,`is_dev`,`status`) values (1,'首页',0,1,'Index/index',0,'','',0,1),(3,'文档列表',2,0,'article/index',1,'','内容',0,1),(4,'新增',3,0,'article/add',0,'','',0,1),(5,'编辑',3,0,'article/edit',0,'','',0,1),(6,'改变状态',3,0,'article/setStatus',0,'','',0,1),(7,'保存',3,0,'article/update',0,'','',0,1),(8,'保存草稿',3,0,'article/autoSave',0,'','',0,1),(9,'移动',3,0,'article/move',0,'','',0,1),(10,'复制',3,0,'article/copy',0,'','',0,1),(11,'粘贴',3,0,'article/paste',0,'','',0,1),(12,'导入',3,0,'article/batchOperate',0,'','',0,1),(13,'回收站',2,0,'article/recycle',1,'','内容',0,1),(14,'还原',13,0,'article/permit',0,'','',0,1),(15,'清空',13,0,'article/clear',0,'','',0,1),(16,'用户',0,3,'User/index',0,'','',0,1),(17,'用户信息',16,0,'User/index',0,'','用户管理',0,1),(18,'新增用户',17,0,'User/add',0,'添加新用户','',0,1),(19,'用户行为',16,0,'User/action',1,'','行为管理',0,1),(20,'新增用户行为',19,0,'User/addaction',0,'','',0,1),(21,'编辑用户行为',19,0,'User/editaction',0,'','',0,1),(22,'保存用户行为',19,0,'User/saveAction',0,'\"用户->用户行为\"保存编辑和新增的用户行为','',0,1),(23,'变更行为状态',19,0,'User/setStatus',0,'\"用户->用户行为\"中的启用,禁用和删除权限','',0,1),(24,'禁用会员',19,0,'User/changeStatus?method=forbidUser',0,'\"用户->用户信息\"中的禁用','',0,1),(25,'启用会员',19,0,'User/changeStatus?method=resumeUser',0,'\"用户->用户信息\"中的启用','',0,1),(26,'删除会员',19,0,'User/changeStatus?method=deleteUser',0,'\"用户->用户信息\"中的删除','',0,1),(27,'权限管理',16,0,'AuthManager/index',0,'','用户管理',0,1),(28,'删除',27,0,'AuthManager/changeStatus?method=deleteGroup',0,'删除用户组','',0,1),(29,'禁用',27,0,'AuthManager/changeStatus?method=forbidGroup',0,'禁用用户组','',0,1),(30,'恢复',27,0,'AuthManager/changeStatus?method=resumeGroup',0,'恢复已禁用的用户组','',0,1),(31,'新增',27,0,'AuthManager/createGroup',0,'创建新的用户组','',0,1),(32,'编辑',27,0,'AuthManager/editGroup',0,'编辑用户组名称和描述','',0,1),(33,'保存用户组',27,0,'AuthManager/writeGroup',0,'新增和编辑用户组的\"保存\"按钮','',0,1),(34,'授权',27,0,'AuthManager/group',0,'\"后台 \\ 用户 \\ 用户信息\"列表页的\"授权\"操作按钮,用于设置用户所属用户组','',0,1),(35,'访问授权',27,0,'AuthManager/access',0,'\"后台 \\ 用户 \\ 权限管理\"列表页的\"访问授权\"操作按钮','',0,1),(36,'成员授权',27,0,'AuthManager/user',0,'\"后台 \\ 用户 \\ 权限管理\"列表页的\"成员授权\"操作按钮','',0,1),(37,'解除授权',27,0,'AuthManager/removeFromGroup',0,'\"成员授权\"列表页内的解除授权操作按钮','',0,1),(38,'保存成员授权',27,0,'AuthManager/addToGroup',0,'\"用户信息\"列表页\"授权\"时的\"保存\"按钮和\"成员授权\"里右上角的\"添加\"按钮)','',0,1),(39,'分类授权',27,0,'AuthManager/category',0,'\"后台 \\ 用户 \\ 权限管理\"列表页的\"分类授权\"操作按钮','',0,1),(40,'保存分类授权',27,0,'AuthManager/addToCategory',0,'\"分类授权\"页面的\"保存\"按钮','',0,1),(41,'模型授权',27,0,'AuthManager/modelauth',0,'\"后台 \\ 用户 \\ 权限管理\"列表页的\"模型授权\"操作按钮','',0,1),(42,'保存模型授权',27,0,'AuthManager/addToModel',0,'\"分类授权\"页面的\"保存\"按钮','',0,1),(45,'创建',44,0,'Addons/create',0,'服务器上创建插件结构向导','',0,1),(46,'检测创建',44,0,'Addons/checkForm',0,'检测插件是否可以创建','',0,1),(47,'预览',44,0,'Addons/preview',0,'预览插件定义类文件','',0,1),(48,'快速生成插件',44,0,'Addons/build',0,'开始生成插件结构','',0,1),(49,'设置',44,0,'Addons/config',0,'设置插件配置','',0,1),(50,'禁用',44,0,'Addons/disable',0,'禁用插件','',0,1),(51,'启用',44,0,'Addons/enable',0,'启用插件','',0,1),(52,'安装',44,0,'Addons/install',0,'安装插件','',0,1),(53,'卸载',44,0,'Addons/uninstall',0,'卸载插件','',0,1),(54,'更新配置',44,0,'Addons/saveconfig',0,'更新插件配置处理','',0,1),(55,'插件后台列表',44,0,'Addons/adminList',0,'','',0,1),(56,'URL方式访问插件',44,0,'Addons/execute',0,'控制是否有权限通过url访问插件控制器方法','',0,1),(58,'模型管理',68,3,'Model/index',0,'','系统设置',0,1),(59,'新增',58,0,'model/add',0,'','',0,1),(60,'编辑',58,0,'model/edit',0,'','',0,1),(61,'改变状态',58,0,'model/setStatus',0,'','',0,1),(62,'保存数据',58,0,'model/update',0,'','',0,1),(63,'属性管理',68,0,'Attribute/index',1,'网站属性配置。','',0,1),(64,'新增',63,0,'Attribute/add',0,'','',0,1),(65,'编辑',63,0,'Attribute/edit',0,'','',0,1),(66,'改变状态',63,0,'Attribute/setStatus',0,'','',0,1),(67,'保存数据',63,0,'Attribute/update',0,'','',0,1),(124,'游戏管理',0,3,'Player/index',0,'','',0,1),(125,'玩家管理',124,0,'Player/index',0,'','账号管理',0,1),(126,'房间管理',124,0,'Room/dataList',0,'','房间管理',0,1),(237,'添加房间',126,0,'Room/addform',0,'','房间管理',0,1),(238,'修改房间',126,0,'Room/editform',0,'','房间管理',0,1),(239,'添加房间模型',126,0,'Room/addformpost',0,'','房间管理',0,1),(240,'修改房间模型',126,0,'Room/editformpost',0,'','房间管理',0,1),(241,'封号',125,0,'Player/setDisable',0,'','账号管理',0,1),(242,'解封',125,0,'Player/setEnable',0,'','账号管理',0,1),(243,'导入房间csv',126,0,'Room/import',0,'','房间管理',0,1),(244,'推荐房间管理',124,0,'RoomRecommend/dataList',0,'','房间管理',0,1),(245,'添加推荐房间',244,0,'RoomRecommend/addform',0,'','房间管理',0,1),(246,'修改推荐房间',244,0,'RoomRecommend/editform',0,'','房间管理',0,1),(247,'添加推荐房间模型',244,0,'RoomRecommend/addformpost',0,'','房间管理',0,1),(248,'修改推荐房间模型',244,0,'RoomRecommend/editformpost',0,'','房间管理',0,1),(249,'导入推荐房间csv',244,0,'RoomRecommend/import',0,'','房间管理',0,1);

/*Table structure for table `tbl_model` */

CREATE TABLE `tbl_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text COMMENT '属性列表（表的字段）',
  `attribute_alias` varchar(255) NOT NULL DEFAULT '' COMMENT '属性别名定义',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `list_grid` text COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文档模型表';

/*Data for the table `tbl_model` */

insert  into `tbl_model`(`id`,`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`attribute_alias`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`) values (1,'document','基础文档',0,'',1,'{\"1\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\"]}','1:基础','','','','','','id:编号\r\ntitle:标题:[EDIT]\r\ntype:类型\r\nupdate_time:最后更新\r\nstatus:状态\r\nview:浏览\r\nid:操作:[EDIT]|编辑,[DELETE]|删除',0,'','',1383891233,1384507827,1,'MyISAM'),(2,'article','文章',1,'',1,'{\"1\":[\"3\",\"24\",\"2\",\"5\"],\"2\":[\"9\",\"13\",\"19\",\"10\",\"12\",\"16\",\"17\",\"26\",\"20\",\"14\",\"11\",\"25\"]}','1:基础,2:扩展','','','','','','',0,'','',1383891243,1387260622,1,'MyISAM'),(3,'download','下载',1,'',1,'{\"1\":[\"3\",\"28\",\"30\",\"32\",\"2\",\"5\",\"31\"],\"2\":[\"13\",\"10\",\"27\",\"9\",\"12\",\"16\",\"17\",\"19\",\"11\",\"20\",\"14\",\"29\"]}','1:基础,2:扩展','','','','','','',0,'','',1383891252,1387260449,1,'MyISAM');

/*Table structure for table `tbl_picture` */

CREATE TABLE `tbl_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tbl_picture` */

/*Table structure for table `tbl_ucenter_admin` */

CREATE TABLE `tbl_ucenter_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='管理员表';

/*Data for the table `tbl_ucenter_admin` */

/*Table structure for table `tbl_ucenter_app` */

CREATE TABLE `tbl_ucenter_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `title` varchar(30) NOT NULL COMMENT '应用名称',
  `url` varchar(100) NOT NULL COMMENT '应用URL',
  `ip` char(15) NOT NULL DEFAULT '' COMMENT '应用IP',
  `auth_key` varchar(100) NOT NULL DEFAULT '' COMMENT '加密KEY',
  `sys_login` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '同步登陆',
  `allow_ip` varchar(255) NOT NULL DEFAULT '' COMMENT '允许访问的IP',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '应用状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='应用表';

/*Data for the table `tbl_ucenter_app` */

/*Table structure for table `tbl_ucenter_member` */

CREATE TABLE `tbl_ucenter_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL DEFAULT '' COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户表';

/*Data for the table `tbl_ucenter_member` */

insert  into `tbl_ucenter_member`(`id`,`username`,`password`,`email`,`mobile`,`reg_time`,`reg_ip`,`last_login_time`,`last_login_ip`,`update_time`,`status`) values (1,'admin','4a378e8e0e8af386b4dd8bee4aa1b8a2','479923197@qq.com','',1465981796,975276412,1493777875,1961309749,1465981796,1),(2,'游客1','db00059e0aa3be38c536efc7325caeb5','11111@qq.com','',1460517910,2130706433,1460518067,2130706433,1460517910,1),(3,'content','db00059e0aa3be38c536efc7325caeb5','123456@qq.com','',1463385806,2130706433,1463388744,2130706433,1463385806,1),(4,'ballack','161c77afe17371f0aa173ba46d2c80f1','ballack@huanhuba.com','',1465914143,1699825671,1479266808,1699865998,1465914143,1),(5,'kaka','f09cb4e11ff7b3d1cf80220b4e034802','kaka@huanhuba.com','',1465914228,1699825671,1466155527,1699825671,1465914228,1),(6,'kahn','a9072cdeb2f9c35e3b6dc89502702be2','kahn@huanhuba.com','',1474355940,1961308560,1475985055,1699825967,1474355940,1),(7,'mikel','f1ab0d924d99c32dc36ba40ed30261e1','mikel@huanhuba.com','',1465918605,1699825671,1476152156,22475883,1465918605,1),(8,'alba','4c1998b78d9522f260c21af0bce5e972','alba@huanhuba.com','',1471257936,1961016755,1479262555,1961308800,1471257936,1),(9,'dybala','8a23db943d91367b395461fe1b5c386c','dybala@huanhuba.com','',1466221846,1699825671,1487647436,2130706433,1466221846,1),(10,'forest','96d0eb40426e1b0fc7913e82c7f11e28','forest@huanhuba.com','',1466221934,1699825671,1489981498,1699865065,1466221934,1),(11,'rondo','e8dfef016e93054052b31b9b6da4481c','rondo@huanhuba.com','',1466222028,1699825671,1474860779,1961308597,1466222028,1),(12,'klose','b7fb28a32cf54a0ae99d9fa89b0a144f','klose@huanhuba.com','',1467303465,1961017059,1478142697,1961308990,1467303465,1),(13,'nicky','7dcd8a2e22a8b9cb822e37633a357db9','nicky@huanhuba.com','',1467686981,1961017059,1479261307,1699826735,1467686981,1),(14,'henin','1d2d670240658c9295de0b09cf145773','henin@huanhuba.com','',1467687739,1961017059,1467687900,1961017059,1467687739,1),(15,'fran','1df38f7a2cec290a6bd72d2a3188e535','fran@huanhuba.com','',1468913378,1699865327,1476847694,1918787338,1468913378,1),(16,'mkll','2e1f36b0c08267568db15b7a8baeee2c','xxx@qq.com','',1475032903,1961308935,1488423191,1699865065,1475032903,1),(17,'canavalo','9a7c8615c14e05ec160ab6db0e6b0faa','canavalo@sohu.com','',1479447695,1699865998,1479815194,1699865998,1479447695,1),(18,'ffmadmin','46a32134c85dc91f088ca373eb70172f','aaa@sohu.com','',1483596401,1699865998,0,0,1483596401,1),(19,'alex','42237081958ffe8268f646a479963e03','wudi110104@163.com','',1493018147,2886730107,1493020187,2886730107,1493018147,1);

/*Table structure for table `tbl_ucenter_setting` */

CREATE TABLE `tbl_ucenter_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='设置表';

/*Data for the table `tbl_ucenter_setting` */

/*Table structure for table `tbl_url` */

CREATE TABLE `tbl_url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_url` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='链接表';

/*Data for the table `tbl_url` */

/*Table structure for table `tbl_userdata` */

CREATE TABLE `tbl_userdata` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型标识',
  `target_id` int(10) unsigned NOT NULL COMMENT '目标id',
  UNIQUE KEY `uid` (`uid`,`type`,`target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tbl_userdata` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
