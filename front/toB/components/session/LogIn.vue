<template>
  <v-container mt-2>
    <v-layout row wrap>
      <v-flex xs6>
        <template>
          <form @submit.prevent="submit" class="box">
            <h2>Log in</h2>
            <v-text-field
              required
              :rules="emailRules"
              v-model="email"
              :counter="20"
              label="email"
              name="email"
              class="email"
            ></v-text-field>
            <v-text-field
              required
              :rules="passwordRules"
              v-model="password"
              :append-icon="show ? 'visibility_off' : 'visibility'"
              :type="show ? 'text' : 'password'"
              :counter="20"
              :autocomplete="true"
              name="password"
              label="Password"
            ></v-text-field>
            <v-checkbox label="Do you agree?" required></v-checkbox>
            <!-- <input type="submit" @click="submit"> -->
            <input type="submit" value="login">
            <v-btn @click="clear" class="clear">clear</v-btn>
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
      login: "",
      show: false,
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
    submit() {
      this.$store.dispatch(`getCompany`, {
        email: this.email,
        password: this.password
      });
      this.$router.push({
        name: "index"
      });
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
<style scoped>
.box {
  background: #3d454c;
  width: 35%;
  padding: 40px;
  border-radius: 20px;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  text-align: center;
}
.box h2 {
  color: white;
  text-transform: uppercase;
  font-weight: 500;
  margin-bottom: 30px;
}

.box input[type="text"],
.box input[type="password"] {
  border: 0;
  background: none;
  display: block;
  margin: 20px auto;
  text-align: center;
  border: 2px solid #3498db;
  padding: 14px 10px;
  width: 100px;
  outline: none;
  color: white;
  border-radius: 24px;
  transition: 0.5s;
}

.box input[type="text"]:focus,
.box input[type="password"]:focus {
  width: 280px;
  border-color: #2ecc71;
}

.clear {
  border-radius: 24px;
  padding: 14px 10px 32px;
}

.box input[type="submit"] {
  border: 0;
  background: none;
  display: block;
  margin: 20px auto;
  text-align: center;
  border: 2px solid #2ecc71;
  padding: 12px 30px;
  outline: none;
  color: white;
  border-radius: 24px;
  transition: 0.5s;
  cursor: pointer;
}

.box input[type="submit"]:hover {
  background: #2ecc71;
}
</style>













