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
import axios from "~/plugins/axios";
import "babel-polyfill";
export default {
  data() {
    return {
      detail: false,
      event_id: this.$route.params.id,
      students: []
    };
  },
  async asyncData({ app, params, error }) {
    const response = await axios.get(`/v1/events/${params.id}`).catch(err => {
      return err.response;
    });
    if (response.status !== 200) {
      error({
        statusCode: response.status,
        message: response.data.message
      });
      return;
    }
    return { event: response.data };
  },
  async mounted() {
    const res = await axios
      .get(`/v1/events/${this.$route.params.id}/join_students`)
      .catch(err => {
        return err.responce;
      });
    if (res.status !== 200) {
      error({
        statusCode: res.status,
        message: res.data.message
      });
      return;
    }

    this.students = res.data;
    console.log(res.data);
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
