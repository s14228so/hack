<template>
  <div>
    <h1>

    </h1>
  </div>
</template>


<script>
export default({
  name: "StudentShow",
  data:  function(){
    return{
      students: []
    }
  },
  async mounted (){
    const responce = await axios.get('/api/students')
    this.users = responce.data
    console.log(responce.data)
  },
  methods: {

  }
})
</script>

<style scoped>
  @import '../../style/students/show.scss'
</style>