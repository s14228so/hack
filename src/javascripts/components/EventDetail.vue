<template>
  <div>
    <v-container>
      {{ hack.title }}
      <div v-for="student in students" class="mt-3">
        <v-chip>{{ student.nickname}}</v-chip>
      </div>
    </v-container>
  </div>
</template>
<script>
import axios from "axios";
import "babel-polyfill";

export default {
  props: ["hack"],
  data: function() {
    return {
      students: []
    };
  },
  mounted() {
    console.log(this.hack.title);
  }
};
</script>
<style scoped>
</style>