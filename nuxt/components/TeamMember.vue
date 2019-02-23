<template>
  <v-container>
    <div class="slot">
      <div class="myteams">マイチーム</div>
      <div v-for="team in teams" class="grey--text" :key="team.name">
        {{ team.name }}
        {{ team.introduction }}
      </div>
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



