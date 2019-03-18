<template>
  <div>{{student.email}}</div>
</template>
<script>
import axios from "axios";
import "babel-polyfill";
export default {
  data() {
    return {
      student_id: this.$route.params.id,
      student: {}
    };
  },
  fetch({ store, redirect }) {
    if (store.state.login === false) {
      return redirect("/");
    }
  },
  async mounted() {
    console.log(this.$route.params.id);
    try {
      const res = await axios.get(
        `http://localhost:5000/v1/students/${this.$route.params.id}/one`,
        {
          headers: {
            Authorization: this.$store.state.currentStudent.access_token
          }
        }
      );
      this.student = res.data;
    } catch {
      this.$router.push("/");
    }
  }
};
</script>

<style lang="scss" scoped>
</style>
