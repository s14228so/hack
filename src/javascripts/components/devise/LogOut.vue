<template>
  <div>
    <button type="submit" @click="destroyUserSession">Log Out</button>
  </div>
</template>
<script>
  import axios from "axios"
  import 'babel-polyfill';
  export default({
    data(){
      return{

      }
    },
    mouted(){

    },
    methods: {
      async destroyUserSession () {
        try{
          await axios.delete(`/api/students/sign_out`)
          await this.$router.go()
          this.$router.push('/login')
        } catch (error){
          console.log(error)
        }
      }
    }
  })
</script>
<style scoped>
  
</style>