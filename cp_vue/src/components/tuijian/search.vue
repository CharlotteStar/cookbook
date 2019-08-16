<template>
  <div class="page-search">
    <div class="page-top">
      <div class="fanhui" @click="fanhui"></div>
      <span class="page-title">搜索</span>
    </div>
    <div class="search-container">
      <div class="search-box">
        <input type="text" placeholder="搜索你喜欢的菜谱" v-model="keyword">
      </div>
      <button class="search-btn" @click="search">搜索</button>
    </div>
    
    <!--搜索历史-->
    <div class="search-history" :style="searchHistory.length!=0 ? '' : 'display:none'">
      <div class="title">
        <span>搜索历史</span>
      </div>
      <div class="qingkong" @click="qingkong">清空</div>
      <div class="top-search-box">
        <ul class="top-search-list">
          <li class="top-search-item"  
          v-for="(item,index) of searchHistory" :key="index" 
          v-text="item.keyword"
          @click="fuzhi(item.keyword)">
          </li>
        </ul>
      </div>
    </div>
    <!--热搜-->
    <div class="top-search">
      <div class="title">
        <span>热搜</span>
      </div>
      <div class="top-search-box">
        <ul class="top-search-list">
          <li class="top-search-item"  
          v-for="(item,index) of searchTop" :key="index" 
          v-text="item.title"
          @click="fuzhi(item.title)">
          </li>
        </ul>
      </div>
    </div>
    <!--搜索结果-->
    <div class="search-result">
      <div class="title" :style="cp_data.length!=0 ? '' : 'display:none'">
        <span>搜索结果</span>
      </div>   
      <div class="search-list">
        <router-link :to="'/menu01/'+item.did" class="search_item" v-for="(item,index) of cp_data" :key="index">
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
</template>

<script>
export default {
  data(){
    return {
      searchTop:[],
      keyword:"",
      cp_data:[],
      searchHistory:[],
      uid:""
    }
  },
  methods:{
    fanhui() {
      this.$router.go(-1);
    },
    fuzhi(keyword){
      this.keyword=keyword;
    },
    search(){
      if(this.keyword){
        this.axios.get(
          '/search/keyword',
          {params:{pname:this.keyword,uid:this.uid}}
        ).then(res=>{
          this.cp_data=res.data;
          this.loadSearchHistory()
        })
      }
    },
    qingkong(){
      this.axios.get(
        '/search/qingkong',
        {params:{uid:this.uid}}
      ).then(res=>{
        this.loadSearchHistory()
      })
    },
    loadSearchHistory(){
      this.axios.get(
        '/search/history',
        {params:{uid:this.uid}}
      ).then(res=>{
        this.searchHistory=res.data.data;
      })
    },
    loadSearchTop(){
      this.axios.get(
        '/search/top'
      ).then(res=>{
        this.searchTop=res.data;
      });
    }
  },
  created(){
    var user=sessionStorage.getItem("user")
    if(user){
      this.uid=JSON.parse(user)[0].uid;
    }
    this.loadSearchTop()
    this.loadSearchHistory()
  }
}
</script>

<style scoped>
.qingkong{
  position:absolute;
  right:30px;;
  top:10px;;
}
.search-list{
  overflow:scroll;
}
.search-history,
.search-result{
  padding:0 15px;
  position: relative;
}

.search_item{
  display:flex; 
  align-items: center;
  padding:10px 0;
}
.search_item_item+.search_item_item{
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

.top-search{
  padding:10px 15px;
}
.page-search .title{
  font-size:18px;
  margin-left:5px;
  padding-bottom:3px;
  font-weight: 700;
  border-bottom:3px solid #888;
  display:inline-block;
  margin:5px 0;
}
.top-search-box{
  padding:5px 0px;
}
.top-search-item{
  border:1px solid #aaa;
  padding:4px 10px;
  margin-right:8px;
  margin-bottom:5px;
  font-size:14px;
}
.top-search-list{
  display:flex;
  flex-wrap: wrap
}

.search-container{
  display:flex;
  padding:10px 15px;
}
.search-box{
  width:90%;
}
.search-box input{
  width:100%;
  height:32px;
  border:1px solid #888;
  border-right:0;
  padding:2px 20px;
  border-top-left-radius:3px;
  border-bottom-left-radius:3px;
  box-sizing: border-box;
  outline:none;
}
.search-btn{
  width:80px;
  background:#ff5151;
  border:0;
  color:#fff;
  border-top-right-radius:3px;
  border-bottom-right-radius:3px;
}

.fanhui{
  position:absolute;
  left:20px;top:50%;
}
.fanhui::before{
  content:"";
  display: block;
  width:16px;height:16px;
  border-left:2px solid #ff5151;
  border-bottom:2px solid #ff5151;
  transform:translateY(-55%) rotate(45deg) ;
  border-radius:3px;
}
.page-top{
  position:relative;
  padding:10px 15px;
  text-align: center;
}
.page-title{
  font-size:24px;
  font-weight: 700;
}
</style>