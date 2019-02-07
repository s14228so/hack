
 <template>
  <v-app id="inspire">
    <v-navigation-drawer
      fixed
      v-model="drawer"
      app
    >
      <v-list dense>
    

        <navbar-list v-for="tag in tags" :tag="tag" >
        ></navbar-list>

      <!-- <router-link to="/home" class="block">
        <v-list-tile @click="">
          <v-list-tile-action>
            <v-icon>home</v-icon>
          </v-list-tile-action>
          <v-list-tile-content>
            <v-list-tile-title>
              Home
           </v-list-tile-title>
          </v-list-tile-content>
        </v-list-tile>
       </router-link>
        <router-link to="/mypage">
        <v-list-tile @click="">
          <v-list-tile-action>
            <v-icon>contact_mail</v-icon>
          </v-list-tile-action>
          <v-list-tile-content>
            <v-list-tile-title>
             Mypage</v-list-tile-title>
          </v-list-tile-content>
        </v-list-tile>
      </router-link> -->
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

 export default {
    data: () => ({
      drawer: false,
      tags: [
        {
          path: "/home",
          label: "Home"
        },
        {
          path: "/mypage",
          label: "Mypage"
        }
      ]
    }),
    components: {
      NavbarList
    },
    props: {
      source: String
    }
  }
</script>

<style scoped>
  @import '../../../style/students/header.scss'
</style>