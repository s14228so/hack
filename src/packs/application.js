/* eslint no-console:0 */

import Vue from 'vue/dist/vue.esm'
import Header from "../javascripts/components/layout/Header.vue"
import Unko from "../javascripts/components/Unko.vue"
new Vue({
  components: {
   'navbar': Header,
    Unko
  },
}).$mount('#app')