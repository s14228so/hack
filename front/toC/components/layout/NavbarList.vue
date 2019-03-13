<template>
  <div>
    <router-link :to="tag.path" class="block">
      <v-list-tile v-show="this.$store.state.login">
        <v-list-tile-action>
          <v-icon>{{tag.icon}}</v-icon>
        </v-list-tile-action>
        <v-list-tile-content>
          <v-list-tile-title>{{ tag.label }}</v-list-tile-title>
        </v-list-tile-content>
      </v-list-tile>
    </router-link>
  </div>
</template>

<script>
export default {
  props: ["tag"],
  mounted() {}
};
</script>

<style scoped>
a {
  text-decoration: none;
  color: black;
}
</style>