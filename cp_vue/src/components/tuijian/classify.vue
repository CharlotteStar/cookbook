<template>
  <div class="page-classify">
    <div class="classify-top">
      <div class="return"></div>
      <router-link to="" placeholder="搜索任何你想要的" class="search"></router-link>
    </div>
  </div>
</template>

<script>
export default {
  data(){
    return {
      
    }
  }
}
</script>

<style scoped>
.classify-top{
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
.search{
  text-align:center;
  background:#ddd;
  border-radius:3px;
  flex-grow: 1;
  height:32px;
}
.search::after{
  content:"";
  
}
</style>