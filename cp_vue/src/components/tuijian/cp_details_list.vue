<template>
  <div class="details_list_container">
    <div class="details_list_top">
      <div class="return" @click="fanhui"></div>
      <div class="search-box">
        <input type="text" placeholder="搜索你想找的才菜" class="search">
        <div class="search_btn">搜索</div>
      </div>
      <router-link to="" class="to_cp_all">菜谱大全</router-link>
    </div>
    <div class="details_list">
      <h1 class="list_title">快手菜</h1>
      <h3 class="list_subtitle"><span>快手菜</span>精品菜谱</h3>
      <div class="list_item">
        <div class="cp_image">
          <img src="@/assets/cp_details_img/c59815c5787e583bdcf1096d4726e794.jpg">
        </div>
        <div class="cp_info">
          <h3>鸡蛋炒虾仁</h3>
          <div class="cp_score">
            <img src="@/assets/icon/20180831142237_413.png">
            <img src="@/assets/icon/20180831142237_413.png">
            <img src="@/assets/icon/20180831142237_413.png">
            <img src="@/assets/icon/20180831142237_310.png">
            <img src="@/assets/icon/20180831142237_552.png">
          </div>
          <div class="view-count">
            <span>312123收藏</span>&nbsp;&nbsp;&nbsp;<span>132132浏览</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data(){
    return {

    }
  },
  methods:{
    fanhui(){
      this.$router.go(-1);
    }
  }
}
</script>

<style scoped>
.details_list_top{
  padding:10px 20px;
  display:flex;
  justify-content: space-between;
  align-items: center;
}
.return{
  width:40px;
}
.return::before{
  content:"";
  display:block;
  width:12px;height:12px ;
  border-left:2px solid #ff5151;
  border-bottom:2px solid #ff5151;
  transform: rotate(45deg);
}

.search-box{
  flex-grow: 1;
}
.search{
  padding-left:32px;
  height: 32px;
  box-sizing: border-box;
  width: 72%;
  display: inline-block;
  outline: none;
  border:1px solid #aaa;
  background:url("../../assets/icon/center_title_icon.png") 10px 7px/15px 15px no-repeat;
}
.search:focus{
  border:1px solid rgb(247, 191, 5);
}
.search_btn{
  display:inline-block;
  vertical-align:top;
  background: #f54932;
  color: #fff;
  text-align: center;
  font-size: 14px;
  width: 28%;
  height: 32px;
  line-height: 32px;
  border-top-right-radius: 2px;
  border-bottom-right-radius: 2px;
  cursor: pointer;
}
.to_cp_all{
  display: inline-block;
  height: 32px;
  width: 70px;
  text-align: center;
  color: #f54932;
  font-size: 14px;
  line-height: 32px;
  text-align: right;
}

.list_title{
  font-size: 28px;
  font-weight: 700;
  color: #333;
  line-height: 38px;
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
.list_item{
  display:flex; 
}
.cp_image{
  width:120px;height:120px;
  border-radius:5px;
  overflow: hidden;
}
.cp_image img{
  width:100%;
}
.cp_info{
  padding-left:15px;
}
.cp_score img{
  width:16px;
}
</style>