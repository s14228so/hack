<template>
  <div>
    <div v-for="event in events" :key="event.title">
      <div class="card" @click="showDetail(event)">
        <p>タイトル: {{event.title}}</p>
        <p>日付: {{event.date}}</p>
        <p>内容: {{event.content}}</p>
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
      company: this.$store.state.currentCompany,
      events: []
    };
  },
  async mounted() {
    const res = await axios.get(
      `/v1/companies/${this.company.company_id}/events`
    );
    if (res.status !== 200) {
      process.exit();
    }
    this.events = res.data;
    console.log(this.events);
  },
  methods: {
    showDetail(event) {
      this.$router.push({
        name: "events-id",
        params: {
          id: event.id,
          event: event
        }
      });
    }
  }
};
</script>

<style>
.card {
  cursor: pointer;
  width: 150px;
  height: 200px;
  padding: 20px;
  border-radius: 5%;
  border: 1px solid gray;
}
</style>
