<template>
  <div class="page-top">
    <div class="fanhui" @click="fanhui"></div>
    <span class="page-title">{{title}}</span>
  </div>
</template>

<script>
export default {
  props:{
    title:""
  },
  data(){
    return {}
  },
  methods:{
    fanhui() {
      this.$router.go(-1);
    },
  },
}
</script>

<style>
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