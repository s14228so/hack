<template>
  <v-container mt-2>
    <v-layout row wrap>
      <v-flex xs6>
        <h2>Log in</h2>
        <template>
  <form>
    <v-text-field
      v-model="email"
      :counter="10"
      label="email"
      required
    ></v-text-field>
    <v-text-field
      v-model="password"
      label="Password"
      required
    ></v-text-field>
    <p>{{email}}</p>
    <p>{{password}}</p>
    <v-checkbox
      label="Do you agree?"
      required
    ></v-checkbox>

    <v-btn @click="submit">submit</v-btn>
    <v-btn @click="clear">clear</v-btn>
    <v-btn @click="index">index</v-btn>
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
  data(){
    return{
      email: "",
      password: "",
      accessToken: "",
      currentStudent: {}
    }
  },
  mounted(){
    console.log(localStorage)
  },
  methods: {
    clear () {
        this.email = ''
        this.password = ''
        this.select = null
        this.checkbox = false
    },
    async submit() {
      try {
        const response = await axios.post(`http://localhost:5000/v1/login`, {
          email: this.email, password: this.password
        });
        
        // await this.$router.go()
        // this.$router.push("/")
        this.currentStudent = response.data;
        var data = [];
        data.push(response.data)
        localStorage.setItem('currentStudent', JSON.stringify(data));

         localStorage.setItem('email', response.data.email);
          // console.log(this.currentStudent);
        this.$router.push({
        name: "index",
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
    },
  }
};
</script>
<style>
</style>











