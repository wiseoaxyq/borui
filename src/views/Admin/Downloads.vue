<template>
    <div class="user">
        <el-button type="primary" class="userAddBtn" @click="dialogAdd = true">上传</el-button>
        <span style="font-size: 18px;">下载文件管理</span>
        <el-table :data="tableData" border style="width: 100%;" max-height="calc(100vh - 120px)">
            <el-table-column type="index" label="序号" width="60" />
            <!-- <el-table-column prop="id" label="ID" width="180" /> -->
            <el-table-column prop="title" label="标题" />
            <el-table-column prop="url" label="文件位置">
                <template #default="scope">
                    <a :href="tableData[scope.$index].url" target="_blank">{{ tableData[scope.$index].url }}</a>
                </template>
            </el-table-column>
            <el-table-column prop="note" label="备注" />
            <el-table-column label="操作" width="90">
                <template #default="scope">
                    <el-button type="danger" @click="delFile(scope.row)">删除</el-button>
                </template>
            </el-table-column>
        </el-table>

        <!-- 新增按钮的弹窗 -->
        <el-dialog v-model="dialogAdd" title="上传文件" class="dialogForm" :before-close="closeAddDialog">
            <el-form :model="dialogForm" ref="dialogForm">
                <el-form-item label="标题：" prop="title">
                    <el-input v-model="dialogForm.title" placeholder="标题"/>
                </el-form-item>
                <el-form-item label="上传：" prop="url">
                    <el-upload 
                        ref="upload"
                        action="http://127.0.0.1:3000/uploadfile"
                        :auto-upload="false"
                        :limit="1"
                        accept=".pdf"
                        :on-exceed="handleExceed"
                        :on-success="handleAddSuccess"
                        >
                        <el-button type="primary">Click to upload</el-button>
                    </el-upload>
                </el-form-item>
                <el-form-item label="备注：" prop="note">
                    <el-input v-model="dialogForm.note" placeholder="备注"/>
                </el-form-item>
            </el-form>
            <template #footer>
                <span class="dialog-footer">
                    <el-button @click="closeAddDialog">取消</el-button>
                    <el-button type="primary" @click="addFile">提交</el-button>
                </span>
            </template>
        </el-dialog>
    </div>
</template>

<script>
import axios from 'axios'
import { nanoid } from 'nanoid'
import { ElMessage, ElMessageBox } from 'element-plus'

export default{
    name:'user',
    data(){
        return{
            tableData:[],
            dialogAdd: false,
            dialogForm:{}
        }
    },
    methods:{
        // 获取文件列表
        getFiles(){
            axios.get('http://127.0.0.1:3000/downloads/getallfiles').then(res=>{
                this.tableData = res.data;
            }).catch(err =>{
                console.log("数据获取失败"+err);
            })
        },
        // 上传文件
        addFile(){
            // 上传文件后,再使用on-success钩子执行保存操作 handleAddSuccess()
            this.$refs.upload.submit()  // 上传文件
        },
        // 关闭上传弹窗
        closeAddDialog(){
            this.dialogForm = {}  // 初始化数据
            this.$refs.upload.clearFiles()  // 清空上传列表
            this.getFiles()  // 刷新表格
            this.dialogAdd = false;  // 关闭弹窗
        },
        // 删除文件
        delFile(row){
            ElMessageBox.confirm(
                '确定删除此文件吗?',
                '删除文件',{
                    confirmButtonText: '确认',
                    cancelButtonText: '取消',
                    type: 'warning'
                }
            ).then(()=>{
                axios.get('http://127.0.0.1:3000/downloads/delfile',{
                    params:{
                        id: row.id
                    }
                }).then(res=>{
                    console.log(res.data);
                    if(res.data.status == 200){
                        this.$message.success('删除成功')
                        this.getFiles()  //刷新列表
                        axios.post('http://127.0.0.1:3000/delfilesurl',row).then(res=>{
                            console.log(res.data);
                        })
                    }else{
                        this.$message.error('删除失败')
                    }
                }).catch(err=>{
                    console.log("操作失败："+err);
                    alert('提交失败')
                })
                // console.log(row.id);
            }).catch(()=>{
                ElMessage({
                    type:'info',
                    message:'取消操作'
                })
            })
        },

        
        // -- 文件上传组件部分 --

        // 替换上一个上传的文件
        handleExceed(files,uploadFiles){
            // console.log(files);
            // console.log(uploadFiles);
            this.$refs.upload.clearFiles()  // 清空上传列表
            const file = files[0] // 存储新的文件
            this.$refs.upload.handleStart(file)  //手动上传新文件
        },
        // 上传成功后
        handleAddSuccess(response,uploadFile){
            // console.log('response: '+response);
            // console.log(uploadFile);
            this.dialogForm.url = response;  // 返回文件上传后的地址

            // 上传完成后，数据保存到数据库的操作
            let result = this.dialogForm
            result.id = nanoid()
            // console.log(this.dialogForm);
            axios.get('http://127.0.0.1:3000/downloads/insfile',{
                params:{
                    id: result.id,
                    title: result.title,
                    url: result.url,
                    note: result.note
                }
            }).then(res=>{
                console.log(res.data);
                if(res.data.status == 200){
                    this.$message.success('提交成功')
                    this.dialogForm = {}  // 初始化表单
                    this.$refs.upload.clearFiles()  // 清空上传列表
                    this.dialogAdd = false  //关闭弹窗
                    this.getFiles()  // 刷新表格
                }else{
                    this.$message.error('提交失败')
                    if(result.pic !== ''){
                        axios.post('http://127.0.0.1:3000/delfilesurl', this.dialogForm).then(res=>{
                            console.log(res.data);
                        })
                    }
                }
            }).catch(err=>{
                console.log('操作失败：' + err);
                this.$message.error('提交失败，请联系管理员')
                if(result.pic !== ''){
                    axios.post('http://127.0.0.1:3000/delfilesurl', this.dialogForm).then(res=>{
                        console.log(res.data);
                    })
                }
            })
        },
    },
    mounted(){  
        this.getFiles()
    }
}
</script>

<style>
.userAddBtn{
    margin: 10px;
}
.dialogForm{
    width: 30%;
}
</style>