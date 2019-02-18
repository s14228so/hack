<template>
  <v-app dark>
    <v-content>
      <v-container>
        <navbar></navbar>
        <nuxt/>
      </v-container>
    </v-content>

    <v-footer :fixed="fixed" app>
      <span>&copy; 2019</span>
    </v-footer>
  </v-app>
</template>

<script>
import Navbar from "../components/layout/Navbar.vue";
export default {
  data() {
    return {
      clipped: false,
      drawer: false,
      fixed: false,
      login: false,
      items: [
        {
          icon: "apps",
          title: "Welcome",
          to: "/"
        },
        {
          icon: "bubble_chart",
          title: "Inspire",
          to: "/inspire"
        }
      ],
      miniVariant: false,
      right: true,
      rightDrawer: false,
      title: "Vuetify.js"
    };
  },
  components: {
    Navbar
  }
};
</script>
