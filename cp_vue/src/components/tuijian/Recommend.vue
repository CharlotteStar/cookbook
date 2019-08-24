<template>
  <div class="tj_container" ref="tj_container">
    <!-- <div class="lunbo">
            轮播组件
    </div>-->
    <div style="height:5px"></div>
    <div class="sancan_top">
      <div class="sancan_type">
        <span class="today">今日</span>
        <ul class="type_list type_0" ref="type_list">
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
          ref="sancan_list"
        >
          <div class="sancan_slide" v-for="i in 5" :key="i" :data-i="i" ref="sancan_slide">
            <div class="sancan_item" ref="sancan_item">
              <div class="img_txt" ref="sancan_item_img_txt">
                <img class="img" ref="sancan_item_img"/>
                <div class="txt_title" ref="sancan_item_title"></div>
                <div class="txt_content" ref="sancan_item_content"></div>
              </div>
            </div>
            <div class="sancan_item" ref="sancan_item">
              <div class="img_txt" ref="sancan_item_img_txt">
                <img class="img" ref="sancan_item_img"/>
                <div class="txt_title" ref="sancan_item_title"></div>
                <div class="txt_content" ref="sancan_item_content"></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="FourPlates">
      <!-- <router-link class="mrfl" to>
        <img src="@/assets/tj_img/timg.jpg" />
        <div class="title">
          <h3>每日福利</h3>
          <p>好货推荐</p>
        </div>
      </router-link>
      <router-link class="bzlx" to>
        <img src="@/assets/tj_img/bzlx.jpg" />
        <div class="title">
          <h3>本周流行</h3>
          <p>最佳菜肴</p>
        </div>
      </router-link> -->
      <router-link class="znzc" to="/SearchFirst">
        <img src="@/assets/tj_img/znzc.jpg" />
        <div class="title">
          <h3>智能组菜</h3>
          <p>选择神器</p>
        </div>
      </router-link>
      <router-link class="cpfl" to="/classify">
        <img src="@/assets/tj_img/cpfl.jpg" />
        <div class="title">
          <h3>菜谱分类</h3>
          <p>美味分类</p>
        </div>
      </router-link>
    </div>
    <div class="today-recommend">
      <div class="zhanwei" ref="zhanwei">
        <div class="navbar" ref="navbar">
          <ul class="nav">
            <li class="navItem selected" >
              <span>推荐</span>
            </li>
            <li class="navItem">
              <span>烘焙</span>
            </li>
            <li class="navItem">
              <span>时令</span>
            </li>
            <li class="navItem">
              <span>食肉</span>
            </li>
            <li class="navItem">
              <span>素食</span>
            </li>
            <li class="navItem">
              <span>韩国料理</span>
            </li>
          </ul>
        </div>
      </div>
      <div class="recommend-container">
        <div class="recommend-list" ref="recommend_list">
          <div class="recommend-container-item">
            <!--推荐-->
            <div class="recommend-slide">
              <div class="column">
                <router-link
                  :to="`/menu01/${item.did}`"
                  class="recommend-item"
                  v-for="(item,index) in tuijian"
                  v-if="index%2==0"
                  :key="index"
                >
                  <div class="imgDiv">
                    <img :src="item.pic" />
                  </div>
                  <div class="info">
                    <p class="title" v-text="item.title"></p>
                    <div class="user-info">
                      <div class="user-tx">
                        <img :src="item.avatar" />
                      </div>
                      <span v-text="item.uname"></span>
                      <div class="browse" v-text="item.browse"></div>
                    </div>
                  </div>
                </router-link>
              </div>
              <div class="column">
                <router-link
                  :to="`/menu01/${item.did}`"
                  class="recommend-item"
                  v-for="(item,index) in tuijian"
                  v-if="index%2==1"
                  :key="index"
                >
                  <div class="imgDiv">
                    <img :src="item.pic" />
                  </div>
                  <div class="info">
                    <p class="title" v-text="item.title"></p>
                    <div class="user-info">
                      <div class="user-tx">
                        <img :src="item.avatar" />
                      </div>
                      <span v-text="item.uname"></span>
                      <div class="browse" v-text="item.browse"></div>
                    </div>
                  </div>
                </router-link>
              </div>
            </div>
          </div>
          <div class="recommend-container-item">
            <!--烘焙-->
            <div class="recommend-slide">
              <div class="column">
                <router-link
                  :to="`/menu01/${item.did}`"
                  class="recommend-item"
                  v-for="(item,index) of hongbei"
                  v-if="index%2==0"
                  :key="index"
                >
                  <div class="imgDiv">
                    <img :src="item.pic" />
                  </div>
                  <div class="info">
                    <p class="title" v-text="item.title"></p>
                    <div class="user-info">
                      <div class="user-tx">
                        <img :src="item.avatar" />
                      </div>
                      <span v-text="item.uname"></span>
                      <div class="browse" v-text="item.browse"></div>
                    </div>
                  </div>
                </router-link>
              </div>
              <div class="column">
                <router-link
                  :to="`/menu01/${item.did}`"
                  class="recommend-item"
                  v-for="(item,index) of hongbei"
                  v-if="index%2==1"
                  :key="index"
                >
                  <div class="imgDiv">
                    <img :src="item.pic" />
                  </div>
                  <div class="info">
                    <p class="title" v-text="item.title"></p>
                    <div class="user-info">
                      <div class="user-tx">
                        <img :src="item.avatar" />
                      </div>
                      <span v-text="item.uname"></span>
                      <div class="browse" v-text="item.browse"></div>
                    </div>
                  </div>
                </router-link>
              </div>
            </div>
          </div>
          <div class="recommend-container-item">
            <!--时令-->
            <div class="recommend-slide">
              <div class="column">
                <router-link
                  :to="`/menu01/${item.did}`"
                  class="recommend-item"
                  v-for="(item,index) of shiling"
                  v-if="index%2==0"
                  :key="index"
                >
                  <div class="imgDiv">
                    <img :src="item.pic" />
                  </div>
                  <div class="info">
                    <p class="title" v-text="item.title"></p>
                    <div class="user-info">
                      <div class="user-tx">
                        <img :src="item.avatar" />
                      </div>
                      <span v-text="item.uname"></span>
                      <div class="browse" v-text="item.browse"></div>
                    </div>
                  </div>
                </router-link>
              </div>
              <div class="column">
                <router-link
                  :to="`/menu01/${item.did}`"
                  class="recommend-item"
                  v-for="(item,index) of shiling"
                  v-if="index%2==1"
                  :key="index"
                >
                  <div class="imgDiv">
                    <img :src="item.pic" />
                  </div>
                  <div class="info">
                    <p class="title" v-text="item.title"></p>
                    <div class="user-info">
                      <div class="user-tx">
                        <img :src="item.avatar" />
                      </div>
                      <span v-text="item.uname"></span>
                      <div class="browse" v-text="item.browse"></div>
                    </div>
                  </div>
                </router-link>
              </div>
            </div>
          </div>
          <div class="recommend-container-item">
            <!--食肉-->
            <div class="recommend-slide">
              <div class="column">
                <router-link
                  :to="`/menu01/${item.did}`"
                  class="recommend-item"
                  v-for="(item,index) of shirou"
                  v-if="index%2==0"
                  :key="index"
                >
                  <div class="imgDiv">
                    <img :src="item.pic" />
                  </div>
                  <div class="info">
                    <p class="title" v-text="item.title"></p>
                    <div class="user-info">
                      <div class="user-tx">
                        <img :src="item.avatar" />
                      </div>
                      <span v-text="item.uname"></span>
                      <div class="browse" v-text="item.browse"></div>
                    </div>
                  </div>
                </router-link>
              </div>
              <div class="column">
                <router-link
                  :to="`/menu01/${item.did}`"
                  class="recommend-item"
                  v-for="(item,index) of shirou"
                  v-if="index%2==1"
                  :key="index"
                >
                  <div class="imgDiv">
                    <img :src="item.pic" />
                  </div>
                  <div class="info">
                    <p class="title" v-text="item.title"></p>
                    <div class="user-info">
                      <div class="user-tx">
                        <img :src="item.avatar" />
                      </div>
                      <span v-text="item.uname"></span>
                      <div class="browse" v-text="item.browse"></div>
                    </div>
                  </div>
                </router-link>
              </div>
            </div>
          </div>
          <div class="recommend-container-item">
            <!--素食-->
            <div class="recommend-slide">
              <div class="column">
                <router-link
                  :to="`/menu01/${item.did}`"
                  class="recommend-item"
                  v-for="(item,index) of sushi"
                  v-if="index%2==0"
                  :key="index"
                >
                  <div class="imgDiv">
                    <img :src="item.pic" />
                  </div>
                  <div class="info">
                    <p class="title" v-text="item.title"></p>
                    <div class="user-info">
                      <div class="user-tx">
                        <img :src="item.avatar" />
                      </div>
                      <span v-text="item.uname"></span>
                      <div class="browse" v-text="item.browse"></div>
                    </div>
                  </div>
                </router-link>
              </div>
              <div class="column">
                <router-link
                  :to="`/menu01/${item.did}`"
                  class="recommend-item"
                  v-for="(item,index) of sushi"
                 
                  :key="index"
                >
                  <div class="imgDiv">
                    <img :src="item.pic" />
                  </div>
                  <div class="info">
                    <p class="title" v-text="item.title"></p>
                    <div class="user-info">
                      <div class="user-tx">
                        <img :src="item.avatar" />
                      </div>
                      <span v-text="item.uname"></span>
                      <div class="browse" v-text="item.browse"></div>
                    </div>
                  </div>
                </router-link>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { setTimeout, setInterval } from "timers";
