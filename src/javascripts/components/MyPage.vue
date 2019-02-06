<template>
  <div>
    <p>{{ student.nickname }}</p>
    <p>{{ student.first_name }} {{student.last_name}}</p>
    <p>{{ student.email }}</p>
    <p>{{ student.university }}</p>
    <p>{{ student.department }}</p>
    <p>{{ student.grade }}年</p>
  </div>
</template>
<script>
  export default({
    name: "MyPage",
    data: function(){
      return {
        student: rails.student
      }
    }
  })
</script>