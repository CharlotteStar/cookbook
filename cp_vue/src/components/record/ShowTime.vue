<template>
  <div class="r_container">
    <!-- 随机生成标语 -->
    <div class="title">
       <div class="show_title">有些人温暖了，</div>
       <!-- 背景色设置一个空div  -->
      <div class="bg_color"></div>
    </div>
    <!-- 导航栏 -->
    <div class="nav_bar" >
      <div class="slide_bar" v-for="(item,index) in list" :key="item.id" @click="add(index)">
        <div class="img" >
          <img src="./s16210777158.jpg" width="100%"/>
           <div class="img_title">{{item.title}}</div>
        </div>
      </div> 
    </div>
    <div class="user_content">
      <div class="user_container">
        <!-- 第一层 -->
        <div class="user_item" >
          <div class="user_nume" v-for="i in 10" :key="i" >
            <img src="./s16210777158.jpg" />
            <div class="details">
              <h3>凉拌黄瓜凉拌黄瓜凉拌黄瓜</h3>
              <div class="category"># &nbsp;早餐</div>
              <div class="userAndImg">
                <div class="left_name_img">
                    <img src="../../assets/icon/20180831142237_413.png"  />
                    <div>昵称</div>
                </div>
                <div class="right_time">2月18日</div>
              </div>
            </div>
          </div>
        </div>
        <!-- 第二层 -->
        <div class="user_item" >
          <div class="user_nume" v-for="i in 10" :key="i" >
            <img src="./s16210777158.jpg" />
            <div class="details">
              <h3>清爽的拍黄瓜清爽的拍黄瓜清爽的拍黄瓜清爽的拍黄瓜</h3>
              <div class="category"># &nbsp;早餐</div>
              <div class="userAndImg">
                <div class="left_name_img">
                    <img src="../../assets/icon/20180831142237_413.png"  />
                    <div>昵称</div>
                </div>
                <div class="right_time">2月18日</div>
              </div>
            </div>
          </div>
        </div>
        <!-- 第三层 -->
        <div class="user_item" >
          <div class="user_nume" v-for="i in 10" :key="i" >
            <img src="./s16210777158.jpg" />
            <div class="details">
              <h3>酸辣小黄瓜酸辣小黄瓜酸辣小黄瓜酸辣小黄瓜</h3>
              <div class="category"># &nbsp;早餐</div>
              <div class="userAndImg">
                <div class="left_name_img">
                    <img src="../../assets/icon/20180831142237_413.png"  />
                    <div>昵称</div>
                </div>
                <div class="right_time">2月18日</div>
              </div>
            </div>
          </div>
        </div>
        <!-- 第四层 -->
        <div class="user_item" >
          <div class="user_nume" v-for="i in 10" :key="i" >
            <img src="./s16210777158.jpg" />
            <div class="details">
              <h3>酸辣黄瓜酸辣黄瓜酸辣黄瓜酸辣黄瓜</h3>
              <div class="category"># &nbsp;早餐</div>
              <div class="userAndImg">
                <div class="left_name_img">
                    <img src="../../assets/icon/20180831142237_413.png"  />
                    <div>昵称</div>
                </div>
                <div class="right_time">2月18日</div>
              </div>
            </div>
          </div>
        </div>
        <!-- 第五层 -->
        <div class="user_item" >
          <div class="user_nume" v-for="i in 10" :key="i" >
            <img src="./s16210777158.jpg" />
            <div class="details">
              <h3>小炒黄瓜小炒黄瓜小炒黄瓜</h3>
              <div class="category"># &nbsp;早餐</div>
              <div class="userAndImg">
                <div class="left_name_img">
                    <img src="../../assets/icon/20180831142237_413.png"  />
                    <div>昵称</div>
                </div>
                <div class="right_time">2月18日</div>
              </div>
            </div>
          </div>
        </div>
        <!-- 第六层 -->
        <div class="user_item" >
          <div class="user_nume" v-for="i in 10" :key="i" >
            <img src="./s16210777158.jpg" />
            <div class="details">
              <h3>乱炖小黄瓜乱炖小黄瓜乱炖小黄瓜乱炖小黄瓜</h3>
              <div class="category"># &nbsp;早餐</div>
              <div class="userAndImg">
                <div class="left_name_img">
                    <img src="../../assets/icon/20180831142237_413.png"  />
                    <div>昵称</div>
                </div>
                <div class="right_time">2月18日</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      list:[
        {id:0,title:"# 热门话题"},
        {id:1,title:"# 热门活动"},
        {id:2,title:"# 安食油鸡"},
        {id:3,title:"# 每日三餐"},
        {id:4,title:"# 视频美食"},
        {id:5,title:"# 年夜饭"}
      ]
    }
    },
    methods: {
      add(i){
        // 查找要修改的元素
        var nav_bar = document.getElementsByClassName("nav_bar");
        var str = document.getElementsByClassName("img");
        var nav_btn = document.getElementsByClassName("nav_btn")[0];
        var slide_bar = document.getElementsByClassName("slide_bar");
        var user_container = document.getElementsByClassName("user_container")[0];
        var lft = slide_bar[i].offsetLeft;
        console.log(i.pageX)
        console.log(lft)
        slide_bar [0].style.marginLeft=(-10*i)+"%";
        
        if(nav_btn){
          //如果判断为true就清除原来的样式
          nav_btn.classList.remove("nav_btn");
          nav_btn.parentNode.style.width=null;
        }
        str[i].classList.add("nav_btn");//然后为点击元素添加样式
        slide_bar[i].style.width="26%"  //修改原来的样式
        user_container.style.marginLeft=(-i*100)+"%"
      }
    },
    mounted() {
      this.add(0);
    },
    
  }

