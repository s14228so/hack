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
                      <v-btn icon @click="onClickOpen(event)" v-show="event.event_filter">
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
    <confirm ref="confirm" @agree="reserveEvent"></confirm>
    <!-- <v-btn color="success" @click>OpenConfirm</v-btn> -->
    <!-- reserveEvent(event.id) -->
  </v-container>
</template>
<script>
import axios from "~/plugins/axios";
import "babel-polyfill";
import Confirm from "./flash/Confirm";
export default {
  props: ["event"],
  data() {
    return {
      student: this.$store.state.currentStudent,
      events: [],
      eventIds: []
    };
  },
  components: {
    Confirm
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
    const response = await axios.get(`/v1/events`, {
      headers: { Authorization: this.student.access_token }
    });
    this.events = response.data;
    const res = await axios.get(
      `/v1/students/${this.student.student_id}/current`,
      {
        params: {
          id: this.student.student_id
        }
      },
      {
        headers: { Authorization: this.student.access_token }
      }
    );
    var arrayIds = [];
    res.data.forEach(function(data) {
      arrayIds.push(data.id);
    });
    this.eventIds = arrayIds;
    console.log(`今日は${this.today}です`);
    console.log(this.eventIds);
  },
  methods: {
    async onClickOpen(event) {
      console.log("--onClickOpen");
      if (
        await this.$refs.confirm.open(
          "イベントの予約",
          "予約しますか？",
          {
            color: "red"
          },
          event
        )
      ) {
        console.log("--yes");
      } else {
        console.log("--no");
      }
    },
    open(event) {
      alert(event.title);
    },
    async reserveEvent(event) {
      try {
        const response = await axios.post(`/v1/event_students`, {
          student_id: this.student.student_id,
          event_id: event.id,
          headers: { Authorization: this.student.access_token }
        });
      } catch (error) {
        console.log(error);
      }
      this.$router.push({
        name: "reserved"
      });
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
