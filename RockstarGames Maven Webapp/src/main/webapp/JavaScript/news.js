/**
 * 
 */

function addItem(id,likes){
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
	
	var img=(xmlDoc.getElementsByTagName("img").length!=0)?"<img src=/resource/news_xml/pic/"+xmlDoc.getElementsByTagName("img")[0].textContent+">":"";
	
	if(xmlDoc.getElementsByTagName("rank")[0].textContent>=3){
		$("#content").append("<div class='block block-"+xmlDoc.getElementsByTagName("rank")[0].textContent+"'>" +
				"<title-l><h2>"+xmlDoc.getElementsByTagName("title_1")[0].textContent+"</h2></title-l>" +
				"<title-s>"+xmlDoc.getElementsByTagName("title_2")[0].textContent+"</title-s>"+
				 img+
				"<div class='content-b content-b-"+xmlDoc.getElementsByTagName("rank")[0].textContent+"'>"+xmlDoc.getElementsByTagName("p")[0].textContent+"</div>" +
				"<input type='button' class='rm-button' value='read more' onclick=window.location.href=&apos;news/content?id="+id+"&apos;>"+
				"<div class='info-bottom'><favs>"+likes+"</favs><share> Share</share><discuss> Discuss</discuss></div></div>");
	}else if(xmlDoc.getElementsByTagName("rank")[0].textContent>=2){
		$("#content").append("<div class='block block-"+xmlDoc.getElementsByTagName("rank")[0].textContent+"'>" +
				"<title-l><h2>"+xmlDoc.getElementsByTagName("title_1")[0].textContent+"</h2></title-l>" +
				img +
				"<div class='content-b content-b-"+xmlDoc.getElementsByTagName("rank")[0].textContent+"'>"+xmlDoc.getElementsByTagName("p")[0].textContent+"</div>" +
				"<a href='news/content?id="+id+"'>READ MORE</a>"+
				"<div class='info-bottom'><favs>"+likes+"</favs><share> Share</share><discuss> Discuss</discuss></div></div>");
	}
	else{
		$("#content").append("<div class='block block-"+xmlDoc.getElementsByTagName("rank")[0].textContent+"'>" +
				img +
				"<div class='content-b content-b-"+xmlDoc.getElementsByTagName("rank")[0].textContent+"'>"+xmlDoc.getElementsByTagName("p")[0].textContent+"</div>" +
				"<a href='news/content?id="+id+"'>READ MORE</a>"+
				"<div class='info-bottom'><favs>"+likes+"</favs><share> Share</share><discuss> Discuss</discuss></div></div>");
	}
	
		
	var nid="#g_"+id;
	$(nid).remove();
}

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

$(document).ready(function(){
	$("#load_pad").css({"width":$("body").width(),"height":$("#content").height(),"margin":$("#content").css("margin")});
	$("#load_pic").css("margin-top",$("#load_pad").css("height").toString().replace("px","")/2-100+"px");
	
});

$(window).load(function (){
	$("#load_pad").css("opacity","0");
	$("#load_pad").css("visibility","hidden");
});