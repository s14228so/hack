const mutations = {
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
};

export default mutations;
