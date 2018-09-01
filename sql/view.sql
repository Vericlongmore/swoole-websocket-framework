DROP VIEW `tbl_view_room_list`;
CREATE VIEW `tbl_view_room_list` AS 
select
  `r`.`room_id`          AS `room_id`,
  `r`.`type`             AS `type`,
  `r`.`rule`             AS `rule`,
  `r`.`bonus`            AS `bonus`,
  `r`.`fee`              AS `fee`,
  `r`.`max_users`        AS `max_users`,
  `r`.`current_users`    AS `current_users`,
  `r`.`total_bonus`      AS `total_bonus`,
  `r`.`top_bonus`        AS `top_bonus`,
  `r`.`closed_time`      AS `closed_time`,
  `r`.`team_number`      AS `team_number`,
  `r`.`team_salarycap`   AS `team_salarycap`,
  `r`.`player_number`    AS `player_number`,
  `r`.`player_salarycap` AS `player_salarycap`,
  `r`.`status`           AS `status`,
  `r`.`room_name`        AS `room_name`,
  `r`.`copy_room_id`     AS `copy_room_id`,
  `r`.`match_insert_id`  AS `match_insert_id`,
  `r`.`update_time`      AS `update_time`,
  `r`.`create_user_id`   AS `create_user_id`,
  `r`.`recommend_type`   AS `recommend_type`,
  `r`.`desc`             AS `desc`,
  `r`.`odds_call_fun`    AS `odds_call_fun`,
  `l`.`match_list`       AS `match_list`
from (`tbl_room_list` `r`
   left join `tbl_match_list` `l`
     on ((`r`.`match_insert_id` = `l`.`id`)));



DROP VIEW `tbl_view_room_rank_detail`;
CREATE VIEW `tbl_view_room_rank_detail` AS 
select
  `d`.`id`          AS `id`,
  `d`.`room_id`     AS `room_id`,
  `d`.`rule`        AS `rule`,
  `d`.`player_id`   AS `player_id`,
  `d`.`match_id`    AS `match_id`,
  `d`.`team_id`     AS `team_id`,
  `d`.`score`       AS `score`,
  `d`.`create_time` AS `create_time`,
  ifnull(`s`.`times`,0) AS `times`
from (`tbl_room_rank_detail` `d`
   left join `tbl_match_team_score` `s`
     on (((`d`.`match_id` = `s`.`match_id`)
          and (`d`.`team_id` = `s`.`team_id`)
          and (`d`.`rule` = `s`.`type`))));


DROP VIEW `tbl_view_room_rank_user`;
CREATE VIEW `tbl_view_room_rank_user` AS 
select
  `rk`.`room_id`   AS `room_id`,
  `rk`.`rank`      AS `rank`,
  `rk`.`player_id` AS `player_id`,
  `rk`.`score`     AS `score`,
  `rk`.`grade`     AS `grade`,
  `rk`.`bonus`     AS `bonus`,
  `u`.`salary`     AS `salary`,
  `i`.`nickname`   AS `nickname`
from ((`tbl_room_rank` `rk`
    left join `tbl_room_users` `u`
      on (((`rk`.`room_id` = `u`.`room_id`)
           and (`rk`.`player_id` = `u`.`player_id`))))
   left join `tbl_player_info` `i`
     on ((`rk`.`player_id` = `i`.`player_id`)));


DROP VIEW `tbl_view_room_users`;
CREATE VIEW `tbl_view_room_users` AS 
select
  `u`.`id`          AS `id`,
  `u`.`room_id`     AS `room_id`,
  `u`.`player_id`   AS `player_id`,
  `u`.`salary`      AS `salary`,
  `u`.`create_ts`   AS `create_ts`,
  `u`.`update_ts`   AS `update_ts`,
  `u`.`status`      AS `ustatus`,
  `r`.`status`      AS `status`,
  `r`.`closed_time` AS `closed_time`,
  `p`.`nickname`    AS `nickname`
from ((`tbl_room_users` `u`
    left join `tbl_room_list` `r`
      on ((`r`.`room_id` = `u`.`room_id`)))
   left join `tbl_player_info` `p`
     on ((`p`.`player_id` = `u`.`player_id`)))
where (`u`.`status` = 1);


DROP VIEW `tbl_view_room_users_detail`;
CREATE VIEW `tbl_view_room_users_detail` AS 
select
  `d`.`teamId`         AS `teamId`,
  `d`.`matchId`        AS `matchId`,
  `d`.`salary`         AS `salary`,
  `d`.`score`          AS `score`,
  `d`.`room_insert_id` AS `room_insert_id`,
  `r`.`room_id`        AS `room_id`,
  `r`.`player_id`      AS `player_id`
from (`tbl_room_users_detail` `d`
   left join `tbl_room_users` `r`
     on ((`d`.`room_insert_id` = `r`.`id`)))
where (`r`.`status` = 1);