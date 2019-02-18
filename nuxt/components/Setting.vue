<template>
  <div>
    <h5>ユーザー情報編集</h5>
    <form @submit.prevent="update">
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
  </div>
</template>
<script>
export default {
  data() {
    return {};
  },
  computed() {
    token: {
    }
  },
  methods: {
    async update() {
      const responce = await axios.post(
        "http://localhost:5000/v1/students/${id}/"
      );
    }
  }
};
</script>
<style lang="scss" scoped>
</style>
