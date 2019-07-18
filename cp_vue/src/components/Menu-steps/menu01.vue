<template>
  <div>
    <div class="sign-food">
      <img :src="cp_details.pic">
    </div>
    <div class="top">
	    <router-link to="javascript" class="btn1">&lt; 美食杰</router-link>
	    <router-link to="javascript" class="btn2">菜谱分类 &gt;</router-link>
    </div>
    <div class="effect">
      <table></table>
      <h3 class="title" v-text="cp_details.title"></h3>
      <span class="view" v-text="cp_details.shoucang+'人收藏'"></span>
      <span class="view" v-text="cp_details.browse+'人浏览'"></span>
      <div class="xiaoguo">
        <router-link to="" class="list" v-for="(item,index) of benefit" :key="index" v-text="item"></router-link>
      </div>
    </div>
    <div class="w-message">
      <router-link :to="`/menu01_item?uid=`+cp_details.user_id" class="weibou">
        <img
          src="https://s1.st.meishij.net/r/106/232/3995606/s3995606_156172491177683.jpg"
          alt
          style="width:40px;height:40px;border-radius:50%"
        />
        <span class="w-name">
          <span>能吃的小胖子微博</span>
          <br />
          <span>发布1130篇菜谱</span>
        </span>
      </router-link>
      <a href class="focus">关注</a>
    </div>
    <div class="comment">
      <p class="comment-p" v-text="cp_details.user_log"></p>
      <div class="pinfen-container">
        <strong class="pingfeng">评分</strong>
        <img class="cp_score" :src="require(cp_details.score>=i ? '@/assets/icon/20180831142237_413.png' : '@/assets/icon/20180831142237_552.png')" v-for="i in 5" :key="i">
      </div>
      <div class="sc_miniw">
        <span>主料</span>
        <p v-text="cp_details.primary_cl">
          <!-- <a class="red">排骨</a>300克、
          <a class="red">胡萝卜</a>1根、
          <a class="red">玉米</a>1只、
          <a class="red" href>豆角</a>适量、
          <a class="red" href>土豆</a>1个 -->
        </p>
        <br />
        <span>辅料</span>
        <p class="peiliao" v-text="cp_details.secondary_cl">
          <!-- <a href>油</a>适量、
          <a href>盐</a>适量、
          <a href>自制辣椒酱</a>适量、
          <a href>料酒</a>适量、
          <a href>花椒大料</a>适量、
          <a href>香叶</a>1片、
          <a href>葱</a>适量、
          <a href>姜</a>适量 -->
        </p>
      </div>
    </div>

    <div class="stepitem1" v-for="(item,index) of cp_step" :key="index">
      <strong class="step_title" id="step_num1">步骤{{item.step}}</strong>
      <img alt="东北大丰收的做法大全" :src="item.step_img" class="stepimg"/>
      <div class="stepc comment">
        <p class="stepdes" v-text="item.content"></p>
      </div>
    </div>

    <div class="fineshed">
      <strong class="step_title" style="font-size:20px;" v-text="cp_details.title+'成品图'"></strong>
      <div class="fineshed-item">
         <img src="https://s1.st.meishij.net/rs/106/232/3995606/n3995606_156172709464504.jpg" class="fineshed-img">
      </div>
    </div>
    <div class="doneimg_preview">
      <div class="imgw current" v-for="(item,index) of cp_complete" :key="index">
        <img :src="item.step_img"/>
      </div>
    </div>
    <div class="skill">
      <strong>烹饪技巧</strong>
      <p class="stepdes1">如果是新鲜的嫩玉米，需要和排骨一起入锅炖，排骨和玉米炖熟了再加入土豆和豆角、胡萝卜等容易熟的蔬菜，这样炖出来的各种蔬菜恰到好处</p>
    </div>
  </div>
