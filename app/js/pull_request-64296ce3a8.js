/**
 * Created by gaopengfei on 16/12/9.
 */

var app = new Vue({
    el : '#body',
    data : json_data,
    methods: {
        getMore: function () {
            if(this.is_fetching){
                // console.log('已经正在请求');
                return;
            }
            this.is_fetching = true;
            // console.log('发送请求去了');
            var url = this.next_page_url;
            this.$http.post(url,this.userInfo).then(function(data){
                    //将状态重置
                    dragger.reset();
                    // console.log('已加载');
                    // console.log(data.body);
                if(data.body.next_page_url){
                    this.data =  this.data.concat(data.body.data);
                    this.next_page_url = data.body.next_page_url;
                    this.is_fetching = false;
                }else{
                    console.log('到头了');
                }

                //lazyload
                echo.init({
                    offset: 100,
                    throttle: 250,
                    unload: false
                });
            },function(errors){
                console.log('请求出错');
            });
        }
    }
});


var dragger = new DragLoader(document.getElementById('test'), {
    dragDownRegionCls: 'latest',
    dragUpRegionCls: 'more',
    disableDragDown: false,
    dragDownHelper: function(status) {
        return '<div style="text-align: center;line-height: 50px;font-weight: 20px;">下拉并没有反应,合上吧,乖～  ╮(￣▽￣)╭</div>';
    },
    dragUpHelper: function(status) {
        if (status == 'default') {
            return '<div style="line-height: 50px;text-align: center">这才是翻页的正确姿势</div>';
        } else if (status == 'prepare') {
            return '<div style="line-height: 50px;text-align: center">放手!放手!我加载还不行嘛?<p style="line-height: 50px;">(╯‵□′)╯︵┻━┻ </p></div>';
        } else if (status == 'load') {
            return '<div style="line-height: 50px;text-align: center">搬运中 _(:3 」∠)_ </div>';
        }
    }
});
dragger.on('dragDownLoad', function() {
    console.log('下拉刷新');
    dragger.reset();
});
dragger.on('dragUpLoad', function() {
    console.log('上拉刷新');
    app.getMore();
});

