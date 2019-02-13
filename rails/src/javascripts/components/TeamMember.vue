<template>
  <v-container>
    <div class="slot">
      <div class="myteams">マイチーム</div>
      <div v-for="team in teams" class="grey--text">{{ team.name }}</div>
    </div>
  </v-container>
</template>

<script>
import axios from "axios";
export default {
  props: ["teams"],
  mounted() {}
};
</script>

<style scoped>
</style>



