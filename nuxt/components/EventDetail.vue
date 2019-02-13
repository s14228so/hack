<template>
  <div>
    <v-container mt-5>
      <div v-for="event in events" class="mt-2">
        <v-chip @click="childDetail(event)">
          {{ event.date }}
          {{ event.title }}
        </v-chip>
      </div>
    </v-container>
  </div>
</template>
<script>
import axios from "axios";
import "babel-polyfill";

export default {
  props: ["events"],
  data: function() {
    return {
      students: []
    };
  },
  mounted() {},
  methods: {
    childDetail: function(event) {
      // vm.$emitでカスタムイベントfavを発火させる
      // 第二引数のデータはfavで指定しているコールバックに渡される
      this.$emit("rand", event);
    }
  }
};
</script>
<style scoped>
</style>