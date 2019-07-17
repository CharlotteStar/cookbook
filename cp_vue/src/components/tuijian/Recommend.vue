<template>
  <div class="container">
    <!-- <div class="lunbo">
            轮播组件
    </div>-->
    <div style="height:35px"></div>
    <div class="sancan_top">
      <div class="sancan_type">
        <span class="today">今日</span>
        <ul class="type_list type_0">
          <li class="type1">早餐</li>
          <li class="type2">午餐</li>
          <li class="type3">下午茶</li>
          <li class="type4">晚餐</li>
          <li class="type5">夜宵</li>
        </ul>
      </div>
      <div class="sancan_view">
        <div
          class="sancan_list"
          @touchstart="slide_start"
          @touchmove="slide_move"
          @touchend="slide_end"
        >
          <div class="sancan_slide" v-for="i in 5" :key="i" :data-i="i">
            <div class="sancan_item">
              <div class="img_txt">
                <img class="img" />
                <div class="txt_box">
                  <div class="txt_title"></div>
                  <div class="txt_content"></div>
                </div>
              </div>
            </div>
            <div class="sancan_item">
              <div class="img_txt">
                <img class="img" />
                <div class="txt_box">
                  <div class="txt_title"></div>
                  <div class="txt_content"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="FourPlates">
      <router-link class="mrfl" to="">
        <img src="@/assets/tj_img/timg.jpg">
        <div class="title">
          <h3>每日福利</h3>
          <p>好货推荐</p>
        </div>
      </router-link>
      <router-link class="bzlx" to="" >
        <img src="@/assets/tj_img/bzlx.jpg">
        <div class="title">
          <h3>本周流行</h3>
          <p>最佳菜肴</p>
        </div>
      </router-link>
      <router-link class="znzc" to="">
        <img src="@/assets/tj_img/znzc.jpg">
        <div class="title">
          <h3>智能组菜</h3>
          <p>选择神器</p>
        </div>
      </router-link>
      <router-link class="cpfl" to="/classify">
        <img src="@/assets/tj_img/cpfl.jpg">
        <div class="title">
          <h3>菜谱分类</h3>
          <p>美味分类</p>
        </div>
      </router-link>
    </div>
    <div class="today-recommend">
        <!-- 推荐导航栏 -->
      <ul class="index-nume">
        <li>推荐</li>
        <li>时令</li>
        <li>食肉</li>
        <li>素食</li>
        <li>烘焙</li>
      </ul>
      <!-- 推荐用户展示 -->
      <div class="index_img_text">
        <div class="img_txt img_text_content">
          <img src="http://127.0.0.1:9999/tj_sancan/125454d0ba92403e7f34bb5025284d9b.jpg" class="img" />
          <h3>部队火锅</h3>
          <h6>家常菜|天涯海角最想念的味道</h6>
          <div class="user_index">
            <div class="user_img_name">
              <img
                src="http://127.0.0.1:9999/tj_sancan/125454d0ba92403e7f34bb5025284d9b.jpg"
                class="user_img"
              />
              <span class="user_name">菜菜美食记</span>
            </div>
            <span class="watch_time">
              <img src="../../assets/icon/watch_time.png" /> 1w+
            </span>
          </div>
        </div>
        <div class="img_txt img_text_content">
          <img src="http://127.0.0.1:9999/tj_sancan/125454d0ba92403e7f34bb5025284d9b.jpg" class="img" />
          <h3>部队火锅</h3>
          <h6>家常菜|天涯海角最想念的味道</h6>
          <div class="user_index">
            <div class="user_img_name">
              <img
                src="http://127.0.0.1:9999/tj_sancan/125454d0ba92403e7f34bb5025284d9b.jpg"
                class="user_img"
              />
              <span class="user_name">菜菜美食记</span>
            </div>
            <span class="watch_time">
              <img src="../../assets/icon/watch_time.png" />
              1w+ 
            </span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { setTimeout } from 'timers';
