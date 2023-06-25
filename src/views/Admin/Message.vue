<template>
    <div class="message">
        <div style="font-size: 18px; margin:10px; height:30px; line-height:30px;">留言管理</div>
        <el-table :data="tableData" border style="width: 100%;" max-height="calc(100vh - 120px)">
            <el-table-column type="index" label="序号" width="60" />
            <!-- <el-table-column prop="id" label="ID" width="60" /> -->
            <el-table-column prop="name" label="姓名" />
            <el-table-column prop="tel" label="电话" />
            <el-table-column prop="email" label="邮箱" />
            <el-table-column prop="address" label="地址" />
            <el-table-column prop="message" label="留言" />
            <el-table-column prop="createDate" label="留言时间" />
        </el-table>
    </div>
</template>

<script>
import axios from 'axios';

export default{
    name:'message',
    data(){
        return{
            tableData: [],  // 表格数据
        }
    },
    methods:{
        // 获取留言列表
        getMessage(){
            axios.get('http://127.0.0.1:3000/message/getallinfo').then(res => {
                this.tableData = res.data;
                // console.log(this.tableData);
            }).catch(err => {
                console.log("数据获取失败" + err);
            })
        }
    },
    mounted(){
        this.getMessage()
    }
}
</script>