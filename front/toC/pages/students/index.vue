<template>
  <students></students>
</template>
<script>
import Students from "../../components/students/Students";
export default {
  components: {
    Students
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

