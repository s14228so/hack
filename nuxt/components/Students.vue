<template>
  <v-container>
    <div v-for="student in students">{{ student.email }}</div>
  </v-container>
</template>
<script>
import axios from "axios";
import "babel-polyfill";
export default {
  data() {
    return {
      students: []
    };
  },
  mounted: async function() {
    var data = localStorage.getItem("currentStudent");
    data = JSON.parse(data);
    console.log(data[0].access_token);
    const res = await axios.get(`http://localhost:5000/v1/students`, {
      headers: { Authorization: data[0].access_token }
    });
    if (res.status !== 200) {
      process.exit();
    }
    this.students = res.data;
    console.log(this.students);
  }
};
</script>

<style>
</style>
