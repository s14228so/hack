import axios from "axios";

const actions = {
  test(context) {
    context.commit("test");
    console.log(context.state.login);
  },
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
};

export default actions;
