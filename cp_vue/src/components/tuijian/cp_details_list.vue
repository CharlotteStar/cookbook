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
      <h1 class="list_title" v-text="tname"></h1>
      <h3 class="list_subtitle"><span v-text="tname"></span>精品菜谱</h3>
      <div class="cp_list_container">
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
</template>

<script>
export default {
  props:['tid'],
  data(){
    return {
      cp_data:[],
      tname:""
    }
  },
  created(){
    this.axios.get(
      "/caipu/cp_list",
      {params:{tid:this.tid}}
    ).then(res=>{
      var data=res.data
      this.cp_data=data.cp_data;
      this.tname=data.tname;
    });
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
  border-radius:5px 0 0 5px;
  background:url("../../assets/icon/center_title_icon.png") 10px 8px/15px 15px no-repeat;
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
  border-top-right-radius: 5px;
  border-bottom-right-radius: 5px;
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
  margin-top:10px
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

.cp_list_container{
  border-bottom:1px solid #ccc;
}
</style>