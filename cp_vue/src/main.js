import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'

//引入mint-ui库中所有组件：完整引入
import MintUI from 'mint-ui'
//单独引入mint-ui样式文件
import 'mint-ui/lib/style.css'
//引入字体图标文件css文件
import "./font_xqweyihcnjm/iconfont.css"
//引入axios.js
import axios from "./axios"
import { Swipe, SwipeItem } from 'mint-ui';
import { TabContainer, TabContainerItem } from 'mint-ui';


Vue.component(TabContainer.name, TabContainer);
Vue.component(TabContainerItem.name, TabContainerItem);




//将mint-ui组件库中组件注册vue实例中
Vue.use(MintUI);
Vue.component(Swipe.name, Swipe);
Vue.component(SwipeItem.name, SwipeItem);
Vue.config.productionTip = false;


new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
