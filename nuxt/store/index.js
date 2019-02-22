import Vuex from "vuex";
import createPersistedState from "vuex-persistedstate";

const createStore = () => {
  return new Vuex.Store({
    state: () => ({
      login: true,
      student_id: null
    }),
    mutations: {
      login(state) {
        state.login = true;
      },
      logout(state) {
        state.login = false;
      }
    },

    //ログイン情報を引数で取るためにactionsのpayloadとかを学ぶ必要がありそう
    actions: {
      async getMessageAction(context) {
        const payload = {
          message: ""
        };
        await axios.get("http://localhost:3000").then(res => {
          payload.message = res.data;
        });
        context.commit("getMessage", payload);
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
