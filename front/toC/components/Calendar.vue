<template>
  <v-container>
    <v-layout>
      <v-flex xs8>
        <v-sheet height="500">
          <v-calendar :now="today" :value="today" color="primary">
            <template slot="day" slot-scope="{ date }">
              <template v-for="event in eventsMap[date]">
                <v-menu
                  :key="event.title"
                  v-model="event.open"
                  full-width
                  offset-x
                  :bind="event.id"
                >
                  <div
                    v-if="!event.time"
                    slot="activator"
                    v-ripple
                    class="my-event"
                    v-html="event.title"
                    @click.once="eventFilter(event)"
                  ></div>
                  <v-card color="grey lighten-4" width="400px" flat>
                    <v-toolbar color="primary" dark>
                      <v-btn icon @click="reserveEvent(event.id)" v-show="event.event_filter">
                        <v-icon title="予約する">done</v-icon>
                      </v-btn>
                      <v-toolbar-title v-html="event.title"></v-toolbar-title>
                      <v-spacer></v-spacer>
                      <v-btn icon>
                        <v-icon>favorite</v-icon>
                      </v-btn>
                      <v-btn icon>
                        <v-icon @click="openDetail(event)">open_in_new</v-icon>
                      </v-btn>
                    </v-toolbar>
                    <v-card-title primary-title>
                      <span v-html="event.content" class="color-black"></span>
                    </v-card-title>
                    <v-card-actions>
                      <v-btn flat color="secondary">Cancel</v-btn>
                    </v-card-actions>
                  </v-card>
                </v-menu>
              </template>
            </template>
          </v-calendar>
        </v-sheet>
      </v-flex>
    </v-layout>
  </v-container>
</template>
<script>
import axios from "axios";
import "babel-polyfill";

export default {
  data() {
    return {
      student: this.$store.state.currentStudent,
      events: [],
      eventIds: []
    };
  },
  computed: {
    eventsMap() {
      const map = {};
      this.events.forEach(e => (map[e.date] = map[e.date] || []).push(e));
      return map;
    },
    today() {
      var hiduke = new Date();
      var year = hiduke.getFullYear();
      var month = hiduke.getMonth() + 1;
      var week = hiduke.getDay();
      var day = hiduke.getDate();
      var current = `${year}-${month}-${day}`;
      return current;
    }
  },
  async created() {
    try {
      const response = await axios.get(`http://localhost:5000/v1/events`, {
        headers: { Authorization: this.student.access_token }
      });
      this.events = response.data;
    } catch (error) {
      console.log(error);
    }
    let response = await axios.get(
      `http://localhost:5000/v1/students/${this.currentId}/current`,
      {
        headers: { Authorization: this.student.access_token }
      }
    );
    var arrayIds = [];
    response.data.forEach(function(data) {
      arrayIds.push(data.id);
    });
    this.eventIds = arrayIds;
    console.log(`今日は${this.today}です`);
  },
  methods: {
    open(event) {
      alert(event.title);
    },
    async reserveEvent(id) {
      try {
        const response = await axios.post(
          `http://localhost:5000/v1/event_students`,
          {
            student_id: this.student.student_id,
            event_id: id,
            headers: { Authorization: this.student.access_token }
          }
        );
      } catch (error) {
        console.log(error);
      }
    },
    eventFilter(event) {
      if (this.eventIds.includes(event.id)) {
        return (event.event_filter = false);
      } else {
        return (event.event_filter = true);
      }
    },
    openDetail(event) {
      this.$router.push({
        name: "events-id",
        params: { id: event.id }
      });
    }
  }
};
</script>
<style scoped>
.color-black {
  color: black;
}
</style>
