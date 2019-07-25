<template>
  <div class="zhuti">
    <perTop :title="title"  :tu="pic"  ></perTop>
    <ul class="jiaohu">
      <li>
        <span v-text="i"></span>
        <router-link to v-text="`关注`"></router-link>
      </li>
      <li>
        <span v-text="q"></span>
        <router-link to v-text="`粉丝`"></router-link>
      </li>
      <li>
        <span v-text="e"></span>
        <router-link to v-text="`菜谱`"></router-link>
      </li>
    </ul>
    <h3>荣誉勋章</h3>
    <ul class="dengji">
      <li>
        <img src="@/assets/per/sousuo.png" alt />
      </li>
      <li>
        <img src="@/assets/per/caipu1.png" alt />
      </li>
      <li>
        <img src="@/assets/per/caixi1.png" alt />
      </li>
      <li>
        <img src="@/assets/per/gexing1.png" alt />
      </li>
      <li>
        <img src="@/assets/per/kouwei1.png" alt />
      </li>
      <li>
        <img src="@/assets/per/zucai1.png" alt />
      </li>
      <li>
        <img src="@/assets/per/zuopin1.png" alt />
      </li>
    </ul>
    <router-link to class="xiahen">
      <div class="jifen">
        <div>
          <img src="@/assets/per/myhome_jifen@3x.png" alt class="jifen_zuo" />
          <span class="zuo_per">积分商城</span>
        </div>
        <div>
          <span class="you_per">免费兑换</span>
          <img src="@/assets/per/ms_publis_recipe_r@3x.png" alt class="jifen_you" />
        </div>
      </div>
    </router-link>
    <router-link to class="xiahen">
      <div class="jifen">
        <div>
          <img src="@/assets/per/myhome_xiaoxi@3x.png" alt class="jifen_zuo" />
          <span class="zuo_per">消息通知</span>
        </div>
        <div>
          <img src="@/assets/per/ms_publis_recipe_r@3x.png" alt class="jifen_you" />
        </div>
      </div>
    </router-link>
    <router-link to class="xiahen">
      <div class="jifen">
        <div>
          <img src="@/assets/per/myhome_fabu@3x.png" alt class="jifen_zuo" />
          <span class="zuo_per">我的发布</span>
        </div>
        <div>
          <img src="@/assets/per/ms_publis_recipe_r@3x.png" alt class="jifen_you" />
        </div>
      </div>
    </router-link>
    <div  @click="myshoucan" class="xiahen">
      <div class="jifen">
        <div>
          <img src="@/assets/per/myhome_shoucang@3x.png" alt class="jifen_zuo" />
          <span class="zuo_per">我的收藏</span>
        </div>
        <div>
          <img src="@/assets/per/ms_publis_recipe_r@3x.png" alt class="jifen_you" />
        </div>
      </div>
    </div>
    <router-link to class="xiahen">
      <div class="jifen">
        <div>
          <img src="@/assets/per/myhome_fabu@3x.png" alt class="jifen_zuo" />
          <span class="zuo_per">我的订单</span>
        </div>
        <div>
          <img src="@/assets/per/ms_publis_recipe_r@3x.png" alt class="jifen_you" />
        </div>
      </div>
    </router-link>
    <router-link to class="xiahen">
      <div class="jifen">
        <div>
          <img src="@/assets/per/20190112151958_101.png" alt class="jifen_zuo" />
          <span class="zuo_per">关于我们</span>
        </div>
        <div>
          <img src="@/assets/per/ms_publis_recipe_r@3x.png" alt class="jifen_you" />
        </div>
      </div>
    </router-link>
  </div>
</template>
<script>
import qs from 'qs'
import perTop from "./common/perTop.vue";
export default {
  components: {
    perTop
  },
  data() {
    return {
      i: "0",
      q: "1",
      e: "2",
      title:"",
      pic:""
    };
  },
  created(){
     if(window.sessionStorage.uid){
       this.axios.post("/user/personal",
    qs.stringify({uid:window.sessionStorage.uid}),
     {headers:{'Content-Type':'application/x-www-form-urlencoded'}}
    ).then(
      res=>{
         this.title=res.data[0].uname;
         this.pic=res.data[0].avatar;
         if(this.pic==null){
           this.pic="http://127.0.0.1:9999/user_avatar/avator.jpg"
         }
         this.i=res.data[0].focus;
         if(!this.i){
          this.i=0
         }
         this.q=res.data[0].fans;
          if(!this.q){
          this.q=0
         }
         this.e=res.data[0].menu;
          if(!this.e){
          this.e=0
         }
      }
    )
     }else{
       this.pic="http://127.0.0.1:9999/user_avatar/se.png"
     }
  },
  methods:{
  myshoucan(){
    
     this.$router.push("/shoucan");
  }
  }
};
</script>
<style scoped>
.zhuti {
  background: #f5f5f5;
}
.jiaohu {
  display: flex;
  list-style: none;
  justify-content: space-around;
  height: 1.5rem;
  background: #fefefe;
}
.jiaohu > li {
  text-align: center;
  width: 30%;
  border-right: 1px solid #eee;
}
.jiaohu > li > a {
  font-size: 14px;
  color: #999;
  width: 100%;
  line-height: 1.5rem;
}
.jiaohu > li > span {
  color: #ff4c35;
  font-size: 14px;
}
h3 {
  padding-left: 15px;
  text-align: left;
  margin: 15px 0;
}
.dengji {
  display: flex;
  justify-content: space-between;
  padding-left: 15px;
  list-style: none;
  margin-bottom: 15px;
  background: transparent;
  background-color: white;
}
.dengji > li > img {
  width: 38px;
  height: 32px;
}
.jifen {
  display: flex;
  justify-content: space-between;
  border-bottom: 1px solid #f5f5f5;
  height: 44px;
  line-height: 44px;
}
.jifen_zuo {
  width: 27px;
  height: 27px;
  position: relative;
  top: -2px;
  margin-right: 8px;
}
.jifen_you {
  width: 12px;
  height: 12px;
  position: relative;
  top: 2px;
  margin-left: 6px;
  right: 6px;
}
.zuo_per {
  font-size: 16px;
  color: #333;
}
.you_per {
  font-size: 12px;
  color: #ff4c35;
  line-height: 44px;
}
.xiahen {
  display: block;
  width: 100%;
  height: 45px;
  line-height: 45px;
  padding-left: 15px;
  margin: 15px 0;
}
.jifen>div:nth-child(2){
  position: relative;
  left: -20px;
}
</style>
