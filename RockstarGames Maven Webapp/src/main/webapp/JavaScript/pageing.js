/**
 * 
 */
$(document).ready(function() {
	if($("#current").attr("value")<=1 || $("#current").attr("value")==undefined){
		$("#pre").attr("disabled", "disabled");
		$("#pre").css("backgroundColor", "gray");
		$("#pre").css("color", "white");
		
	}
	if($("#current").attr("value")>=$("#totalPage").attr("value") || $("#current").attr("value")==undefined){
		$("#next").attr("disabled", "disabled");
		$("#next").css("backgroundColor", "gray");
		$("#next").css("color", "white");
	}
	var current=parseInt($("#current").attr("value"));
	var min=function(){
		if (current-2>0)
			return current-2;
		else if(current -2 == 0)
			return current-1;
		else
			return current;
	};
	var max = function (){
		if(current + 2 <parseInt($("#totalPage").attr("value")))
			return current+2;
		else 
			return parseInt($("#totalPage").attr("value"));
	};
	var index=min();
	var maxpage=max();
	if(index>1){
		var elem=$("<button></button>").text("...");
		$("#span").before(elem);
	}
	for(;index<=maxpage;index++){
		var elem=$("<button id=\"p"+index+"\" onclick=\"window.location.href='"+$("#target").attr("value")+"&current="+index+"'\"></button>").text(index);
		$("#span").before(elem);
	}
	if(index-1 <parseInt($("#totalPage").attr("value"))){
		var elem=$("<button></button>").text("...");
		$("#span").before(elem);
	}
	$("#total").text($("#totalPage").attr("value"));
	$("#p"+current).css("backgroundColor","#04cafb");
	$("#p"+current).css("color","white");
});
function TO(){
	var reg=/^[0-9]+$/;
	if(reg.test($("#jumpTo").attr("value"))){
		if(parseInt($("#jumpTo").attr("value")) >0 && parseInt($("#jumpTo").attr("value"))<= parseInt($("#totalPage").attr("value")))
			window.location.href=$("#target").attr("value")+"&current="+parseInt($("#jumpTo").attr("value"));
		else
			alert("out of range")
	}
	else
		alert("error input")
}