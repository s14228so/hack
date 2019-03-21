<template>
  <div>
    <h4>マイページ</h4>
  </div>
</template>

<script>
import axios from "axios";
import "babel-polyfill";

export default {
  data() {
    return {
      company: this.$store.state.company
    };
  },
  async mouted() {
    await axios.get(`http://localhost:5000/v1/campanies/${company.id}`);
  }
};
</script>

<style scoped>
</style>
