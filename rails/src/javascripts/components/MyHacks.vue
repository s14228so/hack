<template>
  <v-container>
    <event-detail @rand="showDetail" :events="events"></event-detail>
    <div v-show="detailStatus">
      {{event.title}}
      <div v-for="student in students" class="mt-3">
        <v-chip>{{ student.nickname}}</v-chip>
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
    const res = await axios.get(`/api/events/myhacks`);
    if (res.status !== 200) {
      process.exit();
    }
    this.events = res.data.array;

    //これだとカレンダー側からしか呼び出せていない
  },

  methods: {
    async showDetail(event) {
      this.detailStatus = !this.detailStatus;
      this.event = event;
      console.log("親です");
      const res = await axios.get(`/api/events/${event.id}/join_students`);
      if (res.status !== 200) {
        process.exit();
      }
      this.students = res.data.array;
    }
  }
};
</script>
<style scoped>
</style>