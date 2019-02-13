
 <template>
  <v-app id="inspire">
    <v-navigation-drawer fixed v-model="drawer" app>
      <v-list dense>
        <navbar-list v-for="tag in tags" :tag="tag" :login="login">></navbar-list>
        <v-list-tile @click v-show="!login">
          <v-list-tile-action>
            <v-icon>open_in_new</v-icon>
          </v-list-tile-action>
          <v-list-tile-content>
            <v-list-tile-title>
              <log-in></log-in>
            </v-list-tile-title>
          </v-list-tile-content>
        </v-list-tile>
        <v-list-tile @click v-show="login">
          <v-list-tile-action>
            <v-icon>exit_to_app</v-icon>
          </v-list-tile-action>
          <v-list-tile-content>
            <v-list-tile-title>
              <log-out></log-out>
            </v-list-tile-title>
          </v-list-tile-content>
        </v-list-tile>
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
    </v-footer>-->
  </v-app>
</template>

<script>
import NavbarList from "../layout/NavbarList.vue";
import LogOut from "../devise/LogOut.vue";
import LogIn from "../devise/LogIn.vue";

export default {
  data: () => ({
    drawer: false,
    login: login,
    tags: [
      {
        path: "/",
        label: "Home",
        icon: "home"
      },
      {
        path: "/calendar",
        label: "Calendar",
        icon: "calendar_today"
      },
      {
        path: "/mypage",
        label: "Mypage",
        icon: "person"
      },
      {
        path: "/myhacks",
        label: "MyHacks",
        icon: "computer"
      },
      {
        path: "/team",
        label: "Team",
        icon: "folder"
      }
    ]
  }),
  components: {
    NavbarList,
    LogOut,
    LogIn
  }
};
</script>

<style scoped>
@import "../../../style/students/header.scss" a {
  color: red;
}
</style>