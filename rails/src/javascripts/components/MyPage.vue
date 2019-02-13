<template>
  <div>
    <v-container class="my-5">
      <h1 class="subheading grey--text">マイページ</h1>
      <v-layout row wrap mt-5>
        <v-flex xs12 md4 v-show="!settingStatus">
          <v-card flat class="pa-5">
            <v-avatar>
              <img :src="blob" :alt="student.nickname">
            </v-avatar>

            <div class="caption grey--text mt-3">ユーザ名</div>
            <div>{{ student.nickname }}</div>
            <div class="caption grey--text mt-3">メールアドレス</div>
            <div>{{ student.email }}</div>
            <div class="caption grey--text mt-3">大学</div>
            <div>{{ student.university }}</div>
            <div class="caption grey--text mt-3">学部</div>
            <div>{{student.department}}</div>
            <div class="caption grey--text mt-3">学年</div>
            <div>{{ student.grade }}年</div>
            <v-icon class="icon-setting" @click="showSetting">edit</v-icon>
          </v-card>
        </v-flex>
        <v-flex md2 v-show="!settingStatus"></v-flex>
        <v-flex xs12 md4 v-show="settingStatus">
          <setting-comp></setting-comp>
        </v-flex>
      </v-layout>
      <v-form
        enctype="multipart/form-data"
        action="/students/9"
        accept-charset="UTF-8"
        method="post"
      >
        <input name="utf8" type="hidden" value="✓">
        <input type="hidden" name="_method" value="patch">
        <input
          type="hidden"
          name="authenticity_token"
          value="jmIl112dGCbGMDRHjS54MetsksXB8mUFNX4tiF47/tPNr+eS4h1sBpHIAnHY90mPePfUAkd9Mxt7XPTs7pBCpg=="
        >
        <input
          multiple="multiple"
          type="file"
          name="student[images][]"
          id="student_images"
          @change="onFileChange"
        >
        <br>
        <div v-if="image">
          <img :src="image" width="50" height="50">
          <button @click="removeImage">Remove image</button>
        </div>

        <input
          type="submit"
          name="commit"
          value="Update Student"
          data-disable-with="Update Student"
        >
      </v-form>

      <!-- https://codepen.io/Atinux/pen/qOvawK -->
    </v-container>
  </div>
</template>
<script>
import axios from "axios";
import "babel-polyfill";
import Setting from "../components/Setting.vue";

export default {
  name: "MyPage",
  data: function() {
    return {
      student: {},
      infos: ["ユーザ名", "メールアドレス", "大学", "学部", "学年"],
      settingStatus: false,
      // blob_url: blob_url,
      image: "",
      blob: ""
    };
  },
  components: {
    "setting-comp": Setting
  },
  methods: {
    showSetting: function() {
      this.settingStatus = true;
    },
    onFileChange(e) {
      var files = e.target.files || e.dataTransfer.files;
      if (!files.length) return;
      this.createImage(files[0]);
    },
    createImage(file) {
      var image = new Image();
      var reader = new FileReader();
      var vm = this;

      reader.onload = e => {
        vm.image = e.target.result;
      };
      reader.readAsDataURL(file);
    },
    removeImage: function(e) {
      this.image = "";
    }
  },
  mounted: async function() {
    const res = await axios.get(`/api/student`);
    if (res.status !== 200) {
      process.exit();
    }
    this.student = res.data.student;
    this.blob = res.data.image;
    //これだとカレンダー側からしか呼び出せていない
    console.log();
  }
};
</script>
<style scoped>
.icon-setting {
  float: right;
  cursor: pointer;
}
</style>
