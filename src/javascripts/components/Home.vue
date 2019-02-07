<template>
  <v-container>
  <v-layout>
    <v-flex>
      <v-sheet height="500">
        <v-calendar
          :now="today"
          :value="today"
          color="primary"
        >
          <template
            slot="day"
            slot-scope="{ date }"
          >
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
                <v-card
                  color="grey lighten-4"
                  min-width="350px"
                  flat
                >
                  <v-toolbar
                    color="primary"
                    dark
                  >
                    <v-btn icon @click="reseerveEvent(event.id)" v-show="event_filter">
                      <v-icon title="予約する">done</v-icon>
                    </v-btn>
                    <v-toolbar-title v-html="event.title"></v-toolbar-title>
                    <v-spacer></v-spacer>
                    <v-btn icon>
                      <v-icon>favorite</v-icon>
                    </v-btn>
                    <v-btn icon>
                      <v-icon>more_vert</v-icon>
                    </v-btn>
                  </v-toolbar>
                  <v-card-title primary-title>
                    <span v-html="event.content"></span>
                  </v-card-title>
                  <v-card-actions>
                    <v-btn
                      flat
                      color="secondary"
                    >
                      Cancel
                    </v-btn>
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
  import 'babel-polyfill';

  export default {
    data: () => ({
      today: '2019-01-08',
      events: events,
      student: rails.student,
      event_students: rails.event_students,
      event_filter: true,
      event_ids: rails.event_ids
    }),
    computed: {
      // convert the list of events into a map of lists keyed by date
      eventsMap () {
        const map = {}
        this.events.forEach(e => (map[e.date] = map[e.date] || []).push(e))
        return map
      },
    },
    mounted(){
    },
    methods: {
      open (event) {
        alert(event.title)
      },
      async reserveEvent (id) {
        try {
          const response = await axios.post(`/api/event_students`, {event_id: id})
        } catch (error) {
          console.log(error)
        }
      },
       eventFilter(event){
          console.log(event.id)
          if (this.event_ids.includes(event.id)){
            this.event_filter = false
          }
          else{
            this.event_filter = true
          }
          console.log(this.event_filter)
     }
    },
  }
</script>

</script>