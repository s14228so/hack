<template>
  <div>
    <h2>ユーザーログイン</h2>
    <div>メールアドレス</div>
    <input
      @input="updateStudentEmail"
      :value="student.email"
    />
    <div>パスワード</div>
    <input
      @input="updateStudentPass"
      :value="student.password"
    /><br>
    <button type="submit" @click="newStudentSession">ログイン</button>
    <a href="/sign_up">登録</a>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data () {
    return {
      // フォームなどで送信する亀の情報を保存
      student: {
        email: 'yamamoto@gmail.com',
        password: 'pppppppp',
      }
    }
  },
  mounted () {
  },
  methods: {
    // ---------------------- フォームに入力してある値をdata()にある値に保存するための関数。
    updateStudentEmail (e) {
      this.student.email = e.target.value
    },
    updateStudentPass (e) {
      this.student.password = e.target.value
    },
    // ---------------------- ログイン ----------------------
    async  newUserSession () {
      try {
        const response = await axios.post('/api/students/sign_in', this.student)
        // リダイレクト先指定。
        await this.$router.go()
        this.$router.push('/')
      } catch (error) {
        // サーバーもしくはネットワークのエラーが返ってきた場合の処理。
        console.log(error)
      }
    }
  }
}
</script>

<style scoped>
</style>
