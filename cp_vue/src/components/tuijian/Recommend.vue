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
                <img src="../../assets/tj_sancan/1d26834b699639fa05aaa1eb21da28a1.jpg" alt="" >
                <div class="txt_title">东北乱炖</div>
                <div class="txt_content">富含维生素，补肾强身</div>
            </span>
            <span class="img_txt">
                <img src="../../assets/tj_sancan/1d26834b699639fa05aaa1eb21da28a1.jpg" alt="" >
                <div class="txt_title">东北乱炖</div>
                <div class="txt_content">富含维生素，补肾强身</div>
            </span>
        </div>
        <div class="FourPlates">
            <span>
                <div>每日福利</div>
                <div>好货推荐</div>
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
        <ul class="index-nume">
            <li>推荐</li>
            <li>时令</li>
            <li>食肉</li>
            <li>素食</li>
            <li>烘焙</li>
        </ul>
           <div class="index_img_text">
               <div class="img_txt img_text_content">
                   <img src="../../assets/tj_sancan/394c75088907de693fba10b7bedbc8cd.jpg" alt="">
                   <h3>部队火锅</h3>
                   <h6>家常菜|天涯海角最想念的味道</h6>
                   <div class="user_">
                       <img src="" alt="">
                       <span>菜菜美食记</span>
                       <span><i></i> 1w+</span>
                   </div>
               </div>
               <div class="img_txt  img_text_content">
                   <img src="../../assets/tj_sancan/394c75088907de693fba10b7bedbc8cd.jpg" alt="">
                   <h3>部队火锅</h3>
                   <h6>家常菜|天涯海角最想念的味道</h6>
                   <div>
                       <img src="" alt="">
                       <span>菜菜美食记</span>
                       <span><i></i> 1w+</span>
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
    clear: both;
}
 .img_txt{
    padding-right: 10px;
}
.img_txt img{
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
    padding-top: 5px;
}
/* 标题文字内容 */
.txt_content{
    color: #333;
    font-size: 14px;
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
    font-size: 18px;
    padding: 5px 0 0 5px; 
}
.FourPlates span div:nth-child(2){
    color: #333;
    font-size: 14px;
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
.index-nume li{
    float: left;
    list-style: none;
    margin: 5px 20px;
}
.index-nume li:first-child{
    margin-left: 0;
}

.index_img_text{
    display: flex;
    width: 100%;
}

</style>

