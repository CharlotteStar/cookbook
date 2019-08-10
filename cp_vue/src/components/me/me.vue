<template>
  <div class="page-me" :class="isLogin ? '' : 'not-log'">
    <div class="me-top">
      <div class="shezhi-btn"
        @click.stop="show_sz= show_sz ? false : true" 
        :class="show_sz ? '' : 'hide' "
      >
        <img src="@/assets/icon/weibiaoti-.png" >
        <div class="shezhi-list" >
          <div class="shezhi-item" @click="logout">退出当前账号</div>
        </div>
      </div>

      
      <div class="xinfeng-btn">
        <img src="@/assets/icon/xinfengtwo.png" >
      </div>
    </div>
    <div class="user-container">
      <div class="user-box" @click="userInfo">
        <div class="user-tx">
          <img :src="isLogin ? user.avatar : require('@/assets/icon/Groupx.png') ">
        </div>
        <div class="user-info">
          <h1 class="uname" >{{isLogin ? user.uname : '点击登录'}}</h1>
          <p>{{isLogin ? '正在通往美食达人的路上...' : '据说登录的人做饭更好吃'}}</p>
        </div>
      </div>
      <div class="user-record" :class="isLogin ? 'd-flex' : 'd-none'">
        <div class="record-item">
          <span>0</span>
          <span>浏览</span>
        </div>
        <div class="record-item">
          <span>0</span>
          <span>粉丝</span>
        </div>
        <div class="record-item">
          <span v-text="gz_count"></span>
          <span>关注</span>
        </div>
        <div class="record-item">
          <span>0</span>
          <span>作品</span>
        </div>
      </div>
    </div>

    <div class="me-content">
      <div class="content-item" @click="is_show_sc=true">
        <img src="@/assets/icon/wodeshoucang_1.png">
        <span>收藏</span>
      </div>
      <div class="content-item">
        <img src="@/assets/icon/fabu.png">
        <span>发布</span>
      </div>
      <div class="content-item">
        <img src="@/assets/icon/caogaoxiang.png">
        <span>草稿</span>
      </div>
      <div class="content-item">
        <img src="@/assets/icon/cailanzi.png">
        <span>菜篮</span>
      </div>
    </div>

    <div class="my-footprint-box">
      <h1 class="title">我的足迹</h1>
      <div class="my-footprint" >
        <div class="not-login" :class="isLogin ? 'd-none' : ''">
          <img src="@/assets/icon/baozi.png">
          <p>登陆后开始记录足迹......</p>
        </div>
        <div class="my-footprint-list" :class="isLogin ? '' : 'd-none'">
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
    </div>

    <shou-cang :uid="user.uid" @click="is_show_sc=true" @displayStatus="is_show_sc=false" :class="is_show_sc ? 'd-block' : 'd-none'"></shou-cang>
  </div>
</template>

<script>
import shouCang from './common/shoucang.vue'
export default {
  components:{
    shouCang,
  },
  
  data(){
    return {
      user:{},
      isLogin:false,
      cp_data:[],
      is_show_sc:false,
      is_show_fb:false,
      is_show_cg:false,
      is_show_cl:false,
      show_sz:false,
      gz_count:0
    }
  },
  methods:{
    logout(){
      sessionStorage.user='';
      this.$router.go(0);
    },
    userInfo(){
      this.$router.push("/login");
    },
    get_gz_count(){
      this.axios.get(
        "/gz/count",
        {params:{uid:this.user.uid}}
      ).then(res=>{
        this.gz_count=res.data.data;
      })
    },
    getFootprint(){
      this.axios.get(
        "/footprint/get",
        {params:{uid:this.user.uid}}
      ).then(res=>{
        this.cp_data=res.data.data;
      })
    },
  },
  created(){
    var user=sessionStorage.getItem("user");
    if(user){
      this.user=JSON.parse(user)[0];
      this.isLogin=true;
      this.getFootprint();
      this.get_gz_count()
    }
    window.onclick=()=>{
      this.show_sz=false
    }
  },
}
</script>

<style lang="scss" scoped>
  @import './scss/me.scss';
  @import './scss/list.scss';
  .d-none{
    display: none !important;
  }
  .d-flex{
    display: flex !important;
  }
  .d-block{
    display: block !important;
  }
</style>