</script>
<style scoped>
.r_container{
  padding-top: 62px
}
.title {
  display: inline-block;
  position: relative;
  margin-left: 15px;
}
/* 随机更新的标语 */
.show_title {
  color: #333;
  z-index: 10;
  position: relative;

}
/* 标语的背景透明色 */
.bg_color {
  width: 100%;
  height: 30%;
  position: absolute;
  left: 0px;
  bottom: 1px;
  z-index: 1;
  background: #fde8e6;
}
/* 选项导航 */
.nav_bar {
  width: 100%;
  white-space: nowrap;
  overflow: scroll !important;
  /* padding: 15px 0 0 15px; */
  box-sizing: border-box;
  padding:15px 0 0 15px ;
  position: relative;
}
.nav_btn::after{
  content:"";
  position: absolute;
  bottom: 15%;
  left: 50%;
  width: 60px;
  height: 5px;
  border-radius: 9px;
  background: #ff9d00;
  margin-left: -36px
}
.slide_bar{
    display: inline-block;
    width: 24%;
    position: relative;
    overflow: hidden;
}
.slide_bar .img {
  display: inline-block;
  width: 100%;
  flex-grow: inherit;
  padding-right: 10px;
}
.slide_bar .img img{
  border-radius: 7px;
}
.user_content{
  overflow: hidden;
  position: relative;
 
}
.user_container{
  display: flex;
  width: 600%;
  transition: .3s;
}
.img_title{
  display: flex;
  position: absolute;
  left: 50%;
  bottom: 20%;
  margin-left: -41.4px;
  justify-content: center;
  color: #fff;
  font-size: 14px;
  font-weight: 900;
}
/* 用户发表教程最外层div */
.user_item {
  margin-top: 35px;
  display: flex;
   flex-wrap: wrap;
   /* padding: 5px; */
   justify-content:space-around;
   width:calc(100%/6);
}
/* 用户 */
.user_nume {
  display: inline-block;
  width: 45%;
  border-radius: 7px;  
  box-shadow: 0px 0px 10px rgb(0,0,0,.6);
  margin-bottom: 10px;
}
/* 图片 */
.user_nume img{
    border-top-left-radius: 7px;
    border-top-right-radius: 7px;
    width: 100%
}
/* 作者及美食信息 */
.details{
    margin: 10px;
    font-size: 12px;
    color: #333;
}
/* 美食名称 */
.details h3{
    font:  900 16px Arial;
    color: #000;
}
/* 食谱分类 */
.details .category{
    padding: 10px 0;
    position: relative;
    z-index: 100;
    display: inline-block
}
/* 设置一个背景透明色 */
.details .category::after{
position: absolute;
left: 0;
bottom: 10px;
background-color: #f1c9c8;
border-radius: 5px;
content: "";
white-space: nowrap;
width: 100%;
height: 15%;
opacity: 0.8;
}
/* 用户昵称及头像 */
.userAndImg{
display: flex;
justify-content: space-between;
flex-wrap: nowrap;
overflow: hidden;
}
.left_name_img {
    display: flex;
}
.left_name_img div{
     flex-wrap: nowrap;
    overflow: hidden;
}
.userAndImg .left_name_img img{
    width: 15px;
    height: 15px;
    border: 50%;

}
</style>

