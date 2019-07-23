<template>
  <div class="container">
    <div class="r-item">
      <div @click="active='tab1'" style="active=tab">食秀</div>
      <div @click="active='tab2'">食杰</div>
      <div @click="active='tab3'">任务中心</div>
    </div>
    <mt-tab-container v-model="active">
      <mt-tab-container-item id="tab1">
        <showtime></showtime>
      </mt-tab-container-item>
      <mt-tab-container-item id="tab2">
          菜谱日榜月榜
          </mt-tab-container-item>
      <mt-tab-container-item id="tab3">
        <taskcenter></taskcenter>
      </mt-tab-container-item>
    </mt-tab-container>
  </div>
</template>
<script>
import ShowTime from "./ShowTime.vue";
import TaskCenter from "./TaskCenter.vue";
export default {
  data() {
    return {
      active: "tab1"
    };
  },
  components: {
    showtime: ShowTime,
    taskcenter: TaskCenter
  }
};
</script>
<style >
/* 顶部导航栏 */
*{
  padding:0;
  margin: 0;
}

.r-item {
    display: flex;
    width: 100%;
    justify-content: center; /*垂直居中*/
    flex-wrap: nowrap;
    border-bottom: 1px solid #eee;
    color: #333;
    flex-wrap: nowrap;
    position: fixed;
    top: 0;
    background: #fff;
    z-index: 100;
    transition: all .5s linear;
    }
    .r-item div {
    padding: 15px;
    
}

</style>