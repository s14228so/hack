import Vue from "vue/dist/vue.esm";
import Router from "vue-router";
import MyPage from "../components/MyPage";
import Calendar from "../components/Calenadar";
import LoginView from "../components/devise/LoginView";
import MyHacks from "../components/MyHacks";
import EventDetail from "../components/EventDetail";
import Team from "../components/Team";
import SignUp from "../components/devise/SignUp";

Vue.use(Router);

export default new Router({
  hashbang: false,
  mode: "history",
  routes: [
    {
      path: "/",
      name: "Home",
      component: Home
    },
    {
      path: "/calenadar",
      name: "Calendar",
      component: Calendar
    },
    {
      path: "/login",
      name: "LoginView",
      component: LoginView
    },
    {
      path: "/myhacks",
      name: "MyHacks",
      component: MyHacks
    },
    {
      path: "/event/:id",
      name: "EventDetail",
      component: EventDetail
    },
    {
      path: "/team",
      name: "Team",
      component: Team
    },
    {
      path: "/sign_up",
      name: "SignUp",
      component: SignUp
    }
  ]
});
