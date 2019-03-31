<template>
  <my-page :gakusei="student"></my-page>
</template>
<script>
import MyPage from "../components/my/MyPage";
import axios from "~/plugins/axios";
import "babel-polyfill";
export default {
  components: {
    MyPage
  },
  data() {
    return {
      id: this.$store.state.currentStudent.student_id
    };
  },
  fetch({ store, redirect }) {
    if (store.state.login === false) {
      return redirect("/");
    }
  },
  async ounted() {
    console.log(this.$store.state.currentStudent.student_id);
    console.log(this.$store.state.currentStudent.student_id);
  },
  //ここでcurrentStudentをSSRする
  async asyncData({ store }) {
    const res = await axios.get(
      `/v1/students/${store.state.currentStudent.student_id}`
    );
    return { student: res.data };
  }
};
</script>
<style>
</style>

