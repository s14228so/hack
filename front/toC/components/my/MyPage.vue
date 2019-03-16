<template>
  <div>
    <v-container class="my-5">
      <h1 class="subheading grey--text">マイページ</h1>
      <v-layout row wrap mt-5>
        <v-flex xs12 md4 v-show="!settingStatus">
          <v-card flat class="pa-5">
            <div v-if="student.image">
              <v-avatar>
                <img :src="student.image">
              </v-avatar>
            </div>
            <div v-else class="default-img">
              <img :src="img_src">
            </div>

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
        <div v-if="image">
          <form
            action
            method="post"
            novalidate="true"
            @submit.prevent="uploadImage"
            class="uploader"
          >
            <h3>プロフィール写真の追加</h3>
            <hr>
            <input
              type="file"
              name="student[images]"
              id="student_image"
              @change="selectedFile"
              accept="image/*"
              placeholder="Upload file..."
            >
            <br>
            <input
              type="submit"
              name="commit"
              value="追加"
              data-disable-with="Update Student"
              class="img-btn"
            >
          </form>
        </div>
        <v-flex md2 v-show="!settingStatus"></v-flex>
        <v-flex xs12 md4 v-show="settingStatus">
          <setting-comp @update="rails"></setting-comp>
        </v-flex>
      </v-layout>
    </v-container>
  </div>
</template>
<script>
import axios from "axios";
import "babel-polyfill";
import Setting from "../../components/Setting.vue";

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
      uploadFile: null,
      img_src: require("../../assets/noimg.jpeg")
    };
  },
  components: {
    "setting-comp": Setting
  },
  async mounted() {
    this.student = this.$store.state.currentStudent;
  },
  methods: {
    showSetting: function() {
      this.settingStatus = true;
    },
    rails() {
      this.settingStatus = false;
    },
    selectedFile(e) {
      e.preventDefault();
      const files = e.target.files;
      this.uploadFile = files[0];
      console.log(this.uploadFile);
    },
    async uploadImage() {
      const formData = new FormData();
      formData.append("student[images]", this.uploadFile);
      console.log(formData);
      const response = await axios.post(
        `http://localhost:5000/v1/students/${this.student.student_id}/image`,
        formData,
        {
          headers: { Authorization: this.student.access_token }
        }
      );
      this.$store.dispatch(`updateImg`, {
        access_token: this.student.access_token,
        student_id: this.student.student_id,
        image: formData
      });
      this.$router.push({
        name: "index"
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
.uploader {
  margin-top: 20px;
  margin-left: 70px;
}
.uploader hr {
  margin-bottom: 20px;
}
.img-btn {
  margin-top: 20px;
  padding: 8px 14px;
  background: gray;
  color: #fff;
  border-radius: 10px;
}
.default-img img {
  width: 50px;
  height: 50px;
  border-radius: 50%;
}
</style>
