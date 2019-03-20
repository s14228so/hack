<template>
  <div>
    <h2>画像のアップロードが完了しました！</h2>
    <button @click="loadImage">やあ</button>
    <router-link to="/mypage" @click="loadImage">プロフィールに戻る</router-link>
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
      this.$store.dispatch("loadStudent", {this.student.student_id,this.student.access_token});
      console.log("update");
    }
  }
};
</script>

<style scoped>
</style>
