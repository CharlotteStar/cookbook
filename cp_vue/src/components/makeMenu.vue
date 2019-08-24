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
      <div>
        <div class="onelist" @click="popup">
          <img class="oneImg" src="@/assets/icon/fire.png" alt="">
          <span>工艺品 {{qingxz}}</span>
          <span class="dayuhao"></span>
        </div>
        <div class="onelist" @click="popuptow">
          <img class="oneImg" src="@/assets/icon/bottle.png" alt="">
          <span>工艺品 {{qingxztow}}</span>
          <span class="dayuhao"></span>
        </div>
        <div class="lastlist" @click="popupthree">
          <img class="oneImg" src="@/assets/icon/time.png" alt="">
          <span>工艺品 {{qingxzthree}}</span>
          <div class="dayuhao"></div>
        </div>
        <!-- 下弹框的内容 -->
        <mt-popup position="bottom" v-model="popupVisible"  popup-transition="popup-fade">
         <div class="ppp"  style="background:#fff">
          <div class="pfirst">
            <h1 class="select">选择工艺</h1>
            <div class="delete"  @click="popup">+</div>
            <div class="zhuofa">
              <!-- 遍历烹饪方法 ref是获取元素内容的属性-->
              <div class="zhu"
                v-for="(item,index) in cook" :key="index"
                @click="zhu(index)" ref="menuItem">{{item}}</div>
              <div class="zhu" v-if="blockfirst" @click="morefirst">更多</div>
              <div v-else>
                <div class="zhu"
                     v-for="(item,index) in morecook" :key="index"
                     @click="morezhu(index)" ref="morefirst"    
                >{{item}}</div>
              </div>
            </div>
          </div>
         </div>    
        </mt-popup>
        <mt-popup position="bottom" v-model="popupVisibletow"  popup-transition="popup-fade">
         <div class="ppp"  style="background:#fff">
          <div class="pfirst">
            <h1 class="select">选择工艺</h1>
            <div class="delete" @click="popuptow">+</div>
            <div class="zhuofa">
              <div class="zhu"
                v-for="(item,index) in taste" :key="index"
                @click="weidao(index)" ref="tow">{{item}}</div>
              <div class="zhu" v-if="blocktow" @click="moretow">更多</div>
              <div style="display:inline-block" v-else>
                <div class="zhu"
                  v-for="(item,index) in moretaste" :key="index"
                  @click="moreweidao(index)" ref="moretow"
                >{{item}}</div>
              </div>
            </div>
          </div>
         </div>    
        </mt-popup>
        <mt-popup position="bottom" v-model="popupVisiblethree"  popup-transition="popup-fade">
         <div class="ppp"  style="background:#fff">
          <div class="pfirst">
            <h1 class="select">选择工艺</h1>
            <div class="delete"  @click="popupthree">+</div>
            <div class="zhuofa">
              <div v-for="(item,index) in time" :key="index" @click="shijiang(index)"
              ref="three" class="zhu">{{item}}</div>
              <div class="zhu" @click="morethree" v-if="blockthree">更多</div>
              <div v-else>
                <div class="zhu"
                     v-for="(item,index) in moretime" :key="index"
                     @click="moretime(index)" ref="morethree"
                >{{item}}</div>
              </div>
            </div>
          </div>
         </div>    
        </mt-popup>
      </div>
      <div class="zhuliao">
        <h1 class="zhuliaoH">主料</h1>
        <div v-for="(item,index) in num" :key="index">
          <div class="cailiaoBox">
            <input class="clname" type="text" placeholder="材料名称">
            <!-- <span class="collspan"></span> -->
            <div class="div-yongliang">
              <input class="yongliang" type="text" placeholder="用量">
            </div>
            <div class="delete" @click="minus">+</div>
          </div>
        </div>
        <div style="text-align:center;margin-top:10px">
            <span class="tianjia">+</span>
            <span class="tjzl" @click="addstuff">添加主料</span>
        </div>
      </div> 
      <div class="zhuliao">
        <h1 class="zhuliaoH">辅料</h1>
        <div v-for="(item,i) in numtow" :key="i">
          <div class="cailiaoBox">
            <input class="clname" type="text" placeholder="材料名称">
            <!-- <span class="collspan"></span> -->
            <div class="div-yongliang">
              <input class="yongliang" type="text" placeholder="用量">
            </div>
            <div class="delete" @click="minustow">+</div>
          </div>
        </div>
        <div style="text-align:center;margin-top:10px">
            <span class="tianjia">+</span>
            <span class="tjzl" @click="addstufftow">添加主料</span>
        </div>
      </div>
      <div>
      <div class="step" v-for="(value,i) in step" :key="i">
        <div>
          <h1 class="stepH">步骤{{i+1}}</h1>
          <div class="delete" @click="minutstep">+</div>
        </div>
        <label>
          <input type="file" style="display:none" accept="image/*">
          <div class="addstepImg">
            <div class="hint-box">
              <div>
                <img src="@/assets/icon/jia.png">
              </div>
              <span>添加步骤图片</span>
            </div>
          </div>
        </label>
        <div class="div-describe">
          <input class="describe" type="text" placeholder="请填写步骤描述">
        </div>
        <div class="stepselect">
          <div class="div-fillout" v-if="block" @click="timeliao">
            <div class="fillout">显示更多可填项</div><div class="jiangtou"></div>
          </div>
          <div class="timeliao"  v-if="!block">
            <div class="usetime">步骤用时（可...<div class="jiangtoutow"></div></div>
            <div class="useliao">步骤用料（可...<div class="jiangtoutow"></div></div>
          </div>
        </div>
        <div style="text-align:center;margin-top:10px">
            <span class="tianjia">+</span>
            <span class="tjzl" @click="addstep">添加主料</span>
        </div>
      </div>
       </div>  
      <div>
      <div class="step" v-for="(value,i) in product" :key="i">
        <div>
          <h1 class="stepH">成品图1</h1>
          <div class="delete" @click="minutproduct">+</div>
        </div>
        <label>
          <input type="file" style="display:none" accept="image/*">
          <div class="addstepImg">
            <div class="hint-box">
              <div>
                <img src="@/assets/icon/jia.png">
              </div>
              <span>添加步骤图片</span>
            </div>
          </div>
        </label>
        <div style="text-align:center;margin-top:10px">
            <span class="tianjia">+</span>
            <span class="tjzl" @click="addproduct">添加主料</span>
        </div>
      </div>  
      </div>
 </div>