</template>
<script>
export default {
  props:['did'],
  data() {
    return {
      cp_details:{},
      cp_step:[],
      benefit:[],
      cp_complete:[]
    };
  },
  created(){
    this.axios.get(
      '/caipu/details',
      {params:{did:this.did}}
    ).then(res=>{
      this.cp_details=res.data.cp_details;
      for(var item of res.data.cp_step){
        item.step>0 ? this.cp_step.push(item) : this.cp_complete.push(item)
      }
      this.benefit=this.cp_details.benefit.split(' ');
      console.log(this.cp_details.user_id)
    })
  }
};
</script>
<style scoped>
/* .first{display:flex} */
.sign-food {
  height: 15rem;
  overflow: hidden;
}
.sign-food img{
  width:100%;
  object-fit: cover;
  margin-top:50%;
  transform: translateY(-50%);
}
.effect {
  width: 100%;
  background-color: bisque;
  padding:25px 20px;
}
.effect .title{
  font-size:20px;
  font-weight: 700;
  margin-bottom:10px;
}
.view {
  font-size: 15px;
}
.view+.view{
  margin-left:10px;
}
.xiaoguo{
  margin-top:10px;
}
.sc_miniw span{
  display:inline-block;
  font-size:1.1rem;
  font-weight: 700;
  margin-bottom:5px;
}
.list {
  font-size: 15px;
  color:#ec8638;
  margin-right: 10px;
}
.w-name {
  position: absolute;
  margin-top: 0px;
  margin-left: 10px;
}
.w-message {
  margin-top: 20px;
  position: relative;
}
.weibou {
  color: dimgray;
  font-size: 13px;
  display: block;
  padding: 0 10px;
}
.focus {
  height: 30px;
  position: absolute;
  right: 20px;
  top: 50%;
  transform: translateY(-50%);
  border: 1px solid #ff4c39;
  line-height: 30px;
  font-size: 14px;
  color: #ff4c39;
  padding: 0px 18px;
  border-radius: 15px;
}
.comment {
  margin-top: 10px;
  margin-left: 15px;
  margin-right: 15px;
}
.comment-p {
  margin-bottom: 20px;
  font-size:0.95rem;
}
.star {
  display: inline-block;
  width: 30px;
  height: 30px;
  background-image: url("../../assets/icon/wap2017icons1.png");
  background-size: 353px;
  background-position: 0px 267px;
  margin-left: 5px;
}
.love {
  position: absolute;
  right:20px;
  width: 50px;
  height: 68px;
  background-image: url("../../assets/icon/wap2017icons1.png");
  background-size: 353px;
  background-position: 0px 333px;
}
.pingfeng {
  margin-right: 10px;
}
strong {
  color: black;
}
em {
  font-size: 14px;
  color: slategrey;
}
.red {
  color:red
}
.peiliao,
.peiliao > a {
  color: slategrey;
}
.stepitem1 {
  margin-top: 70px;
}
.step_title {
  font-size:24px;
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  margin-bottom:8px;
}
.stepimg {
  width: 100%;
}
.doneimg_preview {
  margin-top: 30px;
  width: 100%;
  height: 84px;
  white-space:nowrap;  
  text-align: center;
}
.imgw {
  display: inline-block;
  margin-right: 16px;
  width: 20%;
}
.imgw > img {
  width: 100%;
}
.skill {
  margin: 10px 0;
  padding:15px;
}
.skill strong{
  font-weight: 700;
  font-size:1.1rem;
  display:block;
  margin-bottom:5px;
}
.pinfen-container {
  margin-bottom: 50px;
}
.fineshed{margin-top:50px;}
.fineshed-item{width:100%;}
.fineshed-img{width:100%;}
.cp_score{
  width:25px;
  margin:0 5px;
  vertical-align: middle;
}
.top {
  height: 45px;
  width: 100%;
  position: fixed;
  left: 0px;
  top: 0px;
  z-index: 1;
}
.btn1 {
  display: inline-block;
  vertical-align: top;
  height: 30px;
  padding: 0px 12px;
  font-size: 14px;
  color: #fff;
  border-radius: 15px;
  line-height: 30px;
  background: rgba(0,0,0,0.5);
  position: absolute;
  left: 15px;
  top: 15px;
}
.btn2 {
  display: inline-block;
  vertical-align: top;
  height: 30px;
  padding: 0px 12px;
  font-size: 14px;
  color: #fff;
  border-radius: 15px;
  line-height: 30px;
  background: rgba(0,0,0,0.5);
  position: absolute;
  right: 15px;
  top: 15px;
}
</style>