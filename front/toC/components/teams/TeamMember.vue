<template>
  <v-container>
    <div class="slot">
      <div class="myteams">マイチーム</div>
      <div v-for="team in teams" class="grey--text" :key="team.name">
        <v-chip @click="teamDetail(team)">{{ team.name }}</v-chip>
        <span>{{ team.introduction }}</span>
      </div>
    </div>
  </v-container>
</template>

<script>
export default {
  props: ["teams"],
  mounted() {},
  methods: {
    teamDetail(team) {
      this.$router.push({
        name: "teams-id",
        params: { id: team.id }
      });
    }
  }
};
</script>

<style scoped>
</style>



