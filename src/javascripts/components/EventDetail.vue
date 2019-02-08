<template>
  <div>
    <v-container>
    <li v-for="event in events">
    {{ event.title }}
    {{ event.title }}
    {{ event.title }}
    </li>
  </v-container>
 </div>
</template>
<script>
  import axios from "axios";
  import 'babel-polyfill';
  //axiosでindexのjsonから検索かける

  export default({
    props: ["eventId"],
    data: function(){
      return{
        events: events
      }
    },
    mounted(){
      axios.get(`/api/event/${this.eventId}`)
    }
  })
  
</script>
<style scoped>
  
</style>