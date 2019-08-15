<template>
  <div class="page-shoucang" >
    <div class="sc_top">
      <div class="fanhui" @click="displayStatus" ></div>
      <span>收藏</span>
      <div class="top_nav">
        <div>全部</div>
      </div>
      <div class="bianji" @click="is_bianji=!is_bianji">{{is_bianji?'取消':'编辑'}}</div>
      <!-- <div class="close" @click="displayStatus">×</div> -->
    </div>
    
    <div class="bianji_box" :style="`display:${is_bianji?'flex':'none'}`">
      <!-- <div class="selected_count">已选择 n 个</div> -->
      <div class="quanxuan">
        <label class="checkbox" @click="quanxuan">
          <span>全选</span>
          <input type="checkbox" ref="quanxuan">
        </label>
      </div>
      <div class="shanchu" @click="sc_del">删除</div>
    </div>
    <div class="sc_content">
      <div class="sc_list">
        <div @click="toDetail(index,item.did)"  class="footprint-item" v-for="(item,index) of cp_data" :key="index">
          <div class="cp_image">
            <img :src="item.pic">
          </div>
          <div class="cp_info">
            <h3 v-text="item.title"></h3>
            <div class="cp_score">
              <img :src="require(item.score>=i ? '@/assets/icon/20180831142237_413.png' : '@/assets/icon/20180831142237_552.png')" v-for="i in 5" :key="i">
            </div>
            <div class="view-count" v-text="`${item.shoucang}收藏  ${item.browse}浏览`"></div>
          </div>
          <label class="checkbox" :style="`display:${is_bianji?'block':'none'}`">
            <input type="checkbox" class="zy" ref="checkbox" :data-sid="item.sid">
          </label>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import qs from "qs"
export default {
  props:{
    uid:"",
  },
  data(){
    return {
      cp_data:[],
      num:1,
      is_bianji:false,
      sid_list:[]
    }
  },
  methods: {
    sc_del(){
      var option=this.$refs.checkbox;
      for(var item of option){
        if(item.checked){
          this.sid_list.push(item.getAttribute("data-sid"))
        }
      }
      this.$messagebox({
        title: '删除',
        message: 'Are you 确定?',
        showCancelButton: true,
      }).then(action=>{
        if(this.sid_list.length!=0){
          if(action=='confirm'){
            console.log(123)
            this.axios.get(
              "/shoucan/quanshan",
              {params:{sids:this.sid_list}}
            ).then(res=>{
              this.get_sc_data();
              this.sid_list=[];
              for(var item of option){
                item.checked=false
              }
            })
          }
        }
        this.is_bianji=false;
      });     
    },
    quanxuan(){
      var quanxuan=this.$refs.quanxuan;   //获取全选节点
      var option=this.$refs.checkbox;
      quanxuan.checked=!quanxuan.checked;   
      for(var item of option){
        item.checked=quanxuan.checked
      }
    },
    toDetail(index,did){
      if(!this.is_bianji){
        this.$router.push('/menu01/'+did);
      }else{
        var option=this.$refs.checkbox;
        var selected =  option[index];
        selected.checked=!selected.checked;

        var bool=true;
        for(var item of option){
          if(item.checked==false){
            bool=false;
            break;
          }
        }
        this.$refs.quanxuan.checked=bool;
      }
    },
    displayStatus(){
      this.$emit('displayStatus');
    },
    get_sc_data(){
      this.axios.post(
        "/shoucan/yh_shoucan",
        qs.stringify({uid:this.uid}),
        {headers:{'Content-Type':'application/x-www-form-urlencoded'}}
      ).then(res=>{
        this.cp_data=res.data
      })
    }
  },
  created(){
    this.get_sc_data();
  },
}
</script>

<style>
@import '../scss/list.scss';


.bianji{
  /* margin-right:10px; */
  padding:5px 10px;
}
.page-shoucang{
  position:fixed;
  background:#fff;
  top:0;left:0;
  bottom:0;right:0;
  z-index:999;
  flex-direction: column;
  overflow: hidden;
}
.sc_top{
  display: flex;
  align-items:center;
  padding:10px 15px 10px 40px;
  box-shadow:0 4px 5px -5px #aaa;
  position:relative
}
.sc_top>span{
  font-size:25px;
  font-weight: 600;
}
.top_nav{
  flex-grow: 1;
  justify-content: space-around;
  display: flex;
}
.close{
  font-size:24px;
  background:#ccc;
  color:#fff;
  border-radius:50%;
  width:25px;
  height:24px;
  text-align: center;
  line-height: 25px;
}
.sc_content{
  padding:0 15px;
  flex-grow: 1;
  overflow: scroll;
}
.bianji_box{
  padding:10px 15px 5px;
  display:flex;
  justify-content: space-between
}
/* .bianji_box::after{
  content:"";
  display:block;
  clear: both;
} */
.shanchu{
  color:#f20;
}
.selected_count{
  
}
.quanxuan{
  font-size:15px;
}
.quanxuan .checkbox input:checked::after{
  top:3px;
}
.checkbox{
  position:relative;
  padding-right:20px;
}
.checkbox input {
  width:0;height:0;
}
.checkbox::before{
  content:"";
  position:absolute;
  width:16px;
  height:16px ;
  border:2px solid #888;
  border-radius:3px;
  right:0;
}
.checkbox input:checked::after{
  content:"";
  position:absolute;
  width:10px;height:5px;
  border-left:2px solid #888;
  border-bottom:2px solid #888;
  transform: rotate(-50deg);
  right:4px;top:5px;
}


</style>
