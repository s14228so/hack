<template>
  <div>
  <v-toolbar dark>
    <v-toolbar-side-icon></v-toolbar-side-icon>
    <v-toolbar-title>Title</v-toolbar-title>
    <v-spacer></v-spacer>
    <v-toolbar-items class="hidden-sm-and-down">
      <v-btn flat>Link One</v-btn>
      <v-btn flat>Link Two</v-btn>
      <v-btn flat>Link Three</v-btn>
    </v-toolbar-items>
  </v-toolbar>
</div>
</template>



<script>
import 'babel-polyfill';
import axios from 'axios'



export default({
  name: "StudentShow",
  // components: {
  //   "navbar": Header
  // },
  data:  function(){
    return{
      students: [],
      current_student: {},
      message: "Hello Vue!"
    }
  },
  created: function() {
    this.getStudents().then(result => {
      this.students = result
      console.log(result)
    })
    
  },
  methods: {
    getStudents: async function() {
      const res = await axios.get(`/api/students`)
      if (res.status !== 200) { process.exit() }
      return res.data.array
    }
  }
})
</script>

<style scoped>
  @import '../../style/students/show.scss'
</style>