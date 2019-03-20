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
  // updateImg(state, payload) {
  //   console.log(payload)
  //   state.currentStudent.image = payload.student.image;
  // },
  update(state, payload) {
    state.currentStudent = payload.student
  },
  loadStudent(state, payload) {
    state.currentStudent = payload.student
  }
};

export default mutations;
