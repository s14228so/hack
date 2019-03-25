<template>
  <div>
    <div>
      <h4>マイページ</h4>
      <p class="content">企業名: {{ company.name }}</p>
      <p class="content">本文: {{ company.introduction }}</p>
      <p class="content">メールアドレス: {{ company.email }}</p>
    </div>
    <hr>
    <br>
    <div>
      <h4>イベント一覧</h4>
      <my-events></my-events>
    </div>
  </div>
</template>

<script>
import axios from "~/plugins/axios";
import "babel-polyfill";
import MyEvents from "../components/MyEvents";
export default {
  data() {
    return {
      company: this.$store.state.currentCompany
    };
  },
  components: {
    MyEvents
  },
  async mouted() {
    await axios.get(`/v1/campanies/${company.id}`);
  },
  fetch({ store, redirect }) {
    if (store.state.login === false) {
      return redirect("/login");
    }
  }
};
</script>

<style scoped>
h4 {
  margin-bottom: 30px;
}
</style>
