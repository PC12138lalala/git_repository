// index.js
$(function(){
	document.getElementById('close').onclick=function(){
		document.getElementById('off').style.display="none";
	};
	function isWeiXin(){
		var ua = window.navigator.userAgent.toLowerCase();
		if(ua.match(/MicroMessenger/i) == 'micromessenger'){
			return true;
		}else{
			return false;
		}
	}
	document.getElementById('downer').onclick=function(){
		var u = navigator.userAgent;//userAgent 属性是一个只读的字符串，声明了浏览器用于 HTTP 请求的用户代理头的值。
		if(isWeiXin()){
			location.href = "http://www.hotcast.cn/download/download.html";
		} else {
			if(u.indexOf('Android') > -1 || u.indexOf('Adr') > -1){
				location.href ="http://cdn.hotcast.cn/APP/android/hotcast.apk";
			}else{
				location.href="https://itunes.apple.com/cn/app/vr-re-bo/id1068803497?mt=8&uo=4";
			}
		}

	};

})
// channel
// index.js
$(function(){
	$('.nav').click(function(){
		if($('.nav-div').css('display')=='none'){
			$('.nav-div').fadeIn();
		}else{
			$('.nav-div').fadeOut();
		}
	});
	$dragBln = false;

	$(".main_image").touchSlider({
		flexible : true,
		speed : 200,
		btn_prev : $("#btn_prev"),
		btn_next : $("#btn_next"),
		paging : $(".flicking_con a"),
		counter : function (e){
			$(".flicking_con a").removeClass("on").eq(e.current-1).addClass("on");
		}
	});

	$(".main_image").bind("mousedown", function() {
		$dragBln = false;
	});

	$(".main_image").bind("dragstart", function() {
		$dragBln = true;
	});

	$(".main_image a").click(function(){
		if($dragBln) {
			return false;
		}
	});

	timer = setInterval(function(){
		$("#btn_next").click();
	}, 5000);

	$(".main_visual").hover(function(){
		clearInterval(timer);
	},function(){
		timer = setInterval(function(){
			$("#btn_next").click();
		},2000);
	});

	$(".main_image").bind("touchstart",function(){
		clearInterval(timer);
	}).bind("touchend", function(){
		timer = setInterval(function(){
			$("#btn_next").click();
		}, 2000);
	});
	
	
	// document.getElementById('close').onclick=function(){
	// 	document.getElementById('off').style.display="none";
	// };
	// $("#downer").on("click",function(){
	// 	var u = navigator.userAgent;//userAgent 属性是一个只读的字符串，声明了浏览器用于 HTTP 请求的用户代理头的值。
	// 	if(u.indexOf('Android') > -1 || u.indexOf('Adr') > -1){
	// 		location.href ="http://cdn.hotcast.cn/APP/android/hotcast_v1_0_5.apk";
	// 	}else{
	// 		location.href="https://itunes.apple.com/cn/app/vr-re-bo/id1068803497?mt=8&uo=4";
	// 	}
	// });
})
/**
 * Created by lv on 16/3/30.
 */
function play_video(jsonMessage) {
	alert(jsonMessage);
    /*
     * 智能机浏览器版本信息:
     *
     */
    //window.android.transferParameter(jsonMessage);
    /**
     var jsonMessage = {
        "clientName":"VR热播",
        "playerNumbers":12352,
        "resourcesCoverImg":"http://hotcast-nas.oss-cn-beijing.aliyuncs.com/image%2F20160305%2F56da81102bc05%2F375_229_shuangyuzuo20160304.jpg",
        "resourcesId":"asd5425dsefds",
        "resourcesIntroduce":"%E7%9B%B4%E6%92%AD%E8%B5%84%E6%BA%90%E4%BB%8B%E7%BB%8D%E5%86%85%E5%AE%B9",
        "resourcesSubTitle":"%E7%9B%B4%E6%92%AD%E8%B5%84%E6%BA%90%E5%89%AF%E6%A0%87%E9%A2%98",
        "resourcesTitle":"%E7%9B%B4%E6%92%AD%E8%B5%84%E6%BA%90%E6%A0%87%E9%A2%98",
        "resourcesUrl":"video/videoviewdemo.mp4",
        "resourceMp3":"http%3A%2F%2Fcdn.hotcast.cn%2Fimport%252F201607214%252Fmp3%252Fzybj220160721.mp3"
    };
     **/
    var browser = {
        versions: function() {
            var u = navigator.userAgent, app = navigator.appVersion;
            return {//移动终端浏览器版本信息
                trident: u.indexOf('Trident') > -1, //IE内核
                presto: u.indexOf('Presto') > -1, //opera内核
                webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核
                gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核
                mobile: !!u.match(/AppleWebKit.*Mobile.*/) || !!u.match(/AppleWebKit/), //是否为移动终端
                ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端
                android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或者uc浏览器
                iPhone: u.indexOf('iPhone') > -1 || u.indexOf('Mac') > -1, //是否为iPhone或者QQHD浏览器
                iPad: u.indexOf('iPad') > -1, //是否iPad
                webApp: u.indexOf('Safari') == -1 //是否web应该程序，没有头部与底部
            };
        }(),
        language: (navigator.browserLanguage || navigator.language).toLowerCase()
    }

    //window.location.href="http://wechat.hotcast.cn/web/m_play/m_play1.html?param="+jsonMessage;
    // window.location.href="http://wechat.hotcast.cn/web/m_play/m_play.html?"+jsonMessage;
    window.location.href=jsonMessage;
    //window.open("http://wechat.hotcast.cn/web/m_play/m_play.html?param="+jsonMessage);
    if (browser.versions.ios || browser.versions.iPhone || browser.versions.iPad) {
        ios_player(jsonMessage);
    }
    else if (browser.versions.android) {
        javascript:android.transferParameter(jsonMessage);
    }else{
        //window.location.href="http://wechat.hotcast.cn/web/m_play/m_play1.html?param="+jsonMessage;
        // window.location.href="http://wechat.hotcast.cn/web/m_play/m_play.html?"+jsonMessage;
        window.location.href=jsonMessage;
    }

// document.writeln("语言版本: " + browser.language);
// document.writeln(" 是否为移动终端: " + browser.versions.mobile);
// document.writeln(" ios终端: " + browser.versions.ios);
// document.writeln(" android终端: " + browser.versions.android);
// document.writeln(" 是否为iPhone: " + browser.versions.iPhone);
// document.writeln(" 是否iPad: " + browser.versions.iPad);
// document.writeln(navigator.userAgent);
}


// special.js
$(function(){
	$('.bg').css('height',window.innerHeight);
	$('.bg_1').css('height',window.innerHeight);
	
})


 
//# sourceMappingURL=all.js.map
