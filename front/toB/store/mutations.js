const mutations = {
  login(state, payload) {
    state.login = true;
    state.currentCompany = payload.company;
  },
  logout(state) {
    state.login = false;
    state.currentCompany = "";
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
