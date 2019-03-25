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
import axios from "~/plugins/axios";
import "babel-polyfill";
export default {
  data() {
    return {
      title: "",
      date: "",
      content: "",
      company: this.$store.state.currentCompany
    };
  },
  methods: {
    async makeEvent() {
      const res = await axios.post(
        `/v1/events`,
        {
          title: this.title,
          content: this.content,
          date: this.date,
          company_id: this.company.company_id
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
