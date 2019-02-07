<template>
  <div>
    <h2>Log in</h2>

<form class="new_student" id="new_student" action="/login" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="✓"><input type="hidden" name="authenticity_token" value="VjSd4QIzXg8ttKu/YCPOPOv+8HwOL+kNQN5goPRuWey/FtFGZEso3+4VgP1upy7Lr4OB6DuZFyHa98CJ1EVt6w==">
  <div class="field">
    <label for="student_email">Email</label><br>
    <input autofocus="autofocus" autocomplete="email" type="email" value="" name="student[email]" id="student_email">
  </div>

  <div class="field">
    <label for="student_password">Password</label><br>
    <input autocomplete="current-password" type="password" name="student[password]" id="student_password">
  </div>

    <div class="field">
      <input name="student[remember_me]" type="hidden" value="0"><input type="checkbox" value="1" name="student[remember_me]" id="student_remember_me">
      <label for="student_remember_me">Remember me</label>
    </div>

  <div class="actions">
    <input type="submit" name="commit" value="Log in" data-disable-with="Log in">
  </div>
</form>

  <a href="/sign_up">Sign up</a><br>

  <a href="/password/new">Forgot your password?</a><br>
  </div>
</template>
<script>
  export default{

  }
</script>
<style>
  
</style>