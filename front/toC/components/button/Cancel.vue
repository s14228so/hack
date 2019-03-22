<template>
  <div>
    <v-btn fab small round @click="dialog">×</v-btn>
  </div>
</template>

<script>
export default {
  methods: {
    dialog() {
      this.$emit("dialog");
    }
  }
};
</script>

<style scoped>
button .v-btn {
  width: 50px;
}
</style>
