<template>
  <v-container>
    <event-detail @rand="showDetail" :events="events"></event-detail>
    <div v-show="detailStatus">
      {{event.title}}
      <div v-for="student in students" class="mt-3" :key="student.email">
        <v-chip @click="idPush(student)">{{ student.email }}</v-chip>
      </div>
    </div>
  </v-container>
</template>

<script>
import axios from "axios";
import "babel-polyfill";
import EventDetail from "../components/EventDetail.vue";
export default {
  data: function() {
    return {
      hack: "",
      events: [],
      detailStatus: false,
      student: this.$store.state.currentStudent,
      students: [],
      event: {}
    };
  },
  components: {
    EventDetail
  },
  mounted: async function() {
    const res = await axios.get(`http://localhost:5000/v1/events/myhacks`, {
      headers: { Authorization: this.student.access_token }
    });
    if (res.status !== 200) {
      process.exit();
    }
    this.events = res.data;

    //これだとカレンダー側からしか呼び出せていない
  },

  methods: {
    async showDetail(event) {
      this.detailStatus = !this.detailStatus;
      this.event = event;
      const res = await axios.get(
        `http://localhost:5000/v1/events/${event.id}/join_students`,
        {
          headers: { Authorization: this.student.access_token }
        }
      );
      if (res.status !== 200) {
        process.exit();
      }
      this.students = res.data;
      console.log(this.students);
    },
    idPush(student) {
      this.$router.push({
        name: "students-id",
        params: {
          id: student.student_id
        }
      });
    }
  }
};
</script>
<style scoped>
</style>