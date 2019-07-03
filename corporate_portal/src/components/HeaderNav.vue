<template>
  <div id="header_nav">
    <div id="nav_content">
      <img src="../resources/build_img/logo.png" />
      <div id="title_span">欢迎您的到来!</div>
      <ul>
          <li>首页</li>
          <li>服务中心</li>
          <li>解决方案</li>
          <li>案例展示</li>
          <li>新闻中心</li>
          <li>合作伙伴</li>
          <li>关于我们</li>
          <li>联系我们</li>
      </ul>
    </div>
  </div>
</template>

<script>
export default {
  name: "HeaderVue"
};
</script>

<style scoped>
#header_nav {
  width: auto;
  height: 91px;
  border-top: 1px solid rgb(13, 13, 13, 1);
  background-color: rgb(13, 13, 13, 1);
  text-align: center;
}
#nav_content {
  margin: 27px auto;
  padding-left: 257px;
  height: 46px;
  width: 70%;
  position: relative;
}
img {
  height: 46px;
  width: 128px;
  position: absolute;
  left: 0;
}
#title_span {
  height: 18px;
  margin-top: 11px;
  width: 109px;
  font: 16px SourceHanSansCN-ExtraLight bold;
  color: white;
  position: absolute;
  left: 148px;
}
ul{

}
li{
    display: inline-block;
    color: white;
    height: 1
}
</style>

