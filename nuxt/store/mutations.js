const mutations = {
  login(state, payload) {
    state.login = true;
    state.currentStudent = payload.student;
  },
  logout(state) {
    state.login = false;
    state.currentStudent = "";
  },
  test(state) {
    state.test = true;
  }
};

export default mutations;
