var apiURL = "http://192.168.200.149:8080/VIDEOMANAGER/";
//服务器apiURL
//var apiURL = "http://47.93.39.174:8085/";
//文件服务器URL


function openWindow(url, data) {
	mui.openWindow({
		url: url,
		createNew: true,
		extras: data,
		waiting: {
			autoShow: true, //自动显示等待框，默认为true
			title: '正在加载...', //等待对话框上显示的提示内容
		}
	});
}

function getQueryString(name) {
    var reg = new RegExp('(^|&)' + name + '=([^&]*)(&|$)', 'i');
    var r = window.location.search.substr(1).match(reg);
    if (r != null) {
        return unescape(r[2]);
    }
    return null;
}

var _netMsg = "系统异常，请检查手机网络状况" /*断网时的error message*/

