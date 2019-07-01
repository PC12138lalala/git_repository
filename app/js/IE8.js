/**
 * 
 */
var per_page = 6;
var current_page = 1;
var prev_page_url = null;
var from = 1;
var to = 16;
var varList = {};
var codeList = {};
var is_fetching = false;
var apiURL = apiURL;
var keywords = "";
var VIDEO_TYPE = "";
var data ;


function greet() {
	
	var self = this;
	// 重置当前页
	self.current_page = 1;
			
	var xmlhttp;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var data=JSON.parse(xmlhttp.responseText);
			self.varList = data.varList;
			self.codeList = data.codeList;
			$(".s_h").remove();
			
			$("#search_area").append("<div class='s_h' style='float:right;width: 20px;height: 20px;margin: 20px 20px 0 0;position: absolute;right: 0px;bottom: 10px;'><img src='png/search.png' onclick='javascript:search()' style='width:20px;height:20px;float:left;cursor:pointer;'></div>")
			$("#codeList").append("<li class='s_h'><a  onclick='javascript:queryAll()'>全部</a></li>");
			
			for(var i = 0; i<codeList.length;i++)
				$("#codeList").append("<li class='s_h'><a onclick='javascript:go("+codeList[i].VALUE+")'>"+codeList[i].TEXT+"</a></li>");
			
			for(var i = 0; i<varList.length;i++)
				$("#other-videos").append("<div class='col-xs-10 col-xs-offset-1 col-sm-6 col-sm-offset-0 col-md-4 col-lg-4 s_h'><div class='content-div'><div><a href='keji.html?VIDEO_ID="+varList[i].VIDEO_ID+"'><img src='"+apiURL+varList[i].PICTURE_URL+"' onerror='png/reload.png' alt='' style='height: 260px; min-height: 150px;'></a></div> <h2 class='clear'><a href='keji.html?VIDEO_ID="+varList[i].VIDEO_ID+"' style='width: 100%;'>"+varList[i].VIDEO_TITLE+"</a></h2> <h3>"+varList[i].VIDEO_INTRO+"</h3></div></div>");
			
			
		}
	}
	xmlhttp.open("POST", apiURL + "appuser/getAppVideoList.do", true);
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded"); 
	xmlhttp.send("keywords="+self.keywords+"&VIDEO_TYPE="+self.VIDEO_TYPE+"&showCount="+self.per_page+"&currentPage="+self.current_page);		
	
}

function go(type){
	this.VIDEO_TYPE=type;
	greet();
	this.VIDEO_TYPE=type;
	greet();
}

function queryAll(){
	this.current_page = 1;
	this.VIDEO_TYPE = "";
	this.keywords="";
	greet();
}

function search(){
	this.keywords=$("#search_box").val();
	greet();
	$("#search_box").attr("value","");
	$("#search_box").val("");
}

$(window).load(function() {
	greet();
	$("#backgd").attr("href","http://"+window.location.host+"/VIDEOMANAGER/");
	$("#search_box").keydown(function(event) {
		if (event.keyCode == 13) {
			search();
		}
	});
});
