<template>
  <v-container mt-2>
    <v-layout row wrap>
      <v-flex xs6>
        <h2>Log in</h2>

        <v-form
          class="new_student mt-2"
          id="new_student"
          action="/login"
          accept-charset="UTF-8"
          method="post"
        >
          <input name="utf8" type="hidden" value="✓">
          <input
            type="hidden"
            name="authenticity_token"
            value="VjSd4QIzXg8ttKu/YCPOPOv+8HwOL+kNQN5goPRuWey/FtFGZEso3+4VgP1upy7Lr4OB6DuZFyHa98CJ1EVt6w=="
          >

          <!--   <v-text-field label="e-mail">
    <input autofocus="autofocus" autocomplete="email" type="email" value="" name="student[email]" id="student_email">
  </v-text-field>
          -->
          <v-text-field
            name="student[email]"
            id="student_email"
            autofocus="autofocus"
            autocomplete="email"
            type="email"
            label="email"
            class="mt-2"
          ></v-text-field>

          <v-text-field
            placeholder="password"
            label="password"
            autocomplete="current-password"
            type="password"
            name="student[password]"
            id="student_password"
            autofocus="autofocus"
            class="mt-2"
          ></v-text-field>
          <!-- 
    <div class="field">
      <input name="student[remember_me]" type="hidden" value="0"><input type="checkbox" value="1" name="student[remember_me]" id="student_remember_me">
      <label for="student_remember_me">Remember me</label>
    </div>
          -->
          <v-checkbox label="remember_me" name="student[remember_me]" type="hidden" value="0"></v-checkbox>

          <div class="actions">
            <v-btn
              type="submit"
              name="commit"
              value="Log in"
              data-disable-with="Log in"
              class="px-3 py-2 round"
            >Login</v-btn>
          </div>
        </v-form>
        <!-- <a href="/sign_up">Sign up</a> -->
        <div class="mt-3">
        <router-link to="/sign_up">Sign Up</router-link>
        </div>
        <br>

        <!-- <a href="/password/new">Forgot your password?</a> -->
        <br>
      </v-flex>
    </v-layout>
  </v-container>
</template>
<script>
export default {};
</script>
<style>
</style>











