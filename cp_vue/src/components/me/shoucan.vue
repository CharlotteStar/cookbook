<template>
  <div class="p_zhuti">
    <div class="p_daohan">
      <div>收藏</div>
      <div>全部</div>
      <div>我的</div>
      <div>菜单</div>
      <div>
        <img src="@/assets/per/fangda.png" alt class="p_img" />
      </div>
      <div @click="kaiguan">
        <img src="@/assets/per/gb.png" alt class="p_img" />
      </div>
    </div>
    <div class="p_caidan" v-for="(item,i) of sc" :key="i">
      <div class="p_sc p_sd" :class="cc ? 'kaiguan' : '' ">
        <input type="checkbox" id="check1" />
        <label for="check1"></label>
      </div>
      <div class="p_caidan_xq">
        <img :src="item.pic" alt class="xq_caitu" />
        <div class="xq_you">
          <p v-text="item.title"></p>
          <div>
            <div class="p_tese_y" v-text="item.benefit"></div>
          </div>
          <p class="p_pf">
            <img src="@/assets/icon/20180831142237_413.png" alt v-if="item.score>4" />
            <img src="@/assets/icon/20180831142237_413.png" alt v-if="item.score>3" />
            <img src="@/assets/icon/20180831142237_413.png" alt v-if="item.score>2" />
            <img src="@/assets/icon/20180831142237_413.png" alt v-if="item.score>1" />
            <img src="@/assets/icon/20180831142237_413.png" alt v-if="item.score>0" />
          </p>
          <div class="p_dibu">
            <div>
              <img :src="item.avatar" alt />
              <span v-text="item.uname"></span>
            </div>
            <div class="dianji">
              <img src="@/assets/per/xin.png" alt class="p_zan" />
              <span v-text="item.shoucang"></span>
              <img src="@/assets/icon/watch_time.png" alt class="p_liulan" />
              <span v-text="item.browse"></span>
            </div>
          </div>
        </div>
      </div>
      <div class="xiao_sc" :class="cc ? 'kaiguan' : '' ">
        <img src="@/assets/per/close.png" alt />
      </div>
    </div>
    <div class="qx p_sc" @click="del" :class="cc ? 'kaiguan' : '' ">全选</div>
  </div>
</template>
<script>
import qs from "qs";
export default {
  data() {
    return {
      fans: "",
      focus: "",
      cc: true,
      sc: [],
      zz: "1"
    };
  },
  created() {
    this.axios
      .post(
        "shoucan/yh_shoucan",
        qs.stringify({ uid: window.sessionStorage.uid }),
        { headers: { "Content-Type": "application/x-www-form-urlencoded" } }
      )
      .then(res => {
        this.sc = res.data;
        console.log(res.data);
      });
  },
  methods: {
    kaiguan() {
      this.cc ? (this.cc = false) : (this.cc = true);
    },
    del() {
      var del = document.querySelectorAll(".p_sd>input");
      console.log(del);
      if (this.zz) {
        for (var i = 0; i < del.length; i++) {
          del[i].checked = true;
          this.zz=0
        }
      }else{
         for(var i=0; i<del.length;i++){
       del[i].checked=false;
       this.zz=1
      }
      }
    }
  }
};
</script>
<style scoped>
.p_zhuti {
  margin: 0 0;
  padding: 0;
}
.qx {
  width: 90%;
  height: 40px;
  background: lightsalmon;
  text-align: center;
  line-height: 40px;
  border-radius: 4px;
  position: fixed;
  bottom: 10px;
  left: 50%;
  transform: translateX(-50%);
}
.qx > input {
  height: 23px;
  width: 23px;
  position: relative;
  top: 5px;
}
.p_daohan {
  display: flex;
  justify-content: space-between;
  height: 53px;
  border-bottom: 1px solid gray;
}
.p_img {
  width: 30px;
  height: 30px;
  position: relative;
  top: 5px;
}
.p_daohan > div {
  height: 51px;
  line-height: 51px;
  font-size: 16px;
}
.p_daohan > div:first-child {
  font-weight: 600;
  font-size: 30px;
  padding-left: 15px;
}
.p_daohan > div:nth-child(2) {
  font-weight: 800;
  border-bottom: 3px solid pink;
  height: 51px;
}
.p_caidan {
  padding: 2px 12px;
  display: flex;
  justify-content: space-between;
  position: relative;
}
.p_caidan > div > input {
  height: 20px;
  width: 20px;
  position: relative;
  top: 25%;
  margin-right: 10px;
  border-radius: 50% !important;
}
.p_caidan_xq {
  display: inline-block;
  height: 120px;
  margin: 10px 0;
}
.p_caidan_xq {
  display: flex;
  width: 100%;
  border-bottom: 1px solid gray;
}
.p_caidan_xq > img {
  display: block;
  width: 90px;
  height: 90px;
}
.xq_caitu {
  display: block;
}
.xq_you {
  margin-left: 33px;
  width: 100%;
}
.xq_you > p:first-child {
  font-size: 20px;
  font-weight: 500;
  margin-bottom: 10px;
}
.p_tese_y {
  border: 1px solid lightcoral;
  border-radius: 2px;
  color: darksalmon;
  font-size: 12px;
  width: 150px;
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}
.p_pf > img {
  width: 12px;
  height: 12px;
}
.p_pf {
  margin-bottom: 12px;
}
.p_dibu {
  display: flex;
  justify-content: space-between;
}
.p_dibu > div > img {
  width: 20px;
  height: 20px;
  margin-right: 5px;
}
.p_dibu > div {
  font-size: 12px;
}
.dianji {
  margin: 0 10px;
}
.p_zan {
  width: 15px !important;
  height: 15px !important;
  margin-left: 15px !important;
  margin-right: 5px !important;
}
.p_liulan {
  width: 17px !important;
  height: 17px !important;
  margin-left: 4px !important;
  margin-right: 10 !important;
}
.p_dibu img {
  position: relative;
  top: -1px;
}
.kaiguan {
  display: none;
}
.xiao_sc {
  position: absolute;
  top: 0px;
  right: 0px;
}
.xiao_sc > img {
  width: 25px;
  height: 25px;
}
</style>
