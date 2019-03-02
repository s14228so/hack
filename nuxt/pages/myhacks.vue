<template>
  <div>
    <my-hacks></my-hacks>
  </div>
</template>
<script>
import MyHacks from "../components/MyHacks";
export default {
  components: {
    MyHacks
  },
  fetch({ store, redirect }) {
    if (store.state.login === false) {
      return redirect("/");
    }
  }
};
</script>