</template>

<script>

export default {
  data(){
    return{
      cook:["煮","炒","蒸","烧","拌","炖","炸","煎","烘焙","烤","酱","焖","烩","扒"],
      morecook:["爆","卤","砂锅","腌","冻","溜","熏","拔丝","煲","榨汁","灼","烙","微波","泡","腊","干锅","焗","干煸","其它"],
      taste:["咸鲜味","家常味","甜味","香辣味","酸甜味","酸辣味","麻辣味","苦香味"],
      moretaste:["五香味","酱香味","奶香味","咖喱味","酸洗味","鱼香味","茄汁味","葱香味","椒麻味","姜汁味","怪味","果味","芥末味","红油味","豆瓣味","麻酱味","黑椒味","酸味","胡椒味","其他"],
      time:["<5分钟","<10分钟","<15分钟","<30分钟","<60分钟","<90分钟",],
      moretime:["<2小时","<数小时","<一天","数天","2小时以上",">2小时"],
      num:1,
      numtow:1,
      step:1,
      product:1,
      block:true,
      popupVisible:false,
      popupVisibletow:false,
      popupVisiblethree:false,
      qingxz:"请选择",
      qingxztow:"请选择",
      qingxzthree:"请选择",
      val:"",
      blockfirst:"ture",
      blocktow:"ture",
      blockthree:"ture",
      // addss:0,
      // add:`<div class="zhuliao">
      //         <h1 class="zhuliaoH">主料</h1>
      //         <div class="cailiaoBox">
      //           <input class="clname" type="text" placeholder="材料名称">
      //           <input class="yongliang" type="text" placeholder="用量">
      //           <div class="delete">+</div>
      //         </div>
      //         <div style="text-align:center;margin-top:10px">
      //           <span class="tianjia">+</span>
      //           <span class="tjzl" @click="addstuff">添加主料</span>
      //         </div>
      //       </div> `
      }
  },
  methods: {
    moretiem(index){
      var val=this.$refs.morethree[index].innerText;
      this.qingxzthree=val
    },
    morezhu(index){
      var val=this.$refs.morefirst[index].innerText;
      this.qingxz=val
    },
    moreweidao(index){
      var val=this.$refs.moretow[index].innerText;
      this.qingxztow=val
    },
    morefirst(){
      this.blockfirst=!this.block
    },
    moretow(){
      this.blocktow=!this.block
    },
    morethree(){
      this.blockthree=!this.block
    },
    //此方法修改做菜所用的时间
    shijiang(index){
      //获取当前对象的dom内容
      var val=this.$refs.three[index].innerText;
      //console.log(val)
      //修改return中qingxztow的值
      this.qingxzthree=val
    },
    //此方法修改做菜的口味
    weidao(index){
      //获取当前对象的dom内容
      var val=this.$refs.tow[index].innerText;
      //console.log(val)
      this.qingxztow=val
    },
    //此方法修改做菜的方式
    zhu(index){
      //获取当前对象的dom内容
      var val=this.$refs.menuItem[index].innerText;
      //console.log(val)
      this.qingxz=val
    },
    popupthree(){
      console.log(this.popupVisiblethree)
     this.popupVisiblethree=!this.popupVisiblethree
    },
    popuptow(){
      console.log(this.popupVisibletow)
     this.popupVisibletow=!this.popupVisibletow
    },
    popup(){
      console.log(this.popupVisible)
     this.popupVisible=!this.popupVisible
    },
    timeliao(){
      console.log(1)
       this.block=false
    },
    addstuff(){
      this.num++;
      console.log(this.num)
    },
    minus(){
      if(this.num>1){
        this.num--;
      console.log(this.num)
      }
    },
    addstufftow(){
      this.numtow++;
      console.log(this.numtow)
    },
    minustow(){
      if(this.numtow>1){
        this.numtow--;
      console.log(this.numtow)
      }
    },
    addstep(){
     this.step++;
    },
    minutstep(){
      if(this.step>1){
        this.step--;
      }
    },
    addproduct(){
     this.product++;
    },
    minutproduct(){
      if(this.product>1){
        this.product--;
      }
    },
  //  addstuff(){
  //    var node=this.$refs.conter.lastChild;
  //      this.$refs.conter.appendChild(node);
  //      console.log(2);
  //  }
  },
  components: {
   
  }
}
</script>
<style scoped>
.page-create{
  overflow: scroll
}
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
.pleceselect{
  width:50%;
  height:35px;
  margin-top:-4px;
  margin-left:5px;
  border:0;
  outline:0;
  font-size: 20px;
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
.zhuliao{
  margin-top:40px;
}
.zhuliaoH{
  font-size:20px;
  margin-left:15px;
  margin-bottom:10px;
}
.cailiaoBox{
  position: relative;
  width:100%;
  height:50px;
  line-height: 50px;
  border-top:1px solid silver;
  border-bottom:1px solid silver;
}
.clname{
  width:40%;
  height:30px;
  margin-left:20px;
  border:none;
  outline:none;
}
.div-yongliang{
   display: inline-block;
   height:30px;
   width:200px;
   border-left:2px solid #ddd;
   line-height: 30px;
}
.yongliang{
  width:40%;
  height:30px;
  border:none;
  outline:none;
  margin-left:20px;
}
.collspan{
   position: absolute;
   height:30px;
   width:0.5px;
   border:1px solid silver;
   left:230px;
   top:15px;
}
.delete{
  position: absolute;
  right:20px;
  top:3px;
  font-size: 30px;
  color:#ccc;
  transform: rotate(45deg);
}
.tianjia{
  font-size:27px;
  color:red;
  margin-right:10px;
}
.tjzl{
  font-size:17px;
  color:red;
}
.step{
  position: relative;
  margin-top:20px;
}
.stepH{
  display: inline-block;
  font-size:18px;
  margin-left:15px;
  margin-bottom:10px;
}
.addstepImg{
  width:91%;
  height:200px;
  background:#eee;
  position: relative;
  margin-left:17px;
}
.addstepImg .hint-box{
  width:100%;
  position: absolute;
  top:50%;
  left:50%;
  transform: translate(-50%,-50%);
  text-align: center;
}
.addstepImg span{
  display: inline-block;
  font-size:18px;
  color:#666;
  margin-top:20px;
  
}
.addstepImg img{
  width:70px;
}
.describe{
  width:100%;
  height:40px;
  border:none;
  outline:none;
  margin-left:20px;
}
.div-describe{
  width:100%;
  height:50px;
  border-bottom:1px solid #ddd;
}
.div-fillout{
  position:absolute;
  right:27px;
  background:#fff;
  
}
.fillout{
  display:inline-block;
  font-size:14px;
}
.jiangtou{
  display:inline-block;
  width:7px;
  height:7px;
  border-left:2px solid slategray;
  border-top:2px solid slategray;
  transform: rotate(45deg);
  margin-left:10px;
}
.stepselect{
  position: relative;
  height:50px;
  line-height: 50px;
}
.timeliao{
  /* display:none; */
  width:100%;
  border-bottom:1px solid silver;
  background:#fff;
}
.usetime{
  display: inline-block;
  width:50%;
  border-right:1px solid silver;
  padding-left:20px;
}
.useliao{
  display:inline-block;
  width:50%;
  padding-left:20px;
}
.jiangtoutow{
  display:inline-block;
  width:7px;
  height:7px;
  border-left:2px solid slategray;
  border-top:2px solid slategray;
  transform: rotate(45deg);
  margin-left:26px;
}
.onelist{
  width:100%;
  height:40px;
  border-top:1px solid silver;
  line-height: 40px;
}
.oneImg{
  width:23px;
  height:25px;
}
.onelist>span{
  color:grey;
}
.dayuhao{
  display:block;
  width:10px;
  height:10px;
  border-top:2px solid silver;
  border-left:2px solid silver;
  transform: rotate(125deg);
  float:right;
  margin-right:20px;
  margin-top:15px;
}
.lastlist{
  width:100%;
  height:40px;
  border-top:1px solid silver;
  border-bottom:1px solid silver;
  line-height: 40px;
}
.lastlist>span{
  color:grey;
}
.ppp{
  width:200%;
  /* height:180px; */
  height:400px;
  background:#fff;
  margin-left:-103px;
}
.pfirst{
  position:relative;
  width:100%;
  height:40px;
  border-bottom:1px solid #ccc;
}
.select{
  display: inline-block;
  font-size:18px;
  margin-left:15px;
  margin-bottom:10px;
  line-height: 40px;
}
.zhuofa{
  width:100%;
  margin-top:2px;
  margin-left:10px;
}
.zhu{
  display: inline-block;
  padding-left:10px;
  padding-right:10px;
  border:1px solid #ccc;
  text-align: center;
  line-height: 45px;
  margin-left:13px;
  margin-top:8px;
}
</style>