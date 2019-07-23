<template>
  <div>
    <div class="bgImg"></div>
    <div class="div-search">
      <router-link to="/suggest" class="topsearch">
          <img src="../../assets/icon/center_title_icon.png">
          <span class="word">搜索你感兴趣的</span>
        </router-link>
    </div>
    <div class="group-btn">
      <button class="Btn">智能组菜</button>
    </div>
  </div>
</template>
<script>
export default {
  data(){
    return{}
  }
}
</script>
<style>
.bgImg{
    width:100%;
    height:300px;
    background-image: url("../../assets/icon/timg.jpg");
    background-position:center 100%;
    background-size: 100%;
}
.topsearch img{
  width:15px;
  height:15px;
  position:absolute;
  top:50%;left:15px;
  transform: translateY(-50%);
}
.topsearch {
    width:80%;
    height: 40px;
    line-height: 32px;
    margin: 0px 52px;
    color: #aaa;
    font-size: 18px;
    display: block;
    position: relative;
    top: 6px;
    border-radius:5px;
    border:1px solid  #ccc;
}
.word{
  position:absolute;
  top:50%;left:45px;
  font-size:16px;
  transform: translateY(-50%);
}
.group-btn{
  width:100%;
  text-align: center;
  margin-top:50px;
}
.Btn{
  display:inline-block;
  width:30%;
  min-width:100px;
  height:50px;
  background-color:#ff5151;
  font-size: 17px;
  color:blanchedalmond;
  border:0px;
  outline:0px;
  border-radius: 5px;
  box-shadow: 0 5px 10px 0px #888;
}
</style>