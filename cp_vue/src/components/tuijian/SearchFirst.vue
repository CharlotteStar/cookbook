<template>
  <div class="page-znSearch">
    <div class="Top" @click="fanhui"></div>
    <div class="bgImg"></div>
    <div class="div-search">
      <div class="topsearch" @click="show=true">
        <img src="../../assets/icon/center_title_icon.png" />
        <span class="word">搜索你需要的食材</span>
      </div>
    </div>
    <div class="search-keyword" :style="keywords.length==0? 'display:none' : ''">
      <h1 class="count" v-text="keywords.length"></h1>
      <span>已选食材</span>
      <div class="keyword-wrapper">
        <div class="keyword-list">
          <div class="keyword" v-for="(item,index) of keywords" :key="index">
            {{item}}
            <span class="del_keyword" @click="del_keyword(index)">×</span>
          </div>
        </div>
      </div>
    </div>
    <div class="group-btn">
      <button class="Btn" @click="search">智能组菜</button>
    </div>

    <div class="zn-search" :class="show ? '' : 'd-none'">
      <div class="title">
        <div class="Top" @click="show=false;getKeyword"></div>
        <span>智能搜索</span>
      </div>
      <div class="search-container">
        <div class="search-box">
          <input type="text" placeholder="添加你需要的食材" v-model="keyword" @keyup="getKeyword" autofocus="autofocus"/>
          <div class="delText" @click="delTxt">×</div>
        </div>
        <div class="tianjia-btn" @click="tianjia(keyword)">添加</div>
      </div>
      <div class="search-result">
        <div class="search-list">
          <div class="search-item" v-for="(item,index) of shicai_data" :key="index">
            <div class="imgDiv">
              <img :src="item.pic">
            </div>
            <div class="sname" v-text="item.sname"></div>
            <div class="tianjia" @click="tianjia(item.sname)">+</div>
          </div>
        </div>
      </div>
    </div>

    <div class="page-result" :class="showResult ? '' : 'd-none'">
      <div class="title">
        <div class="Top" @click="showResult=false"></div>
        <span>组菜结果</span>
      </div>
      <div class="side_dish">
        <span>配菜：</span>
        <ul class="side_dish_list">
          <li class="side_dish_item" v-for="(item,index) of keywords" :key="index" v-text="item"></li>
        </ul>
      </div>
      <div class="result-container">
        <div class="result-txt">
          <span>已为您找到菜谱{{cp_data.length}}篇</span>
        </div>
        <div class="result-list">
          <router-link :to="'/menu01/'+item.did" class="list_item" v-for="(item,index) of cp_data" :key="index">
            <div class="cp_image">
              <img :src="item.pic">
            </div>
            <div class="cp_info">
              <h3 v-text="item.title"></h3>
              <div class="cp_score">
                <img :src="require(item.score>=i ? '@/assets/icon/20180831142237_413.png' : '@/assets/icon/20180831142237_552.png')" v-for="i in 5" :key="i">
              </div>
              <div class="view-count" v-text="`${item.shoucang}收藏  ${item.browse}浏览`"></div>
            </div>
          </router-link>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      keyword: "",
      shicai_data: [],
      show:false,
      showResult:false,
      keywords:[],
      cp_data:[]
    };
  },
  methods: {
    search(){
      if(this.keywords.length!=0){
        this.showResult=true
        this.axios.get(
          '/search/zn_search',
          {params:{keywords:this.keywords}}
        ).then(res=>{
          this.cp_data=res.data.data
        })
      }else{
        this.$toast({
          message:"请选择食材",
          duration:1500,
        })
      }
    },
    delTxt() {
      this.keyword = '';
    },
    del_keyword(i){
      this.keywords.splice(i,1);
    },
    tianjia(keyword){
      if(keyword){
        this.keywords.push(keyword);
      }
      this.show=false
    },
    getKeyword() {
      if(this.keyword){
        this.axios.get(
          "/search/getkeyword", 
          { params: { keyword: this.keyword } 
        }).then(res => {
          this.shicai_data = res.data.data;
        });
      }else{
        this.shicai_data=[];
      }
    },
    fanhui() {
      this.$router.go(-1);
    }
  }
};
</script>
<style scoped>
.side_dish{
  display:flex;
  align-items: center;
  padding:15px;
}
.side_dish_item{
  background:#ffe1e1;
  color:#ff5151;
  border-radius:20px;
  padding:5px 14px;
  margin-right:10px;
  font-size:15px;
}
.side_dish_list{
  display:flex;
}
.tianjia-btn{
  background:#ff5151;
  width:80px;
  height:36px;
  color:#fff;
  text-align: center;
  line-height: 36px;
  border-top-right-radius:3px;
  border-bottom-right-radius:3px;
}

