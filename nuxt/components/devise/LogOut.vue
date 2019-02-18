<template>
  <div>
    <button type="submit" @click="destroyUserSession" class="black--text">Log Out</button>
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
  mounted() {
    if(localStorage.currentStudent){
    var data = localStorage.getItem("currentStudent");
    data = JSON.parse(data);
    this.token = data[0].access_token;
    console.log(this.token);
    }
  },
  methods: {
    async destroyUserSession() {
      try {
        const response = await axios.delete(`http://localhost:5000/v1/logout`, {
          params: { access_token: this.token }
        });
        localStorage.clear();
        this.$router.push({
          name: "login"
          // params: { currentStudent: this.currentStudent }
        });
      } catch (error) {
        console.log(error);
      }
    }
  }
};
</script>
<style scoped>
</style>