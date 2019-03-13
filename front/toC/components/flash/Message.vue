<template>
  <transition name="fade">
    <p v-if="show" title="クリックで非表示" id="login-msg">ログインしました</p>
    <p v-if="!show" title="クリックで非表示" id="login-msg">ログアウトしました</p>
  </transition>
</template>

<script>
export default {
  data() {
    return {
      show: this.$store.state.login,
      message: ""
    };
  },
  watch: {
    // この関数は question が変わるごとに実行されます。
    show: function(now, prev) {
      console.log("changed:", prev, "->", now);
    }
  },
  mounted() {
    var text = document.getElementById("login-msg");
    text.addEventListener(
      "click",
      function() {
        text.classList.add("fadeout");
        setTimeout(function() {
          text.style.display = "none";
        }, 1000);
      },
      false
    );
  },
  methods: {}
};
</script>




<style scoped>
#login-msg {
  color: green;
  cursor: pointer;
}
.fadeout {
  animation: fadeOut 1s;
  animation-fill-mode: both;
}
@keyframes fadeOut {
  0% {
    opacity: 1;
  }
  100% {
    opacity: 0;
  }
}
</style>

