/**
 * 
 */

var per_page = 6;
var current_page = 1;
var varList = {};
var codeList = {};
var picList = {};
var pd = {
	VIDEO_TITLE: "",
	VIDEO_INTRO: ""
};
var is_fetching = false;
var apiURL = apiURL;
var keywords = "";
var VIDEO_TYPE = "";
var picture_url = "";
var video_url = "";
var yulantuurl = "";
var yulantudisplay = "";

function GetQueryString(name) {
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
	var r = window.location.search.substr(1).match(reg);
	if (r != null)
		return unescape(r[2]);
	return null;
}

function greet() {

	var self = this;
	// 重置当前页
	self.current_page = 1;

	var video_id = GetQueryString("VIDEO_ID");
	if (video_id == null || video_id == "") {
		window.location.href = "vrvideo.html";
	}
	var xmlhttp1;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp1 = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp1 = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp1.onreadystatechange = function () {
		if (xmlhttp1.readyState == 4 && xmlhttp1.status == 200) {
			var data = JSON.parse(xmlhttp1.responseText);
			$(".s_h").remove();
			self.picList = data.picList;
			self.pd = data.pd;
			if (self.pd.VIDEO_INTRO != "") {
				var str = self.pd.VIDEO_INTRO
					.replace(new RegExp(
						"\n", "gm"),
						"<br/>");
				str = str.replace(new RegExp(
					" ", "gm"), "&nbsp;");
				self.pd.VIDEO_INTRO = str;
			}
			$("#more_info").append("<p style='padding-top: 10px;'  class='s_h' id='more_info'>" + self.pd.VIDEO_INTRO + "</p>");
			$("#add_title").append("<h2 class='s_h' style='margin-bottom: 0px; margin-top: 0px;'>" + self.pd.VIDEO_TITLE + "</h2>");
			var picture_url = apiURL
				+ data.pd.PICTURE_URL;
			self.picture_url = picture_url;
			if (data.pd.VIDEO_FILE_URL != null
				&& data.pd.VIDEO_FILE_URL != "") {
				var video_url = apiURL
					+ data.pd.VIDEO_FILE_URL;
				self.video_url = video_url;
				var video_type = "video/"
					+ data.pd.VIDEO_FILE_URL
						.substring(
							data.pd.VIDEO_FILE_URL
								.lastIndexOf(".") + 1,
							data.pd.VIDEO_FILE_URL.length);

				videoObject = {
					//playerID:'ckplayer01',//播放器ID，第一个字符不能是数字，用来在使用多个播放器时监听到的函数将在所有参数最后添加一个参数用来获取播放器的内容
					container: '#videosd', //容器的ID或className
					variable: 'player', //播放函数名称
					loaded: 'loadedHandler', //当播放器加载后执行的函数
					loop: false, //播放结束是否循环播放
					autoplay: true, //是否自动播放
					//duration: 500, //设置视频总时间
					cktrack: '', //字幕文件
					poster: picture_url, //封面图片
					//preview: { //预览图片
					//	file: ['material/mydream_en1800_1010_01.png', 'material/mydream_en1800_1010_02.png'],
					//	scale: 2
					//},
					config: '', //指定配置函数
					debug: false, //是否开启调试模式
					flashplayer: true, //强制使用flashplayer
					drag: 'start', //拖动的属性
					seek: 0, //默认跳转的时间
					//playbackrate:1,//默认速度的编号，只对html5有效,设置成-1则不显示倍速
					//advertisements:'website:ad.json',
					//front:'frontFun',//上一集的操作函数
					//next:'nextFun',//下一集的操作函数
					//广告部分开始
					//adfront: 'http://www.ckplayer.com/yytf/swf/front001.swf,http://www.ckplayer.com/yytf/swf/front002.swf', //前置广告
					//adfronttime: '15,15',
					//adfrontlink: '',
					/*adpause: 'http://www.ckplayer.com/yytf/swf/pause001.swf,http://www.ckplayer.com/yytf/swf/pause002.swf',
					adpausetime: '5,5',
					adpauselink: '',
					adinsert: 'http://www.ckplayer.com/yytf/swf/insert001.swf,http://www.ckplayer.com/yytf/swf/insert002.swf',
					adinserttime: '10,10',
					adinsertlink: '',
					inserttime: '10,80',
					adend: 'http://www.ckplayer.com/yytf/swf/end001.swf,http://www.ckplayer.com/yytf/swf/end002.swf',
					adendtime: '15,15',
					adendlink: '',
					//广告部分结束
					promptSpot: [ //提示点
						{
							words: '提示点文字01',
							time: 30
						},
						{
							words: '提示点文字02',
							time: 150
						}
					],*/
					//mobileCkControls:true,//是否在移动端（包括ios）环境中显示控制栏
					//live:true,//是否是直播视频，true=直播，false=点播
					video: [
						[video_url,
							video_type,
							'普通', 10],]
				};


				player = new ckplayer(videoObject);

			}


		}
	}
	xmlhttp1.open("POST", apiURL + "appuser/getAppPictureList.do", true);
	xmlhttp1.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xmlhttp1.send("VIDEO_ID=" + video_id);


	var xmlhttp;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function () {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var data = JSON.parse(xmlhttp.responseText);
			varList = data.varList;
			codeList = data.codeList;

			$(".s_h1").remove();
			for (var i = 0; i < varList.length; i++) {
				$("#other-videos").append("<div class='col-xs-12 col-sm-6 col-md-4 col-lg-4 content-List s_h1' style='padding-left: 0px; padding-right: 0px;' v-cloak><div class='row'><div class='content-div col-xs-10 col-xs-offset-1 col-sm-10 ' ><div><a href='keji.html?VIDEO_ID=" + varList[i].VIDEO_ID + "'><img style='height: 260px; min-height: 150px;' onerror='png/reload.png' src='" + apiURL + varList[i].PICTURE_URL + "'  /></a></div></div>" +
					"<div class='content-div col-xs-10 col-xs-offset-1 col-sm-10' style='padding-left: 10px;'><h2 style='margin-top: 10px;' class='clear'> <a href='keji.html?VIDEO_ID=" + varList[i].VIDEO_ID + "' style='width: 100%'>" + varList[i].VIDEO_TITLE + "</a></h2><h3 style='height: 98px; white-space: normal; margin-top: 20px;'>" + varList[i].VIDEO_INTRO + "</h3></div><div class='col-xs-12' style='margin-bottom: 10px; border-bottom: 1px solid #999899; margin-left: 2%; margin-right: 2%; width: 96%;'></div></div></div>");
			}
			$(".s_h1").remove();
			for (var i = 0; i < varList.length; i++) {
				$("#other-videos").append("<div class='col-xs-12 col-sm-6 col-md-4 col-lg-4 content-List s_h1' style='padding-left: 0px; padding-right: 0px;' v-cloak><div class='row'><div class='content-div col-xs-10 col-xs-offset-1 col-sm-10 ' ><div><a href='keji.html?VIDEO_ID=" + varList[i].VIDEO_ID + "'><img style='height: 260px; min-height: 150px;' onerror='png/reload.png' src='" + apiURL + varList[i].PICTURE_URL + "'  /></a></div></div>" +
					"<div class='content-div col-xs-10 col-xs-offset-1 col-sm-10' style='padding-left: 10px;'><h2 style='margin-top: 10px;' class='clear'> <a href='keji.html?VIDEO_ID=" + varList[i].VIDEO_ID + "' style='width: 100%'>" + varList[i].VIDEO_TITLE + "</a></h2><h3 style='height: 98px; white-space: normal; margin-top: 20px;'>" + varList[i].VIDEO_INTRO + "</h3></div><div class='col-xs-12' style='margin-bottom: 10px; border-bottom: 1px solid #999899; margin-left: 2%; margin-right: 2%; width: 96%;'></div></div></div>");
			}


		}
	}
	xmlhttp.open("POST", apiURL + "appuser/getAppVideoList.do", true);
	xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xmlhttp.send("keywords=" + self.keywords + "&VIDEO_TYPE=" + self.VIDEO_TYPE + "&showCount=" + self.per_page + "&currentPage=" + self.current_page);

	
}

$(window).load(function () {

	greet();

});