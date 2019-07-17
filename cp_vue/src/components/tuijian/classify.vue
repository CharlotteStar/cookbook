<template>
  <div class="page-classify">
    <div class="classify-top">
      <div class="return" @click="fanhui"></div>
      <router-link :to="`/detailslist`" placeholder="搜索任何你想要的" class="search"></router-link>
    </div>
    <div class="content">
      <div class="classify-container">
        <ul class="classify-list">
          <li
            class="classify-item"
            :class="item.fid==index ? 'selected' : ''"
            @click="selected(item.fid)"
            v-for="(item,i) of classify_data"
            :key="i"
          >
            <img :src="item.icon" />
            <div v-text="item.fname"></div>
          </li>
        </ul>
      </div>
      <div class="type-container">
        <ul class="type-list">
          <li
            class="type-item"
            v-for="(item,index) of type_data"
            :key="index"
            @click="to_details_list(item.tid)"
          >
            <img :src="item.icon" />
            <div v-text="item.tname"></div>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      type_data: [],
      classify_data: [],
      index: 0
    };
  },
  methods: {
    selected(id) {
      this.index = id;
      this.axios
        .get("/caipu/type", { params: { fid: this.index } })
        .then(res => {
          this.type_data = res.data.data;
        });
    },
    to_details_list(tid) {
      this.$router.push({ path: "/detailslist/" + tid });
    },
    fanhui() {
      this.$router.go(-1);
    }
  },
  created() {
    this.axios.get("/caipu/classify").then(res => {
      var data = res.data.data;
      this.classify_data = data;
      this.index = data[0].fid;
      this.axios
        .get("/caipu/type", { params: { fid: this.index } })
        .then(res => {
          this.type_data = res.data.data;
        });
    });
  }
};
</script>

<style scoped>
.page-classify{
  position: absolute;
  width: 100%;
  height: 100%;
  overflow: hidden;
  flex-direction: column;
  padding-top:52px;
}
.classify-top {
  padding: 10px 20px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  position:absolute;
  width:100%;
  top:0;
}
.return {
  width: 40px;
}
.return::before {
  content: "";
  display: block;
  width: 12px;
  height: 12px;
  border-left: 2px solid #ff5151;
  border-bottom: 2px solid #ff5151;
  transform: rotate(45deg);
}
.search {
  background: #eee;
  border-radius: 3px;
  flex-grow: 1;
  height: 32px;
  display: flex;
  align-items: center;
  justify-content: center;
}
.search::before {
  content: "";
  display: block;
  background: url("../../assets/icon/center_title_icon.png");
  background-size: 100% 100%;
  font-size: 16px;
  width: 16px;
  height: 16px;
  margin-right: 10px;
}
.search::after {
  content: "搜索任何你想要的";
  display: block;
  font-size: 1rem;
  color: #aaa;
}

.content{
  position: relative;
  height:100%;
}
.classify-container {
  display: flex;
  float:left;
  position: absolute;
  top:0;
  height: 100%;
  z-index: 10;
}
.classify-list {
  position: absolute;
  overflow: scroll;
  width: 100px;
  background: #fdfdfd;
  height: 100%;
}
.classify-list .classify-item {
  width: 100px;
  height: 100px;
  padding-top: 30px;
  font-size: 14px;
  text-align: center;
}

.classify-list img {
  width: 30px;
  height: 30px;
}
.type-container{
  height: 100%;
  overflow: scroll;
  position: absolute;
}
.type-list {
  display: flex;
  flex-wrap: wrap;
  margin-left: 100px;
  overflow:scroll;
}
.type-item {
  width: 33.333%;
  padding: 10px;
  font-size: 12px;
  text-align: center;
}
.type-item img {
  width: 100%;
}
.selected {
  background: #eee;
}
</style>