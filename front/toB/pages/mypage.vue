<template>
  <div>
    <div>
      <h4>マイページ</h4>
      {{ company.name }}
      {{ company.introduction }}
      {{ company.email }}
    </div>
    <div>
      <my-events></my-events>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import "babel-polyfill";
import MyEvents from "../components/MyEvents";
export default {
  data() {
    return {
      company: this.$store.state.currentCompany
    };
  },
  components: {
    MyEvents
  },
  async mouted() {
    await axios.get(`http://localhost:5000/v1/campanies/${company.id}`);
  }
};
</script>

<style scoped>
</style>
