var e_pindex = 0;
var e_pnum = parseInt($(".exhibition .nav ul li").eq(0).children(0).attr("data-pnum"));
$(document).ready(function () {

    check_pnum();

    $(".exhibition .view next_button img").click(function () {
        e_pindex += 1;
        check_pnum();
        var a = 0;
        for (var i = 0; i < e_pindex; i++) {
            a -= $(".exhibition .view .content_box img").eq(i).width() + 20;
        }
        $(".exhibition .view .content_box").css({
            "transform": "translate3d(" + a + "px, 0px, 0px)",
            "transition-timing-function": "ease",
            "transition-duration": XImgtransitionDuration
        });
    });

    $(".exhibition .view pre_button img").click(function () {
        e_pindex -= 1;
        check_pnum();
        var a = 0;
        for (var i = 0; i < e_pindex; i++) {
            a -= $(".exhibition .view .content_box img").eq(i).width() + 20;
        }
        $(".exhibition .view .content_box").css({
            "transform": "translate3d(" + a + "px, 0px, 0px)",
            "transition-timing-function": "ease",
            "transition-duration": XImgtransitionDuration
        });
    });


    $(".exhibition .nav ul li button").click(function () {
        $(this).addClass("clicked");
        $(this).parent().siblings().children().removeClass("clicked");
        var id = $(this).attr("id");
        e_pnum = $(this).attr("data-pnum");
        e_pindex = 0;
        $(".exhibition .view .content_box").empty();
        for (var i = 1; i <= e_pnum; i++)
            $(".exhibition .view .content_box").append("<img src='img/service/exhibition/" + id.toString() + i + ".png'>");
        check_pnum();
        $(".exhibition .view .content_box").css({
            "transform": "translate3d(0px, 0px, 0px)",
            "transition-timing-function": "ease",
            "transition-duration": XImgtransitionDuration
        });
    });
});

function check_pnum() {
    if (e_pindex <= 0)
        $(".exhibition .view pre_button").hide();
    else
        $(".exhibition .view pre_button").show();

    if (e_pindex >= e_pnum - 1)
        $(".exhibition .view next_button").hide();
    else
        $(".exhibition .view next_button").show();
}