import { Promise } from "q";
export default {
  data() {
    return {
      list: [], //三餐推荐的数据
      start_x: 0,
      prev_x: 0,
      offset_x: 0,
      end_x: 0,
      selected: "tuijian",
      time: 0,
      i: 0,             //滑块的下标
      tuijian: [],      //推荐栏数据
      shiling: [],      //时令栏数据
      shirou: [],       //食肉栏数据
      sushi: [],        //素食栏数据
      hongbei: [],      //烘焙栏数据
      pages: 0,         //上拉触底发送请求的页数
      count: 8,         //一次请求的个数
      index:0
    };
  },
  methods: {
    setHeight: function(i) {
      var recommend_list = this.$refs.recommend_list;
      var recommend_container_item = recommend_list.children;
      recommend_list.style.height = recommend_container_item[i].clientHeight + "px";
    },
    loadMore: function() {
      this.pages++;
      new Promise((reslove,reject)=>{
        this.axios
        .get("/tj/tuijian", {
          params: { pages: this.pages, count: this.count }
        })
        .then(res => {
          this.tuijian = this.tuijian.concat(res.data.data);
          reslove();
        });
      }).then(()=>{
        this.setHeight(this.index);
      });
    },
    slide_start(e) {
      var sancan_list = this.$refs.sancan_list;
      var left = window.getComputedStyle(sancan_list, null).left;
      sancan_list.style.transition = "0s";
      this.offset_x = parseInt(left);
      this.start_x = e.changedTouches[0].pageX;
      this.prev_x = e.changedTouches[0].pageX;
      this.time = new Date().getTime();
    },
    slide_move(e) {
      var sancan_list = this.$refs.sancan_list;
      var now_x = e.changedTouches[0].pageX;

      this.offset_x += now_x - this.prev_x;
      sancan_list.style.left = `${this.offset_x}px`;
      this.prev_x = now_x;
    },
    slide_end(e) {
      this.time = new Date().getTime() - this.time; //获取按下时  移动的时间
      var lc = this.prev_x - this.start_x; //获取按下后  移动的距离
      var speed = Math.abs(lc) / (this.time / 1000); //计算出按下后 移动的速度
      this.time = 0;

      var sancan_list = this.$refs.sancan_list;
      var sancan_slide = this.$refs.sancan_slide;
      var type_list = this.$refs.type_list;
      var width = sancan_slide[0].clientWidth;
      sancan_list.style.transition = "0.3s";

      //判断 移动的速度 speed 是否大于 400px/1s 并且移动距离大于 50px
      if (speed > 400 && lc < -50) {
        this.i < 4 ? this.i++ : this.i;
        type_list.className = "type_list type_" + this.i;
        sancan_list.style.left = `-${this.i * width}px`;
      } else if (speed > 400 && lc > 50) {
        this.i > 0 ? this.i-- : this.i;
        type_list.className = "type_list type_" + this.i;
        sancan_list.style.left = `-${this.i * width}px`;
      } else {
        //循环判断当前位移量的值与每个滑块宽度之间的距离
        for (var i = 0, arr = []; i < sancan_slide.length; i++) {
          var n = Math.abs(sancan_slide[i].offsetLeft + this.offset_x);
          if (n < sancan_slide[0].clientWidth / 2) {
            type_list.className = "type_list type_" + i;
            sancan_list.style.left = `-${i * width}px`;
            this.i = i;
            break;
          }
        }
        //超出时候的样式
        if (this.offset_x > 0) {
          type_list.className = "type_list type_0";
          sancan_list.style.left = `-0px`;
        }
        if (Math.abs(this.offset_x) > sancan_slide[0].clientWidth * 4) {
          type_list.className = "type_list type_4";
          sancan_list.style.left = `-${4 * width}px`;
        }
      }
    },
    now_tj(){
      var time = new Date().toLocaleString("chinese", { hour12: false });
      var now = parseInt(time.split(" ")[1]); //获取当前刷新页面时的时间
      now >= 21
        ? this.toggle_type(4)
        : now >= 17
        ? this.toggle_type(3)
        : now >= 14
        ? this.toggle_type(2)
        : now >= 12
        ? this.toggle_type(1)
        : this.toggle_type(0);
    },
    toggle_type(i){
      var width = this.$refs.sancan_slide[0].clientWidth;
      var type_list = this.$refs.type_list;
      var sancan_list = this.$refs.sancan_list;
      type_list.className = "type_list type_" + i;
      sancan_list.style.left = `-${i * width}px`;
      this.i = i;
    },
  },
  created() {
    this.axios.get("tj/qita").then(res => {
      var data = res.data.data;
      for (var i = 0; i < data.length; i++) {
        switch (data[i].type_name) {
          case "时令":
            this.shiling.push(data[i]);
            break;
          case "肉食":
            this.shirou.push(data[i]);
            break;
          case "素食":
            this.sushi.push(data[i]);
            break;
          case "烘焙":
            this.hongbei.push(data[i]);
            break;
        }
      }
    });

    this.axios.get("/tj/sancan").then(result => {
      this.list = result.data.data;
      var sancan_items = this.$refs.sancan_item;
      for (let i = 0; i < this.list.length; i++) {
        this.$refs.sancan_item_img[i].src = this.list[i].pic;
        this.$refs.sancan_item_title[i].innerHTML = this.list[i].title;
        this.$refs.sancan_item_content[i].innerHTML = this.list[i].benefit;
        sancan_items[i].addEventListener("click", () => {
          this.$router.push("/menu01/" + this.list[i].cp_id);
        });
      }
      setTimeout(()=>{
        this.now_tj();
      },200)
    });
  },
  mounted() {
    //页面加载时加载一次数据;
    this.loadMore();

    var type_list = this.$refs.type_list;
    var types = this.$refs.type_list.children;
    var sancan_list = this.$refs.sancan_list;
    for (let i = 0; i < types.length; i++) {
      types[i].addEventListener("click",()=> {
        this.toggle_type(i);
      });
    }
    
    //给页面添加滚动条事件并判断对应条件
    var tj_container = this.$refs.tj_container;
    tj_container.onscroll = () => {
      //判断页面是否到底部
      if (tj_container.scrollTop + tj_container.clientHeight == tj_container.scrollHeight) {
        this.loadMore();
      }
      var zhanwei = this.$refs.zhanwei;
      var navbar = this.$refs.navbar;
      //判断页面顶部是否到推荐导航栏
      if (zhanwei.offsetTop - 44 <= tj_container.scrollTop) {
        navbar.classList.add("fixed");
      } else {
        navbar.classList.remove("fixed");
      }
    };

    var navItem = document.getElementsByClassName("navItem"); //获取指示器元素
    var recommend_container_item = document.getElementsByClassName(
      "recommend-container-item"
    ); //获取切换的滑块元素
    //用循环给所有指示器元素绑定事件点击事件
    for (let i = 0; i < navItem.length; i++) {
      navItem[i].onclick = () => {
        var selected = document.getElementsByClassName("navItem selected")[0];
        selected.classList.remove("selected"); //删除上一次选中的指示器的样式
        navItem[i].classList.add("selected"); //添加当前选中的指示器的样式
        for (var item of recommend_container_item) {
          item.style.left = `-${i * 100}%`; //点击指示器时滑块的偏移量
        }
        this.setHeight(i);
        this.index=i;
      };
    }
  },
};
</script>
<style scoped>
.zhanwei {
  height: 40px;
}
.navbar {
  display: flex;
  height: 40px;
  align-content: center;
  padding-left: 10px;
  background: #fff;
  width: 100%;
}
.navbar.fixed {
  position: fixed;
  top: 40px;
  left: 0;
  z-index: 999;
  padding: 0px 5px;
  padding-left: 30px;
  box-shadow: 0 5px 10px -5px #aaa;
  height: 50px;
}
.nav {
  display: flex;
  align-items: center;
  white-space: nowrap;
  overflow: scroll;
}
.navItem {
  transition: 0.2s;
}
.navItem + .navItem {
  padding-left: 20px;
  font-size: 15px;
}
.navItem.selected {
  font-size: 20px;
  font-weight: 700;
}
.navItem.selected span {
  background-image: linear-gradient(to bottom, transparent 60%, #f20 100%);
  border-radius: 5px;
}
.recommend-container {
  overflow: hidden;
}
.recommend-list {
  white-space: nowrap;
  margin-bottom: 55px;
}
.recommend-container-item {
  display: inline-block;
  vertical-align: top;
  position: relative;
  transition: 0.3s;
  left: 0;
  overflow: hidden;
}
.recommend-slide {
  display: flex;
  justify-content: space-around;
  float: left;
  flex-wrap: wrap;
}
.column {
  width: 45%;
}
.recommend-item {
  display: block;
  width: 100%;
  box-shadow: 0 5px 10px -5px #000;
  border-radius: 10px;
  overflow: hidden;
  margin: 15px 0;
  color: #2c3e50;
}
.recommend-item img {
  width: 100%;
  height: 100%;
  vertical-align: middle;
}
.recommend-item .imgDiv {
  max-height: 200px;
  overflow: hidden;
}
.recommend-item .info {
  padding: 5px 10px;
}
.recommend-item .title {
  margin: 5px 0;
  font-size: 18px;
  font-weight: 700;
  padding: 0;
  width: 100%;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
.user-info {
  display: flex;
  position: relative;
  font-size: 14px;
  margin: 8px 0;
  align-items: center;
}
.user-info span {
  margin-left: 5px;
}
.user-info .browse {
  position: absolute;
  right: 0;
  padding-left: 25px;
  background: url("../../assets/icon/watch_time.png") no-repeat left center;
  background-size: 20px auto;
}
.user-tx {
  width: 28px;
  height: 28px;
  border-radius: 50%;
  overflow: hidden;
  box-shadow: 0 2px 12px -4px #000;
}

.tj_container {
  justify-content: space-between;
  padding-top: 30px;
  position: relative;
  height: 100%;
  width: 100%;
  overflow: auto;
}

.today {
  color: #333;
  line-height: 22px;
  font-size: 20px;
  display: inline-block;
  border-radius: 11px;
  vertical-align: top;
  margin-left: 15px;
  font-weight: 900;
}
.sancan_type {
  position: relative;
  width: 100%;
  padding: 20px 0 15px;
}
.type_list {
  position: absolute;
  height: 22px;
  display: inline-block;
  vertical-align: top;
  position: absolute;
  left: 55px;
  width: 265px;
  bottom: 15px;
}
.type_list li {
  position: absolute;
  font-size: 14px;
  bottom: -3px;
  color: #666;
  transition: 0.3s 0.3s;
}
.type_0 .type1 {
  left: 0px;
  font-size: 20px !important;
  color: #333 !important;
  font-weight: 900;
}
.type_0 .type2 {
  left: 55px;
}
.type_0 .type3 {
  left: 100px;
}
.type_0 .type4 {
  left: 155px;
}
.type_0 .type5 {
  left: 200px;
}

.type_1 .type2 {
  left: 0px;
  font-size: 20px !important;
  color: #333 !important;
  font-weight: 900;
}
.type_1 .type3 {
  left: 55px;
}
.type_1 .type4 {
  left: 110px;
}
.type_1 .type5 {
  left: 155px;
}
.type_1 .type1 {
  left: 200px;
}

.type_2 .type3 {
  left: 0px;
  font-size: 20px !important;
  color: #333 !important;
  font-weight: 900;
}
.type_2 .type4 {
  left: 75px;
}
.type_2 .type5 {
  left: 120px;
}
.type_2 .type1 {
  left: 165px;
}
.type_2 .type2 {
  left: 205px;
}

.type_3 .type4 {
  left: 0px;
  font-size: 20px !important;
  color: #333 !important;
  font-weight: 900;
}
.type_3 .type5 {
  left: 55px;
}
.type_3 .type1 {
  left: 105px;
}
.type_3 .type2 {
  left: 155px;
}
.type_3 .type3 {
  left: 200px;
}

.type_4 .type5 {
  left: 0px;
  font-size: 20px !important;
  color: #333 !important;
  font-weight: 900;
}
.type_4 .type1 {
  left: 55px;
}
.type_4 .type2 {
  left: 100px;
}
.type_4 .type3 {
  left: 145px;
}
.type_4 .type4 {
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
  width: 500%;
  position: relative;
  left: 0;
  transition: 0.3s;
}
.sancan_slide {
  display: flex;
  justify-content: space-between;
  position: relative;
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

/* 标题文字 */
.txt_title {
  color: #000;
  font-size: 18px;
  font-weight: 900;
  margin: 10px 0 3px;
}
/* 标题文字内容 */
.txt_content {
  color: #333;
  font-size: 12px;
  white-space: nowrap;
  position: relative;
  z-index: 10;
  display: inline-block;
  overflow: hidden;
  background: linear-gradient(
    to bottom,
    transparent 0%,
    transparent 40%,
    #fde8e6 40%,
    #fde8e6 100%
  );
  border-radius: 5px;
}

.FourPlates {
  display: flex;
  justify-content: space-around;
  align-items: center;
  margin: 30px 0;
  padding: 0 10px;
}
.FourPlates > a {
  width: 45%;
  height: 120px;
  display: block;
  background: #fff;
  border-radius: 3px;
  box-shadow: 0 2px 5px 0px #888;
  position: relative;
  overflow: hidden;
  min-width: 80px;
}
.FourPlates img {
  width: 100%;
  height: 100%;
  object-fit: contain;
  object-position: 0 95%;
  transform: translateX(30%);
}
.FourPlates .cpfl img {
  object-position: 0 200%;
}
.mrfl img {
  object-position: 0 130%;
}
.FourPlates .title {
  position: absolute;
  top: 0;
  left: 0;
  padding: 5px 10px;
}
.FourPlates .title h3 {
  font-size: 0.87rem;
  font-weight: 700;
  color: #222;
}
.FourPlates .title p {
  font-size: 0.7rem;
  color: #222;
}

.today-recommend {
  padding: 0 15px;
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
  padding: 5px 10px;
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
/* 用户头像姓名及观看 */
.user_img_name {
  align-items: center;
  line-height: 170%;
}
.user_index .user_img {
  width: 20px;
  height: 20px;
  border-radius: 17px;
}
.user_index .user_name {
  color: #333;
  font-size: 12px;
}
.user_index .watch_time {
  float: right;
  padding: 7px 3px 7px 7px;
  color: #333;
  font-size: 12px;
  justify-content: space-between;
  vertical-align: top;
  /* position: relative; */
}
.watch_time img {
  width: 15px;
  height: 15px;
  background-color: #fff;
  /* position: absolute;
  top: 7px;
  right: 30px; */
  margin-right: 0;
}
/* .title>h3{
  padding-left: 0px !important;
} */
</style>

