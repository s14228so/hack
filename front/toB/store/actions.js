import axios from "~/plugins/axios";
import "babel-polyfill"

const actions = {
  test(context) {
    context.commit("test");
    console.log(context.state.login);
  },
  async reset(context) {
    context.commit("reset")
  },
  async signUp(context, {
    email,
    password
  }) {
    const payload = {
      company: {}
    }

    const response = await axios.post(`/v1/companies`, {
      company: {
        email: email,
        password: password
      }
    });
    payload.company = response.data;
    var data = [];
    data.push(response.data);
    localStorage.setItem("currentCompany", JSON.stringify(data));
    this.$router.push({
      name: "index"
    });
    context.commit("signUp", payload)
  },
  async getCompany(context, {
    email,
    password
  }) {
    const payload = {
      company: {}
    };
    await axios
      .post(`/v1/clogin`, {
        email: email,
        password: password
      })
      .then(res => {
        payload.company = res.data;
        localStorage.setItem("currentCompany", JSON.stringify(res.data));
        this.$router.push({
          name: "index"
        });
      });
    context.commit("login", payload);
  },
  async signOut(context, access_token) {
    try {
      await axios.delete(`/v1/clogout`, {
        params: {
          access_token: access_token
        }
      });
      this.$router.push({
        name: "login"
      });
      localStorage.removeItem("currentCompany");
    } catch (error) {
      console.log(error);
    }
    context.commit("logout");
  },
  async update(context, data) {
    const payload = {
      company: {}
    };
    payload.company = data;
    context.commit("update", payload);
  },
  async loadcompany(context, {
    company_id,
    access_token
  }) {
    const payload = {
      company: {}
    };

    await axios.get(`/v1/companys/${company_id}`, {
      headers: {
        Authorization: access_token
      }
    }).then(responce => {
      console.log(responce.data);
      payload.company = responce.data;
      localStorage.setItem("currentcompany", JSON.stringify(responce.data));
    });
    context.commit("loadcompany", payload);
  },
  // async updateImg(context, data) {
  //   const payload = {
  //     company: {}
  //   };
  //   payload.company = data;
  //   console.log(payload.company);
  //   console.log("iiii");
  //   context.commit("updateImg", payload);
  // }
};

export default actions;
