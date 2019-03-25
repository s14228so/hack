<template>
  <v-container>
    <event-detail @rand="showDetail" :events="events"></event-detail>
    <div v-show="detailStatus" class="box">
      <h4>{{event.title}}</h4>
      <hr>
      <p>{{event.content}}</p>
      <div v-for="student in students" class="mt-3" :key="student.email">
        <v-chip @click="idPush(student)">
          <div v-if="student.image" class="image">
            <v-avatar>
              <img :src="student.image">
            </v-avatar>
          </div>
          {{ student.email }}
        </v-chip>
      </div>
    </div>
  </v-container>
</template>

<script>
import axios from "~/plugins/axios";
import "babel-polyfill";
import EventDetail from "../events/EventDetail";

export default {
  data: function() {
    return {
      hack: "",
      events: [],
      detailStatus: false,
      student: this.$store.state.currentStudent,
      students: [],
      event: {}
    };
  },
  components: {
    EventDetail
  },
  mounted: async function() {
    console.log(this.students);
    const res = await axios.get(
      `/v1/events/myhacks`,
      {
        params: {
          id: this.student.student_id
        }
      },
      {
        headers: { Authorization: this.student.access_token }
      }
    );
    if (res.status !== 200) {
      process.exit();
    }
    this.events = res.data;
    console.log(this.events);
  },

  methods: {
    async showDetail(event) {
      if (this.detailStatus === false) {
        this.detailStatus = true;
      }
      this.event = event;
      const res = await axios.get(`/v1/events/${event.id}/join_students`, {
        headers: { Authorization: this.student.access_token }
      });
      if (res.status !== 200) {
        process.exit();
      }
      this.students = res.data;
      console.log(this.students);
    },
    idPush(student) {
      this.$router.push({
        name: "students-id",
        params: {
          id: student.student_id
        }
      });
    }
  }
};
</script>
<style scoped>
.box {
  width: 300px;
  height: 400px;
  padding: 20px;
  border: 1px solid gray;
  border-radius: 10px;
}

h4 {
  font-size: 18px;
}
p {
  font-size: 12px;
  margin-top: 10px;
}
.image {
}
</style>