<template>
  <div>
    <button type="submit" @click="$emit('destroyUserSession')" class="black--text">Log Out</button>
  </div>
</template>
<script>
import axios from "axios";
import "babel-polyfill";
export default {
  data() {
    return {
      token: ""
    };
  },
  methods: {
    // async destroyUserSession() {
    //   try {
    //     const response = await axios.delete(`http://localhost:5000/v1/logout`, {
    //       params: { access_token: this.token }
    //     });
    //     localStorage.clear();
    //     this.$router.push({
    //       name: "login"
    //       // params: { currentStudent: this.currentStudent }
    //     });
    //   } catch (error) {
    //     console.log(error);
    //   }
    // }
  }
};
</script>
<style scoped>
</style>