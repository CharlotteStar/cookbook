<template>
    <div class="container">
        <!-- <div class="lunbo">
            轮播组件
        </div> -->
        <div class="classify">
            <div class="today" >今日</div>
            <div class="today_classify">
                <span class="m m1" id="slide">早餐</span>
                <span class="m m2">午餐</span>
                <span class="m m3">下午茶</span>
                <span class="m m4">晚餐</span>
                <span class="m m5">夜宵</span>
            </div>
        </div>
        <div class="sancan_item">
            <span class="img_txt" >
                <img src="../../assets/tj_sancan/1d26834b699639fa05aaa1eb21da28a1.jpg" class="img">
                <div class="txt_title">东北乱炖</div>
                <div class="txt_content">富含维生素，补肾强身</div>
            </span>
            <span class="img_txt">
                <img src="../../assets/tj_sancan/1d26834b699639fa05aaa1eb21da28a1.jpg" class="img">
                <div class="txt_title">东北乱炖</div>
                <div class="txt_content">富含维生素，补肾强身</div>
            </span>
        </div>
        <div class="FourPlates">
            <span>
                <div class="">
                    <div>每日福利</div>
                    <div>好货推荐</div>
                </div>
                <img src="../../assets/tj_sancan/125454d0ba92403e7f34bb5025284d9b.jpg" >
            </span>
            <span>
                <div>本周流行</div>
                <div>最佳菜肴</div>
                 <img src="../../assets/tj_sancan/125454d0ba92403e7f34bb5025284d9b.jpg" >
            </span>
            <span>
                <div>智能组菜</div>
                <div>选菜神器</div>
                 <img src="../../assets/tj_sancan/125454d0ba92403e7f34bb5025284d9b.jpg" >
            </span>
            <span>
                <div>菜谱分类</div>
                <div>美味分类</div>
                 <img src="../../assets/tj_sancan/125454d0ba92403e7f34bb5025284d9b.jpg" >
            </span>
        </div>
        <!-- 推荐导航栏 -->
        <ul class="index-nume">
            <li>推荐</li>
            <li>时令</li>
            <li>食肉</li>
            <li>素食</li>
            <li>烘焙</li>
        </ul>
        <!-- 推荐用户展示 -->
           <div class="index_img_text">
               <div class="img_txt img_text_content">
                   <img src="../../assets/tj_sancan/394c75088907de693fba10b7bedbc8cd.jpg" class="img">
                   <h3>部队火锅</h3>
                   <h6>家常菜|天涯海角最想念的味道</h6>
                   <div class="user_index">
                       <div class="user_img_name">
                           <img src="../../assets/tj_sancan/125454d0ba92403e7f34bb5025284d9b.jpg" class="user_img">
                       <span class="user_name">菜菜美食记</span>
                       </div>
                       <span class="watch_time"><img src="../../assets/icon/watch_time.png"> 1w+</span>
                   </div>
               </div>
               <div class="img_txt  img_text_content">
                   <img src="../../assets/tj_sancan/394c75088907de693fba10b7bedbc8cd.jpg" class="img">
                   <h3>部队火锅</h3>
                   <h6>家常菜|天涯海角最想念的味道</h6>
                   <div class="user_index">
                       <div class="user_img_name">
                           <img src="../../assets/tj_sancan/125454d0ba92403e7f34bb5025284d9b.jpg" class="user_img">
                       <span class="user_name">菜菜美食记</span>
                       </div>
                       <span class="watch_time"><img src="../../assets/icon/watch_time.png"> 1w+</span>
                   </div>
               </div>
           </div>
           
    </div>    
</template>
<script>
export default {
    data() {
        return {
            selected:""
        }
    },
}
</script>
<style>
.container{
    margin: 0 10px;
    justify-content: space-between;
    padding-bottom: 50px;
}
.classify{
    display: flex;
    width: 100%;
    padding: 20px 0;
}
 .today ,#slide{
    display: inline-block;
    color: #333;
    font-size: 20px;
    font-weight: 900;
}
.today_classify{
    display: inline-block;
}
.today_classify .m{
    margin-right: 15px;
    color: #666;
    font-size: 14px;
}
.sancan_item{
    display: flex;
    justify-content: space-between;
}
.sancan_item .img_txt{
    padding-right: 10px;
}
.img_txt .img{
    width: 100%;
    border-radius: 7px;
    box-shadow: 0 3px 6px rgba(0,0,0,.5);
    background-color: #666;
}
/* 标题文字 */
.txt_title{
    color: #000;
    font-size: 18px;
    font-weight: 900;
    padding: 5px; 
}
/* 标题文字内容 */
.txt_content{
    color: #333;
    font-size: 14px;
    padding: 5px;
}
.FourPlates{
    margin: 15px 0;
    width: 100%;
    display: flex;
    justify-content: space-between;
}
.FourPlates span{
    width: 24%;
    box-sizing: border-box;
    border-radius: 7px;
    box-shadow: 0 3px 6px rgba(0,0,0,.5);
}
.FourPlates span div:nth-child(1){
    color: #000;
    font-size: 14px;
    padding: 5px 0 0 5px; 
}
.FourPlates span div:nth-child(2){
    color: #333;
    font-size: 12px;
    padding-bottom: 10px;
    padding: 5px 0 15px 5px;
}
.FourPlates span img{
    width: 100%;
}
.tuijian{
    display: flex;
}
/* 推荐 */
.index-nume{
    padding-left: 15px;
    color: #333;
}
.index-nume li{
    float: left;
    list-style: none;
    margin: 5px 20px;
}
.index-nume li:first-child{
    margin-left: 0;
}
/* 推荐用户展示 */
.img_text_content{
    width: 100%;
    margin-right: 10px;
    border-radius: 7px;
    box-shadow: 0 3px 6px rgba(0,0,0,.5);
}
.index_img_text{
    display: flex;
    width: 100%;
    padding: 15px 0;
}
.img_text_content h3{
    color: #000;
    font-weight:900;
    padding: 5px 0 0 5px;
}
.img_text_content h6{
    font-size: 12px;
    padding: 5px 0 5px 10px;
    color: #333;
}
.user_index{
    display: flex;
    text-align: center;
    justify-content:space-between; 
    margin:18px 5px 12px 12px; 

}
.user_img_name{
align-items: center;
line-height: 170%
}
 .user_index .user_img{
    width: 30px;
    height: 30px;
    border-radius: 17px;
    vertical-align: top;
}
 .user_index .user_name{
     color: #333;
     font-size: 12px;
     padding-left: 5px;
 }
  .user_index .watch_time{
    float: right;
    margin-right: 5px;
    padding: 7px;
    color: #333;
    font-size: 12px;
    justify-content: space-between;
    vertical-align: top;
    position: relative;
  }
  .watch_time img{
      width: 15px;
      height: 15px;
      background-color: #fff;
      position: absolute;
      top: 7px;
      right: 30px;
  }
</style>

