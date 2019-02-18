
 <template>
  <div>
    <v-navigation-drawer fixed v-model="drawer" app class="blue-grey lighten-4">
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
    <v-toolbar class="blue-grey lighten-4 grey--text" fixed app>
      <v-toolbar-side-icon @click.stop="drawer = !drawer"></v-toolbar-side-icon>
      <v-toolbar-title>Hack</v-toolbar-title>
    </v-toolbar>
    <!-- <v-footer color="indigo" app>
      <span class="white--text">&copy; 2017</span>
    </v-footer>-->
  </div>
</template>

<script>
import NavbarList from "../layout/NavbarList.vue";
import LogOut from "../devise/LogOut.vue";
import LogIn from "../devise/LogIn.vue";

export default {
  data: () => ({
    drawer: false,
    login: false,

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
  },
  async mounted() {
    if (localStorage.currentStudent){
    var data = localStorage.getItem("currentStudent");
    data = JSON.parse(data);
    if (data) {
      this.login = true;
    }
    }

  }
};
</script>

<style scoped>
</style>