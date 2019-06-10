/**
 * 
 */

$(document).ready(function(){
	var app = new Vue(
			{
				el : '#body',
				data : {
					//每页条数
					"per_page" : 6,
					//当前页
					"current_page" : 1,
					varList : {},
					codeList : {},
					picList : {},
					pd : {
						VIDEO_TITLE : "",
						VIDEO_INTRO : ""
					},
					"is_fetching" : false,
					apiURL : apiURL,
					keywords : "",
					VIDEO_TYPE : "",
					picture_url : "",
					video_url : "",
					yulantuurl : "",
					yulantudisplay : "none"
				},
				methods : {
					greet : function() {
						var self = this;
						//重置当前页
						self.current_page = 1;
						$.ajax({
							type : 'POST',
							url : apiURL + "appuser/getAppVideoList.do",
							data : {
								keywords : self.keywords,
								VIDEO_TYPE : self.VIDEO_TYPE,
								showCount : self.per_page,
								currentPage : self.current_page
							},
							success : function(data) {
								self.varList = data.varList;
								self.codeList = data.codeList;

								//lazyload
								echo.init({
									offset : 100,
									throttle : 250,
									unload : false
								});
							},
							dataType : "json"
						});
						var video_id = getQueryString("VIDEO_ID");
						if (video_id == null || video_id == "") {
							window.location.href = "vrvideo.html";
						}
						$
								.ajax({
									type : 'POST',
									url : apiURL
											+ "appuser/getAppPictureList.do",
									data : {
										VIDEO_ID : video_id
									},
									success : function(data) {
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
												container : '#videosd', //容器的ID或className
												variable : 'player', //播放函数名称
												loaded : 'loadedHandler', //当播放器加载后执行的函数
												loop : false, //播放结束是否循环播放
												autoplay : true, //是否自动播放
												//duration: 500, //设置视频总时间
												cktrack : '', //字幕文件
												poster : picture_url, //封面图片
												//preview: { //预览图片
												//	file: ['material/mydream_en1800_1010_01.png', 'material/mydream_en1800_1010_02.png'],
												//	scale: 2
												//},
												config : '', //指定配置函数
												debug : false, //是否开启调试模式
												//flashplayer: true, //强制使用flashplayer
												drag : 'start', //拖动的属性
												seek : 0, //默认跳转的时间
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
												video : [
														[ video_url,
																video_type,
																'普通', 10 ], ]
											};
											player = new ckplayer(
													videoObject);
										}
										//lazyload
										echo.init({
											offset : 100,
											throttle : 250,
											unload : false
										});
									},
									dataType : "json"
								});
					},
					go : function(type) {
						this.VIDEO_TYPE = type;
						this.greet();
					},
					showTU : function(url) {
						this.yulantuurl = url;
						this.yulantudisplay = "block";
					},
					hideTU : function() {
						this.yulantudisplay = "none";
					},
					getMore : function() {
						var self = this;
						if (self.is_fetching) {
							// console.log('已经正在请求');
							dragger.reset();
							return;
						}
						self.is_fetching = true;
						// console.log('发送请求去了');
						self.current_page = self.current_page + 1;
						$
								.ajax({
									type : 'POST',
									url : apiURL
											+ "appuser/getAppVideoList.do",
									data : {
										keywords : self.keywords,
										VIDEO_TYPE : self.VIDEO_TYPE,
										showCount : self.per_page,
										currentPage : self.current_page
									},
									success : function(data) {
										var arry = new Array();
										var dataFlag = true;
										if (data.varList != null) {
											for (var j = 0; j < data.varList.length; j++) {
												for (var i = 0; i < self.varList.length; i++) {
													if (self.varList[i].VIDEO_ID == data.varList[j].VIDEO_ID) {
														dataFlag = false;
														break;
													}
												}
												if (dataFlag) {
													arry
															.push(data.varList[j]);
												}
											}
											if (dataFlag) {
												self.varList = self.varList
														.concat(arry);
												self.is_fetching = false;
											}
										}
										self.codeList = data.codeList;
										dragger.reset();
										//lazyload
										echo.init({
											offset : 100,
											throttle : 250,
											unload : false
										});
									},
									error : function() {
										console.log(_netMsg);
									},
									dataType : "json"
								});
					}
				},
				created : function() {
					this.greet();
				},
			});
	var dragger = new DragLoader(
			document.getElementById('test'),
			{
				dragDownRegionCls : 'latest',
				dragUpRegionCls : 'more',
				disableDragDown : false,
				dragDownHelper : function(status) {
					return '<div style="text-align: center;line-height: 50px;font-weight: 20px;">下拉并没有反应,合上吧,乖～  ╮(￣▽￣)╭</div>';
				},
				dragUpHelper : function(status) {
					if (status == 'default') {
						return '<div style="line-height: 50px;text-align: center">这才是翻页的正确姿势</div>';
					} else if (status == 'prepare') {
						return '<div style="line-height: 50px;text-align: center">放手!放手!我加载还不行嘛?<p style="line-height: 50px;">(╯‵□′)╯︵┻━┻ </p></div>';
					} else if (status == 'load') {
						return '<div style="line-height: 50px;text-align: center">搬运中 _(:3 」∠)_ </div>';
					}
				}
			});
	dragger.on('dragDownLoad', function() {
		console.log('下拉刷新');
		dragger.reset();
	});
	dragger.on('dragUpLoad', function() {
		console.log('上拉刷新');
		app.getMore();
	});

	function loadedHandler() {
		player.addListener('error', errorHandler); //监听视频加载出错
	}

	function errorHandler() {
		console.log('出错')
		//changeText('.playerstate', '状态：视频加载错误，停止执行其它动作，等待其它操作');
	}

	function newVideo() {
		var videoUrl = player.getByElement('.videourl').value;
		changeVideo(videoUrl);
	}

	function newVideo2() {
		var videoUrl = player.getByElement('.videourl2').value;
		changeVideo(videoUrl);
	}

	function changeVideo(videoUrl) {
		if (player == null) {
			return;
		}

		var newVideoObject = {
			container : '#videosd', //容器的ID
			variable : 'player',
			autoplay : true, //是否自动播放
			loaded : 'loadedHandler', //当播放器加载后执行的函数
			video : videoUrl
		}
		//判断是需要重新加载播放器还是直接换新地址

		if (player.playerType == 'html5video') {
			if (player.getFileExt(videoUrl) == '.flv'
					|| player.getFileExt(videoUrl) == '.m3u8'
					|| player.getFileExt(videoUrl) == '.f4v'
					|| videoUrl.substr(0, 4) == 'rtmp') {
				player.removeChild();
				player = null;
				player = new ckplayer();
				player.embed(newVideoObject);
			} else {
				player.newVideo(newVideoObject);
			}
		} else {
			if (player.getFileExt(videoUrl) == '.mp4'
					|| player.getFileExt(videoUrl) == '.webm'
					|| player.getFileExt(videoUrl) == '.ogg') {
				player = null;
				player = new ckplayer();
				player.embed(newVideoObject);
			} else {
				player.newVideo(newVideoObject);
			}
		}
	}
});