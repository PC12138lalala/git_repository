/**
 * 
 */

function scroll(){
	if($(document).scrollTop()>2){
		$("#hd").css("z-index", "100000");
		$("#white").css("margin", "180 0 0 0");
		$("#hd").css("position", "fixed");
		$("#hd").css("width", "100%");
		$("#hd").css("top", "-100");
	}
	else{
		$("#white").css("margin", "20 0 0 0");
		$("#hd").css("position", "relative");
		$("#hd").css("top", "0");
	};
};
	
	
function sc(rs){
	//window.scroll(0, 1080);
	$(".top").hide();
	$("#my-video_html5_api").attr("src","CSS/video/video/"+rs);
	$("#vid").show();
	myPlayer.play();
	var it = setInterval(function() {
	if(myPlayer.ended()){
		$(".top").show();
		$("#vid").hide();
		window.clearInterval(it);
		}
	}, 500);
}


function change_language(language){
	window.location.href="homepage?language="+language;
}


$(document).ready(function(){
	$("#vid").hide();
	$("#lpad").append("<ul><li id='l_en_US' onclick=change_language('en_US')>ENGLISH</li><li id='l_zh_CN' onclick=change_language('zh_CN')>中文(简体)</li></ul>");
	toggle=0;
	$("#current_language").click(function(){
		if(toggle==0){
			$("#lpad").css({"bottom":"0px","transition":"bottom 0.5s linear"});
			
			toggle=1;
		}else{
			$("#lpad").css("bottom", "-80px");
			toggle=0;
		}
	});
	$("#l_icon").click(function(){
		if(toggle==0){
			$("#lpad").css({"bottom":"0px","transition":"bottom 0.5s linear"});
			
			toggle=1;
		}else{
			$("#lpad").css("bottom", "-80px");
			toggle=0;
		}
	});
	
	$("#load_pad").css({"width":$("body").width(),"height":$("#white").height(),"margin":$("#white").css("margin")});
	$("#load_pic").css("margin-top",$("#load_pad").css("height").toString().replace("px","")/2-100+"px");

});
		
$(window).load(function (){
	$("#load_pad").css("opacity","0");
	$("#load_pad").css("visibility","hidden");
});