<template>
  <div class="container">
    <div class="title">
      <div class="show_title">有些人温暖了，</div>
      <!-- 背景色设置一个空div -->
      <div class="bg_color"></div>
    </div>
    <div class="nav_bar" >
      <div class="slide_bar" v-for="i in 6" :key="i">
        <div class="img" >
          <img src="./s16210777158.jpg" width="100%"/>
          <div class="img_title">#热门话题</div>
        </div>
      </div>
    </div>
    <div class="user_item" >
      <div class="user_nume" v-for="n in 10" :key="n">
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
  </div>
</template>
<script>
export default {
  data() {
    return {}
    }
    
  }
  methods: {

};
</script>
<style scope>
*{
    padding: 0;
    margin: 0;
}
.container {
  margin: 10px;
  padding-top: 25px
}
.title {
  display: inline-block;
  position: relative;
  overflow: hidden;
}
/* 随机更新的标语 */
.show_title {
  width: 100%;
  color: #333;
  z-index: 10;
  position: relative;
  flex-wrap: nowrap;
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
.nav_bar {
  width: 100%;
  white-space: nowrap;
  overflow: scroll !important;
}
.slide_bar{
    display: inline-block;
    width: 25%;
    position: relative;
    overflow: hidden;
}
.slide_bar .img {
  display: inline-block;
  width: 100%;
  flex-grow: inherit;
  padding-right: 10px;
}
.img_title{
  display: flex;
  position: absolute;
  left: 50%;
  bottom: 10%;
  margin-left: -50px;
  justify-content: center;
  color: #fff;
}
/* 用户发表教程最外层div */
.user_item {
  margin-top: 50px;
  display: flex;
   flex-wrap: wrap;
   padding: 5px;
}
/* 用户 */
.user_nume {
  display: inline-block;
  width: 45%;
  height: 100%;
  margin: 5px;
  border-radius: 7px;  
  box-shadow: 0px 0px 10px rgb(0,0,0,.6);
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

