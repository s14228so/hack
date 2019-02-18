import Vuex from "vuex";
import { longStackSupport } from "q";

const createStore = () => {
  return new Vuex.Store({
    state: () => ({
      login: true
    }),
    mutations: {
      login(state) {
        state.login = true;
        localStorage.setItem("login", JSON.stringify(state));
      },
      logout(state) {
        state.login = false;
        localStorage.setItem("login", JSON.stringify(state));
      }
    }
  });
};

export default createStore;
