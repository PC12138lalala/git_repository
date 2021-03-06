/**

 * @author 作者 Your-Name: 郭鹏程

 * @version 创建时间：2019年2月19日 下午3:03:43

 * 滑动相册加载及控制js

 */

var SISImgPath = "img/SIS_img/";	/*图片文件存放位置*/
var pindex = 1;	/*当前照片指针，页面加载完成初始化为1(第一张)*/
var pnum;	/*照片数量，在程序中初始化*/
var SISinterval;	/*滚动计时器*/
var SISintervalTime = 5000;	/*滚动计时器时间，不给定值则初始化为5000ms*/
var imgRatio = 16 / 9;	/*分辨率,默认16:9*/
var SISBoxWidth;	/*盒子宽度，默认为70%*/
var SISType = "z";	/*SIS滑动类型,默认为z*/
var XImgtransitionDuration = "300ms";	/*SIS x轴滚动默认时间*/


/*
* 页面加载完成后执行，用于初始化某些参数、动态添加选择条并开启计时器
*/

$(window).on("load", function () {
    SISType = document.getElementById("SISMainBox").getAttribute("data-type").toLowerCase();
    imgRatio = eval(document.getElementById("SISMainBox").getAttribute("data-ratio").replace(":", "/"));
    SISBoxWidth = document.getElementById("SISMainBox").getAttribute("data-box-width");
    if (SISBoxWidth != "") {
        if (/^[1,2,3,4,5,6,7,8,9](\d{0,1}||00)%$/.test(SISBoxWidth) || /^\d{1,5}px$/.test(SISBoxWidth)) {
            $("#SISMainBox").css("width", SISBoxWidth);
            if (/^[1,2,3,4,5,6,7,8,9](\d{0,1}||00)%$/.test(SISBoxWidth))
                $("#SISMainBox").css("padding-bottom", SISBoxWidth.replace("%", "") / 100 / imgRatio * 100 + "%");
            else
                $("#SISMainBox").css("padding-bottom", $("#SISMainBox").css("width").replace("px", "") / imgRatio + "px");
        }

    }

    SISintervalTime = document.getElementById("SISMainBox").getAttribute("data-intervalTime");
    var sISsource = document.getElementsByTagName("SISsource");
    pnum = sISsource.length;
    if (SISType == "z") {
        $("#SISMainBox").addClass("z-slide-img-show");
        /*组建向前翻页按钮*/
        var img = document.createElement("img");
        img.setAttribute("id", "slide-img-show-pre-button");
        img.setAttribute("src", SISImgPath + "0.svg");
        img.setAttribute("onclick", "javascript:z_changeToPrePhoto()");
        var pre_button = document.createElement("SISpre-button");
        pre_button.appendChild(img);
        /*组建向后翻页按钮*/
        img = document.createElement("img");
        img.setAttribute("id", "slide-img-show-next-button");
        img.setAttribute("src", SISImgPath + "2.svg");
        img.setAttribute("onclick", "javascript:z_changeToNextPhoto()");
        var next_button = document.createElement("SISnext-button");
        next_button.appendChild(img);
        var sISmainBox = document.getElementById("SISMainBox");
        /*组建底部*/
        var sISbottom = document.createElement("SISbottom");
        sISbottom.setAttribute("id", "SISbottom");
        var sISbottomWidth = 1 / pnum * 100;
        for (i = 0; i < pnum; i++) {
            var child = document.createElement("lcolor");
            child.setAttribute("id", "SISlc" + (i + 1));
            child.setAttribute("name", "SISlcolor");
            var newElt = document.createElement("c-line");
            newElt.setAttribute("id", "SISb" + (i + 1));
            newElt.setAttribute("onclick", "z_changeDirect(" + (i + 1) + ")");
            newElt.setAttribute("style", "width:calc(" + sISbottomWidth + "% - 30px)");
            newElt.appendChild(child);
            sISbottom.appendChild(newElt);
        }
        /*组建*/
        sISmainBox.appendChild(pre_button);
        sISmainBox.appendChild(next_button);
        sISmainBox.appendChild(sISbottom);

        /*创建图片*/
        for (var i = 0; i < pnum; i++) {
            var mimg = document.createElement("img");
            mimg.setAttribute("id", "SISp" + (i + 1));
            mimg.setAttribute("name", "SISphotos");
            mimg.setAttribute("src", sISsource.item(i).getAttribute("psrc"));
            if (i == 0)
                mimg.setAttribute("style", "opacity:1;");
            else
                mimg.setAttribute("style", "opacity:0;");
            sISmainBox.appendChild(mimg);
        }
        /*开启轮播*/
        z_changeDirect(1);

    } else if (SISType == "x-left" || SISType == "x-right") {
        $("#SISMainBox").addClass("x-slide-img-show");
        /*组建向前翻页按钮*/
        var img = document.createElement("img");
        img.setAttribute("id", "slide-img-show-pre-button");
        img.setAttribute("src", SISImgPath + "0.svg");
        img.setAttribute("onclick", "javascript:x_changeToPrePhoto()");
        var pre_button = document.createElement("SISpre-button");
        pre_button.appendChild(img);
        /*组建向后翻页按钮*/
        img = document.createElement("img");
        img.setAttribute("id", "slide-img-show-next-button");
        img.setAttribute("src", SISImgPath + "2.svg");
        img.setAttribute("onclick", "javascript:x_changeToNextPhoto()");
        var next_button = document.createElement("SISnext-button");
        next_button.appendChild(img);
        var sISmainBox = document.getElementById("SISMainBox");
        /*组建底部*/
        var sISbottom = document.createElement("SISbottom");
        sISbottom.setAttribute("id", "SISbottom");
        var sISbottomWidth = 1 / pnum * 100;
        for (i = 0; i < pnum; i++) {
            var child = document.createElement("lcolor");
            child.setAttribute("id", "SISlc" + (i + 1));
            child.setAttribute("name", "SISlcolor");
            var newElt = document.createElement("c-line");
            newElt.setAttribute("id", "SISb" + (i + 1));
            newElt.setAttribute("onclick", "x_changeDirect(" + (i + 1) + ")");
            newElt.setAttribute("style", "width:calc(" + sISbottomWidth + "% - 30px)");
            newElt.appendChild(child);
            sISbottom.appendChild(newElt);
        }
        /*组建*/
        sISmainBox.appendChild(pre_button);
        sISmainBox.appendChild(next_button);
        sISmainBox.appendChild(sISbottom);
        /*创建图片*/
        var x_img_content = document.createElement("x-img-content");
        x_img_content.setAttribute("id", "x-img-content");
        x_img_content.setAttribute("style", "transform: translate3d(0px, 0px, 0px);transition-timing-function: ease;transition-duration: " + XImgtransitionDuration + ";");
        sISmainBox.appendChild(x_img_content);
        for (var i = 0; i < pnum; i++) {
            var mimg = document.createElement("img");
            mimg.setAttribute("id", "SISp" + (i + 1));
            mimg.setAttribute("name", "SISphotos");
            mimg.setAttribute("src", sISsource.item(i).getAttribute("psrc"));
            x_img_content.appendChild(mimg);
            var content_box = document.createElement("content_box");
            var content_box_title = document.createElement("title");
            content_box_title.innerText = sISsource.item(i).getAttribute("ptitle");
            var content_box_sub_title = document.createElement("sub_title");
            content_box_sub_title.innerText = sISsource.item(i).getAttribute("pstitle");
            var content_box_eng = document.createElement("eng");
            content_box_eng.innerHTML = sISsource.item(i).getAttribute("peng");
            var content_box_b_area = document.createElement("b_area");
            var button = document.createElement("button");
            button.innerHTML = "了解更多";
            button.setAttribute("onclick", "window.location.href='" + sISsource.item(i).getAttribute("phref") + "'")
            content_box_b_area.appendChild(button);

            content_box.appendChild(content_box_title);
            content_box.appendChild(content_box_sub_title);
            content_box.appendChild(content_box_eng);
            content_box.appendChild(content_box_b_area);
            content_box.setAttribute("style", "left:calc(17% + " + i * $("#x-img-content").width() + "px);");
            x_img_content.appendChild(content_box);

        }
        /*开启轮播*/
        x_changeDirect(1);
    }
    /*删除废弃标签*/
    for (i = 0; i < pnum; i++)
        sISmainBox.removeChild(sISsource[0]);


});


