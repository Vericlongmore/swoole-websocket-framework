function presend(key){
	var apiInfo = apiList[key];
	
	var content = apiInfo.data
	if(apiInfo.fill_playerid){
		content.data.playerId = $("#player_id").val()
	}
	
	content = JSON.stringify(content)
	if(apiInfo.is_auto_send){
		fun_sendcon(content)
	}else{
		var content = pre_send(content)
		$("#inp_send").val(content)
	}
}

$(function(){
	$.each(apiList, function(k,v){
		var html = '<button onclick="presend('+k+')">'+v.name+'</button>&nbsp;';
		$("#buttons_area").append(html);
	});
	
	$("#clear_creen").click(function(){
		$("#div_msg").html("");
	});
});