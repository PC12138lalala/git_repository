<template>
  <div id="app">
    <!--<img alt="Vue logo" src="./assets/logo.png">
    <HelloWorld msg="Welcome to Your Vue.js App"/>-->
    <HeaderVue/>
  </div>
</template>

<script>
import HelloWorld from "./components/HelloWorld.vue";
import HeaderVue from "./components/HeaderNav.vue";

export default {
  name: "app",
  components: {
    HelloWorld,
    HeaderVue
  }
};
</script>

<style>
* {
  padding: 0;
  margin: 0;
}
body{
  position: relative;
}
</style>
