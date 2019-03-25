<template>
  <div>
    <log-in></log-in>
  </div>
</template>

<script>
import LogIn from "../components/session/LogIn";
export default {
  components: {
    LogIn
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
