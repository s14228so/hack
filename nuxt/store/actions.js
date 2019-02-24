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
  },
  async signOut(context, access_token) {
    try {
      await axios.delete(`http://localhost:5000/v1/logout`, {
        params: { access_token: access_token }
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
  async update(context, { access_token, student_id }) {
    const payload = {
      student: {}
    };
    try {
      const res = await axios.get(
        `http:://localhost:5000/v1/students/${student_id}`,
        {
          headers: {
            Authorization: access_token
          }
        }
      );
      payload.student = res.data;
      context.commit("update");
    } catch (error) {
      console.log(error);
    }
  }
};

export default actions;
