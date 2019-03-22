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
      parent: [],
      student: this.$store.state.currentStudent
    };
  },
  components: {
    TeamMember
  },
  mounted: async function() {
    const res = await axios.get(
      `http://localhost:5000/v1/myteams`,
      {
        params: {
          id: this.student.student_id
        }
      },
      {
        headers: {
          Authorization: this.student.access_token
        }
      }
    );
    if (res.status !== 200) {
      process.exit();
    }
    this.parent = res.data;
  }
};
</script>
<style scoped>
</style>