import Vue from 'vue/dist/vue.esm'
import Router from 'vue-router'
import MyPage from '../components/MyPage.vue'
import Home from '../components/Home.vue'

Vue.use(Router)

export default new Router({
  hashbang: false,
  mode: 'history',
  routes: [
    {
      path: '/mypage',
      name: 'MyPage',
      component: MyPage
    },
    {
      path: '/home',
      name: 'Home',
      component: Home
    },
    
    
  ]
})