/*
* 点击左右按钮切换图片函数
*/
function z_changeArrow() {
    var img1 = document.getElementById("slide-img-show-pre-button");
    var img2 = document.getElementById("slide-img-show-next-button");
    var src1 = img1.getAttribute("src");
    var src2 = img2.getAttribute("src");
    if (src1.substr(src1.lastIndexOf("/") + 1, 1) == "1") {
        img1.setAttribute("src", src1.substr(0, src1.lastIndexOf("/") + 1) + "0.svg");
        img2.setAttribute("src", src2.substr(0, src2.lastIndexOf("/") + 1) + "2.svg");
    } else {
        img1.setAttribute("src", src1.substr(0, src1.lastIndexOf("/") + 1) + "0.svg");
        img2.setAttribute("src", src2.substr(0, src2.lastIndexOf("/") + 1) + "2.svg");
    }
}


/*
* 向后翻页
*/
function z_changeToNextPhoto() {
    z_changeArrow();
    pindex += 1;
    if (pindex == pnum + 1)
        pindex = 1;
    z_changeTo(pindex);
    clearInterval(SISinterval);
    SISinterval = window.setInterval(function () {
        z_changeArrow();
        pindex += 1;
        if (pindex == pnum + 1)
            pindex = 1;
        z_changeTo(pindex);
    }, SISintervalTime);
}

