<template>
  <div>
    <form action method="post" novalidate="true" @submit.prevent="uploadImage" class="uploader">
      <h3>プロフィール写真の追加</h3>
      <hr>
      <input
        type="file"
        name="student[images]"
        id="student_image"
        @change="selectedFile"
        accept="image/*"
        placeholder="Upload file..."
      >
      <br>
      <input
        type="submit"
        name="commit"
        value="追加"
        data-disable-with="Update Student"
        class="img-btn"
      >
    </form>
  </div>
</template>

<script>
export default {};
</script>

<style scoped>
</style>
