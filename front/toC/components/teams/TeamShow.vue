<template>
  <v-layout>
    <v-flex xs12 sm6 offset-sm3>
      <v-card>
        <v-img
          class="white--text"
          height="200px"
          src="https://cdn.vuetifyjs.com/images/cards/docks.jpg"
        >
          <v-container fill-height fluid>
            <v-layout fill-height>
              <v-flex xs12 align-end flexbox>
                <span class="headline">{{team.name}}</span>
              </v-flex>
            </v-layout>
          </v-container>
        </v-img>
        <v-card-title>
          <div v-for="member in members" :key="member.id">
            <span class="grey--text">メンバー</span>
            <br>/
            <span>{{member.nickname}}</span>
          </div>
        </v-card-title>
        <v-card-actions>
          <v-btn flat color="orange">Share</v-btn>
          <v-btn flat color="orange">Explore</v-btn>
        </v-card-actions>
      </v-card>
    </v-flex>
  </v-layout>
</template>
<script>
import axios from "~/plugins/axios";
import "babel-polyfill";
export default {
  data() {
    return {
      student: this.$store.state.currentStudent,
      team_id: this.$route.params.id,
      team: {},
      members: []
    };
  },
  async mounted() {
    const res = await axios.get(`/v1/teams/${this.team_id}/one`, {
      headers: { Authorization: this.student.access_token }
    });
    this.team = res.data;
    this.members = this.team.students;
  }
};
</script>

<style scoped>
</style>
