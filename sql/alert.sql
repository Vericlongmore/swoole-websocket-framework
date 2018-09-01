UPDATE tbl_account_info SET PASSWORD = 'a8191a3c4bc45d4df5863b58456b5ea0';


ALTER TABLE `tbl_room_list` ADD COLUMN `team_list` VARCHAR(1024) DEFAULT '' NOT NULL COMMENT '球队id' AFTER `closed_time`; 


ALTER TABLE `tbl_room_list` CHANGE `status` `status` INT(10) DEFAULT -1 NOT NULL COMMENT '状态(房间状态-1:创建中;1:报名中;2:已截止;3:已结算;4-取消;0-无效;5-延期状态)'; 



INSERT INTO tbl_match_list (match_list) SELECT match_list FROM tbl_room_list;

UPDATE tbl_room_list,tbl_match_list SET tbl_room_list.match_list =tbl_match_list.id WHERE  tbl_room_list.match_list = tbl_match_list.`match_list`;

DELETE FROM tbl_match_list WHERE id NOT IN (SELECT match_list FROM tbl_room_list);
