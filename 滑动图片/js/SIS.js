/** 

 * @author 作者 Your-Name: 郭鹏程 

 * @version 创建时间：2019年2月19日 下午3:03:43 

 * 滑动相册加载及控制js 

 */
var pindex=1;	/*当前照片指针，页面加载完成初始化为1(第一张)*/
var pnum;	/*照片数量，在程序中初始化*/
var interval;	/*滚动计时器*/
var intervalTime=5000;	/*滚动计时器时间，不给定值则初始化为5000ms*/
var imgRatio=16/9;	/*分辨率,默认16:9*/

$(document).ready(function() {	/*页面加载完成后执行，用于初始化某些参数、动态添加选择条并开启计时器*/
	imgRatio=eval(document.getElementById("SISmainBox").getAttribute("data-ratio").replace(":", "/"));
	document.getElementById("SISmainBox").setAttribute("style", "padding-bottom: "+(document.getElementById("SISmainBox").clientWidth/imgRatio)+"px;")
	intervalTime=document.getElementById("SISmainBox").getAttribute("data-intervalTime");
	var imgs=document.getElementsByName("SISphotos");
	var sISsource=document.getElementsByTagName("SISsource");
	pnum=sISsource.length;
	/*组建向前翻页按钮*/
	var img=document.createElement("img");
	img.setAttribute("id", "slide-img-show-pre-button");
	img.setAttribute("src", "img/1.svg");
	img.setAttribute("onclick", "javascript:changeToPrePhoto()");
	var pre_button=document.createElement("SISpre-button");
	pre_button.appendChild(img);
	/*组建向后翻页按钮*/
	img=document.createElement("img");
	img.setAttribute("id", "slide-img-show-next-button");
	img.setAttribute("src", "img/3.svg");
	img.setAttribute("onclick", "javascript:changeToNextPhoto()");
	var next_button=document.createElement("SISnext-button");
	next_button.appendChild(img);
	var sISmainBox=document.getElementById("SISmainBox");
	/*组建底部*/
	var sISbottom=document.createElement("SISbottom");
	sISbottom.setAttribute("id", "SISbottom");
	var sISbottomWidth=1/pnum*100;
	for(i=0;i<pnum;i++){
		var child=document.createElement("lcolor");
		child.setAttribute("id", "SISlc"+(i+1));
		child.setAttribute("name", "SISlcolor");
		var newElt=document.createElement("c-line");
		newElt.setAttribute("id","SISb"+(i+1));
		newElt.setAttribute("onclick","changeDirect("+(i+1)+")");
		newElt.setAttribute("style","width:calc("+sISbottomWidth+"% - 30px)");
		newElt.appendChild(child);
		sISbottom.appendChild(newElt);
	}
	/*组建*/
	sISmainBox.appendChild(pre_button);
	/*创建图片*/
	for(i=0;i<pnum;i++){
		console.log();
		var mimg=document.createElement("img");
		mimg.setAttribute("id", "SISp"+(i+1));
		mimg.setAttribute("name", "SISphotos");
		mimg.setAttribute("src", sISsource.item(i).getAttribute("src"));
		if(i==0)
			mimg.setAttribute("style", "opacity:1;");
		else
			mimg.setAttribute("style", "opacity:0;");
		sISmainBox.appendChild(mimg);
	}
	/*清楚内容*/
	sISmainBox.appendChild(next_button);
	sISmainBox.appendChild(sISbottom);
	/*开启轮播*/
	
	interval=window.setInterval(function() {
		changeArrow();
		pindex+=1;
		if(pindex==pnum+1)
			pindex=1;
		changeTo(pindex);
	}, intervalTime);
	changeDirect(1);
});

function changeArrow(){	/*点击左右按钮切换图片函数*/
	var img1=document.getElementById("slide-img-show-pre-button");
	var img2=document.getElementById("slide-img-show-next-button");
	var src1=img1.getAttribute("src");
	var src2=img2.getAttribute("src");
	if(src1.substr(src1.lastIndexOf("/")+1, 1)=="1"){
		img1.setAttribute("src", src1.substr(0, src1.lastIndexOf("/")+1)+"0.svg")
		img2.setAttribute("src", src2.substr(0, src2.lastIndexOf("/")+1)+"2.svg")
	}else{
		img1.setAttribute("src", src1.substr(0, src1.lastIndexOf("/")+1)+"1.svg")
		img2.setAttribute("src", src2.substr(0, src2.lastIndexOf("/")+1)+"3.svg")
	}
};
function changeToNextPhoto(){	/*向后翻页*/
	changeArrow();
	pindex+=1;
	if(pindex==pnum+1)
		pindex=1;
	changeTo(pindex);
	clearInterval(interval);
	interval=window.setInterval(function() {
		changeArrow();
		pindex+=1;
		if(pindex==pnum+1)
			pindex=1;
		changeTo(pindex);
	}, intervalTime);
};
function changeToPrePhoto(){	/*向前翻页*/
	changeArrow();
	pindex-=1;
	if(pindex==0)
		pindex=pnum;
	changeTo(pindex);
	clearInterval(interval);
	interval=window.setInterval(function() {
		changeArrow();
		pindex+=1;
		if(pindex==pnum+1)
			pindex=1;
		changeTo(pindex);
	}, intervalTime);
};
function changeDirect(num){	/*直接定位选择的图片*/
	changeArrow();
	pindex=num;
	changeTo(num);
	clearInterval(interval);
	interval=window.setInterval(function() {
		changeArrow();
		pindex+=1;
		if(pindex==pnum+1)
			pindex=1;
		changeTo(pindex);
	}, intervalTime);
}
function changeTo(num){	/*轮播控制函数*/
	var imgs=document.getElementsByName("SISphotos");
	var lcolors=document.getElementsByName("SISlcolor");
	for(i=0;i<pnum;i++){
		if(i+1==num){
			lcolors.item(i).setAttribute("style", "width:100%;transition:width "+intervalTime+"ms;");
			imgs.item(i).setAttribute("style", "opacity:1;")
			continue;
		}
		lcolors.item(i).removeAttribute("style");
		imgs.item(i).setAttribute("style", "opacity:0;");
	}
		
};