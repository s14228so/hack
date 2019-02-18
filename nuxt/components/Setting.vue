<template>
  <!-- v-forで回したらいけるかも -->
  <!-- student.statuses -->
  <div>
    <h5>ユーザー情報編集</h5>
    <form @submit.prevent="update">
      <v-text-field v-model="email" label="email"></v-text-field>
      <v-text-field v-model="introduction" label="introduction"></v-text-field>
      <v-text-field v-model="address" label="address"></v-text-field>
      <v-text-field v-model="app" label="app"></v-text-field>
      <v-text-field v-model="nickname" label="nickname"></v-text-field>
      <v-text-field v-model="phone" label="phone_number"></v-text-field>
      <v-text-field v-model="firstName" label="first_name"></v-text-field>
      <v-text-field v-model="lastName" label="last_name"></v-text-field>

      <input type="submit">
    </form>
  </div>
</template>
<script>
import axios from "axios";
import "babel-polyfill";
export default {
  data() {
    return {
      token: "",
      nickname: "",
      id: "",
      email: "",
      university: "",
      grade: "",
      introduction: "",
      app: "",
      address: "",
      phone: "",
      firstName: "",
      lastName: "",
      images: []
    };
  },
  mounted() {
    var data = localStorage.getItem("currentStudent");
    data = JSON.parse(data);
    this.token = data[0].access_token;
    this.id = data[0].student_id;
  },
  methods: {
    async update() {
      try {
        const responce = await axios.put(
          `http://localhost:5000/v1/students/${this.id}`,
          {
            email: this.email,
            nickname: this.nickname,
            address: this.address,
            phone_number: this.phone,
            app: this.app,
            introduction: this.introduction,
            grade: this.grade,
            university: this.university,
            last_name: this.lastName,
            first_name: this.firstName,
            department: this.department
          }
        );
        this.$router.push({
          name: "index"
        });
      } catch (error) {
        console.log(error);
      }
    }
  }
};
</script>
<style lang="scss" scoped>
</style>
