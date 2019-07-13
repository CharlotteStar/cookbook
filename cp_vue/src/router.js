import Vue from 'vue'
import Router from 'vue-router'
import Home from './components/Home.vue'
//1.引入头部子组件
// import CookTop from './components/cook/CookTop.vue'
// import CookList from './components/cook/CookList.vue'
import Login from './components/me/login.vue'
import Register from './components/me/register.vue'
import classify from './components/tuijian/classify.vue'
import menu01 from './components/Menu-steps/menu01.vue'
Vue.use(Router)

export default new Router({
  routes: [
    {path: '/',redirect:'/home'},
    {path: '/home',name: 'home',component: Home},
    { path: '/about', name: 'about' },
    { path: '/login', name: 'login' ,component: Login},
    { path: '/register', name: 'login', component: Register },
    { path: '/classify', name: 'login', component: classify },
    // {path:'/CookTop',component:CookTop},
    // {path:'/CookList',component:CookList}
    {path:'/menu01',component:menu01},
  ]
})
