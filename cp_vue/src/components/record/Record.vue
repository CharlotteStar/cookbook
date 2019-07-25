<template>
  <div class="container">
    <div class="r-item">
      <div @click="active='tab1'" :class="active=='tab1' ? 'v_tab' : ''">食秀</div>
      <div @click="active='tab2'" :class="active=='tab2' ? 'v_tab' : ''">食杰</div>
      <div @click="active='tab3'" :class="active=='tab3' ? 'v_tab' : ''">任务中心</div>
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
<style scoped>
/* 顶部导航栏 */
.v_tab{
  border-bottom: 3px solid #f1a9a3;
  font-size: 23px;
  border-radius: 57px;
}
.r-item {
    display: flex;
    width: 100%;
    justify-content: center; /*垂直居中*/
    flex-wrap: nowrap;
    border-bottom: 1px solid #eee;
    color: #333;
    position: fixed;
    background-color: #fff!important;
    z-index: 100;
    line-height: 27px;
    }
    .r-item div {
    padding: 10px;
    
}

</style>