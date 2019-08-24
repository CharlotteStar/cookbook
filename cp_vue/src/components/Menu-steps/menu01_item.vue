<template>
  <div>
    <div class="page-user-cp">
      <!-- <fanhui></fanhui> -->
      <title-bar getback="<<返回" authorSteps="爱吃的小胖子~菜谱"></title-bar>
      <div class="all-teps">
        <div class="moudel" v-for="(item,index) of user_cp" :key="index">
          <div class="div-img">
            <router-link
              name="recipe"
              recipe_id="1934621"
              to="https://m.meishij.net/html5/news.php?from=author&amp;id=1934621"
              class="link">
                <img alt="天鹅蛋白菜海鲜小炒" :src="item.pic" class="img" />
              <strong v-text="item.title"></strong>
            </router-link>
          </div>
        </div>
        <!-- 按钮 -->
        <a class="loadmore" id="loadmore" href="javascript:void(0);" :style="d_none ? 'display:none' : ''">到底啦...</a>
        <mt-button size="large" type="primary" @click="loadMore" :style="!d_none ? 'display:none' : ''">加载更多</mt-button>
        
      </div>
    </div>
  </div>
</template>
<script>
import TitleBar from "./TitleBar.vue";
import fanhui from "../me/common/fanhui.vue";
export default {
  data() {
    return {
      user_cp: [],
      pno:0,
      ps:8,
      d_none:true
    };
  },
  methods: {
    //点击加载更多
    loadMore(){
      var uid= this.$route.query.uid;
      var url="/menu01_item";
      this.pno++;
      var obj={pno:this.pno,pageSize:this.ps,uid};
      this.axios.get(url,{params:obj}).then(result=>{
        console.log(result.data.data)
        if(result.data.data.length==0){this.d_none=false ;return}
        var rows=this.user_cp.concat(result.data.data);
        this.user_cp=rows;
      })
    }
  },
  created() {
    this.loadMore();
    // this.axios.get("/caipu/user_cp", { params: { uid } }).then(res => {
    //   this.user_cp = res.data.data;
    //   // console.log(this.user_cp[0]);
    //   // var cname1 = document.getElementById("cname1");
    //   // var pic1 = document.getElementById("pic1");
    //   // cname1.innerHTML = this.user_cp[0].cname;
    //   // console.log(this.imgurl);
    // });
  },
  components: {
    TitleBar,
    fanhui
  }
};
</script>
<style scoped>
.page-user-cp{
  padding-top:48px;
}
.link{
  display: block;
  width: 100%;
  max-height:15rem;
  overflow: hidden;
}
.all-teps {
  background-color: #efefef;
  display: flex;
  flex-wrap:wrap ;
}
.img {
  width: 100%;
  overflow: hidden;
}
.div-img {
  display: inline-block;
  width: 100%;
  text-align: center;
}
.moudel {
  display: flex;
  width:50%;
  padding:15px;
}
.loadmore {
  display: block;
  width: 100%;
  height: 60px;
  line-height: 60px;
  font-size: 17px;
  color: slategray;
  text-align: center;
  border-top: 1px solid #ddd;
  background:#efefef;
}
strong {
  color: black !important;
}
</style>