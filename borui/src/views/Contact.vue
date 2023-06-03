<template>
    <div class="contact">
        <banner title="联系我们" bgc="../src/assets/img/contact.jpg"></banner>
        <el-row justify="center">
            <el-col :span="12" class="contactUs">
                <h1>东莞市柏锐智能科技有限公司</h1>
                <tr><td class="conTitles">联系人：</td><td>崔小姐-13712898815</td></tr>
                <tr><td class="conTitles"></td><td>易小姐-13729337935</td></tr>
                <tr><td class="conTitles">电话：</td><td>0769-81303390</td></tr>
                <tr><td class="conTitles">邮箱：</td><td>dgljccd1698@163.com</td></tr>
                <tr><td class="conTitles">地址：</td><td>东莞市高埗镇振兴东二横路兆方资本工业园G栋1楼</td></tr>
            </el-col>
            <el-col :span="6" class="contactTable">
                <el-form label-position="top" class="contactForm" :rules="rules">
                    <h1>留言板</h1>
                    <el-form-item label="姓名：">
                        <el-input v-model="formInfo.name" placeholder="姓名"/>
                    </el-form-item>
                    <el-form-item label="电话：">
                        <el-input v-model="formInfo.tel" placeholder="电话"/>
                    </el-form-item>
                    <el-form-item label="邮箱：" prop="email">
                        <el-input v-model="formInfo.email" placeholder="邮箱"/>
                    </el-form-item>
                    <el-form-item label="地址：">
                        <el-input v-model="formInfo.add" placeholder="地址"/>
                    </el-form-item>
                    <el-form-item label="内容详情：">
                        <el-input v-model="formInfo.mes" type="textarea" placeholder="请在此输入留言内容，我们会尽快与您联系"/>
                    </el-form-item>
                    <el-form-item>
                        <el-button type="primary" @click="formDatePost">提交</el-button>
                    </el-form-item>
                </el-form>
            </el-col>
        </el-row>
    </div>
</template>

<script>
import banner from '../components/banner.vue'
import axios from 'axios'

export default{
    name:'contact',
    data(){
        return{
            formInfo:{
                name:'',
                tel:'',
                email:'',
                add:'',
                mes:''
            },
            rules:{
                email:[{
                    type: 'email',
                    required: true,
                    message: '请输入正确的邮箱地址',
                }]
            }
        }
    },
    methods:{
        // 提交信息到留言板
        formDatePost() {
            axios.get('http://127.0.0.1/message/postmessage',{
                params: {
                name: this.formInfo.name,
                tel: this.formInfo.tel,
                email: this.formInfo.email,
                add: this.formInfo.add,
                mes: this.formInfo.mes
                }
            }).then(res=>{
            console.log(res.data);
            if(res.data.status == 200) {
                this.$message({
                    message: '提交成功',
                    type: 'success'
                })
                // 提交后初始化表单
                this.formInfo = {}
            }else{
                this.$message({
                    message: '提交失败',
                    type: 'error'
                });
            }
            }).catch(err=>{
                console.log("操作失败" + err);
                alert('提交失败，请联系管理员')
            })
        }
    },
    components:{
        banner
    }
}
</script>

<style>
.contact{
    margin-bottom: 100px;
}
/* 联系我们 */
.contactUs{
    background-color: #f8f8f8;
    padding: 50px;
    line-height: 40px;
    font-size: 20px;
}
.contactUs h1{
    margin: 20px 0;
    font-size: 30px;
}
.conTitles{
    width: 80px;
}

/* 留言板 */
.contactTable{
    background-color: #1d2740;
    padding: 50px;
}
.contactForm{
    width: 90%;
    margin: 0 auto;
    color: #fff;
}
.contactForm h1{
    margin: 20px 0;
    font-size: 30px;
}
.contactForm .el-input__wrapper, .contactForm .el-textarea__inner{
    background-color: #3b4d71;
    font-size: 14px;    
    box-shadow: none;
}
.contactForm .el-input__inner, .contactForm .el-textarea__inner{
    color: #9ecef7;
}
.contactForm .el-form-item__label{
    color: #6d7488;
}
</style>