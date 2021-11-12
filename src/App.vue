<template>
  <div id="app">
    <keep-alive>
    <component v-bind:is="currentTabComponent"></component>
    </keep-alive>
  </div>
</template>

<script>

import Analysis from './view/Analysis.vue';
import Welcome from './view/Welcome.vue';

export default {
  name: 'App',
  components: {
    Analysis,
    Welcome
  },
  data() {
    return {
      currentPage: 'welcome',
    }
  },
  computed: {
    currentTabComponent() {
      return this.currentPage === "welcome" ? Welcome : Analysis;
    }
  }
}
</script>

<style lang="less">
@import "./assets/font.css";

#app {
  font-family: Avenir, Helvetica, Arial, sans-serif, lobster;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
