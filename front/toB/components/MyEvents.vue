<template>
  <div>
    <div v-for="event in events" :key="event.title">{{event.title}}</div>
  </div>
</template>

<script>
import axios from "axios";
import "babel-polyfill";
export default {
  data() {
    return {
      company: this.$store.state.currentCompany,
      events: []
    };
  },
  async mounted() {
    const res = await axios.get(
      `http://localhost:5000/v1/companies/${this.company.company_id}/events`
    );
    if (res.status !== 200) {
      process.exit();
    }
    this.events = res.data;
    console.log(this.events);
  },
  methods: {}
};
</script>

<style>
</style>
