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
                    @click="eventFilter(event)"
                  ></div>
                  <v-card color="grey lighten-4" width="400px" flat>
                    <v-toolbar color="primary" dark>
                      <v-btn icon @click="reserveEvent(event.id)" v-show="event_filter">
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
                      <span v-html="event.content"></span>
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
  data: () => ({
    today: "2019-01-015",
    events: [],
    // student: rails.student,
    // event_students: rails.event_students,
    event_filter: true
    // event_ids: rails.event_ids
  }),
  computed: {
    // convert the list of events into a map of lists keyed by date
    eventsMap() {
      const map = {};
      this.events.forEach(e => (map[e.date] = map[e.date] || []).push(e));
      return map;
    }
  },
  async mounted() {
    var data = localStorage.getItem("currentStudent");
    data = JSON.parse(data);
    console.log(data[0].access_token);
    try {
      const response = await axios.get(`http://localhost:5000/v1/events`, {
        headers: { Authorization: data[0].access_token }
      });
      this.events = response.data;
      console.log(response.data);
    } catch (error) {
      console.log(error);
    }
  },
  methods: {
    open(event) {
      alert(event.title);
    },
    async reserveEvent(id) {
      try {
        const response = await axios.post(
          `http://localhost:5000/api/event_students`,
          {
            event_id: id
          }
        );
      } catch (error) {
        console.log(error);
      }
    },
    eventFilter(event) {
      if (this.event_ids.includes(event.id)) {
        this.event_filter = false;
      } else {
        this.event_filter = true;
      }
    },
    openDetail(event) {
      this.$router.push({
        name: "EventDetail",
        params: { event: event, id: event.id }
      });
      // console.log(event)
    }
  }
};
</script>
