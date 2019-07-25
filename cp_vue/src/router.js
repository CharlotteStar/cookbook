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
import personal from './components/me/Personal.vue'//个人
import shoucan from './components/me/shoucan.vue'//收藏
import menu01_item from './components/Menu-steps/menu01_item.vue'
import SearchFirst from './components/tuijian/SearchFirst.vue'
import Record from './components/record/Record.vue'
import ShowTime from './components/record/ShowTime.vue'


Vue.use(Router);

export default new Router({
  routes: [
    { path: '/ShowTime', component: ShowTime },
    { path: '/Record', component: Record },
    { path: '/', redirect: '/home' },
    { path: '/home', component: Home },
    { path: '/about', name: 'about' },
    { path: '/login', component: Login },
    { path: '/register', component: Register },
    { path: '/classify', component: classify },
    { path: '/detailslist/:tid', component: DetailsList, props: true },
    { path: '/menu01/:did', component: menu01, props: true },
    { path: '/Recommend', component: Recommend },
    { path: '/menu01_item', component: menu01_item },
    { path: '/SearchFirst', component: SearchFirst },
    { path: '/search', component: search },
    { path: '/personal', component: personal },
    { path: '/shoucan', component: shoucan },
  ]
})
