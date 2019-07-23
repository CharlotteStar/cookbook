<template>
  <div class="me-top">
    <div  class="return" @click="fanhui">返回</div>
    <h2 class="me-title" v-text="meTitle"></h2>
    <router-link :to="meTopRightTo" class="register">{{meTopRight}}</router-link>
  </div>
</template>

<script>
export default {
  props:{
    meTitle:{default:""},
    meTopRight:{default:""},
    meTopRightTo:{default:""},
  },
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

<style scoped>  .page-login{
  background: #f5f5f5;
}
.me-top{
  position:relative;
  display:flex;
  justify-content: space-between;
  align-items:center;
  padding:0.75rem;
  margin-bottom:2rem;
  background:#fff;
}
.return,.register{
  color:#ff5151;
}
.me-title{
  position:absolute;
  left:50%;
  transform: translateX(-50%);
  font-size:24px;
}
.return{
  padding-left:1.2rem;
  position:relative
}
.return::before{
  content:"";
  display:block;
  border-left:2px solid #FF5151;
  border-bottom:2px solid #ff5151;
  position:absolute;
  left:0;top:45%;
  width:0.7rem;height:.7rem;
  transform:rotate(45deg) translateY(-50%);
}
</style>