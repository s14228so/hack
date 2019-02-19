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
        // // images: [],
        { university: "" },
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
    this.token = data[0].access_token;
    this.status[1].email = data[0].email;
    this.status[0].nickname = data[0].nickname;
    this.status[2].university = data[0].nickname;
    this.status[10].department = data[0].department;
    this.status[3].grade = data[0].grade;
    this.status[4].introduction = data[0].introduction;
    this.status[5].app = data[0].app;
    this.status[7].phone = data[0].phone_number;
    this.status[8].firstName = data[0].first_name;
    this.status[9].lastName = data[0].last_name;
    this.status[6].address = data[0].address;
    this.id = data[0].student_id;
  },
  methods: {
    async update() {
      try {
        const responce = await axios.put(
          `http://localhost:5000/v1/students/${this.id}`,
          {
            email: this.status.email,
            nickname: this.status.nickname,
            address: this.status.address,
            phone_number: this.status.phone,
            app: this.app,
            introduction: this.status.introduction,
            grade: this.status.grade,
            university: this.status.university,
            last_name: this.lastName,
            first_name: this.status.firstName,
            department: this.status.department,
            university: this.status.university
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
