<template>
  <v-container mt-5>
    <div v-for="event in events" class="mt-2">
      <v-chip @click="showDetail(event)">
        {{ event.date }}
        {{ event.title }}
      </v-chip>
    </div>
    <div v-show="detailStatus">
      <event-detail :event="hack"></event-detail>
    </div>
  </v-container>
</template>

<script>
import EventDetail from "../components/EventDetail.vue";
export default {
  data: function() {
    return {
      hack: {},
      events: my_events,
      detailStatus: false
    };
  },
  components: {
    EventDetail
  },
  mounted: function() {},
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