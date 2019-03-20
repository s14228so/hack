<template>
  <div>
    <v-container mt-5>
      <div v-for="event in events" :key="event.id" class="mt-2">
        <v-chip @click="childDetail(event)">
          {{ event.date }}
          {{ event.title }}
          <cancel @dialog="onClickOpen(event)"></cancel>
        </v-chip>
      </div>
      <confirm ref="confirm" @agree="deleteEvent"></confirm>
    </v-container>
  </div>
</template>
<script>
import axios from "axios";
import "babel-polyfill";

import Cancel from "../button/Cancel";
import Confirm from "../flash/Confirm";
export default {
  props: ["events"],
  components: {
    Cancel,
    Confirm
  },
  data: function() {
    return {
      students: [],
      student: this.$store.state.currentStudent
    };
  },
  mounted() {},
  methods: {
    childDetail: function(event) {
      // vm.$emitでカスタムイベントfavを発火させる
      // 第二引数のデータはfavで指定しているコールバックに渡される
      this.$emit("rand", event);
    },
    async onClickOpen(event) {
      console.log("yamada");
      if (
        await this.$refs.confirm.open(
          "イベント予約のキャンセル",
          "キャンセルしますか？",
          {
            color: "red"
          },
          event
        )
      ) {
        console.log("--yes");
      } else {
        console.log("--no");
      }
    },
    async deleteEvent(event) {
      //event_studentのidが欲しい
      // delete "/:event_id/:student_id"
      await axios.delete(
        `http://localhost:5000/v1/${event.id}/${this.student.student_id}`,
        {
          headers: { Authorization: this.student.access_token }
        }
      );
      this.$router.push({
        name: "canceled"
      });
    }
  }
};
</script>
<style scoped>
</style>