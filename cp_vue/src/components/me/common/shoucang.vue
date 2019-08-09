<template>
  <div class="page-shoucang">
    <div class="sc_top">
      <span>收藏</span>
      <div class="top_nav">
        <div>全部</div>
      </div>
      <div class="close">×</div>
    </div>
    <div class="sc_content">
      <router-link :to="'/menu01/'+item.did" class="footprint-item" v-for="(item,index) of cp_data" :key="index">
        <div class="cp_image">
          <img :src="item.pic">
        </div>
        <div class="cp_info">
          <h3 v-text="item.title"></h3>
          <div class="cp_score">
            <img :src="require(item.score>=i ? '@/assets/icon/20180831142237_413.png' : '@/assets/icon/20180831142237_552.png')" v-for="i in 5" :key="i">
          </div>
          <div class="view-count" v-text="`${item.shoucang}收藏  ${item.browse}浏览`"></div>
        </div>
      </router-link>
    </div>
  </div>
</template>

<script>
import qs from "qs"
export default {
  props:{
    uid:""
  },
  data(){
    return {
      cp_data:[]
    }
  },
  methods: {
    get_sc_data(){
      console.log(this.uid);
      // this.axios.get(
      //   "/shoucan/yh_shoucan",
      //   qs.stringify({uid:this.uid}),
      //   {headers:{'Content-Type':'application/x-www-form-urlencoded'}}
      // ).then(res=>{
      //   console.log(res.data);
      // })
    }
  },
  created(){
    this.get_sc_data();
  },
}
</script>

<style>
.page-shoucang{
  position:absolute;
  top:0;left:0;
  bottom:0;right:0;
  background:#fff;
  z-index:999;
}
.sc_top{
  display: flex;
  align-items:flex-end;
  padding:10px 15px;
  box-shadow:0 5px 5px -5px #aaa;
}
.sc_top>span{
  font-size:25px;
  font-weight: 600;
}
.top_nav{
  flex-grow: 1;
  justify-content: center;
  display: flex;
}
.close{
  font-size:24px;
  background:#ccc;
  color:#fff;
  border-radius:50%;
  width:25px;
  height:24px;
  text-align: center;
  line-height: 25px;
}
</style>
