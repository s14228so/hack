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
    const res = await axios.get(`/api/myteams`);
    if (res.status !== 200) {
      process.exit();
    }
    this.parent = res.data.array;
    //これだとカレンダー側からしか呼び出せていない
  }
};
</script>
<style scoped>
</style>