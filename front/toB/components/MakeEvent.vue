<template>
  <div>
    <div class="container">
      <form @submit.prevent="makeEvent" class="wrap">
        <v-text-field v-model="title" label="タイトル"></v-text-field>
        <v-text-field v-model="content" label="本文"></v-text-field>
        <v-text-field v-model="date" label="日付"></v-text-field>
        <input type="submit" value="作成">
      </form>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import "babel-polyfill";
export default {
  data() {
    return {
      title: "",
      date: "",
      content: ""
    };
  },
  methods: {
    async makeEvent() {
      const res = await axios.post(
        `http://localhost:5000/events`,
        {
          title: this.title,
          content: this.content,
          data: this.date
        },
        {
          headers: {
            Authorization: this.company.access_token
          }
        }
      );
    }
  }
};
</script>

<style scoped>
.wrap {
  width: 50%;
}
</style>
