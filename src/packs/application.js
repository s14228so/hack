/* eslint no-console:0 */

import Vue from 'vue/dist/vue.esm'
import Header from "../javascripts/components/layout/Header.vue"
import StundentShow from "../javascripts/components/StudentShow.vue"

new Vue({
  components: {
   'navbar': Header,
   'student-show': StundentShow
  },
}).$mount('#app')