<template>
  <div>{{team.name}}</div>
</template>
<script>
import axios from "axios";
import "babel-polyfill";
export default {
  data() {
    return {
      student: this.$store.state.currentStudent,
      team_id: this.$route.params.id,
      team: {}
    };
  },
  async mounted() {
    const res = await axios.get(
      `http://localhost:5000/v1/teams/${this.team_id}/one`,
      { headers: { Authorization: this.student.access_token } }
    );
    this.team = res.data;
  }
};
</script>
