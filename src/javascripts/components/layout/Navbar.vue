
 <template>
  <v-app id="inspire">
    <v-navigation-drawer
      fixed
      v-model="drawer"
      app
    >
      <v-list dense>
        <navbar-list v-for="tag in tags" :tag="tag" :login="login">
        ></navbar-list>
        <log-out></log-out>
      </v-list>
    </v-navigation-drawer>
    <v-toolbar color="teal lighten-4" fixed app>
      <v-toolbar-side-icon @click.stop="drawer = !drawer"></v-toolbar-side-icon>
      <v-toolbar-title>Hack</v-toolbar-title>
    </v-toolbar>
    <v-content>
     <router-view></router-view>
    </v-content>
    <!-- <v-footer color="indigo" app>
      <span class="white--text">&copy; 2017</span>
    </v-footer> -->
  </v-app>
</template>

<script>
  import NavbarList from "../layout/NavbarList.vue"
  import LogOut from "../devise/LogOut.vue"

 export default {
    data: () => ({
      drawer: false,
      login: !rails.login,
      tags: [
        {
          path: "/home",
          label: "Home"
        },
        {
          path: "/mypage",
          label: "Mypage"
        },
      ]
    }),
    components: {
      NavbarList,
      LogOut
    },
  }
</script>

<style scoped>
  @import '../../../style/students/header.scss'
</style>