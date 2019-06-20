/**
 * 
 */

function scroll(){
	if($(document).scrollTop()>2){
		$("#hd").css("z-index", "100000");
		$("#container").css("margin", "170 0 0 0");
		$("#hd").css("position", "fixed");
		$("#hd").css("width", "100%");
		$("#hd").css("top", "-100");
	}
	else{
		$("#container").css("margin", "0");
		$("#hd").css("position", "relative");
		$("#hd").css("top", "0");
	};
};

$(document).ready(function (){
	
	$("#load_pad").css({"width":$("body").width(),"height":$("#container").height(),"margin":$("#container").css("margin")});
	$("#load_pic").css("margin-top",$("#load_pad").css("height").toString().replace("px","")/2-100+"px");
	
	
	$("#newButton").click(function(){
		$("#newdis").prepend("<cont><form action=\"forum/discSubmit\" method=\"post\" onsubmit=\"return check()\"><h2>new discussion</h2><table ><tr><td><input type=\"search\" placeholder=\"title\" style=\"background-color: white;color: black;\" id=\"title\" name=\"title\"></td></tr><tr><td><textarea id=\"ct\" placeholder=\"say something\" name=\"content\"></textarea></td></tr><tr><td><input type=\"submit\" value=\"submit\"></td></tr></table><input type=\"hidden\" value=\"GRAND THEFT AUTO V\" id=\"name\" name=\"name\"></form></cont>");
		$("#newButton").attr("disabled", true);
	});
	
	$("#toSearch").click(function() {
		window.location.href="forum/condition?condition="+$("#condition").val()+"&current=1";
	})
	
	if(document.getElementById("newdis").children[0].childElementCount==0){
		$("#pageing").hide();
	}else{
		$("#pageing").show();
	}
});

$(window).load(function (){
	$("#load_pad").css("opacity","0");
	$("#load_pad").css("visibility","hidden");
});

function check()
{
	var title=document.getElementById("title");
	var content=document.getElementById("ct");
	if(title.value==null || title.value=="")
	{
		sAlert("titel is empty","alert","");
		return false;
	}
	if(content.value==null || content.value=="")
	{
		sAlert("content is empty","alert","");
		return false;
	}	
	return true;
}