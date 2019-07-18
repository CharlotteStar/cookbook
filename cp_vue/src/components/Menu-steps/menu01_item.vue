<template>
  <div>
    <div class>
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
              <strong v-text="item.cname"></strong>
            </router-link>
          </div>
        </div>
        <a class="loadmore" id="loadmore" href="javascript:void(0);">到底啦...</a>
      </div>
    </div>
  </div>
</template>
<script>
import TitleBar from "./TitleBar.vue";
export default {
  data() {
    return {
      user_cp: []
    };
  },
  created() {
    var uid = this.$route.query.uid;
    this.axios.get("/caipu/user_cp", { params: { uid } }).then(res => {
      this.user_cp = res.data.data;
      // console.log(this.user_cp[0]);
      // var cname1 = document.getElementById("cname1");
      // var pic1 = document.getElementById("pic1");
      // cname1.innerHTML = this.user_cp[0].cname;
      // console.log(this.imgurl);
    });
  },
  components: {
    TitleBar
  }
};
</script>
<style scoped>
.link{
  display: block;
  width: 100%;
}
.all-teps {
  background-color: #efefef;
  display: flex;
  flex-wrap:wrap ;
}
.img {
  width: 100%;
  height:17rem;
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
  font-size: 14px;
  color: #999;
  text-align: center;
  border-top: 1px solid #ddd;
}
strong {
  color: black !important;
}
</style>