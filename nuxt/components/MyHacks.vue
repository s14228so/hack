<template>
  <v-container>
    <event-detail @rand="showDetail" :events="events"></event-detail>
    <div v-show="detailStatus">
      {{event.title}}
      <div v-for="student in students" class="mt-3">
        <v-chip>{{ student.email }}</v-chip>
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
      students: [],
      event: {}
    };
  },
  components: {
    EventDetail
  },
  mounted: async function() {
    if (localStorage) {
      var data = localStorage.getItem("currentStudent");
      data = JSON.parse(data);
    }
    const res = await axios.get(`http://localhost:5000/v1/events/myhacks`, {
      headers: { Authorization: data.access_token }
    });
    if (res.status !== 200) {
      process.exit();
    }
    this.events = res.data;

    //これだとカレンダー側からしか呼び出せていない
  },

  methods: {
    async showDetail(event) {
      var data = localStorage.getItem("currentStudent");
      data = JSON.parse(data);
      this.detailStatus = !this.detailStatus;
      this.event = event;
      console.log("親です");
      const res = await axios.get(
        `http://localhost:5000/v1/events/${event.id}/join_students`,
        {
          headers: { Authorization: data.access_token }
        }
      );
      if (res.status !== 200) {
        process.exit();
      }
      this.students = res.data;
      console.log(this.students);
    }
  }
};
</script>
<style scoped>
</style>