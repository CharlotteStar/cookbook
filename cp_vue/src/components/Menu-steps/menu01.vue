<template>
  <div class="page_details">
    <div class="sign-food">
      <img :src="cp_details.pic" />
    </div>
    <div class="top">
      <div @click="$router.go(-1)" class="btn1">&lt; 返回</div>
      <router-link to="/home" class="btn2">首页 &gt;</router-link>
    </div>
    <div class="effect">
      <table></table>
      <h3 class="title" v-text="cp_details.title"></h3>
      <span class="view" v-text="byCount+'人收藏'"></span>
      <span class="view" v-text="cp_details.browse+'人浏览'"></span>
      <div class="xiaoguo">
        <router-link to class="list" v-for="(item,index) of benefit" :key="index" v-text="item"></router-link>
      </div>
    </div>
    <div class="w-message">
      <router-link :to="`/menu01_item?uid=`+cp_details.user_id" class="weibou">
        <img :src="user_data.avatar" style="width:40px;height:40px;border-radius:50%" />
        <span class="w-name">
          <span v-text="user_data.uname"></span>
          <br />
          <span>发布1130篇菜谱</span>
        </span>
      </router-link>
      <div class="star-love" @click="gz_toggle">
        <span href class="focus" :class="isGz ? 'guanzhu' : ''">{{isGz ? '已关注' : '关注'}}</span>
      </div>
    </div>
    <div class="comment">
      <p class="comment-p" v-text="cp_details.user_log"></p>
      <div class="pinfen-container">
        <strong class="pingfeng">评分</strong>
        <img
          class="cp_score"
          :src="require(cp_details.score>=i ? '@/assets/icon/20180831142237_413.png' : '@/assets/icon/20180831142237_552.png')"
          v-for="i in 5"
          :key="i"
        />
      </div>
      <div class="sc_miniw">
        <span>主料</span>
        <p v-text="cp_details.primary_cl"></p>
        <br />
        <span>辅料</span>
        <p class="peiliao" v-text="cp_details.secondary_cl"></p>
      </div>
    </div>

    <div class="cp_step" :class="isSpread ? 'spread' : ''">
      <div class="stepitem1" v-for="(item,index) of cp_step" :key="index">
        <strong class="step_title" id="step_num1">步骤{{item.step}}</strong>
        <img alt="东北大丰收的做法大全" :src="item.step_img" class="stepimg" />
        <div class="stepc comment">
          <p class="stepdes" v-text="item.content"></p>
        </div>
      </div>

      <div class="fineshed">
        <strong class="step_title" style="font-size:20px;" v-text="cp_details.title+'成品图'"></strong>
        <div class="fineshed-item">
          <img :src="show_complete" class="fineshed-img" />
        </div>
      </div>
      <div class="doneimg_preview">
        <div
          class="imgw current"
          v-for="(item,index) of cp_complete"
          :key="index"
          @click="toggle_pic(index)"
        >
          <img :src="item.step_img" />
        </div>
      </div>
      <div class="skill">
        <strong>烹饪技巧</strong>
        <p class="stepdes1">如果是新鲜的嫩玉米，需要和排骨一起入锅炖，排骨和玉米炖熟了再加入土豆和豆角、胡萝卜等容易熟的蔬菜，这样炖出来的各种蔬菜恰到好处</p>
      </div>
      <div class="seeallbtn" id="seeallbtn" @click="zhankai" style="display: block;">点击展开 ↓</div>
    </div>


    <div class="user_operate">
      <div class="operate_item" @click="change" >
        <img :src="require(scIsSelected ? '@/assets/icon/shoucang2.png' : '@/assets/icon/shoucang.png')">
        <span v-text="byCount"></span>
      </div>
      <div class="operate_item" @click="show_pl">
        <img src="@/assets/icon/pinglun.png">
        <span>评论</span>
      </div>
    </div>

    <!--评论-->
    <div class="pinglun" :class=" is_show_pl ? '' : 'd-none'">
      <div style="text-align:right;padding:10px 15px;box-shadow:0 4px 5px -5px #ccc">
        <div class="close" @click="is_show_pl=false">×</div>
      </div>
      <div class="pinglun-list">
        <div class="pinglun-item" v-for="(item,index) of pl_data" :key="index">
          <div class="pinglun-user">
            <div class="user-avatar">
              <img :src="item.avatar">
            </div>
            <div class="user-name" v-text="item.uname"></div>
            <div class="pinglun-date" v-text="new Date(item.time).getMonth()+'-'+new Date(item.time).getDate()"></div>
          </div>
          <div class="pinglun-content" v-text="item.content"></div>
        </div>
      </div>
      <div class="write-pinglun">
        <input type="text" v-model="pl_value" placeholder="写评论">
        <div class="send-pinglun"  :class="pl_value.length==0 ? 'disabled' : ''" @click="send_pl">发布</div>
      </div>
    </div>

  </div>
