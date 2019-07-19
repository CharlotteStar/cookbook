<template>
    <div class="container">
        <div class="title">
            <div class="show_title">有些人温暖了，
            </div>
            <!-- 背景色空div -->
             <div class="bg_color"></div>
        </div>
        <div class="slide_bar">
            <div>1</div>
            <div>2</div>
            <div>3</div>
            <div>4</div>
            <div>5</div>
            <div>6</div>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return{

        }
    }
}
</script>
<style scope>
.container{
    margin: 10px;
}
.title{
   display: inline-block;
   position: relative;
   overflow: hidden;
    
}
/* 随机更新的标语 */
.show_title{
    width: 100%;
    color: #333;
    z-index: 10;
    position: relative;
    flex-wrap: nowrap;
}
/* 标语的背景透明色 */
.bg_color{
    width: 100%;
    height:30%;
    position: absolute;
    left:0px;
    bottom: 1px;
    z-index: 1;
    background: #fde8e6;
}
.slide_bar{
    display: flex;
    width: 100%;
}
.slide_bar div{
    width: 25%;
    height: 100%;
    background: url(./s16210777158.jpg)
}
</style>

