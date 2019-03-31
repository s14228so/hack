// // ~/plugins/localStorage.js

import createPersistedState from 'vuex-persistedstate'

export default ({
  store
}) => {
  window.onNuxtReady(() => {
    createPersistedState({
      key: "app",
      paths: ["login", "currentStudent"],
      storage: window.localStorage
    })(store)
  })
}
