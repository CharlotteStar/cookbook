<template>
  <div class="p_zhuti">
    <div class="p_daohan">
      <fanhui></fanhui>
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
        <input type="checkbox" class="dagou" :data-id="item.sid"/>
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
      <div class="xiao_sc" :class="cc ? 'kaiguan' : '' " @click="delone(item.sid)">
        <img src="@/assets/per/close.png" alt />
      </div>
    </div>
    <div :class="cc ? 'kaiguan' : '' " class="qx p_sc">
     <div @click="del" class="xuanzhong">全选</div>
     <div class="quanshan" @click="qshang">多选删</div>  
    </div>
  </div>
</template>
<script>
import fanhui from "./common/fanhui.vue"
import qs from "qs";
export default {
   components:{
     fanhui
   },
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
      });
  },
  methods: {
    // 单击显示删除按钮
    kaiguan() {
      this.cc ? (this.cc = false) : (this.cc = true);
    },
    del() {
      var del = document.querySelectorAll(".p_sd>input");
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
    },
    // 单条删除
    delone(sid){
     this.axios.get("/shoucan/shangchu",{params:{sid:sid}})
     .then(res=>{
       if(res.data==1){
          this.$toast({
          message:"删除了",
          position:"center",
          duration:800,
        })
        setTimeout(()=>{
          this.$router.go(0);
        },800)
       }else{
          this.$toast({
          message:"没删",
          position:"center",
          duration:800,
        })
       }
     })
    },
    // 多选删除
  qshang(){
    var str="";
    var  dagou=document.getElementsByClassName("dagou")
      for(var da of dagou){
        if(da.checked==true){
          str+=da.getAttribute("data-id")+","
        }
      }
      str=str.substring(0,str.length-1);
       if(str.length==0){
        this.$toast("请选中商品");
        return;
      }
     this.axios.get("/shoucan/quanshan",{params:{sids:str}})
     .then(res=>{
       if(res.data==1){
          this.$toast({
          message:"删除了",
          position:"center",
          duration:800,
        })
        setTimeout(()=>{
          this.$router.go(0);
        },800)
       }else{
          this.$toast({
          message:"没删",
          position:"center",
          duration:800,
        })
       }
     })
   }
  }
};
</script>
<style scoped>
.p_zhuti {
  margin: 0 ;
  padding-top:53px;

}
.qx {
  width: 100%;
  position: fixed;
  bottom: 0px;
  left: 50%;
  transform: translateX(-50%);
  display: flex;
  justify-content: space-between;
  background: #fff;
}
.xuanzhong{
 background: lightsalmon;
 width: 50%;
  height: 40px;
  text-align: center;
  line-height: 40px;
  border-radius: 4px;
}
.quanshan{
  width: 20%;
  background: rgb(212, 18, 18);
   height: 40px;
  text-align: center;
  line-height: 40px;
  border-radius: 4px;
  color: #fff;
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
  position: fixed;
  top: 0px;
  background-color: #fff;
  width: 100%;
  z-index: 9999;
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
.p_daohan > div:nth-child(2) {
  font-weight: 600;
  font-size: 30px;
  padding-left: 15px;
}
.p_daohan > div:nth-child(3) {
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
