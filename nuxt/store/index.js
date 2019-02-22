// import Vuex from "vuex";
// import createPersistedState from "vuex-persistedstate";

// const createStore = () => {
//   return new Vuex.Store({
//     state: () => ({
//       login: true,
//       student_id: null
//     }),
//     mutations: {
//       login(state) {
//         state.login = true;
//         student_id =
//       },
//       logout(state) {
//         state.login = false;
//       }
//     },

//     //ログイン情報を引数で取るためにactionsのpayloadとかを学ぶ必要がありそう
//     actions: {
//       async getMessageAction(context) {
//         const payload = {
//           message: ""
//         };
//         await axios.get("http://localhost:3000").then(res => {
//           payload.message = res.data;
//         });
//         context.commit("getMessage", payload);
//       }
//     },
//     plugins: [
//       createPersistedState({
//         key: "login",
//         paths: ["login"],
//         storage: window.localStorage
//       })
//     ]
//   });
// };

// export default createStore;

// // Rails API
// // https://rails-api-for-nuxt.herokuapp.com/

import Vuex from "vuex";
import createPersistedState from "vuex-persistedstate";
import axios from "axios";
import "babel-polyfill";

const createStore = () => {
  return new Vuex.Store({
    state: () => ({
      login: true,
      currentStudent: {},
      test: false
    }),
    mutations: {
      login(state, payload) {
        state.login = true;
        state.currentStudent = payload.student;
      },
      logout(state) {
        state.login = false;
      },
      test(state) {
        state.test = true;
      }
    },

    //component側ではthis.$store.dispatch('testAction', { userId: id, userName: name })
    //ログイン情報を引数で取るためにactionsのpayloadとかを学ぶ必要がありそう
    actions: {
      test(context) {
        context.commit("test");
        console.log(context.state.login);
      },
      // 非同期処理や外部APIとの通信を行い、ミューテーションを呼び出す
      //（例）RailsのAPIコントローラにaxiosでログイン中のユーザーのemailを送り、返ってきたデータを'updateUserDataState'というミューテーションに送るアクション
      async getStudent(context, { email, password }) {
        const payload = {
          student: {}
        };
        await axios
          .post(`http://localhost:5000/v1/login`, {
            email: email,
            password: password
          })
          .then(res => {
            payload.student = res.data;
            localStorage.setItem("currentStudent", JSON.stringify(res.data));
          });
        context.commit("login", payload);
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

// // component側
// methods: {
//   increment() {
//     this.$store.dispatch('incrementAction')
//   },
//   changeMessage(message) {
//     this.$store.dispatch({
//       type: 'changeMessageAction', // store の actions に登録した関数
//       message // キーとバリューが同じ名前の場合 message とだけ書いてもよい
//     })
//   }
// }
