import { createApp } from 'vue'
// 完全引入element-ui
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'

// 引入vue-video-player
import VideoPlayer from 'vue-video-player'
// import 'vue-video-player/src/custom-theme.css'
import 'video.js/dist/video-js.css'

// 引入icon-vue
import * as ElementPlusIconsVue from '@element-plus/icons-vue'

import App from './App.vue'
// 引入路由器
import router from './router.js'


const app = createApp(App)

app.use(ElementPlus)
app.use(VideoPlayer)

// 注册icon-vue
for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
    app.component(key, component)
}

// 应用路由器
app.use(router)
app.mount('#app')

// 路由跳转后回到顶部
router.afterEach((to,from,next) => {
    window.scrollTo(0,0);
})