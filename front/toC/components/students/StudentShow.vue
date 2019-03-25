<template>
  <div></div>
</template>



<script>
import axios from "~/plugins/axios";
import "babel-polyfill";

export default {
  name: "StudentShow",
  // components: {
  //   "navbar": Header
  // },
  data: function() {
    return {
      students: [],
      current_student: {},
      message: "Hello Vue!",
      token: this.$store.state.currentStudent.access_token
    };
  },
  mounted: function() {
    console.log(this.token);
    this.getStudents().then(result => {
      this.students = result;
    });
  },
  methods: {
    getStudents: async function() {
      const res = await axios.get(`/api/students`, {
        headers: {
          Authorization: this.token
        }
      });
      if (res.status !== 200) {
        process.exit();
      }
      return res.data.array;
    }
  }
};
</script>

<style scoped>
@import "../../style/students/show.scss";
</style>