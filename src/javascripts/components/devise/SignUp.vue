<template>
<v-container mt-2>
  <v-layout row wrap>
    <v-flex xs6>
    <h2>Sign up</h2>

<v-form class="new_student" id="new_student" action="/" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="✓"><input type="hidden" name="authenticity_token" value="SycOztDjRzShdnL3HSVUaFENuWxEAZhFNKewuBpv8nsTaLm77N6b3IhdNjnTR+kRc4E6tWhraIHyWiwcgjCrlQ==">
  

  <v-text-field label="student_email" autofocus="autofocus" autocomplete="email" type="email" value="" name="student[email]" id="student_email">
  </v-text-field>



  <v-text-field label="student_password" autocomplete="new-password" type="password" name="student[password]" id="student_password" aria-autocomplete="list">
  </v-text-field>
    <em>(6 characters minimum)</em>


<v-text-field label="student_password_confirmation" autocomplete="new-password" type="password" name="student[password_confirmation]" id="student_password_confirmation">
</v-text-field>

  <div class="actions">
    <v-btn type="submit" name="commit" value="Sign up" data-disable-with="Sign up">Sign Up
    </v-btn>
  </div>
</form>
  <router-link to="/login">Log in</router-link><br>

</v-form>
</v-flex>
</v-layout>
</v-container>
</template>
<script>
  
</script>
<style>
  
</style>