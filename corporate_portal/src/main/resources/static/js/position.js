function add_num(max_num, inter, e) {
    var tag = 0;
    var interval = window.setInterval(function () {
        e.text(tag);
        tag += inter;

        if (tag >= max_num) {
            e.text(max_num);
            window.clearInterval(interval);
        }

    }, 25);
}

$(document).ready(function () {
    var pos_interval = window.setInterval(function () {
        if ($(document).scrollTop() + window.innerHeight - 250 > $(".history_band").offset().top) {
            window.clearInterval(pos_interval);
            add_num(1000, 17, $("#num1"));
            add_num(300, 17, $("#num2"));
            add_num(50, 2, $("#num3"));
            add_num(200, 17, $("#num4"));
        }
    }, 1);

    var pos_interval_1 = window.setInterval(function () {
        $(".work_process .top").height($(".work_process").height());
        var width = 0;
        if ($(document).scrollTop() + window.innerHeight - 550 > $(".work_process").offset().top) {
            window.clearInterval(pos_interval_1);
            var pos_interval_2 = window.setInterval(function () {
                if (width < 58.5)
                    width += 0.1;
                else
                    width += 0.07;
                $(".work_process .top").width(width + "%");
                if (width >= 100) {
                    window.clearInterval(pos_interval_2);
                }
            }, 1);
        }
    }, 1);

});