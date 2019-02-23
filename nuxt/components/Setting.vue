<template>
  <!-- watch関数とか使わないと -->
  <!-- 現状初期値がパラメータとして送られてしまう -->
  <!-- updateするとidが取得できない -->
  <div>
    <h5>ユーザー情報編集</h5>
    <form @submit.prevent="update">
      <div v-for="(item,index) in status" :key="item.id">
        <div v-for="(value, key) in item" :key="key">
          <v-text-field :label="key" v-model="status[index][key]"></v-text-field>
        </div>
      </div>
      <input type="submit">
    </form>
  </div>
</template>
<script>
import axios from "axios";
import "babel-polyfill";
export default {
  data() {
    return {
      token: "",
      id: "",
      status: [
        { nickname: "" },
        { email: "" },
        { university: "" },
        { grade: "" },
        { introduction: "" },
        { app: "" },
        { address: "" },
        { phone: "" },
        { firstName: "" },
        { lastName: "" },
        { department: "" }
      ]
    };
  },
  watch: {
    // status(newVal, oldVal) {
    //   console.log(`更新前のデータ：${oldVal}`);
    //   console.log(`更新後のデータ：${newVal}`);
    // }
  },
  mounted() {
    var data = localStorage.getItem("currentStudent");
    data = JSON.parse(data);
    this.id = data.student_id;
    this.token = data.access_token;
    this.status[0].nickname = data.nickname;
    this.status[1].email = data.email;
    this.status[2].university = data.university;
    this.status[3].grade = data.grade;
    this.status[4].introduction = data.introduction;
    this.status[5].app = data.app;
    this.status[6].address = data.address;
    this.status[7].phone = data.phone_number;
    this.status[8].firstName = data.first_name;
    this.status[9].lastName = data.last_name;
    this.status[10].department = data.department;
  },
  methods: {
    async update() {
      try {
        const responce = await axios.put(
          `http://localhost:5000/v1/students/${this.id}`,
          {
            email: this.status[1].email,
            nickname: this.status[0].nickname,
            address: this.status[6].address,
            phone_number: this.status[7].phone,
            app: this.status[5].app,
            introduction: this.status[4].introduction,
            grade: this.status[3].grade,
            university: this.status[2].university,
            last_name: this.status[9].lastName,
            first_name: this.status[8].firstName,
            department: this.status[10].department
          }
        );
        const res = await axios.get(
          `http://localhost:5000/v1/students/${this.id}`,
          {
            headers: { Authorization: this.token }
          }
        );
        var data = [];
        data.push(res.data);
        this.$router.push({
          name: "index"
        });
        localStorage.setItem("currentStudent", JSON.stringify(data));
      } catch (error) {
        console.log(error);
      }
    }
  }
};
</script>
<style lang="scss" scoped>
</style>
