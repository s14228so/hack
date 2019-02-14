<template>
  <div>
    {{ currentStudent.email }}
    {{currentStudent.nickname}}
    {{currentStudent.address}}
    {{currentStudent.univeristy}}
    {{currentStudent.app}}
    {{currentStudent.first_name}}
    {{currentStudent.last_name}}
    {{currentStudent.student_id}}
  </div>
</template>

    


<script>
export default {
  data() {
    return {
      currentStudent: {}
    };
  },
  mounted() {
    // console.log(this.currentStudent)
    var data = localStorage.getItem("currentStudent");
    data = JSON.parse(data);
    this.currentStudent = data[0];
    console.log(this.currentStudent);
  }
};
</script>

<style>
</style>
