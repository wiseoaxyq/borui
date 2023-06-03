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
            path:'/Case',
            component: Case
        },
        {
            path:'/Service',
            component: Service
        },
        {
            path:'/News',
            component: News
        },
        {
            name:'newsdetails',
            path:'/NewsDetails/:id',
            component: NewsDetails
        },
        {
            path:'/About',
            component: About
        },
        {
            path:'/Contact',
            component: Contact
        }
    ]
});
export default router