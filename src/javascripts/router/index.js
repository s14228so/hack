import Vue from 'vue/dist/vue.esm'
import Router from 'vue-router'
import MyPage from '../components/MyPage.vue'
import Home from '../components/Home.vue'
import LoginView from '../components/devise/LoginView.vue'
import MyHacks from '../components/MyHacks.vue'

Vue.use(Router)

export default new Router({
  hashbang: false,
  mode: 'history',
  routes: [
    {
      path: "/",
      name: "Home",
      component: Home
    },
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
    {
      path: '/login',
      name: 'LoginView',
      component: LoginView
    },
    {
      path: '/myhacks',
      name: 'MyHacks',
      component: MyHacks
    }
  ]
})

