<template>
  <div>
    <div>{{event.title}}</div>
    <div>{{event.date }}</div>
  </div>
</template>
<script>
import axios from "axios";
import "babel-polyfill";

export default {
  data() {
    return {
      event: {},
      currentStudent: {}
    };
  },
  async mounted() {
    if (localStorage) {
      var data = localStorage.getItem("currentStudent");
      data = JSON.parse(data);
      this.currentStudent = data;
    }
    const res = await axios.get(
      `http://localhost:5000/v1/events/${this.$route.params.id}`
    );
    if (res.status !== 200) {
      process.exit();
    }
    this.event = res.data;
    console.log(this.event);
  }
};
</script>
<style lang="scss" scoped>
</style>

