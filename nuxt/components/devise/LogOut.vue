<template>
  <div>
    <button type="submit" @click="destroyUserSession" class="white black--text">Log Out</button>
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
  mouted() {
    var data = localStorage.getItem("currentStudent");
    data = JSON.parse(data);
    this.token = data[0].access_token;
    console.log(this.token);
  },
  methods: {
    async destroyUserSession() {
      try {
        await axios.delete(`http://localhost:5000/v1/logout`, {
          access_token: this.token
        });
        this.$router.push("/login");
      } catch (error) {
        console.log(error);
      }
    }
  }
};
</script>
<style scoped>
</style>