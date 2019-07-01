/**
 * 
 */
function scroll(){
	if($(document).scrollTop()>2){
		$("#hd").css("z-index", "100000");
		$("#mainForce").css("margin", "180 0 0 0");
		$("#hd").css("position", "fixed");
		$("#hd").css("width", "100%");
		$("#hd").css("top", "-100");
	}
	else{
		$("#mainForce").css("margin", "20 0 0 0");
		$("#hd").css("position", "relative");
		$("#hd").css("top", "0");
	};
};

$(document).ready(function(){
	$("#load_pad").css({"width":$("body").width(),"height":$("#mainForce").height(),"margin":"40px"});
	$("#load_pic").css("margin-top",$("#load_pad").css("height").toString().replace("px","")/2-100+"px");
});

$(window).load(function (){
	$("#load_pad").css("opacity","0");
	$("#load_pad").css("visibility","hidden");
});