</template>
<script>
import { resolve, reject } from "q";
export default {
  props: ["did"],
  data() {
    return {
      is_show_pl:false,
      pl_data:[],
      pl_value:"",
      cp_details: {},   //菜谱的数据
      cp_step: [],    //菜谱的步骤
      benefit: [],
      user_data: {},
      cp_complete: [], //菜谱步骤的成品图
      show_complete: "", //突出显示的成品图
      isSpread: false,
      scIsSelected: false,
      sid: "",
      isLogin: false,
      openUser: {}, //登录用户的数据
      byCount: 0,
      isGz: false, //是否已关注
      gid: null, //关注的id
    };
  },
  methods: {
    show_pl(){
      this.is_show_pl=true;
      this.get_pl();
    },
    send_pl(){
      var params={
        user_id:this.openUser.uid,
        cp_id:this.cp_details.did,
        time:new Date().getTime(),
        content:this.pl_value,
      }
      if(this.pl_value.length!=0){
        this.axios.get(
          "/pinglun/add",
          {params}
        ).then(res=>{
          this.$toast({
            message: "发表成功",
            position: "center",
            duration: 1500
          });
          this.pl_value="";
          this.get_pl();
        })
      }
    },
    get_pl(){
      this.axios.get(
        "/pinglun/get",
        {params:{did:this.cp_details.did}}
      ).then(res=>{
        this.pl_data=res.data.data
      })
    },
    change() {      //判断是否已登录并切换收藏状态
      if (this.isLogin) {
        if (!this.scIsSelected) {
          this.sc_add();
        } else {
          this.sc_del();
        }
      } else {
        this.$toast({
          message: "请登录",
          position: "center",
          duration: 1500
        });
      }
    },
    sc_del() {    //取消收藏
      this.scIsSelected = false;
      this.axios
        .get("/shoucan/shangchu", { params: { sid: this.sid } })
        .then(res => {
          this.sc_count();
          this.is_shoucang();
          this.$toast({
            message: "取消收藏",
            position: "center",
            duration: 1500
          });
        });
    },
    sc_add() {    //添加收藏
      this.scIsSelected = true;
      this.axios
        .get("/shoucan/add", {
          params: {
            uid:this.openUser.uid,
            did: this.cp_details.did
          }
        })
        .then(res => {
          this.sc_count();
          this.is_shoucang();
          this.$toast({
            message: "添加收藏",
            position: "center",
            duration: 1500
          });
        });
    },
    is_shoucang() {   //判断是否收藏
      this.axios
        .get("/shoucan/is_shoucang", {
          params: { uid: this.openUser.uid, did: this.did }
        })
        .then(res => {
          if (res.data.code == "1") {
            this.sid = res.data.data.sid;
            this.scIsSelected = true;
          }
        });
    },
    zhankai() {     //向下展开更多
      this.isSpread = true;
      seeallbtn.style = "display:none";
    },
    toggle_pic(i) {       //切换成品图
      this.show_complete = this.cp_complete[i].step_img;
    },
    sc_count() {      //获取此菜谱被收藏的个数
      this.axios
        .get("/shoucan/byCount", { params: { did: this.did } })
        .then(res => {
          this.byCount = res.data.data;
        });
    },
    gz_toggle() {   //切换关注状态
      this.isGz ? this.gz_del() : this.gz_add();
    },
    gz_add() {    //添加关注
      if (this.isLogin) {
        this.axios
          .get("/gz/add", {
            params: {
              uid: this.user_data.uid,
              open_id: this.openUser.uid
            }
          })
          .then(res => {
            this.isGz = true;
            this.$toast({
              message: res.data.msg,
              position: "center",
              duration: 1500
            });
          });
      } else {
        this.$toast({
          message: "未登录",
          position: "center",
          duration: 1500
        });
      }
    },
    gz_del() {      //取消关注
      this.axios.get("/gz/del", { params: { gid: this.gid } }).then(res => {
        this.isGz = false;
        this.$toast({
          message: res.data.msg,
          position: "center",
          duration: 1500
        });
      });
    },
    isGuanzhu() {     //判断是否已关注
      this.axios
        .get("/gz/isGz", {
          params: {
            uid: this.user_data.uid,
            open_id: this.openUser.uid
          }
        })
        .then(res => {
          if (res.data.code == 1) {
            this.isGz = true;
            this.gid = res.data.data.gid;
          } else {
            this.isGz = false;
          }
        });
    },
    getDetailData() {   //获取菜谱详情的数据
      this.axios
        .get("/caipu/details", { params: { did: this.did } })
        .then(res => {
          this.cp_details = res.data.cp_details;
          this.footprint_add();   //添加足迹
          //菜谱的步骤及成品图
          for (var item of res.data.cp_step) {
            item.step > 0
              ? this.cp_step.push(item)
              : this.cp_complete.push(item);
          }
          this.benefit = this.cp_details.benefit.split(" ");//效果
          this.cp_complete[0]
            ? (this.show_complete = this.cp_complete[0].step_img)
            : "";
          //获取对应用户的数据
          var uid = this.cp_details.user_id;
          this.axios.get("/caipu/user", { params: { uid } }).then(res => {
            this.user_data = res.data.data[0];
            this.isGuanzhu(); //判断是否已关注
          });
          //页面加载时浏览量加一;
          var browse = ++this.cp_details.browse;
          this.axios
            .get("/caipu/browse", { params: { browse, did: this.did } })
            .then(res => {
              return;
            });
        });
    },
    footprint_add(){
      var params={
        uid:this.openUser.uid,
        did:this.cp_details.did
      }
      this.axios.get("/footprint/isExist",{params}).then(res=>{
        var params={
          uid:this.openUser.uid,
          did:this.cp_details.did,
          time:new Date().getTime()
        }
        if(res.data.code==1){
          this.axios.get('/footprint/update_time',{params})
        }
        else{
          this.axios.get('/footprint/add',{params})
        }
      });
    },
  },
  created() {
    this.getDetailData(); //获取整个详情页的数据
    this.sc_count();    //获取此菜谱被收藏的个数
    if (sessionStorage.getItem("user")) {
      this.isLogin = true;
      this.openUser = JSON.parse(sessionStorage.getItem("user"))[0];
    }
    if (this.isLogin) {
      this.is_shoucang(); //判断是否已收藏
      
    }
  },
  mounted() {
    
  },
}
</script>
<style scoped>
.close{
  display: inline-block;
  font-size:24px;
  background:#ccc;
  color:#fff;
  border-radius:50%;
  width:25px;
  height:24px;
  text-align: center;
  line-height: 25px;
}
  .d-none{
    display: none !important;
  }
  .d-flex{
    display: flex !important;
  }
  .d-block{
    display: block !important;
  }
