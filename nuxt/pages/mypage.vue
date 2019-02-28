<template>
  <my-page></my-page>
</template>
<script>
import MyPage from "../components/MyPage";
export default {
  components: {
    MyPage
  },
  fetch({ store, redirect }) {
    if (store.state.login === false) {
      return redirect("/");
    }
  }
};
</script>
<style>
</style>

