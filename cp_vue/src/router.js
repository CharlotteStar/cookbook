import Vue from 'vue'
import Router from 'vue-router'
import Home from './components/Home.vue'
//1.引入头部子组件
// import CookTop from './components/cook/CookTop.vue'
// import CookList from './components/cook/CookList.vue'
import Login from './components/me/login.vue'
import Register from './components/me/register.vue'
import classify from './components/tuijian/classify.vue'
import DetailsList from './components/tuijian/cp_details_list.vue'
import menu01 from './components/Menu-steps/menu01.vue'
Vue.use(Router)

export default new Router({
  routes: [
    {path: '/',redirect:'/home'},
    {path: '/home',component: Home},
    { path: '/about', name: 'about' },
    { path: '/login' ,component: Login},
    { path: '/register', component: Register },
    { path: '/classify', component: classify },
    { path: '/detailslist/:tid', component: DetailsList, props: true },
    { path: '/menu01/:did', component: menu01, props: true },
    // {path:'/CookTop',component:CookTop},
    // {path:'/CookList',component:CookList}
  ]
})
