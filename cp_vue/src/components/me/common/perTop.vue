<template>
  <div class="contail">
    <img :src="tu" alt="">
    <div class="ge_xinxi" v-if="tt==true">
      <router-link to="" v-text="title"></router-link><br>
      <router-link to="">正在前往美食达人广场路上</router-link><br>
      <router-link to="" class="dna">美食杰DNA 0 条</router-link><br>
    </div>
    <div v-else>
      <div class="denglu" @click="denglu">点击登陆</div>
      <p>做菜好吃</p>
    </div>
  </div>
</template>
<script>
export default {
  props:{
    tu:{default:""},
    title:{default:""},
  },
  data(){
    return{
      tt:""
    }
  },
  created(){
    if(window.sessionStorage.uid){
      this.tt=true;
    }else{
      this.tt=false;
    }
 },
 methods:{
   denglu(){
     console.log(this.tt)
    this.$router.push("/login");
   }
 }
}
</script>
<style scoped>
.contail{
  display: flex;
  text-align: center;
  height: 7rem;
  width: 100%;
  background-image:url(../../../assets/per/home_bgOnline@3x.png); 
  padding: 1rem;
}
.contail>img{
  display: block;
  width: 3.5rem;
  height: 3.5rem;
  border-radius: 50%;
  margin-right: 1rem;
}
.ge_xinxi{
  color: #fff;
  font-size: 16px;
  line-height: 24px;
}
.ge_xinxi>a{
  color:#fff !important;
}
.dna{
  border-end-end-radius: 0.2rem;
  height: 24px;
  line-height: 22px;
  border-radius: 16px;
  color: #fff;
  border: 1px solid rgba(255,255,255,0.5);
  background: rgba(255,255,255,0.2);
  box-sizing: border-box;
  padding: 0 12px;
}
.denglu{
  color: black;
  font-size: 24px;
  margin: 10px 0;
}
.denglu+p{
  color: #fff;
}

</style>
