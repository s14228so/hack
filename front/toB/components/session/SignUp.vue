<template>
  <v-container mt-2 class="signup-wrap">
    <v-layout row wrap>
      <v-flex xs6>
        <h2>Sign Up</h2>
        <template>
          <form @submit.prevent="submit">
            <v-text-field
              required
              :rules="emailRules"
              v-model="email"
              :counter="20"
              label="email"
              name="email"
            ></v-text-field>
            <v-text-field
              required
              :rules="passwordRules"
              v-model="password"
              :counter="20"
              name="password"
              label="Password"
            ></v-text-field>
            <v-text-field
              required
              :rules="passwordRules"
              v-model="passwordConfirm"
              :counter="20"
              name="passwordConfirm"
              label="PasswordConfirm"
            ></v-text-field>
            <v-text-field
              required
              :rules="passwordRules"
              v-model="name"
              :counter="20"
              name="name"
              label="name"
            ></v-text-field>
            {{password}}
            {{passwordConfirm}}
            <v-checkbox label="Do you agree?" required></v-checkbox>
            <!-- <input type="submit" @click="submit"> -->
            <input type="submit">
            <v-btn @click="clear">clear</v-btn>
          </form>
        </template>
      </v-flex>
    </v-layout>
  </v-container>
</template>
<script>
import axios from "~/plugins/axios";
import "babel-polyfill";
export default {
  data() {
    return {
      valid: false,
      email: "",
      password: "",
      passwordConfirm: "",
      name: "",
      accessToken: "",
      currentCompany: {},
      login: "",
      emailRules: [
        v => !!v || "Email is required",
        v => /.+@.+/.test(v) || "Email must be valid"
      ],
      passwordRules: [
        v => !!v || "Password is required",
        v => v.length >= 5 || "Name must be more than 6 characters"
      ]
    };
  },
  mounted() {},
  methods: {
    clear() {
      this.email = "";
      this.password = "";
      this.name = "";
      this.password = "";
      this.passwordConfirm = "";
      this.select = null;
      this.checkbox = false;
    },
    async submit() {
      // try {
      //   const response = await axios.post(`/v1/companies`, {
      //     company: {
      //       email: this.email,
      //       password: this.password
      //     }
      //   });
      //   this.currentCompany = response.data;
      //   var data = [];
      //   data.push(response.data);
      //   localStorage.setItem("currentCompany", JSON.stringify(data));
      //   this.$store.state.currentCompany = response.data;
      //   this.$store.state.login = true;
      this.$store.dispatch("signUp", {
        email: this.email,
        password: this.password
      });

      // } catch (error) {
      //   console.log(error);
      // }
    }
  }
};
</script>
<style scoped>
.signup-wrap {
  padding-left: 350px;
}
</style>











