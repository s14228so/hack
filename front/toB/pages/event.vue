<template>
  <div>
    <h4>イベント作成</h4>
    <make-event></make-event>
  </div>
</template>

<script>
import MakeEvent from "../components/MakeEvent";
export default {
  components: {
    MakeEvent
  },
  fetch({ store, redirect }) {
    if (store.state.login === false) {
      return redirect("/login");
    }
  }
};
</script>

<style scoped>
</style>
