<template>
 <div>{{ currentStudent.email }}</div>
</template>

    


<script>
export default {
  data(){
    return{
      currentStudent: this.$route.params.currentStudent
    }
  },
  mounted(){
    console.log(this.currentStudent)
  }
};
</script>

<style>
</style>
