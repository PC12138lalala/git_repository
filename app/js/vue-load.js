/**
 * 
 */

$(document).ready(function(){
	
	$("#backgd").attr("href","http://"+window.location.host+"/VIDEOMANAGER/");
	
	var app = new Vue({
		el: '#body',
		data: {
			//每页条数
			"per_page": 6,
			//当前页
			"current_page": 1,
			"prev_page_url": null,
			"from": 1,
			"to": 16,
			varList: {},
			codeList: {},
			"is_fetching": false,
			apiURL: apiURL,
			keywords: "",
			VIDEO_TYPE: ""
		},
		methods: {
			greet: function() {
				var self = this;
				//重置当前页
				self.current_page = 1;
				$.ajax({
					type: 'POST',
					url: apiURL + "appuser/getAppVideoList.do",
					data: {
						keywords: self.keywords,
						VIDEO_TYPE: self.VIDEO_TYPE,
						showCount: self.per_page,
						currentPage: self.current_page
					},
					success: function(data) {
						self.varList = data.varList;
						self.codeList = data.codeList;
						//lazyload
						echo.init({
							offset: 100,
							throttle: 250,
							unload: false
						});
					},
					dataType: "json"
				});
			},
			go: function(type) {
				this.VIDEO_TYPE = type;
				this.greet();
				this.VIDEO_TYPE = type;
				this.greet();
			},
			getMore: function() {
				var self = this;
				if(self.is_fetching) {
					// console.log('已经正在请求');
					dragger.reset();
					return;
				}
				self.is_fetching = true;
				// console.log('发送请求去了');
				self.current_page = self.current_page + 1;
				$.ajax({
					type: 'POST',
					url: apiURL + "appuser/getAppVideoList.do",
					data: {
						keywords: self.keywords,
						VIDEO_TYPE: self.VIDEO_TYPE,
						showCount: self.per_page,
						currentPage: self.current_page
					},
					success: function(data) {
						var arry = new Array();
						var dataFlag = true;
						if(data.varList != null){
							for (var j = 0;j<data.varList.length;j++) {
								for(var i = 0;i < self.varList.length;i++){
									if(self.varList[i].VIDEO_ID == data.varList[j].VIDEO_ID){
										dataFlag = false;
										break;
									}
								}
								if(dataFlag){
									arry.push(data.varList[j]);
								}
							}
							if(dataFlag){
								self.varList = self.varList.concat(arry);
								self.is_fetching = false;
							}
						}
						self.codeList = data.codeList;
						dragger.reset();
						//lazyload
						echo.init({
							offset: 100,
							throttle: 250,
							unload: false
						});
					},
					error: function(){
						console.log(_netMsg);
					},
					dataType: "json"
				});
			}
		},
		created: function() {
			this.greet();
		},
	});

	var dragger = new DragLoader(document.getElementById('test'), {
		dragDownRegionCls: 'latest',
		dragUpRegionCls: 'more',
		disableDragDown: false,
		dragDownHelper: function(status) {
			return '<div style="text-align: center;line-height: 50px;font-weight: 20px;">下拉并没有反应,合上吧,乖～  ╮(￣▽￣)╭</div>';
		},
		dragUpHelper: function(status) {
			if(status == 'default') {
				return '<div style="line-height: 50px;text-align: center">这才是翻页的正确姿势</div>';
			} else if(status == 'prepare') {
				return '<div style="line-height: 50px;text-align: center">放手!放手!我加载还不行嘛?<p style="line-height: 50px;">(╯‵□′)╯︵┻━┻ </p></div>';
			} else if(status == 'load') {
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
});