<template>
  <div>
    <v-container>
      {{ event.title }}
    </v-container>
 </div>
</template>
<script>
  import axios from "axios";
  import 'babel-polyfill';
  //axiosでindexのjsonから検索かける

  export default({
    data: function(){
      return{
        event: {}
        //リロードしたらもってこれなくなる。
      }
    },
   created:  async function() {
      const res = await axios.get(`/api/events/${this.$route.params.id}`)
      if (res.status !== 200) { process.exit() }
      console.log(res.data)
      this.event = res.data.event
     }
  })




  
</script>
<style scoped>
  
</style>