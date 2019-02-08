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
        event: this.$route.params.event
        //リロードしたらもってこれなくなる。
      }
    },
    mounted(){
      // axios.get(`/api/events/${this.eventId}`)
      console.log(this.event)
    }
  })
  
</script>
<style scoped>
  
</style>