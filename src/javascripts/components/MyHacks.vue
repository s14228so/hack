<template>
  <v-container mt-5>
    <div v-for="event in events" class="mt-2">
      <v-chip @click="showDetail(event)">
        {{ event.date }}
        {{ event.title }}
      </v-chip>
    </div>
    <div v-show="detailStatus">
      <event-detail :hack="hack"></event-detail>
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
      detailStatus: false
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
    showDetail(event) {
      this.detailStatus = true;
      this.hack = event;
    }
  }
};
</script>
<style scoped>
</style>