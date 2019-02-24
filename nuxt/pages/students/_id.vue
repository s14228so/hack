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
  async mounted() {
    const res = await axios.get(`http://localhost:5000/v1/students/7/one`, {
      headers: {
        Authorization: this.$store.state.currentStudent.access_token
      }
    });
    this.student = res.data;
    console.log(res.data);
  }
};
</script>

<style lang="scss" scoped>
</style>
