/* eslint no-console:0 */

import Vue from 'vue'
import Vuetify from 'vuetify'
import router from '../javascripts/router'
import Navbar from "../javascripts/components/layout/Navbar.vue"
import StundentShow from "../javascripts/components/StudentShow.vue"
import 'vuetify/dist/vuetify.min.css' 
import MyPage from "../javascripts/components/MyPage.vue"

Vue.use(Vuetify)


new Vue({
  router,
  components: {
    Navbar,
    MyPage,
   'student-show': StundentShow
  },
}).$mount('#app')