<template>
  <div>
    <p>タイトル: {{event.title}}</p>
    <p>日付: {{event.date}}</p>
    <p>内容: {{event.content}}</p>
  </div>
</template>

<script>
import axios from "axios";
import "babel-polyfill";
export default {
  data() {
    return {
      event_id: this.$route.params.id,
      event: {},
      students: []
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
  }
};
</script>

<style scoped>
</style>
