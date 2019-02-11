<template>
  <div>
    <team-member :teams="parent">
      <div class="come"></div>
    </team-member>
  </div>
</template>
<script>
import TeamMember from "./TeamMember";
export default {
  components: {
    TeamMember
  },
  data() {
    return {
      parent: teams
    };
  },
  mounted() {}
};
</script>
<style scoped>
</style>