<template>
  <div class="page-me" :class="isLogin ? '' : 'not-log'">
    <div class="me-top">
      <div class="shezhi-btn">
        <img src="@/assets/icon/weibiaoti-.png" >
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
          <span>0</span>
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

    <!-- <shou-cang :uid="user.uid" :class="is_show_sc ? '' : 'd-none'"></shou-cang> -->
  </div>
</template>

<script>
import shouCang from './common/shoucang.vue'
export default {
  components:{
    shouCang
  },
  
  data(){
    return {
      user:{},
      isLogin:false,
      cp_data:[],
      is_show_sc:false,
      is_show_fb:false,
      is_show_cg:false,
      is_show_cl:false
    }
  },
  methods:{
    userInfo(){
      this.$router.push("/login");
    },
    getFootprint(){
      this.axios.get(
        "/footprint/get",
        {params:{uid:this.user.uid}}
      ).then(res=>{
        this.cp_data=res.data.data
      })
    },
  },
  created(){
    if(sessionStorage.getItem("user")){
      this.user=JSON.parse(sessionStorage.getItem("user"))[0];
      this.isLogin=true;
      this.getFootprint();
    }
  },
}
</script>

<style lang="scss" scoped>
  @import './scss/me.scss';
  .d-none{
    display: none !important;
  }
  .d-flex{
    display: flex !important;
  }
  .d-block{
    display: block !important;
  }

  .list_title{
  font-size: 28px;
  font-weight: 700;
  color: #333;
  line-height: 38px;
  margin-top:10px
}
.list_subtitle{
  font-size: 18px;
  font-weight: 700;
  color: #333;
  padding: 15px 0 5px;
  margin-bottom: 10px;
  line-height: 24px;
}
   
.details_list{
  padding:0 20px;
}
.footprint-item{
  display:flex; 
  align-items: center;
  padding:10px 0;
  
}
.footprint-item+.footprint-item{
  border-top:0.01rem solid #ccc;
}
.cp_image{
  width:120px;height:90px;
  border-radius:5px;
  overflow: hidden;
}
.cp_image img{
  width:100%;
  margin-top:50%;
  transform: translateY(-50%);
}
.cp_info{
  padding-left:15px;
 
}
.cp_info h3{
  font-size: 16px;
  font-weight: 700;
  color: #333;
  line-height: 24px;
  height: 24px;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  display: block;
}
.cp_score{
  display: inline-block;
  font-size: 0px;
  padding: 4px 0px 6px;
}
.cp_score img{
  width:16px;
}
.view-count{
  font-size: 12px;
  color: #999;
  line-height: 20px;
}

.cp_list_container{
  border-bottom:1px solid #ccc;
}
</style>
