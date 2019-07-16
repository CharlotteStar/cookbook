<template>
  <div>
    <div class="shou">
      <div class="Top" @click="fanhui">《</div>
      <div class="div-input"><input class="inputBox" type="text"></div>
    </div>
    <div class="div-out">
      <div class="food-img">
        <img src="https://s1.st.meishij.net/r/197/182/6108197/a6108197_156285817636368.jpg" alt="">
        <div class="food-name">鸡肉</div>
        <div class="add">+</div>
     </div> 
    </div> 
    <div class="div-out">
      <div class="food-img">
        <img src="https://s1.st.meishij.net/r/197/182/6108197/a6108197_156285817636368.jpg" alt="">
        <div class="food-name">鸡肉</div>
        <div class="add">+</div>
     </div> 
    </div> 
    <div class="div-out">
      <div class="food-img">
        <img src="https://s1.st.meishij.net/r/197/182/6108197/a6108197_156285817636368.jpg" alt="">
        <div class="food-name">鸡肉</div>
        <div class="add">+</div>
     </div> 
    </div> 
    <div class="div-out">
      <div class="food-img">
        <img src="https://s1.st.meishij.net/r/197/182/6108197/a6108197_156285817636368.jpg" alt="">
        <div class="food-name">鸡肉</div>
        <div class="add">+</div>
     </div> 
    </div> 
    <div class="div-out">
      <div class="food-img">
        <img src="https://s1.st.meishij.net/r/197/182/6108197/a6108197_156285817636368.jpg" alt="">
        <div class="food-name">鸡肉</div>
        <div class="add">+</div>
     </div> 
    </div> 
    <div class="div-out">
      <div class="food-img">
        <img src="https://s1.st.meishij.net/r/197/182/6108197/a6108197_156285817636368.jpg" alt="">
        <div class="food-name">鸡肉</div>
        <div class="add">+</div>
     </div> 
    </div> 
    <div class="div-out">
      <div class="food-img">
        <img src="https://s1.st.meishij.net/r/197/182/6108197/a6108197_156285817636368.jpg" alt="">
        <div class="food-name">鸡肉</div>
        <div class="add">+</div>
     </div> 
    </div> 
    <div class="div-out">
      <div class="food-img">
        <img src="https://s1.st.meishij.net/r/197/182/6108197/a6108197_156285817636368.jpg" alt="">
        <div class="food-name">鸡肉</div>
        <div class="add">+</div>
     </div> 
    </div> 
    <div class="div-out">
      <div class="food-img">
        <img src="https://s1.st.meishij.net/r/197/182/6108197/a6108197_156285817636368.jpg" alt="">
        <div class="food-name">鸡肉</div>
        <div class="add">+</div>
     </div> 
    </div> 
    <div class="div-out">
      <div class="food-img">
        <img src="https://s1.st.meishij.net/r/197/182/6108197/a6108197_156285817636368.jpg" alt="">
        <div class="food-name">鸡肉</div>
        <div class="add">+</div>
     </div> 
    </div> 
    <div class="div-out">
      <div class="food-img">
        <img src="https://s1.st.meishij.net/r/197/182/6108197/a6108197_156285817636368.jpg" alt="">
        <div class="food-name">鸡肉</div>
        <div class="add">+</div>
     </div> 
    </div> 
    <div class="div-out">
      <div class="food-img">
        <img src="https://s1.st.meishij.net/r/197/182/6108197/a6108197_156285817636368.jpg" alt="">
        <div class="food-name">鸡肉</div>
        <div class="add">+</div>
     </div> 
    </div> 
    <div class="div-out">
      <div class="food-img">
        <img src="https://s1.st.meishij.net/r/197/182/6108197/a6108197_156285817636368.jpg" alt="">
        <div class="food-name">鸡肉</div>
        <div class="add">+</div>
     </div> 
    </div> 
    <div class="div-out">
      <div class="food-img">
        <img src="https://s1.st.meishij.net/r/197/182/6108197/a6108197_156285817636368.jpg" alt="">
        <div class="food-name">鸡肉</div>
        <div class="add">+</div>
     </div> 
    </div> 
    <div class="div-out">
      <div class="food-img">
        <img src="https://s1.st.meishij.net/r/197/182/6108197/a6108197_156285817636368.jpg" alt="">
        <div class="food-name">鸡肉</div>
        <div class="add">+</div>
     </div> 
    </div> 
    <div class="div-out">
      <div class="food-img">
        <img src="https://s1.st.meishij.net/r/197/182/6108197/a6108197_156285817636368.jpg" alt="">
        <div class="food-name">鸡肉</div>
        <div class="add">+</div>
     </div> 
    </div> 
  </div>
</template>
<script>
export default {
  data(){
    return{}
  },
  methods:{
    fanhui(){
      this.$router.go(-1);
    }
  }
}
</script>
<style scoped>
.div-input{
   display:inline-block;
  width:80%;
  text-align: center;
}
.inputBox{
    border:1px solid slategray;
    width:94%;
    height:30px;
}
.Top{
  display:inline-block;
  width:50px;height:45px;
  font-size:20px;
  line-height: 45px;
  color:red;
}
.shou{
  margin-bottom:30px;
  width:100%;
  border:1px;
}
.food-img{
  margin-top:5px;
  width:60px;
  height:60px;
  border:1px;
  border-radius:50%;
  overflow: hidden;
  margin-left:10px;
}
.food-img>img{width:100%;}
.add{
  position:absolute;
  right:8px;
  top:16px;
  width:30px;
  height:30px;
  text-align: center;
  line-height: 30px;
  font-size: 30px;
  color:black;
}
.div-out{
  position: relative;
  text-align: center;
  line-height: 100%;
  width:100%;
  background:#efefef;
}
.food-name{
  position:absolute;
  left:73px;
  top:16px;
  width:30px;
  height:30px;
  text-align: center;
  line-height: 30px;
  font-size: 15px;
  color:black;
}
</style>