.keyword-wrapper{
  margin-left:10px;
}
.keyword-list{
  display:flex;
  position: relative;
}
.keyword{
  padding:8px 25px 8px 10px;
  font-size:15px;
  color:#ff5151;
  box-shadow: 0 0 3px 0 #aaa;
  border-radius:3px;
  position: relative
}
.keyword+.keyword{
  margin-left:10px;
}
.del_keyword{
  position:absolute;
  right:5px;
  top:50%;
  transform: translateY(-50%);
  font-size:20px;
}

.search-keyword{
  display:flex;
  padding:20px 30px;
  align-items: center;
  margin-top:20px;
}
.search-keyword .count{
  font-size:46px;
  font-weight: 700;
}
.search-keyword .count+span{
  width:40px;
  color:#666;
  font-size:15px;
  text-align: center;
}
.search-item {
  display: flex;
  align-items: center;
  border-top: 1px solid #ccc;
  padding: 10px 0;
  position: relative;
}
.imgDiv {
  width: 45px;
  height: 45px;
  border-radius: 50%;
  overflow: hidden;
  border: 1px solid #aaa;
  margin: 0 10px;
}
.imgDiv img {
  width: 100%;
}
.tianjia {
  font-size: 36px;
  position: absolute;
  right: 10px;
}

.search-container {
  display: flex;
  padding: 10px 20px;
  align-items: center;
}
.search-box {
  width: 100%;
  position: relative;
}
.delText {
  display: block;
  border-radius: 50%;
  background: #ddd;
  width: 15px;
  height: 15px;
  text-align: center;
  line-height: 15px;
  position: absolute;
  right: 10px;
  top: 50%;
  transform: translateY(-50%);
  color: #888;
  z-index: 10;
}
.search-box input:focus + .delText {
  display: block;
}
.search-box input {
  width: 100%;
  height: 36px;
  border: 1px solid #888;
  border-right:0;
  padding: 2px 20px;
  border-top-left-radius:3px;
  border-bottom-left-radius:3px;
  box-sizing: border-box;
  outline: none;
}

.page-result,
.zn-search {
  position: absolute;
  width: 100%;
  height: 100%;
  top: 0;
  background: #fff;
}
.page-result.d-none,
.zn-search.d-none{
  display:none;
}
.page-result .title,
.zn-search .title {
  position: relative;
  text-align: center;
  font-size: 20px;
  font-weight: 700;
  padding: 10px 0;
}
.page-result .title{
  box-shadow: 1px 0 5px -4px #000;
}

.page-result .Top,
.zn-search .Top {
  top: 50%;
  transform: translateY(-50%);
}
.Top {
  position: absolute;
  top: 30px;
}
.Top::before {
  content: "";
  display: block;
  width: 16px;
  height: 16px;
  border-left: 2px solid #ff5151;
  border-bottom: 2px solid #ff5151;
  transform: translateY(-55%) rotate(45deg);
  position: absolute;
  left: 20px;
  top: 50%;
  border-radius: 3px;
}

.bgImg {
  width: 100%;
  height: 300px;
  background-image: url("../../assets/icon/timg.jpg");
  background-position: center 100%;
  background-size: 100%;
}
.topsearch img {
  width: 15px;
  height: 15px;
  position: absolute;
  top: 50%;
  left: 15px;
  transform: translateY(-50%);
}
.topsearch {
  width: 80%;
  height: 40px;
  line-height: 32px;
  margin: 0px auto;
  color: #aaa;
  font-size: 18px;
  display: block;
  position: relative;
  top: 6px;
  border-radius: 3px;
  border: 1px solid #aaa;
}
.word {
  position: absolute;
  top: 50%;
  left: 45px;
  font-size: 16px;
  transform: translateY(-50%);
}
.group-btn {
  width: 100%;
  text-align: center;
  margin-top: 20px;
}
.Btn {
  display: inline-block;
  width: 30%;
  min-width: 100px;
  height: 50px;
  background-color: #ff5151;
  font-size: 17px;
  color: blanchedalmond;
  border: 0px;
  outline: 0px;
  border-radius: 5px;
  box-shadow: 0 5px 10px 0px #888;
}
.result-container{
  padding:0 15px;
}

.list_item{
  display:flex; 
  align-items: center;
  padding:10px 0;
  
}
.list_item+.list_item{
  border-top:0.01rem solid #ccc;
}
.cp_image{
  width:120px;height:90px;
  border-radius:5px;
  overflow: hidden;
}
.cp_image img{
  width:100%;
  margin-top:50%;
  transform: translateY(-50%);
}
.cp_info{
  padding-left:15px;
 
}
.cp_info h3{
  font-size: 16px;
  font-weight: 700;
  color: #333;
  line-height: 24px;
  height: 24px;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  display: block;
}
.cp_score{
  display: inline-block;
  font-size: 0px;
  padding: 4px 0px 6px;
}
.cp_score img{
  width:16px;
}
.view-count{
  font-size: 12px;
  color: #999;
  line-height: 20px;
}

</style>