<template>
  <v-container mt-2>
    <v-layout row wrap>
      <v-flex xs6>
        <h2>Log in</h2>
        <template>
          <form v-model="valid" @submit.prevent="submit">
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
            <p>{{email}}</p>
            <p>{{password}}</p>
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
import axios from "axios";
import "babel-polyfill";
// curl localhost:3000/v1/login --data 'email=user@example.com&password=mypass'
export default {
  data() {
    return {
      valid: false,
      email: "",
      password: "",
      accessToken: "",
      currentStudent: {},
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
      this.select = null;
      this.checkbox = false;
    },
    async submit() {
      try {
        const response = await axios.post(`http://localhost:5000/v1/login`, {
          email: this.email,
          password: this.password
        });

        // await this.$router.go()
        // this.$router.push("/")
        this.currentStudent = response.data;
        var data = [];
        data.push(response.data);
        localStorage.setItem("currentStudent", JSON.stringify(data));
        localStorage.setItem("email", response.data.email);
        // console.log(this.currentStudent);
        this.$router.push({
          name: "index"
          // params: { currentStudent: this.currentStudent }
        });
      } catch (error) {
        console.log(error);
      }
    },
    async index() {
      try {
        const response = await axios.get(`http://localhost:5000/v1/students`);
      } catch (error) {
        console.log(error);
      }
    }
  }
};
</script>
<style>
</style>