export default {
  data() {
    return {
      list: [],
      start_x: 0,
      prev_x:0,
      offset_x:0,
      end_x:0
    };
  },
  methods: {
    slide_start(e) {
      var sancan_list=document.getElementsByClassName("sancan_list")[0];
      var left=window.getComputedStyle(sancan_list,null).left;

      sancan_list.style.transition="0s";

      this.offset_x=parseInt(left)
      this.start_x=e.changedTouches[0].pageX;
      this.prev_x=e.changedTouches[0].pageX;
    },
    slide_move(e) {
      var sancan_list=document.getElementsByClassName("sancan_list")[0];
      var now_x=e.changedTouches[0].pageX;
      this.offset_x+= now_x-this.prev_x;
      sancan_list.style.left=`${this.offset_x}px`;
      this.prev_x=now_x;
    },
    slide_end(e) {
      var sancan_list=document.getElementsByClassName("sancan_list")[0];
      var sancan_slide=document.getElementsByClassName("sancan_slide");
      var type_list=document.getElementsByClassName("type_list")[0];
      var width=sancan_slide[0].clientWidth;

      sancan_list.style.transition="0.3s";

      //循环判断当前位移量的值与每个滑块宽度之间的距离
      for(var i=0,arr=[];i<sancan_slide.length;i++){ 
        var n=Math.abs(sancan_slide[i].offsetLeft+this.offset_x);
        if(n-30<sancan_slide[0].clientWidth/2-30){
          type_list.className="type_list type_"+i;
          sancan_list.style.left=`-${i*width}px`;
          break;
        }
      }
      //超出时候的样式
      if(this.offset_x>0){
        type_list.className="type_list type_0";
        sancan_list.style.left=`-0px`;
      }
      if(Math.abs(this.offset_x)>sancan_slide[0].clientWidth*4){
        type_list.className="type_list type_4";
        sancan_list.style.left=`-${4*width}px`;
      }
    }
  },
  created() {
    this.axios.get("/tj/sancan").then(result => {
      this.list = result.data.data;
      var sancan_items = document.getElementsByClassName("sancan_item");
      for (var i = 0; i < this.list.length; i++) {
        sancan_items[i].getElementsByClassName("img")[0].src = this.list[i].pic;
        sancan_items[i].getElementsByClassName("txt_title")[0].innerHTML = this.list[i].title;
        sancan_items[i].getElementsByClassName("txt_content")[0].innerHTML = this.list[i].benefit;
      }
    });
  },
  mounted(){
    var type_list=document.getElementsByClassName("type_list")[0];
    var types=document.querySelectorAll(".type_list>li");
    var sancan_list=document.getElementsByClassName("sancan_list")[0];  
    for(let i=0;i<types.length;i++){
      types[i].addEventListener("click",fn);
      function fn(){
        toggle_type(i)
      }
    }
    setTimeout(function(){
      var time = new Date().toLocaleString('chinese',{hour12:false});
      var now=parseInt(time.split(" ")[1]);
      now >= 21 ? toggle_type(4) :  
      now >= 18 ? toggle_type(3) : 
      now >= 14 ? toggle_type(2) : 
      now >= 12 ? toggle_type(1) : toggle_type(0);
    },300);
    function toggle_type(i){
      var width=document.getElementsByClassName("sancan_slide")[0].clientWidth;
      type_list.className="type_list type_"+i;
      sancan_list.style.left=`-${i*width}px`;
    }
  }
};
</script>
<style>
.container {
  justify-content: space-between;
  padding-bottom: 50px;
}

.today{
  color: #333;
  line-height: 22px;
  font-size: 20px;
  display: inline-block;
  border-radius: 11px;
  vertical-align: top;
  margin-left: 15px;
  font-weight: 900;
}
.sancan_type{
  position:relative;
  width:100%;
  padding:20px 0 15px;
}
.type_list{
  position:absolute;
  height: 22px;
  display: inline-block;
  vertical-align: top;
  position: absolute;
  left: 55px;
  width: 265px;
  bottom:15px;
}
.type_list li{
  position:absolute;
  font-size:14px;
  bottom:-3px;
  color: #666;
  transition:0.3s 0.3s;
}
.type_0 .type1{
  left: 0px;
  font-size: 20px !important;
  color: #333 !important;
  font-weight: 900;
}
.type_0 .type2{
  left: 55px;
}
.type_0 .type3{
  left: 100px;
}
.type_0 .type4{
  left: 155px;
}
.type_0 .type5{
  left: 200px;
}


.type_1 .type2{
  left: 0px;
  font-size: 20px !important;
  color: #333 !important;
  font-weight: 900;
}
.type_1 .type3{
  left: 55px;
}
.type_1 .type4{
  left: 110px;
}
.type_1 .type5{
  left: 155px;
}
.type_1 .type1{
  left: 200px;
}

.type_2 .type3{
  left: 0px;
  font-size: 20px !important;
  color: #333 !important;
  font-weight: 900;
}
.type_2 .type4{
  left: 75px;
}
.type_2  .type5{
  left: 120px;
}
.type_2 .type1{
  left: 165px;
}
.type_2 .type2{
  left: 205px;
}

