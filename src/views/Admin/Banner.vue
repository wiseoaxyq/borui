<template>
    <div class="adminBanner">
        <el-button type="primary" class="userAddBtn" @click="dialogAdd = true">新增</el-button>
        <span style="font-size: 18px;">轮播图管理</span>
        <el-table :data="tableData" border style="width: 100%;" max-height="calc(100vh - 120px)">
            <el-table-column type="index" label="序号" width="60" />
            <!-- <el-table-column prop="id" label="ID" width="60" /> -->
            <el-table-column label="图片">
                <template #default="scope">
                    <div class="tablePic">
                        <img :src="scope.row.url" alt="">
                    </div>
                </template>
            </el-table-column>
            <el-table-column prop="filter" label="页面" width="60"/>
            <el-table-column prop="note" label="备注" width="120"/>
            <el-table-column label="操作" width="160">
                <template #default="scope">
                    <el-button type="primary" plain @click="getUpdateBanner(scope.$index)">修改</el-button>
                    <el-button type="danger" @click="delBanner(scope.row)">删除</el-button>
                </template>
            </el-table-column>
        </el-table>

        <!-- 新增按钮的弹窗 -->
        <el-dialog v-model="dialogAdd" title="新增轮播图" :before-close="closeAddDialog">
            <el-form label-width="100px" :model="dialogForm" ref="dialogForm">
                <el-form-item label="页面：" prop="filter">
                    <el-select v-model="dialogForm.filter" placeholder="请选择">
                        <el-option
                            v-for="item in dialogOptions"
                            :key="item.value"
                            :label="item.label"
                            :value="item.value"
                        />
                    </el-select>
                </el-form-item>
                <el-form-item label="轮播图：" prop="pic">
                    <el-upload 
                        ref="upload"
                        action="http://127.0.0.1:3000/upload"
                        :auto-upload="false"
                        accept="image/jpeg,image/gif,image/png"
                        list-type="picture-card"
                        :limit="1"
                        :on-exceed="handleExceed"
                        :on-success="handleAddSuccess"
                        :on-change="beforeAvatarUpload"
                        >
                        <el-icon><Plus /></el-icon>
                    </el-upload>
                </el-form-item>
                <el-form-item label="备注" prop="note">
                    <el-input v-model="dialogForm.note" placeholder="备注" />
                </el-form-item>
            </el-form>
            <template #footer>
                <span class="dialog-footer">
                    <el-button @click="closeAddDialog">取消</el-button>
                    <el-button type="primary" @click="addBanner">提交</el-button>
                </span>
            </template>
        </el-dialog>

        <!-- 修改按钮的弹窗 -->
        <el-dialog v-model="dialogUpdate" title="修改轮播图" :before-close="closeUpdateDialog">
            <el-form label-width="100px" :model="dialogForm" ref="dialogForm">
                <el-form-item label="页面：" prop="filter">
                    <el-select v-model="dialogForm.filter" placeholder="请选择">
                        <el-option
                            v-for="item in dialogOptions"
                            :key="item.value"
                            :label="item.label"
                            :value="item.value"
                        />
                    </el-select>
                </el-form-item>
                <el-form-item label="轮播图：" prop="pic">
                    <div class="formPic">
                        <img :src="dialogForm.pic" alt="原封面图">
                    </div>
                    <el-upload 
                        ref="upload"
                        action="http://127.0.0.1:3000/upload"
                        :auto-upload="false"
                        accept="image/jpeg,image/gif,image/png"
                        list-type="picture-card"
                        :limit="1"
                        :on-exceed="handleExceed"
                        :on-success="handleUpdateSuccess"
                        :on-change="beforeAvatarUpload"
                        >
                        <el-icon><Plus /></el-icon>
                    </el-upload>
                </el-form-item>
                <el-form-item label="备注" prop="note">
                    <el-input v-model="dialogForm.note" placeholder="备注" />
                </el-form-item>
            </el-form>
            <template #footer>
                <span class="dialog-footer">
                    <el-button @click="closeUpdateDialog">取消</el-button>
                    <el-button type="primary" @click="updateBtn">提交</el-button>
                </span>
            </template>
        </el-dialog>
    </div>
