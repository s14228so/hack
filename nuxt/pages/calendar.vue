<template>
  <div>
    <calendar></calendar>
  </div>
</template>

<script>
import Calendar from "../components/Calendar";
export default {
  components: {
    Calendar
  },
  fetch({ store, redirect }) {
    if (store.state.login === false) {
      return redirect("/");
    }
  }
};
</script>
