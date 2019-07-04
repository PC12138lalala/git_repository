$(document).ready(function () {
    var i = 0;
    window.setInterval(function () {
        if (i == 0) {
            i = 1;
            for (var j = 0; j < 8; j += 2) {
                $(".S_title").eq(j).addClass("S_title_small");
                $(".S_title").eq(j+1).removeClass("S_title_small");
                $(".icon").eq(j).addClass("icon_small");
                $(".icon").eq(j + 1).removeClass("icon_small");
            }
        } else {
            i = 0;
            for (var j = 0; j < 8; j += 2) {
                $(".S_title").eq(j+1).addClass("S_title_small");
                $(".S_title").eq(j).removeClass("S_title_small");
                $(".icon").eq(j + 1).addClass("icon_small");
                $(".icon").eq(j).removeClass("icon_small");
            }
        }
    }, 2000);

});