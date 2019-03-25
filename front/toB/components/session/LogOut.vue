<template>
  <div>
   <button @click="logout">ログアウト</button> 
  </div>
</template>

<script>
export default {
  data(){
    return{

    }
  },
  methods:{
    logout(){
      this.$store.dispatch(`reset`)
      // this.$store.state.currentCompany.access_token
      this.$router.push({
        name: "login"
      });
    }
  }
};
</script>

<style>
</style>
