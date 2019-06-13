var c_year, i_year;
var xmlDoc;

$(document).ready(function () {

    var xmlhttp;
    if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    } else {// code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.open("GET", "xml/MainInfo.xml", false);
    xmlhttp.send();
    xmlDoc = xmlhttp.responseXML;

    for (i = 0; i < xmlDoc.getElementsByTagName("year").length; i++) {
        $("#c_year").append("<li name='c_year' onclick='javascript:c_change(" + xmlDoc.getElementsByTagName("year")[i].getAttribute("y") + ")'>" + xmlDoc.getElementsByTagName("year")[i].getAttribute("y") + "</li>");
        $("#i_year").append("<li name='i_year' onclick='javascript:i_change(" + xmlDoc.getElementsByTagName("year")[i].getAttribute("y") + ")'>" + xmlDoc.getElementsByTagName("year")[i].getAttribute("y") + "</li>");
    }
    i_year = c_year = xmlDoc.getElementsByTagName("year")[0].getAttribute("y").toString();

    $("#c_year").children().eq(0).css("background", "url(img/tabs_bg.png)");
    $("#i_year").children().eq(0).css("background", "url(img/tabs_bg.png)");

    $("li[name='c_year']").click(function () {
        $(this).css("background", "url(img/tabs_bg.png)").siblings("li").css("background", "url()");
    });
    $("li[name='i_year']").click(function () {
        $(this).css("background", "url(img/tabs_bg.png)").siblings("li").css("background", "url()");
    });

    change(c_year, "#c_e");
    change(i_year, "#i_e");
});

function change(year, type) {
    var now = xmlDoc.getElementsByTagName("year");
    for (var i = 0; i < now.length; i++)
        if (now[i].getAttribute("y") == year) {
            now = now[i];
            break;
        }
    if (type == "#c_e") {
        var a = now.getElementsByTagName("community")[0];
        $(type).append("<div class='big_img'><img src='img/photo/" + a.getElementsByTagName("entity")[0].getElementsByTagName("photo")[0].textContent + "' alt='' ><span>" + a.getElementsByTagName("entity")[0].getElementsByTagName("designation")[0].textContent + "</span></div>");
        for (var i = 1; i < (a.getElementsByTagName("entity").length > 4 ? 4 : a.getElementsByTagName("entity").length); i++)
            $(type).append("<div class='small_img'><img src='img/photo/" + now.getElementsByTagName("community")[0].getElementsByTagName("entity")[i].getElementsByTagName("photo")[0].textContent + "' alt=''></div>");
    } else {
        var a = now.getElementsByTagName("individual")[0];
        $("#i_e").append("<div class='big_img'><img src='img/photo/" + a.getElementsByTagName("entity")[0].getElementsByTagName("photo")[0].textContent + "' alt='' ><span>" + a.getElementsByTagName("entity")[0].getElementsByTagName("name")[0].textContent + "</span></div>");
        for (var i = 1; i < (a.getElementsByTagName("entity").length > 4 ? 4 : a.getElementsByTagName("entity").length); i++)
            $("#i_e").append("<div class='small_img'><img src='img/photo/" + now.getElementsByTagName("individual")[0].getElementsByTagName("entity")[i].getElementsByTagName("photo")[0].textContent + "' alt=''></div>");
    }

}

function c_change(year) {
    c_year = year.toString();
    $("#c_e .big_img").remove();
    $("#c_e .small_img").remove();
    change(c_year, "#c_e");
}

function i_change(year) {
    i_year = year.toString();
    $("#i_e .big_img").remove();
    $("#i_e .small_img").remove();
    change(i_year, "#i_e");
}