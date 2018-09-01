var apiList = [
	//{"name":"接口名称", "data":发送消息体, "fill_playerid":是否在消息体中自动加入playerId, "is_auto_send":是否直接提交},
	{"name":"进入游戏", "data":{"msgId":1001,"data":{"playerId":"","token":""}}, "fill_playerid":true, "is_auto_send":true},
	{"name":"寻找房间", "data":{"msgId":1002,"data":{"leagueId":1,"leagueType":2}}, "fill_playerid":false, "is_auto_send":false},
	{"name":"停止寻找房间", "data":{"msgId":1003}, "fill_playerid":false, "is_auto_send":false},
	{"name":"换牌", "data":{"msgId":1005,"data":{"roomId":354, "cardIds":[]}}, "fill_playerid":false, "is_auto_send":false},
	{"name":"出牌", "data":{"msgId":1008,"data":{"roomId":354, "cardInfo":[{'cardId':662, 'cardState':1, 'itemId':0}]}}, "fill_playerid":false, "is_auto_send":false},
	{"name":"使用道具","data":{"msgId":1011,"data":{"roomId":354,"itemId":102101,"itemType":5,"itemParams":{}}}, "fill_playerid":false, "is_auto_send":false},
	{"name":"世界聊天","data":{"msgId":1501,"data":{"content":""}}, "fill_playerid":false, "is_auto_send":false},
	{"name":"求购","data":{"msgId":200001,"data":{"tradeId":1}}, "fill_playerid":false, "is_auto_send":false},
	{"name":"拍卖","data":{"msgId":200002,"data":{"tradeId":1,"saleMode":1}}, "fill_playerid":false, "is_auto_send":false},
	{"name":"取消求购","data":{"msgId":200003,"data":{"tradeId":1}}, "fill_playerid":false, "is_auto_send":false},
	{"name":"取消拍卖","data":{"msgId":200004,"data":{"tradeId":1}}, "fill_playerid":false, "is_auto_send":false},
];