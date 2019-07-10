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
});