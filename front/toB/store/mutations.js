const mutations = {
  login(state, payload) {
    state.currentCompany = payload.company;
    if (state.currentCompany.error) {
      state.login = false;
    } else {
      state.login = true;
      state.items = [{
          icon: "apps",
          title: "マイページ",
          to: "/"
        },

        {
          icon: "bubble_chart",
          title: "イベント",
          to: "/event"
        },
        {
          icon: "bubble_chart",
          title: "ログアウト",
          to: "/logout"
        }
      ]
    }

  },
  signUp(state, payload) {
    state.login = true;
    state.currentCompany = payload.company
  },
  logout(state) {
    state.login = false;
    state.currentCompany = "";
  },
  reset(state) {
    state.login = false;
    state.currentCompany = ""
    state.items.splice(0, 3)
    state.items = [{
      icon: "apps",
      title: "ログイン",
      to: "/login"
    }, ]
  },
  test(state) {
    state.test = true;
  },
  // updateImg(state, payload) {
  //   console.log(payload)
  //   state.currentStudent.image = payload.student.image;
  // },
  update(state, payload) {
    state.currentCompany = payload.company
  },
  loadStudent(state, payload) {
    console.log("muta!")
    state.currentCompany = payload.company
  }
};

export default mutations;
