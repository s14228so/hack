<template>
  <div>
    <log-in></log-in>
  </div>
</template>

<script>
import LogIn from "../components/session/LogIn";
export default {
  layout: "logout",
  components: {
    LogIn
  },
  async asyncData({ params }) {
    // let { data } = await axios.get(`https://my-api/posts/${params.id}`);
    // return { title: data.title };
  },
  fetch({ store, redirect }) {
    if (store.state.login === true) {
      return redirect("/");
    }
  }
};
</script>

<style>
</style>
