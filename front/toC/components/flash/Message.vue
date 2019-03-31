<template>
  <transition name="fade">
    <div v-show="unko" id="login-msg">
      <p v-show="isLogin" title="クリックで非表示">ログインしました</p>
      <p v-show="!isLogin" title="クリックで非表示">ログアウトしました</p>
    </div>
  </transition>
</template>

<script>
export default {
  data() {
    return {
      message: "",
      unko: false
    };
  },
  computed: {
    isLogin() {
      return this.$store.state.login;
    }
  },
  watch: {
    // この関数は show が変わるごとに実行されます。
    isLogin: function(now, prev) {
      this.unko = !this.unko;
      console.log("カワッタヨ");
    }
  },
  mounted() {
    var text = document.getElementById("login-msg");

    text.classList.add("fadeout");
    setTimeout(function() {
      text.style.display = "none";
    }, 2000);
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
  animation: fadeOut 10s;
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

