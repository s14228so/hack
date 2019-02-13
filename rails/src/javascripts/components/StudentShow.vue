<template>
  <div></div>
</template>



<script>
import "babel-polyfill";
import axios from "axios";

export default {
  name: "StudentShow",
  // components: {
  //   "navbar": Header
  // },
  data: function() {
    return {
      students: [],
      current_student: {},
      message: "Hello Vue!"
    };
  },
  created: function() {
    this.getStudents().then(result => {
      this.students = result;
    });
  },
  methods: {
    getStudents: async function() {
      const res = await axios.get(`/api/students`);
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