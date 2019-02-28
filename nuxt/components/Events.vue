<template>
  <v-container>
    <ul v-for="event in events" :key="event.id">
      <li>{{event.title}}</li>
    </ul>
  </v-container>
</template>
<script>
import axios from "axios";
import "babel-polyfill";

export default {
  data() {
    return {
      student: this.$store.state.currentStudent,
      events: []
    };
  },
  async mounted() {
    try {
      const response = await axios.get(`http://localhost:5000/v1/events`, {
        headers: { Authorization: this.student.access_token }
      });
      this.events = response.data;
    } catch (error) {
      console.log(error);
    }
  }
};
</script>

<style lang="scss" scoped>
ul {
  list-style: none;
  li {
    padding: 10px 5px;
  }
}
</style>