.type_3 .type4{
  left: 0px;
  font-size: 20px !important;
  color: #333 !important;
  font-weight: 900;
}
.type_3 .type5{
  left: 55px;
}
.type_3  .type1{
  left: 105px;
}
.type_3 .type2{
  left: 155px;
}
.type_3 .type3{
  left: 200px;
}

.type_4 .type5{
  left: 0px;
  font-size: 20px !important;
  color: #333 !important;
  font-weight: 900;
}
.type_4 .type1{
  left: 55px;
}
.type_4  .type2{
  left: 100px;
}
.type_4 .type3{
  left: 145px;
}
.type_4 .type4{
  left: 205px;
}



.sancan_top {
  margin: 0 10px;
}
.sancan_view {
  overflow: hidden;
}
.sancan_list {
  display: flex;
  flex-wrap: nowrap;
  width:500%;
  position:relative;
  left:0;
  transition:0.3s;
}
.sancan_slide {
  display: flex;
  justify-content: space-between;
  position:relative;
}
.sancan_item {
  width: 50%;
  padding: 0 10px;
}

.img_txt .img {
  width: 100%;
  border-radius: 7px;
  box-shadow: 0 3px 6px rgba(0, 0, 0, 0.5);
  background-color: #666;
  width: 100%;
}

.txt_box{
  position:relative;
  display: inline-block;
  z-index:10;
}
.txt_box::after{
  content:"";
  height: 10px;
  background: #fde8e6;
  width: 100%;
  bottom: 2px;
  position: absolute;
  left: 0px;
  z-index: 1;
}
/* 标题文字 */
.txt_title {
  color: #000;
  font-size: 18px;
  font-weight: 900;
  margin:10px 0 3px;
}
/* 标题文字内容 */
.txt_content {
  color: #333;
  font-size: 14px;
  white-space: nowrap;
  position:relative;
  z-index:10;
}

.FourPlates{
  display:flex;
  justify-content: space-around;
  align-items:center;
  margin:30px 0;
  padding:0 10px;
}
.FourPlates>a{
  width:21%;height:120px;
  display:block;
  background:#fff;
  border-radius:3px;
  box-shadow:0 0px 8px -2px #888;
  position:relative;
  overflow: hidden;
}
.FourPlates img{
  width:100%;height:100%;
  object-fit: contain;
  object-position:0 95%;
  transform :translateX(30%);
}
.FourPlates .cpfl img{
  object-position:0 200%;
}
.mrfl img{
  object-position:0 130%;
}
.FourPlates .title{
  position:absolute;
  top:0;
  padding:5px 10px;
}
.FourPlates .title h3{
  font-size:0.87rem;
  font-weight: 700;
  color:#222;
}
.FourPlates .title p{
  font-size:0.7rem;
  color:#222;
}


.today-recommend{
  padding:0 10px;
}

.tuijian {
  display: flex;
}
/* 推荐 */
.index-nume {
  padding-left: 15px;
  color: #333;
}
.index-nume li {
  float: left;
  list-style: none;
  margin: 5px 20px;
}
.index-nume li:first-child {
  margin-left: 0;
}
/* 推荐用户展示 */
.img_text_content {
  width: 45%;
  border-radius: 7px;
  box-shadow: 0 3px 6px rgba(0, 0, 0, 0.5);
}
.index_img_text {
  display: flex;
  justify-content: space-around;
  width: 100%;
  padding: 15px 0;
}
.img_text_content h3 {
  color: #000;
  font-weight: 900;
  padding: 5px 0 0 5px;
}
.img_text_content h6 {
  font-size: 12px;
  padding: 5px 0 5px 10px;
  color: #333;
}
.user_index {
  display: flex;
  text-align: center;
  justify-content: space-between;
  margin: 18px 5px 12px 12px;
}
.user_img_name {
  align-items: center;
  line-height: 170%;
}
.user_index .user_img {
  width: 30px;
  height: 30px;
  border-radius: 17px;
  vertical-align: top;
}
.user_index .user_name {
  color: #333;
  font-size: 12px;
  padding-left: 5px;
}
.user_index .watch_time {
  float: right;
  margin-right: 5px;
  padding: 7px;
  color: #333;
  font-size: 12px;
  justify-content: space-between;
  vertical-align: top;
  position: relative;
}
.watch_time img {
  width: 15px;
  height: 15px;
  background-color: #fff;
  position: absolute;
  top: 7px;
  right: 30px;
}
</style>

