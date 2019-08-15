<template>
  <div class="page-create">
    <div class="page-top">
      <h1>创作菜谱</h1>
      <span class="fabu">发布</span>
    </div>

    <label>
      <input type="file" style="display:none" accept="image/*">
      <div class="addImg">
        <div class="hint-box">
          <div>
            <img src="@/assets/icon/jia.png">
          </div>
          <span>添加图片菜谱</span>
        </div>
      </div>
    </label>

    <input placeholder="添加菜谱标题" class="addTitle"/>
    <textarea placeholder="说说这道菜背后的故事吧~" cols="20" rows="10" class="addLog"></textarea>

    <div class="zhuliao">
      
    </div>
  </div>
</template>

<script>
export default {
  
}
</script>

<style scoped>
.page-top{
  position:relative;
  box-shadow: 0 3px 5px -5px #ccc;
}
.page-top .fabu{
  position:absolute;
  right:15px;
  top:50%;
  padding:5px;
  transform: translateY(-50%);
}
  .page-top h1{
    font-size:18px;
    font-weight: 700;
  }

.addTitle{
  background:lightyellow;
  width:100%;
  border:0;
  outline:0;
  height:20px;
  padding:20px 15px;
}
.addTitle::-webkit-input-placeholder {
  color: #666;
  font-size: 18px;
  font-weight: 700;
}

.addLog{
  width:100%;
  border:0;
  padding:15px;
  outline:none;
  background:#fafafa;
  box-sizing:border-box;
}
.addLog::-webkit-input-placeholder{
  font-size:15px;
}

.addImg{
  width:100%;
  height:200px;
  background:#eee;
  position: relative;
}
.addImg .hint-box{
  width:100%;
  position: absolute;
  top:50%;
  left:50%;
  transform: translate(-50%,-50%);
  text-align: center;
}
.addImg span{
  display: inline-block;
  font-size:18px;
  color:#666;
  margin-top:20px;
  
}
.addImg img{
  width:70px;
}
</style>