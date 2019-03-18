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
  },
  updateImg(state, payload) {
    state.currentStudent.img = payload.student.img;
  },
  update(state, payload) {
    state.currentStudent = payload.student
  }
};

export default mutations;