.write-pinglun{
  background:#fff;
  position:fixed;
  bottom:0;
  width:100%;
  padding:5px 20px;
  display: flex;
  align-items: center;
  justify-content: space-between
}
.write-pinglun input{
  border-radius:20px;
  width:100%;height:30px;
  border:0;
  outline: 0;
  background:#ddd;
  padding:0 30px;
  box-sizing: border-box;
}
.write-pinglun .send-pinglun{
  width:65px;
  height:28px;
  font-size:14px;
  text-align: center;
  line-height: 28px;
  border-radius:3px;
  background:#ff5151;
  color:#fff;
  margin-left:5px;
}
.write-pinglun .send-pinglun.disabled{
  background:#ccc;
  color:#666;
}

.pinglun{
  position:fixed;
  background:rgba(255,255,255,0.8);
  bottom:0;
  height:80%;
  width:100%;
  z-index:20 ;
  font-size:15px;
  overflow: scroll;
}
.pinglun-list{
  padding:0 15px 40px;
    overflow: scroll;
}
.pinglun-item{
  padding:10px 0;
}
.pinglun-date{
  float:right
}
.pinglun-user::after{
  content:"";
  display:block;
  clear:both;
}
.user-avatar,
.user-name{
  float:left;
  color:#000;
}
.user-name{
  padding:0 5px;
}
.pinglun-content{
  padding-left:25px;
  margin-top:5px;
}
.user-avatar{
  width:20px;
  border-radius:50%;
  overflow: hidden;
}
.user-avatar img{
  width:100%;
}

