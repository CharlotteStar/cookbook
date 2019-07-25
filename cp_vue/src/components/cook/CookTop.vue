<template>
<!-- 顶部导航栏 -->
    <div>
        <div class="cook_title">
            <div class="left_title_icon">
                <img :src="leftImg" slot="icon" style="width:52px; margin-top:-5px">
            </div>
            <div class="center_title">
                <router-link to="/search">
                    <img :src="centerImg" slot="icon" s>
                    搜索你感兴趣的
                </router-link>
            </div>
            <div class="right_title_icon">
                <img :src="rightImg" slot="icon" style="width:52px; margin-top:-5px">
            </div>
        </div>
    </div>
</template>
<script>
export default {
    //左侧图片  中间图片文字  右侧图片
    props:{
        leftImg:{default:""},
        centerImg:{default:""},
        rightImg:{default:""}
    },
    data() {
        return {
            
        }
    },
}
</script>
<style scope>
    .cook_title{
        display: flex;
        position: fixed;
        top:0;
        height: 44px;
        z-index: 999;
        width: 100%;
        justify-content: center;
        font-size: 14px;
        line-height: 44px;
        background-color: #fff;
    }
    .center_title{
        display: flex;
        width: 100%;
        align-items:center;
    }
    .center_title>a{
        display: flex;
        height: 32px;
        width: 100%;
        justify-content: center;
        
        background-color:#f5f5f5;
        border-radius: 4px;
        line-height: 32px;
        text-decoration: none;
        color: #aaa;
    }
    .center_title>a>img{
    height:14px;
    width:14px;
    margin:9px 4px 0 0;
    vertical-align: top;
    }
</style>

