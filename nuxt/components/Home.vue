<template>
  <div>
    {{currentStudent.email }}
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
      currentStudent: this.$store.state.currentStudent
    };
  },
  mounted() {}
};
</script>

<style>
</style>