.user_operate{
  position:fixed;
  bottom:20px;
  width:100%;
  height:50px;
  left:0;
  display:flex;
  justify-content: space-around;
  align-items: center;
}
.operate_item{
  border-radius:30px;
  padding:5px 15px; 
  box-shadow: 0 3px 5px 3px rgba(0,0,0,0.3);
  background:rgba(255,255,255,0.8);
}
.operate_item img{
  width:25px;
  margin-right:5px;
}
.operate_item span{
  vertical-align: middle;
}

.cp_step {
  position: relative;
  height: 1200px;
  overflow: hidden;
}
.cp_step.spread {
  height: auto;
  overflow: none;
}

.sign-food {
  height: 15rem;
  overflow: hidden;
}
.sign-food img {
  width: 100%;
  object-fit: cover;
  margin-top: 50%;
  transform: translateY(-50%);
}
.effect {
  width: 100%;
  background-color: bisque;
  padding: 25px 20px;
}
.effect .title {
  font-size: 20px;
  font-weight: 700;
  margin-bottom: 10px;
}
.view {
  font-size: 15px;
}
.view + .view {
  margin-left: 10px;
}
.xiaoguo {
  margin-top: 10px;
}
.sc_miniw span {
  display: inline-block;
  font-size: 1.1rem;
  font-weight: 700;
  margin-bottom: 5px;
}
.list {
  font-size: 15px;
  color: #ec8638;
  padding-right: 10px;
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
  top: -9px;
  transform: translateY(-50%);
  border: 1px solid #ff4c39;
  line-height: 30px;
  font-size: 14px;
  color: #ff4c39;
  padding: 0px 18px;
  border-radius: 15px;
}
.focus.guanzhu {
  border: 0px;
  background: #ff4c39;
  color: #fff;
}

.comment {
  margin-top: 10px;
  margin-left: 15px;
  margin-right: 15px;
}
.comment-p {
  margin-bottom: 20px;
  font-size: 0.95rem;
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
  color: red;
}
.peiliao,
.peiliao > a {
  color: slategrey;
}
.stepitem1 {
  margin-top: 70px;
}
.step_title {
  font-size: 24px;
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  margin-bottom: 8px;
}
.stepimg {
  width: 100%;
}
.doneimg_preview {
  padding: 10px 5px;
  width: 100%;
  display: flex;
  position: relative;
}
.imgw {
  display: flex;
  justify-content: center;
  align-items: center;
  margin: 0 5px;
  width: 70px;
  height: 70px;
  overflow: hidden;
}
.imgw > img {
  width: 100%;
}
.skill {
  margin: 10px 0;
  padding: 15px;
}
.skill strong {
  font-weight: 700;
  font-size: 1.1rem;
  display: block;
  margin-bottom: 5px;
}
.pinfen-container {
  margin-bottom: 50px;
  position: relative;
}
.fineshed {
  margin-top: 50px;
}
.fineshed-item {
  width: 100%;
  height: 300px;
  overflow: hidden;
}
.fineshed-img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.cp_score {
  width: 25px;
  margin: 0 5px;
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
  background: rgba(0, 0, 0, 0.5);
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
  background: rgba(0, 0, 0, 0.5);
  position: absolute;
  right: 15px;
  top: 15px;
}
.seeallbtn {
  display: none;
  width: 100%;
  position: absolute;
  bottom: 0px;
  left: 0px;
  height: 80px;
  line-height: 100px;
  color: #666;
  text-align: center;
  font-size: 16px;
  background: linear-gradient(
    to bottom,
    rgba(245, 245, 245, 0),
    color-stop(30%, rgba(245, 245, 245, 0.8)),
    rgba(245, 245, 245, 1)
  );
  background: -webkit-gradient(
    linear,
    0 0,
    0 bottom,
    from(rgba(245, 245, 245, 0)),
    color-stop(30%, rgba(245, 245, 245, 0.8)),
    to(rgba(245, 245, 245, 1))
  );
}
.star-love {
  position: absolute;
  top: 60%;
  transform: translateY(-50%);
  right: 0;
  width: 100px;
}
.love {
  position: absolute;
  right: 10px;
  top: 0px;
  width: 42px;
  height: 69px;
  background-image: url("../../assets/icon/wap2017icons1.png");
  background-size: 353px;
  background-position: 0px 333px;
}
.love.selected {
  background-position: -42px 333px;
}
</style>