// 引入vue-router
import {createRouter, createWebHashHistory} from 'vue-router'

// 引入组件页面
import Home from './views/Home.vue'
import Product from './views/Product.vue'
import ProductDetails from './views/ProductDetails.vue'
import Case from './views/Case.vue'
import Service from './views/Service.vue'
import News from './views/News.vue'
import NewsDetails from './views/NewsDetails.vue'
import About from './views/About.vue'
import Contact from './views/Contact.vue'

// 后台页面
import Login from './views/Login.vue'
import Admin from './views/Admin.vue'
import User from './views/Admin/User.vue'
import AdminProduct from './views/Admin/Product.vue'
import AdminNews from './views/Admin/News.vue'
import Message from './views/Admin/Message.vue'
import Banner from './views/Admin/Banner.vue'
import CaseBanner from './views/Admin/caseBanner.vue'
import Downloads from './views/Admin/Downloads.vue'

const router = createRouter({
    history:createWebHashHistory(),
    routes:[
        {
            path:'/',
            component: Home
        },
        {
            path:'/product',
            component: Product
        },
        {   
            name:'productdetails',
            path:'/productdetails/:id',
            component: ProductDetails
        },
        {
            path:'/case',
            component: Case
        },
        {
            path:'/service',
            component: Service
        },
        {
            path:'/news',
            component: News
        },
        {
            name:'newsdetails',
            path:'/NewsDetails/:id',
            component: NewsDetails
        },
        {
            path:'/about',
            component: About
        },
        {
            path:'/contact',
            component: Contact
        },
        {
            path:'/login',
            component: Login
        },
        {
            path:'/admin',
            component: Admin,
            meta: { requiresAuth: true },
            children:[
                {
                    path:'/admin/user',
                    component: User,
                },
                {
                    path:'/admin/product',
                    component: AdminProduct
                },
                {
                    path:'/admin/news',
                    component: AdminNews
                },
                {
                    path:'/admin/message',
                    component: Message
                },
                {
                    path:'/admin/banner',
                    component: Banner
                },
                {
                    path:'/admin/casebanner',
                    component: CaseBanner
                },
                {
                    path:'/admin/downloads',
                    component: Downloads
                }
            ]
        }
    ]
});

// 验证Token
router.beforeEach((to, from, next) => {
    const requiresAuth = to.matched.some(record => record.meta.requiresAuth);
    if (requiresAuth && !localStorage.getItem('token')) {
        next('/login');
        console.log('请先登录');
    } else {
        next();
    }
})
export default router