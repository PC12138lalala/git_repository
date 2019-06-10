
$(document).ready(function () {
    $("#c_year").children().eq(0).css("background","url(img/tabs_bg.png)");
    $("#i_year").children().eq(0).css("background","url(img/tabs_bg.png)");
    $("li[name='c_year']").click(function(){
       $(this).css("background","url(img/tabs_bg.png)").siblings("li").css("background","url()");
    });
    $("li[name='i_year']").click(function(){
        $(this).css("background","url(img/tabs_bg.png)").siblings("li").css("background","url()");
    });
});