import axios from "axios";

const actions = {
  test(context) {
    context.commit("test");
    console.log(context.state.login);
  },
  async getStudent(context, {
    email,
    password
  }) {
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
  },
  async signOut(context, access_token) {
    try {
      await axios.delete(`http://localhost:5000/v1/logout`, {
        params: {
          access_token: access_token
        }
      });
      this.$router.push({
        name: "login"
      });
      localStorage.removeItem("currentStudent");
    } catch (error) {
      console.log(error);
    }
    context.commit("logout");
  },
  async update(context, data) {
    const payload = {
      student: {}
    };
    payload.student = data;
    context.commit("update", payload);
  },
  async updateImg(context, data) {
    const payload = {
      student: {}
    };
    payload.student = data;
    context.commit("updateImg", payload);
  }
};

export default actions;
