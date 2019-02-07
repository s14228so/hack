<template>
  <v-container>
    <div v-for="event in events">
      {{ event.date }}
      {{ event.title }}
    </div>
</v-container>
</template>

<script>
  export default({
    data: function(){
      return{
      events: my_events
      }
    },
    mounted: function(){
      console.log(this.events)
    }
  })
  
</script>
<style scoped>
  
</style>