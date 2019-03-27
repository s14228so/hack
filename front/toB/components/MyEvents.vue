<template>
  <div>
    <div v-for="event in events" :key="event.title" class="display">
      <div class="card" @click="showDetail(event)">
        <h4>タイトル: {{event.title}}</h4>
        <p>日付: {{event.date}}</p>
        <p>内容: {{event.content}}</p>
      </div>
      <v-icon @click="dialog(event)">delete</v-icon>
    </div>
    <div>
      <confirm ref="confirm" @agree="deleteEvent"></confirm>
    </div>
  </div>
</template>

<script>
import axios from "~/plugins/axios";
import "babel-polyfill";
import Confirm from "./alert/Confirm";
export default {
  data() {
    return {
      company: this.$store.state.currentCompany,
      events: []
    };
  },
  components: {
    Confirm
  },
  async mounted() {
    const res = await axios.get(
      `/v1/companies/${this.company.company_id}/events`
    );
    if (res.status !== 200) {
      process.exit();
    }
    this.events = res.data;
    console.log(this.events);
  },
  methods: {
    showDetail(event) {
      this.$router.push({
        name: "events-id",
        params: {
          id: event.id,
          event: event
        }
      });
    },
    deleteEvent() {},
    async dialog(event) {
      console.log("--onClickOpen");
      if (
        await this.$refs.confirm.open(
          "イベントの削除",
          "削除しますか？",
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
    }
  }
};
</script>

<style>
.v-icon {
  margin-top: 20px;
}
.display {
  display: inline-block;
  margin-right: 20px;
}
.card {
  cursor: pointer;
  width: 150px;
  padding: 20px;
  border-radius: 5%;
  border: 1px solid gray;
}
</style>
