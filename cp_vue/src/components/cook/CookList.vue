<template>
    <div>
        <recommend></recommend>
    </div>
</template>
<script>
import Recommend from './Recommend.vue'
export default {
    data(){
        return{}
    },
    components:{
        // 如果我在这修改 
        "recommend":Recommend
    }
}

</script>

<style scope>
    
</style>
