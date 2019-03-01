<template>
  <transition name="fade">
    <p v-if="show" class="login-msg">ログインしました</p>
  </transition>
</template>

<script>
export default {
  data() {
    return {
      show: this.$store.state.login
    };
  },
  mounted() {},
  methods: {}
};
</script>

<style scoped>
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.5s;
}
.fade-enter,
.fade-leave-to {
  opacity: 0;
}

.login-msg {
  color: green;
}
</style>
