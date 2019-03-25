<template>
  <div>
    <button type="submit" @click="$emit('destroyUserSession')" class="black--text">Log Out</button>
  </div>
</template>
<script>
// import axios from "~/plugins/axios";
// import "babel-polyfill";
export default {
  data() {
    return {
      token: ""
    };
  },
  methods: {}
};
</script>
<style scoped>
</style>