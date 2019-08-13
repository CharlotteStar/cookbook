<template>
  <div class="home">
    <div class="page-tab-container">
      <div class="page-tabber">
        <!-- <h3>一个父面板 四个子面板</h3> -->
        <mt-tab-container v-model="active" class="tabContainer">
          <mt-tab-container-item id="recommend" class="recommend">
            <!-- <h3>顶部导航栏</h3> -->
            <cooktop
            :leftImg="require('../assets/icon/left_title_icon.png')"
            :centerImg="require('../assets/icon/center_title_icon.png')"
            :rightImg="require('../assets/icon/right_title_icon.png')"
            ></cooktop>
              <recommend></recommend>
          </mt-tab-container-item>
          <mt-tab-container-item id="find" class="find">
              <classify></classify>
          </mt-tab-container-item>
          <mt-tab-container-item id="food" >
            <make-menu></make-menu>
          </mt-tab-container-item>
          <mt-tab-container-item id="me" class="liang" >
            <me></me>
          </mt-tab-container-item>
        </mt-tab-container>
      </div>
      <!-- 底部导航栏 -->
      <mt-tabbar v-model="active" fixed>
        <mt-tab-item id="recommend" @click.native="changeState(0)">
          <tabbaricon
            :selectedImage="require('../assets/icon/t_selected_img.png')"
            :normalImage="require('../assets/icon/t_normal_img.png')"
            :focused="currentIndex[0].isSelect"
          ></tabbaricon>
          推荐
        </mt-tab-item>
        <mt-tab-item id="find" @click.native="changeState(1)" @click="tz" >
          <tabbaricon
            :selectedImage="require('../assets/icon/fenlei_selected.png')"
            :normalImage="require('../assets/icon/fenlei_normal.png')"
            :focused="currentIndex[1].isSelect"
          ></tabbaricon>
          分类
        </mt-tab-item>
        <mt-tab-item id="food" @click.native="changeState(2)">
          <tabbaricon
            :selectedImage="require('../assets/icon/s_selected_img.png')"
            :normalImage="require('../assets/icon/s_normal_img.png')"
            :focused="currentIndex[2].isSelect"
          ></tabbaricon>
          创作
        </mt-tab-item>
        <mt-tab-item id="me" @click.native="changeState(3)" @click="tz"
        class="zong">
          <tabbaricon
            :selectedImage="require('../assets/icon/w_selected_img.png')"
            :normalImage="require('../assets/icon/w_normal_img.png')"
            :focused="currentIndex[3].isSelect"
          ></tabbaricon>
          我的
        </mt-tab-item>
      </mt-tabbar>
    </div>
  </div>
</template>
<script>
  //引入头部面板
  import CookTop from './cook/CookTop.vue'
  // 引入底部四个按钮
  import TabBarIcon from './cook/TabBarIcon.vue'
  // 引入首页推荐面板
  import Recommend from './tuijian/Recommend.vue'
  import classify from './tuijian/classify.vue'  //分类
  import me from './me/me.vue'
  import makeMenu from './makeMenu.vue'

  export default {
    data(){
      return {
        active:"recommend",
        currentIndex:[
          {isSelect:true},
          {isSelect:false},
          {isSelect:false},
          {isSelect:false},
        ]
      }
    },
    methods: {
      tz(){
        console.log(window.sessionStorage.uid)
      },
      changeState(n){
        for(var i=0;i<this.currentIndex.length;i++){
          this.currentIndex[i].isSelect=false;
        }
        this.currentIndex[n].isSelect=true;
        window.sessionStorage.currentIndex=n;
        switch(n){
          case 0:
            window.sessionStorage.active="recommend";
            break;
          case 1:
            window.sessionStorage.active='find';
            break;
          case 2:
            window.sessionStorage.active='food';
            break;
          case 3:
            window.sessionStorage.active='me';
            break;
        }
      }
    },
    created(){
      var active=window.sessionStorage.active
      if(active){
        this.active=active;
        this.changeState(window.sessionStorage.currentIndex);
      };
    },
    components:{
      "cooktop":CookTop,
      "tabbaricon":TabBarIcon,
      "recommend":Recommend,
      "me":me,
      'classify':classify,
      makeMenu
    }
  }
</script>

<style scoped>
.tabContainer .find .page-classify{
  padding-bottom: 56px !important;
}

  .recommend{
    position:absolute;
    width:100%;
    height:100%;
  }
  .page-tabber{
    padding-bottom:60px; 
  }
 .mint-tabbar>.mint-tab-item{
   color: #999;
 }
  .mint-tabbar>.mint-tab-item.is-selected{
    background-color: transparent;
    color: #ff4c39;
  }
</style>