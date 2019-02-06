/* eslint no-console:0 */

import Vue from 'vue'
import Vuetify from 'vuetify'
import Header from "../javascripts/components/layout/Header.vue"
import StundentShow from "../javascripts/components/StudentShow.vue"
import 'vuetify/dist/vuetify.min.css' 

Vue.use(Vuetify)


new Vue({
  components: {
   'navbar': Header,
   'student-show': StundentShow
  },
}).$mount('#app')