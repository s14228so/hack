<template>
  <div>
    <v-container>
      {{ event.title }}
      <div v-for="student in students" class="mt-3">
      <v-chip>
      {{ student.nickname}}
      </v-chip>
      </div>
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
        students: join_students
        //リロードしたらもってこれなくなる。

      }
    },
    props: ["event"],
   mounted:  async function() {
      const res = await axios.get(`/api/events/${this.$route.params.id}`)
      if (res.status !== 200) { process.exit() }
      this.event = res.data.event
    //これだとカレンダー側からしか呼び出せていない

     }
  })




  
</script>
<style scoped>
  
</style>