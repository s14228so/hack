import Vuex from "vuex";
import createPersistedState from "vuex-persistedstate";

const createStore = () => {
  return new Vuex.Store({
    state: () => ({
      login: true
    }),
    mutations: {
      login(state) {
        state.login = true;
      },
      logout(state) {
        state.login = false;
      }
    },
    plugins: [
      createPersistedState({
        key: "login",
        paths: ["login"],
        storage: window.localStorage
      })
    ]
  });
};

export default createStore;

// import Vuex from "vuex";

// Vue.use(Vuex);

// export default new Vuex.Store({
//   state: () => ({
//     login: true
//   }),
//   mutations: {
//     login(state) {
//       state.login = true;
//       localStorage.setItem("login", JSON.stringify(state));
//     },
//     logout(state) {
//       state.login = false;
//       localStorage.setItem("login", JSON.stringify(state));
//     }
//   },
//   plugins: [
//     createPersistedState({
//       key: "login",
//       paths: ["login"],
//       storage: window.sessionStorage
//     })
//   ]
// });
