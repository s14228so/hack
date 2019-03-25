
 <template>
  <div>
    <v-navigation-drawer fixed v-model="drawer" app class="blue-grey lighten-4">
      <v-list dense>
        <navbar-list v-for="tag in tags" :tag="tag" :key="tag.label"></navbar-list>
        <v-list-tile v-show="!this.$store.state.login">
          <v-list-tile-action>
            <v-icon>open_in_new</v-icon>
          </v-list-tile-action>
          <v-list-tile-content>
            <v-list-tile-title>
              <log-in></log-in>
            </v-list-tile-title>
          </v-list-tile-content>
        </v-list-tile>
        <v-list-tile v-show="!this.$store.state.login">
          <v-list-tile-action>
            <v-icon>done</v-icon>
          </v-list-tile-action>
          <v-list-tile-content>
            <v-list-tile-title>
              <sign-link></sign-link>
            </v-list-tile-title>
          </v-list-tile-content>
        </v-list-tile>
        <v-list-tile v-show="this.$store.state.login">
          <v-list-tile-action>
            <v-icon>exit_to_app</v-icon>
          </v-list-tile-action>
          <v-list-tile-content>
            <v-list-tile-title>
              <log-out @destroyUserSession="signOut"></log-out>
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
import axios from "~/plugins/axios";
import "babel-polyfill";
import NavbarList from "../layout/NavbarList.vue";
import LogOut from "../devise/LogOut.vue";
import LogIn from "../devise/LogIn.vue";
import SignLink from "../devise/SignLink.vue";

export default {
  data() {
    return {
      login: "",
      drawer: false,
      token: "",
      student: this.$store.state.currentStudent,
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
    };
  },
  components: {
    NavbarList,
    LogOut,
    LogIn,
    SignLink
  },
  mounted() {},
  methods: {
    async signOut() {
      this.$store.dispatch(`signOut`, this.student.access_token);
    }
  }
};
</script>

<style scoped>
</style>