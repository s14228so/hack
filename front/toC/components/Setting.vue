<template>
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
      student: this.$store.state.currentStudent,
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
  async mounted() {
    this.id = this.student.student_id;
    this.token = this.student.access_token;
    this.status[0].nickname = this.student.nickname;
    this.status[1].email = this.student.email;
    this.status[2].university = this.student.university;
    this.status[3].grade = this.student.grade;
    this.status[4].introduction = this.student.introduction;
    this.status[5].app = this.student.app;
    this.status[6].address = this.student.address;
    this.status[7].phone = this.student.phone_number;
    this.status[8].firstName = this.student.first_name;
    this.status[9].lastName = this.student.last_name;
    this.status[10].department = this.student.department;
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
        console.log(responce.data);
        this.$store.dispatch(`update`, responce.data);
        this.$router.push({
          name: "mypage"
        });
        this.$emit("update");
      } catch (error) {
        console.log(error);
      }
    }
  }
};
</script>
<style lang="scss" scoped>
</style>
