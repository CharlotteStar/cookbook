<template>
  <div class="home">
    <div class="page-tab-container">
      
 
      <div class="page-tabber">
        <!-- <h3>一个父面板 四个子面板</h3> -->
        <mt-tab-container v-model="active">
          <mt-tab-container-item id="recommend" >
            <!-- <h3>顶部导航栏</h3> -->
            <cooktop
            :leftImg="require('../assets/icon/left_title_icon.png')"
            :centerImg="require('../assets/icon/center_title_icon.png')"
            :rightImg="require('../assets/icon/right_title_icon.png')"
            ></cooktop>
              推荐
          </mt-tab-container-item>
          <mt-tab-container-item id="find" >
              发现
          </mt-tab-container-item>
          <mt-tab-container-item id="food" >
              食话              
          </mt-tab-container-item>
          <mt-tab-container-item id="me" >
              我的
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
        <mt-tab-item id="find" @click.native="changeState(1)">
          <tabbaricon
            :selectedImage="require('../assets/icon/f_selected_img.png')"
            :normalImage="require('../assets/icon/f_normal_img.png')"
            :focused="currentIndex[1].isSelect"
          ></tabbaricon>
          发现
        </mt-tab-item>
        <mt-tab-item id="food" @click.native="changeState(2)">
          <tabbaricon
            :selectedImage="require('../assets/icon/s_selected_img.png')"
            :normalImage="require('../assets/icon/s_normal_img.png')"
            :focused="currentIndex[2].isSelect"
          ></tabbaricon>
          食话
        </mt-tab-item>
        <mt-tab-item id="me" @click.native="changeState(3)">
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
      changeState(n){
        for(var i=0;i<this.currentIndex.length;i++){
          if(n==i){
            this.currentIndex[i].isSelect=true;
            console.log(123)
          }else{
            this.currentIndex[i].isSelect=false;
            console.log(321)
          }
        }
      }
    },
    components:{
      "cooktop":CookTop,
      "tabbaricon":TabBarIcon
    }
  }
</script>

<style scoped>
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