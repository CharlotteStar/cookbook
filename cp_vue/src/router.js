import Vue from 'vue'
import Router from 'vue-router'
import Home from './components/Home.vue'            //首页
import Login from './components/me/login.vue'         //登录页面
import Register from './components/me/register.vue'     //注册页面
import classify from './components/tuijian/classify.vue'  //分类页面
import Recommend from './components/tuijian/Recommend'    //首页推荐
import DetailsList from './components/tuijian/cp_details_list.vue'  //详情列表页
import menu01 from './components/Menu-steps/menu01.vue'   //详情页
import search from './components/tuijian/search.vue'  //搜索页
Vue.use(Router)
import menu01_item from './components/Menu-steps/menu01_item.vue'
import SearchFirst from './components/SmartRecipe/SearchFirst.vue'
import suggest from './components/SmartRecipe/suggest.vue'
import Record from './components/record/Record.vue'

import ShowTime from './components/record/ShowTime.vue'
export default new Router({
  routes: [
    {path:'/ShowTime',component:ShowTime},
    {path:'/Record',component:Record},
    {path: '/',redirect:'/home'},
    {path: '/home',component: Home},
    { path: '/about', name: 'about' },
    { path: '/login' ,component: Login},
    { path: '/register', component: Register },
    { path: '/classify', component: classify },
    { path: '/detailslist/:tid', component: DetailsList, props: true },
    { path: '/menu01/:did', component: menu01, props: true },
    {path:'/Recommend',component:Recommend},
    {path:'/menu01_item',component:menu01_item},
    {path:'/SearchFirst',component:SearchFirst},
    {path:'/suggest',component:suggest},
    {path:'/search',component:search},
  ]
})
