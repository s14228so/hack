<template>
  <div>
    <h2>画像のアップロードが完了しました！</h2>
    <button @click="loadImage">プロフィールに戻る</button>
  </div>
</template>

<script>
import axios from "axios";
import "babel-polyfill";

export default {
  data() {
    return {
      student: this.$store.state.currentStudent
    };
  },
  methods: {
    loadImage() {
      this.$store.dispatch(`loadStudent`, {
        student_id: this.student.student_id,
        access_token: this.student.access_token
      });
      this.$router.push({
        name: "mypage"
      });
    }
  }
};
</script>

<style scoped>
</style>
