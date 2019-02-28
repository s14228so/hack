<template>
  <div>
    <events></events>
  </div>
</template>

    


<script>
import Events from "./Events";
export default {
  data() {
    return {
      currentStudent: this.$store.state.currentStudent
    };
  },
  components: {
    Events
  },
  mounted() {}
};
</script>

<style>
</style>
