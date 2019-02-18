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

// Rails API
// https://rails-api-for-nuxt.herokuapp.com/
