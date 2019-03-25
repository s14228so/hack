<template>
  <v-container>
    <div v-for="student in students" :key="student.student_id">
      <div class="student" @click="pushDetail(student)">{{ student.email }}</div>
    </div>
  </v-container>
</template>
<script>
import axios from "~/plugins/axios";
import "babel-polyfill";
export default {
  data() {
    return {
      student: this.$store.state.currentStudent,
      students: []
    };
  },
  mounted: async function() {
    const res = await axios.get(`/v1/students`, {
      headers: { Authorization: this.student.access_token }
    });
    if (res.status !== 200) {
      process.exit();
    }
    this.students = res.data;
  },
  methods: {
    pushDetail(student) {
      this.$router.push({
        name: "students-id",
        params: { id: student.student_id }
      });
    }
  }
};
</script>

<style scoped>
.student {
  width: 20%;
  cursor: pointer;
  margin-bottom: 20px;
}
</style>
