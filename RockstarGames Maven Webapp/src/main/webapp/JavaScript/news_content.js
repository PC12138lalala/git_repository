/**
 * 
 */
$(document).ready(function(){
	var id=$("#id").attr("value");
	var path="/resource/news_xml/";
	if (window.XMLHttpRequest)
	  {// code for IE7+, Firefox, Chrome, Opera, Safari
	  xmlhttp=new XMLHttpRequest();
	  }
	else
	  {// code for IE6, IE5
	  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	  }
	xmlhttp.open("GET",path+id+".xml",false);
	xmlhttp.send();
	xmlDoc=xmlhttp.responseXML; 
	console.log();
	if(xmlDoc.getElementsByTagName("title_1").length>0 && xmlDoc.getElementsByTagName("title_1")[0].textContent!=""){
		$("#content").prepend("<div class='title title-1'>"+xmlDoc.getElementsByTagName("title_1")[0].textContent+"</div>");
	}
	if(xmlDoc.getElementsByTagName("title_2").length>0 && xmlDoc.getElementsByTagName("title_2")[0].textContent!=""){
		$(".title-1").after("<div class='title title-2'>"+xmlDoc.getElementsByTagName("title_2")[0].textContent+"</div>");
	}
	if(xmlDoc.getElementsByTagName("title_3").length>0 && xmlDoc.getElementsByTagName("title_3")[0].textContent!=""){
		$(".title-2").after("<div class='title title-3'>"+xmlDoc.getElementsByTagName("title_3")[0].textContent+"</div>");
	}
	xmlContent=xmlDoc.getElementsByTagName("content")[0];
	for(i=0;i<xmlContent.childElementCount;i++){
		if(xmlContent.children[i].tagName=="img")
			$("leftArea").append("<img src=/resource/news_xml/pic/"+xmlContent.children[i].textContent+">");
		else{
			$("leftArea").append("<p >"+xmlContent.children[i].textContent+"</p>");
		}
	}
});

function scroll(){
	if($(document).scrollTop()>2){
		$("#hd").css("z-index", "100000");
		$("#content").css("margin", "180 0 0 0");
		$("#hd").css("position", "fixed");
		$("#hd").css("width", "100%");
		$("#hd").css("top", "-100");
	}
	else{
		$("#content").css("margin", "20 0 0 0");
		$("#hd").css("position", "relative");
		$("#hd").css("top", "0");
	};
};