function x_changeToNextPhoto() {
    z_changeArrow();
    pindex += 1;
    if (pindex == pnum + 1)
        pindex = 1;
    x_changeTo(pindex);
    clearInterval(SISinterval);
    SISinterval = window.setInterval(function () {
        z_changeArrow();
        pindex += 1;
        if (pindex == pnum + 1)
            pindex = 1;
        x_changeTo(pindex);
    }, SISintervalTime);
}


/*
* 向前翻页
*/
function z_changeToPrePhoto() {
    z_changeArrow();
    pindex -= 1;
    if (pindex == 0)
        pindex = pnum;
    z_changeTo(pindex);
    clearInterval(SISinterval);
    SISinterval = window.setInterval(function () {
        z_changeArrow();
        pindex += 1;
        if (pindex == pnum + 1)
            pindex = 1;
        z_changeTo(pindex);
    }, SISintervalTime);
}

function x_changeToPrePhoto() {
    z_changeArrow();
    pindex -= 1;
    if (pindex == 0)
        pindex = pnum;
    x_changeTo(pindex);
    clearInterval(SISinterval);
    SISinterval = window.setInterval(function () {
        z_changeArrow();
        pindex += 1;
        if (pindex == pnum + 1)
            pindex = 1;
        x_changeTo(pindex);
    }, SISintervalTime);
}

/*
* 直接定位选择的图片
*/
function z_changeDirect(num) {
    if (num != pindex) {
        z_changeArrow();
        pindex = num;
        clearInterval(SISinterval);
        z_changeTo(num);
        SISinterval = window.setInterval(function () {
            z_changeArrow();
            pindex += 1;
            if (pindex == pnum + 1)
                pindex = 1;
            z_changeTo(pindex);
        }, SISintervalTime);
    } else {
        var lcolors = document.getElementsByName("SISlcolor");
        lcolors.item(num - 1).setAttribute("style", "width:1 px;");
        window.setTimeout(function () {
            lcolors.item(num - 1).setAttribute("style", "width:100%;transition:width " + SISintervalTime + "ms linear;");
            clearInterval(SISinterval);
            SISinterval = window.setInterval(function () {
                z_changeArrow();
                pindex += 1;
                if (pindex == pnum + 1)
                    pindex = 1;
                z_changeTo(pindex);
            }, SISintervalTime);
        }, 10);

    }
}

function x_changeDirect(num) {

    if (num != pindex) {
        z_changeArrow();
        clearInterval(SISinterval);
        x_changeTo(num);
        pindex = num;
        SISinterval = window.setInterval(function () {
            z_changeArrow();
            pindex += 1;
            if (pindex == pnum + 1)
                pindex = 1;
            x_changeTo(pindex);
        }, SISintervalTime);
    } else {
        var lcolors = document.getElementsByName("SISlcolor");
        lcolors.item(num - 1).setAttribute("style", "width:1 px;");
        window.setTimeout(function () {
            lcolors.item(num - 1).setAttribute("style", "width:100%;transition:width " + SISintervalTime + "ms linear;");
            clearInterval(SISinterval);
            SISinterval = window.setInterval(function () {
                z_changeArrow();
                pindex += 1;
                if (pindex == pnum + 1)
                    pindex = 1;
                x_changeTo(pindex);
            }, SISintervalTime);
        }, 10);

    }
}

/*
* 轮播控制函数
*/
function z_changeTo(num) {

    $("img[name='SISphotos']").eq(num - 1).css("opacity", "1").siblings("img[name='SISphotos']").css("opacity", "0");
    $("c-line").eq(num - 1).children(0).css({
        "width": "100%",
        "transition": "width " + SISintervalTime + "ms linear"
    }).parent().siblings("c-line").children(0).removeAttr("style");

}

function x_changeTo(num) {

    var width = $("#x-img-content").width();
    $("#x-img-content").css({
        "transform": "translate3d(" + (-num + 1) * width + "px, 0px, 0px)",
        "transition-timing-function": "ease",
        "transition-duration": XImgtransitionDuration
    });
    $("c-line").eq(num - 1).children(0).css({
        "width": "100%",
        "transition": "width " + SISintervalTime + "ms linear"
    }).parent().siblings("c-line").children(0).removeAttr("style");
}