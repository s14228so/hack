<template>
  <div>
    <p>タイトル: {{event.title}}</p>
    <p>日付: {{event.date}}</p>
    <p>内容: {{event.content}}</p>
    <div v-for="student in students" :key="student.student_id">
      <v-chip @click="moreDetail(student)">
        <v-avatar>
          <div v-if="student.image">
            <img :src="student.image">
          </div>
          <div v-else>
            <img src="https://randomuser.me/api/portraits/men/35.jpg" alt="trevor">
          </div>
        </v-avatar>
        {{student.email}}
      </v-chip>
      <div v-show="student.detail">
        <p>{{student.email}}</p>
        <p>{{student.nickname}}</p>
        <p>{{student.university}}</p>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import "babel-polyfill";
export default {
  data() {
    return {
      detail: false,
      event_id: this.$route.params.id,
      event: {},
      students: [
        {
          student: {
            detail: false
          }
        }
      ]
    };
  },
  async mounted() {
    const responce = await axios.get(
      `http://localhost:5000/v1/events/${this.event_id}`
    );
    if (responce.status !== 200) {
      process.exit();
    }
    this.event = responce.data;

    const res = await axios.get(
      `http://localhost:5000/v1/events/${this.$route.params.id}/join_students`
    );
    if (res.status !== 200) {
      process.exit();
    }
    this.students = res.data;
    console.log(this.students);
  },
  methods: {
    moreDetail(student) {
      student.detail = !student.detail;
    }
  }
};
</script>

<style scoped>
</style>
