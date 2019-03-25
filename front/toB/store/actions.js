import axios from "axios";

const actions = {
  test(context) {
    context.commit("test");
    console.log(context.state.login);
  },
  async reset(context){
    context.commit("reset")
  },
  async getCompany(context, {
    email,
    password
  }) {
    const payload = {
      company: {}
    };
    await axios
      .post(`http://localhost:5000/v1/clogin`, {
        email: email,
        password: password
      })
      .then(res => {
        payload.company = res.data;
        localStorage.setItem("currentCompany", JSON.stringify(res.data));
      });
    context.commit("login", payload);
  },
  async signOut(context, access_token) {
    try {
      await axios.delete(`http://localhost:5000/v1/clogout`, {
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
  async loadStudent(context, {
    student_id,
    access_token
  }) {
    const payload = {
      student: {}
    };

    await axios.get(`http://localhost:5000/v1/students/${student_id}`, {
      headers: {
        Authorization: access_token
      }
    }).then(responce => {
      console.log(responce.data);
      payload.student = responce.data;
      localStorage.setItem("currentStudent", JSON.stringify(responce.data));
    });
    context.commit("loadStudent", payload);
  },
  // async updateImg(context, data) {
  //   const payload = {
  //     student: {}
  //   };
  //   payload.student = data;
  //   console.log(payload.student);
  //   console.log("iiii");
  //   context.commit("updateImg", payload);
  // }
};

export default actions;