</template>

<script>
import axios from 'axios';
import { nanoid } from 'nanoid'
import { ElMessage, ElMessageBox } from 'element-plus'

export default{
    name:'adminbanner',
    data(){
        return{
            tableData: [],  // 表格数据
            dialogAdd: false,
            dialogUpdate: false,
            dialogForm: {pic:''},
            dialogOptions:[
                {value:'index', label:'首页'},
                {value:'product', label:'产品中心'}
            ],
            fileNum: 0
        }
    },
    methods:{
        // 获取轮播图列表
        getBanner(){
            axios.get('http://127.0.0.1:3000/banner/getallbanner').then(res => {
                this.tableData = res.data;
                // console.log(this.tableData);
            }).catch(err => {
                console.log("数据获取失败" + err);
            })
        },
        // 触发新增banner按钮
        addBanner(){
            // 上传图片后,再使用on-success钩子执行保存操作 handleAddSuccess()
            this.$refs.upload.submit()  // 上传图片
            this.$message.info('正在提交，请稍候...')
            // console.log(this.dialogForm);
        },
        // 关闭新增弹窗
        closeAddDialog() {
            // this.$refs.dialogForm.resetFields()  //重置表单
            this.dialogForm = {pic:''}  // 初始化数据
            this.getBanner()  // 刷新表格
            this.$refs.upload.clearFiles()  // 清空上传列表
            this.dialogAdd = false;  //关闭弹窗
        },
        // 关闭修改弹窗
        closeUpdateDialog() {
            // this.$refs.dialogForm.resetFields()  //重置表单
            this.dialogForm = {pic:''}  // 初始化数据
            this.getBanner()  // 刷新表格
            this.$refs.upload.clearFiles()  // 清空上传列表
            this.dialogUpdate = false;  //关闭弹窗
        },
        // 删除banner
        delBanner(row){
            ElMessageBox.confirm('确认删除该BANNER吗？','删除BANNER',{
                confirmButtonText:'确认',
                cancelButtonText:'取消',
                type:'warning'
            }).then(()=>{
                axios.get('http://127.0.0.1:3000/banner/delbanner',{params:{id:row.id}}
                ).then(res=>{
                    console.log(res.data);
                    if(res.data.status == 200){
                        this.$message.success('删除成功')
                        this.getBanner()  // 刷新表格
                        row.pic = row.url
                        // console.log(row);
                        axios.post('http://127.0.0.1:3000/delfiles',row).then(res=>{
                            console.log(res.data);
                        })
                    }else{this.$message.error('删除失败')}
                }).catch(err=>{
                    console.log('操作失败：'+err);
                    this.$message.error('提交失败，请联系管理员')
                })
            }).catch(()=>{
                this.$message.info('取消操作')
            })
        },
        // 获取需要修改的文章信息（打开修改弹窗）
        getUpdateBanner(index){
            this.dialogUpdate = true
            this.dialogForm = this.tableData[index]  // 获取选择行的数据
            let result = this.dialogForm
            result.pic = result.url  // 格式化图片字段，用于显示原来的封面图
            // console.log(result);
        },
        // 修改文章（上传接口）
        updateBanner(result){
            axios.get('http://127.0.0.1:3000/banner/updatebanner',{
                params:{
                    url: result.pic,
                    filter: result.filter,
                    note: result.note,
                    id: result.id
                }
            }).then(res=>{
                console.log(res.data);
                if(res.data.status == 200){
                    this.$message.success('提交成功')
                    this.dialogForm = {pic:''}  // 初始化表单
                    this.fileNum = 0  // 初始化封面图上传列表
                    this.$refs.upload.clearFiles()  // 清空上传列表
                    this.dialogUpdate = false  //关闭弹窗
                    this.getBanner()  // 刷新表格
                }else{
                    this.$message.error('提交失败')
                    if(this.fileNum > 0){
                        axios.post('http://127.0.0.1:3000/delfiles', result).then(res=>{
                            console.log(res.data);
                        })
                        this.fileNum = 0
                        this.$refs.upload.clearFiles()  // 清空上传列表
                    }
                }
            }).catch(err=>{
                console.log('操作失败：' + err);
                this.$message.error('提交失败，请联系管理员')
                if(this.fileNum > 0){
                    axios.post('http://127.0.0.1:3000/delfiles', result).then(res=>{
                        console.log(res.data);
                    })
                    this.fileNum = 0
                    this.$refs.upload.clearFiles()  // 清空上传列表
                }
            })
        },
        // 触发修改文章按钮
        updateBtn(){
            // 若有图片上传，则使用on-success钩子执行保存操作 handleUpdateSuccess()
            if(this.fileNum > 0){
                this.$refs.upload.submit()  // 上传图片
                this.$message.info('正在提交，请稍候...')
            }else{
                this.$message.info('正在提交，请稍候...')
                let result = this.dialogForm;
                console.log(result);
                this.updateBanner(result)
            }
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
        // 上传文件到列表前，检查文件大小
        beforeAvatarUpload(uploadFile,fileList){
            if(uploadFile.size / 1024 / 1024 > 5){
                this.$message.error('图片大小不能大于5M')
                this.$refs.upload.clearFiles()  // 清空上传列表
                return false
            }
            if(fileList.length > 0){  // 判断是否有文件上传了（修改文章）
                this.fileNum = fileList.length
                console.log('files upload');
            }else{
                console.log('no files');
            }
            return true
        },
        // 上传成功后，调用接口保存新增的数据（新增banner）
        handleAddSuccess(response,uploadFile){
            // console.log('response: '+response);
            // console.log(uploadFile);
            this.dialogForm.pic = response;  //返回文件上传后的真实地址，并存入表单

            let result = this.dialogForm
            result.id = nanoid()  // 赋值id
            // 上传接口
            axios.get('http://127.0.0.1:3000/banner/insbanner',{
                params:{
                    id: result.id,
                    url: result.pic,
                    filter: result.filter,
                    note: result.note
                }
            }).then(res=>{
                console.log(res.data);
                if(res.data.status == 200){
                    this.$message.success('提交成功')
                    this.dialogForm = {pic:''}
                    this.dialogAdd = false
                    this.getBanner()
                }else{
                    this.$message.error('提交失败')
                    if(result.pic !== ''){
                        axios.post('http://127.0.0.1:3000/delfiles', this.dialogForm).then(res=>{
                            console.log(res.data);
                        })
                    }
                }
            }).catch(err=>{
                console.log('操作失败：' + err);
                this.$message.error('提交失败，请联系管理员')
                if(result.pic !== ''){
                    axios.post('http://127.0.0.1:3000/delfiles', this.dialogForm).then(res=>{
                        console.log(res.data);
                    })
                }
            })
        },
        // 上传成功后，调用接口保存修改的数据（修改banner）
        handleUpdateSuccess(response,uploadFile){
            // console.log('response: '+response);
            // console.log(uploadFile);
            this.dialogForm.pic = response;  //返回文件上传后的真实地址，并存入表单

            // 上传完成后，数据保存到数据库的操作
            let result = this.dialogForm;
            console.log(result);
            this.updateBanner(result)
        }
        
    },
    mounted(){
        this.getBanner()
    }
}
</script>

<style>
.adminBanner .tablePic img {
    width: 100%;
}
.adminBanner .formPic {
    width: 146px;
    height: 146px;
    position: relative;
    background-color: #fafafa;
    border: 1px dashed rgb(194, 194, 194);
    border-radius: 5px;
    margin-right: 10px;
}
.adminBanner .formPic img{
    width: 100%;
    height: auto;
    position: absolute;
    top:50%;
    transform: translateY(-50%);
}
</style>