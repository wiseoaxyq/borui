<template>
    <div class="service">
        <banner title="服务中心" bgc="../src/assets/img/contact.jpg"></banner>
        <el-tabs v-model="tabName">
            <el-tab-pane label="客户培训" name="0"></el-tab-pane>
            <el-tab-pane label="技术支持" name="1"></el-tab-pane>
            <el-tab-pane label="常见问题" name="2"></el-tab-pane>
            <el-tab-pane label="设备配件" name="3"></el-tab-pane>
            <el-tab-pane label="保养知识" name="4"></el-tab-pane>
            <el-tab-pane label="下载中心" name="5"></el-tab-pane>
        </el-tabs>
    </div>
</template>

<script>
import banner from '../components/banner.vue'

export default{
    name:'service',
    data(){
        return{
            tabName: '0'
        }
    },
    components:{
        banner
    }
}
</script>