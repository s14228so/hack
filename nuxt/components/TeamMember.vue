<template>
  <v-container>
    <div class="slot">
      <div class="myteams">マイチーム</div>
      <div v-for="team in teams" class="grey--text" :key="team.name">
        <v-chip @click="teamDetail">{{ team.name }}</v-chip>
        <span>{{ team.introduction }}</span>
      </div>
    </div>
  </v-container>
</template>

<script>
import axios from "axios";
export default {
  props: ["teams"],
  mounted() {},
  methods: {
    temaDetail(team) {
      this.$router.push({
        name: "temas-id",
        params: { id: team.id }
      });
    }
  }
};
</script>

<style scoped>
</style>



