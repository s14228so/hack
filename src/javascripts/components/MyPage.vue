<template>
  <div>
    <v-container class="my-5">
      <h1 class="subheading grey--text">マイページ</h1>
        <v-layout row wrap mt-5>
          <v-flex xs12 md4 v-show="!settingStatus">
             <v-card flat class="pa-5">
           <v-avatar>
              <img
                :src="blob_url" height="40"
                :alt="student.nickname"
              >
            </v-avatar>

            <div class="caption grey--text mt-3">
              ユーザ名
            </div>
            <div>{{ student.nickname }}</div>
            <div class="caption grey--text mt-3">
              メールアドレス
            </div>
            <div>{{ student.email }}</div>
               <div class="caption grey--text mt-3">
              大学
            </div>
            <div>{{ student.university }}</div>
             <div class="caption grey--text mt-3">
              学部
            </div>
            <div>{{student.department}}</div>
             <div class="caption grey--text mt-3">
              学年
            </div>
            <div>{{ student.grade }}年</div>
             <v-icon class="icon-setting" @click="showSetting">edit</v-icon>
             </v-card>
         </v-flex>
          <v-flex md2 v-show="!settingStatus">
         </v-flex>
         <v-flex xs12 md4 v-show="settingStatus">
          <setting-comp></setting-comp>
         </v-flex>
        </v-layout>  
   </v-container>
  </div>
</template>
<script>
    import axios from "axios";
  import 'babel-polyfill';
  import Setting from "../components/Setting.vue"

  export default({
    name: "MyPage",
    data: function(){
      return {
        student: rails.student,
        infos: ["ユーザ名","メールアドレス","大学","学部","学年"],
        settingStatus: false,
        blob_url: blob_url
      }
    },
    components:{
      "setting-comp": Setting
    },
    methods: {
      showSetting: function(){
        this.settingStatus = true
      }
    },
    mounted: function(){
      console.log(rails_blob_url(student.pic));
    }
  })
</script>
<style scoped>
  .icon-setting{
    float: right;
    cursor: pointer;
  }
</style>