<template>
  <div>
    <events></events>
  </div>
</template>

    


<script>
import Events from "./events/Events";
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
