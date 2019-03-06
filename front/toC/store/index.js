import Vuex from "vuex";
import createPersistedState from "vuex-persistedstate";
import state from "./state";
import actions from "./actions";
import mutations from "./mutations";
import "babel-polyfill";

const createStore = () => {
  return new Vuex.Store({
    state: state,
    mutations: mutations,
    actions: actions,
    plugins: [
      createPersistedState({
        key: "app",
        paths: ["login", "currentStudent"],
        storage: window.localStorage
      })
    ]
  });
};

export default createStore;

// Rails API
// https://rails-api-for-nuxt.herokuapp.com/
