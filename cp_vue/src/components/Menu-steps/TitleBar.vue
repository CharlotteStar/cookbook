<template>
  <div class="page-head">
    <div @click="fanhui" class="back">{{getback}}</div>
    <strong class="author">{{authorSteps}}</strong>
  </div>
</template>
<script>
export default {
  props:{
    getback:{default:""},
    authorSteps:{default:""},
  },
  data(){
    return {}
  },
  methods:{
    fanhui(){
      this.$router.go(-1);
    }
  }
}
</script>
<style scoped>
   .page-head{
    display:flex;
    position:fixed;
    top:0;
    z-index: 999;
    width:100%;
    align-items:center;
    background-color:#fff;
    padding-left:7px;
    height:48px;
    color:#000;
    font-size:18px;
    margin-bottom:30px;
  }
  .page-head>.back{
    color:red;
    margin-right:50px;
  }
</style>