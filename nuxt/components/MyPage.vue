<template>
  <div>
    <v-container class="my-5">
      <h1 class="subheading grey--text">マイページ</h1>
      <v-layout row wrap mt-5>
        <v-flex xs12 md4 v-show="!settingStatus">
          <v-card flat class="pa-5">
            <v-avatar>
              <img :src="student.image">
            </v-avatar>

            <p class="caption grey--text mt-3">ユーザ名</p>
            <p>{{ student.nickname }}</p>
            <p class="caption grey--text mt-3">メールアドレス</p>
            <p>{{ student.email }}</p>
            <p class="caption grey--text mt-3">大学</p>
            <p>{{ student.university }}</p>
            <p class="caption grey--text mt-3">学部</p>
            <p>{{student.department}}</p>
            <p class="caption grey--text mt-3">学年</p>
            <p>{{ student.grade }}年</p>
            <v-icon class="icon-setting" @click="showSetting">edit</v-icon>
          </v-card>
        </v-flex>
        <v-flex md2 v-show="!settingStatus"></v-flex>
        <v-flex xs12 md4 v-show="settingStatus">
          <setting-comp></setting-comp>
        </v-flex>
      </v-layout>
      <form action method="post" novalidate="true" @submit.prevent="uploadImage">
        <!-- <input type="hidden" name="authenticity_token" :value="this.student.access_token"> -->
        <!-- <input
          type="file"
          name="student[image][]"
          id="student_images"
          @change="processFile($event)"
        >-->
        <input
          type="file"
          name="student[images]"
          id="student_image"
          @change="selectedFile"
          accept="image/*"
          placeholder="Upload file..."
        >
        <br>
        <!-- <div v-if="image">
          <img :src="image" width="50" height="50">
          <button @click="removeImage">Remove image</button>
        </div>-->
        <input
          type="submit"
          name="commit"
          value="Update Student"
          data-disable-with="Update Student"
        >
      </form>

      <!-- https://codepen.io/Atinux/pen/qOvawK -->
    </v-container>
  </div>
</template>
<script>
import axios from "axios";
import "babel-polyfill";
import Setting from "./Setting.vue";

export default {
  name: "MyPage",
  data: function() {
    return {
      student: {},
      infos: ["ユーザ名", "メールアドレス", "大学", "学部", "学年"],
      settingStatus: false,
      // blob_url: blob_url,
      image: "",
      blob: "",
      uploadFile: null
    };
  },
  components: {
    "setting-comp": Setting
  },
  mounted: async function() {
    if (localStorage.currentStudent) {
      var data = localStorage.getItem("currentStudent");
      data = JSON.parse(data);
      this.student = data;
    }
    // } else {
    //   const res = await axios.get(
    //     `http://localhost:5000/v1/students/${this.$store.state.currentStudent.student_id}`,
    //     {
    //       headers: { Authorization: this.token }
    //     }
    //   );
    //   var data = [];
    //   data.push(res.data);
    //   localStorage.setItem("currentStudent", JSON.stringify(data));

    //   this.student = data;
    // }
  },
  methods: {
    showSetting: function() {
      this.settingStatus = true;
    },
    selectedFile(e) {
      e.preventDefault();
      const files = e.target.files;
      this.uploadFile = files[0];
      console.log(this.uploadFile);
    },
    async uploadImage() {
      // formData.append("student[image]", this.uploadFile);
      // console.log(formData);
      const formData = new FormData();

      // const formData = new FormData();
      formData.append("student[images]", this.uploadFile);
      console.log(formData);
      const response = await axios.post(
        `http://localhost:5000/v1/students/${this.student.student_id}/image`,
        formData,
        {
          headers: { Authorization: this.student.access_token }
        }
      );
      localStorage.removeItem("currentStudent");
      this.$router.push({
        name: "mypage"
      });
    }
  }
};
</script>
<style scoped>
.icon-setting {
  float: right;
  cursor: pointer;
}
</style>
