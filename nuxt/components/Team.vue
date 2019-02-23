<template>
  <div>
    <team-member :teams="parent">
      <div class="come"></div>
    </team-member>
  </div>
</template>
<script>
import axios from "axios";
import "babel-polyfill";
import TeamMember from "./TeamMember";
export default {
  data() {
    return {
      parent: []
    };
  },
  components: {
    TeamMember
  },
  mounted: async function() {
    var data = localStorage.getItem("currentStudent");
    data = JSON.parse(data);
    const res = await axios.get(`http://localhost:5000/v1/myteams`, {
      headers: {
        Authorization: data.access_token
      }
    });
    if (res.status !== 200) {
      process.exit();
    }
    this.parent = res.data;
    //これだとカレンダー側からしか呼び出せていない
  }
};
</script>
<style scoped>
</style>