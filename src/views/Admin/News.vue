<template>
    <div class="adminNews">
        <el-button type="primary" class="userAddBtn" @click="dialogAdd = true">新增</el-button>
        <span style="font-size: 18px;">文章管理</span>
        <el-table :data="tableData" border style="width: 100%;" max-height="calc(100vh - 120px)">
            <el-table-column type="index" label="序号" width="60" />
            <!-- <el-table-column prop="id" label="ID" width="60" /> -->
            <el-table-column prop="newTitle" label="新闻标题" />
            <el-table-column prop="newInfo" label="新闻内容" class="newInfo" show-overflow-tooltip />
            <el-table-column label="封面图片">
                <template #default="scope">
                    <div class="tablePic">
                        <img :src="scope.row.newPic" alt="">
                    </div>
                </template>
            </el-table-column>
            <el-table-column prop="newTags" label="文章分类" width="100" />
            <el-table-column prop="newDate" label="创作日期" />
            <el-table-column prop="person" label="作者" width="80" />
            <el-table-column prop="isdels" label="状态" width="60" />
            <el-table-column label="操作" width="160">
                <template #default="scope">
                    <el-button type="primary" plain @click="getUpdateNew(scope.$index)">修改</el-button>
                    <el-button type="danger" @click="delNew(scope.row)">删除</el-button>
                </template>
            </el-table-column>
        </el-table>

        <!-- 新增按钮的弹窗 -->
        <el-dialog v-model="dialogAdd" title="新增产品" :before-close="closeAddDialog">
            <el-form label-width="100px" :model="dialogForm" ref="dialogForm">
                <el-form-item label="新闻标题：" prop="newTitle">
                    <el-input v-model="dialogForm.newTitle" placeholder="新闻标题" />
                </el-form-item>
                <el-form-item label="文章分类：" prop="newTags">
                    <el-select v-model="dialogForm.newTags" placeholder="请选择">
                        <el-option
                            v-for="item in dialogOptions"
                            :key="item.value"
                            :label="item.label"
                            :value="item.value"
                        />
                    </el-select>
                </el-form-item>
                <el-form-item label="封面图片：" prop="pic">
                    <el-upload 
                        ref="upload"
                        action="http://127.0.0.1/upload"
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
                <el-form-item label="新闻内容：" prop="newInfo">
                    <el-input 
                        v-model="dialogForm.newInfo" 
                        type="textarea" 
                        placeholder="新闻内容" 
                        :autosize="{ minRows: 2, maxRows: 6 }"
                    />
                </el-form-item>
                <el-form-item label="是否发布：" prop="isDel">
                    <el-switch v-model="dialogForm.isDel" />
                </el-form-item>
            </el-form>
            <template #footer>
                <span class="dialog-footer">
                    <el-button @click="closeAddDialog">取消</el-button>
                    <el-button type="primary" @click="addNew">提交</el-button>
                </span>
            </template>
        </el-dialog>

        <!-- 修改按钮的弹窗 -->
        <el-dialog v-model="dialogUpdate" title="修改产品" :before-close="closeUpdateDialog">
            <el-form label-width="100px" :model="dialogForm" ref="dialogForm">
                <el-form-item label="新闻标题：" prop="newTitle">
                    <el-input v-model="dialogForm.newTitle" placeholder="新闻标题" />
                </el-form-item>
                <el-form-item label="文章分类：" prop="newTags">
                    <el-select v-model="dialogForm.newTags" placeholder="请选择">
                        <el-option
                            v-for="item in dialogOptions"
                            :key="item.value"
                            :label="item.label"
                            :value="item.value"
                        />
                    </el-select>
                </el-form-item>
                <el-form-item label="封面图片：" prop="pic">
                    <div class="formPic">
                        <img :src="dialogForm.pic" alt="原封面图">
                    </div>
                    <el-upload 
                        ref="upload"
                        action="http://127.0.0.1/upload"
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
                <el-form-item label="新闻内容：" prop="newInfo">
                    <el-input 
                        v-model="dialogForm.newInfo" 
                        type="textarea" 
                        placeholder="新闻内容" 
                        :autosize="{ minRows: 2, maxRows: 6 }"
                    />
                </el-form-item>
                <el-form-item label="是否发布：" prop="isDel">
                    <el-switch v-model="dialogForm.isDel" />
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

export default {

    name: 'adminNews',
    data() {
        return {
            tableData: [],  // 表格数据
            dialogAdd: false,
            dialogUpdate: false,
            dialogForm: {isDel:false,pic:''},  //弹窗内容
            dialogOptions:[
                {value: '新闻资讯', label:'新闻资讯'},
                {value: '行业动态', label:'行业动态'},
            ],
            fileNum: 0
        }
    },
    methods: {
        // 获取文章列表
        getNews() {
            axios.get('http://127.0.0.1/news/getallinfo').then(res => {
                this.tableData = res.data;
                // console.log(this.tableData);
            }).catch(err => {
                console.log("数据获取失败" + err);
            })
        },
        // 新增文章
        addNew(){
            // 上传图片后,再使用on-success钩子执行保存操作 handleAddSuccess()
            this.$refs.upload.submit()  // 上传图片
        },
        // 关闭新增弹窗
        closeAddDialog() {
            // this.$refs.dialogForm.resetFields()  //重置表单
            this.dialogForm = {isDel:false,pic:''}  // 初始化数据
            this.getNews()  // 刷新表格
            this.$refs.upload.clearFiles()  // 清空上传列表
            this.dialogAdd = false;  //关闭弹窗
        },
        // 关闭修改弹窗
        closeUpdateDialog(){
            // this.$refs.dialogForm.resetFields()  //重置表单
            this.dialogForm = {isDel:false,pic:''}  // 初始化数据
            this.getNews()  // 刷新表格
            this.$refs.upload.clearFiles()  // 清空上传列表
            this.dialogUpdate = false;  //关闭弹窗
        },
        // 删除文章
        delNew(row){
            ElMessageBox.confirm('确认删除该文章吗？','删除文章',{
                confirmButtonText:'确认',
                cancelButtonText:'取消',
                type:'warning'
            }).then(()=>{
                axios.get('http://127.0.0.1/news/delnew',{params:{id:row.id}}
                ).then(res=>{
                    console.log(res.data);
                    if(res.data.status == 200){
                        this.$message.success('删除成功')
                        this.getNews()  // 刷新表格
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
        getUpdateNew(index){
            this.dialogUpdate = true
            this.dialogForm = this.tableData[index]  // 获取选择行的数据
            let result = this.dialogForm
            result.pic = result.newPic  // 格式化图片字段，用于显示原来的封面图
            // 格式化文章状态字段，用于激活选择滑块
            if(result.isDel == 1){result.isDel = true}else{result.isDel = false}
            // console.log(result);
        },
        // 修改文章（上传接口）
        updateNew(result){
            axios.get('http://127.0.0.1/news/updatenew',{
                params:{
                    newtitle: result.newTitle,
                    newpic: result.pic,
                    newinfo: result.newInfo,
                    newtags: result.newTags,
                    person: result.person,
                    isdel: result.isDel,
                    id: result.id,
                }
            }).then(res=>{
                console.log(res.data);
                if(res.data.status == 200){
                    this.$message.success('提交成功')
                    this.dialogForm = {isDel:false,pic:''}  // 初始化表单
                    this.fileNum = 0  // 初始化封面图上传列表
                    this.$refs.upload.clearFiles()  // 清空上传列表
                    this.dialogUpdate = false  //关闭弹窗
                    this.getNews()  // 刷新表格
                }else{
                    this.$message.error('提交失败')
                    if(this.fileNum > 0){
                        axios.post('http://127.0.0.1/delfiles', result).then(res=>{
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
                    axios.post('http://127.0.0.1/delfiles', result).then(res=>{
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
            }else{
                let result = this.dialogForm;
                result.person = localStorage.user  // 赋值登录的用户名
                // 将状态的bool类型转为int
                if(result.isDel === true) result.isDel = 1
                else result.isDel = 0
                console.log(result);
                this.updateNew(result)
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
            if(uploadFile.size / 1024 / 1024 > 2){
                this.$message.error('图片大小不能大于2M')
                this.$refs.upload.clearFiles()  // 清空上传列表
                return false
            }
            if(fileList.length > 0){  // 判断是否有文件上传了（修改文章）
                this.fileNum = fileList.length
            }else{
                console.log('no files');
            }
            return true
        },
        // 上传成功后，调用接口保存新增的数据（新增文章）
        handleAddSuccess(response,uploadFile){
            // console.log('response: '+response);
            // console.log(uploadFile);
            this.dialogForm.pic = response;  //返回文件上传后的真实地址，并存入表单

            // 上传完成后，数据保存到数据库的操作
            let result = this.dialogForm;
            result.id = nanoid()  // 赋值id
            result.person = localStorage.user  // 赋值登录的用户名
            // 将状态的bool类型转为int
            if(result.isDel === true) result.isDel = 1
            else result.isDel = 0
            // console.log(result);
            // 上传接口
            axios.get('http://127.0.0.1/news/insnew',{
                params:{
                    id: result.id,
                    newtitle: result.newTitle,
                    newpic: result.pic,
                    newinfo: result.newInfo,
                    newtags: result.newTags,
                    person: result.person,
                    isdel: result.isDel
                }
            }).then(res=>{
                console.log(res.data);
                if(res.data.status == 200){
                    this.$message.success('提交成功')
                    this.dialogForm = {isDel:false,pic:''}  // 初始化表单
                    this.dialogAdd = false  //关闭弹窗
                    this.getNews()  // 刷新表格
                }else{
                    this.$message.error('提交失败')
                    if(result.pic !== ''){
                        axios.post('http://127.0.0.1/delfiles', this.dialogForm).then(res=>{
                            console.log(res.data);
                        })
                    }
                }
            }).catch(err=>{
                console.log('操作失败：' + err);
                this.$message.error('提交失败，请联系管理员')
                if(result.pic !== ''){
                    axios.post('http://127.0.0.1/delfiles', this.dialogForm).then(res=>{
                        console.log(res.data);
                    })
                }
            })
        },
        // 上传成功后，调用接口保存修改的数据（修改文章）
        handleUpdateSuccess(response,uploadFile){
            // console.log('response: '+response);
            // console.log(uploadFile);
            this.dialogForm.pic = response;  //返回文件上传后的真实地址，并存入表单

            // 上传完成后，数据保存到数据库的操作
            let result = this.dialogForm;
            result.person = localStorage.user  // 赋值登录的用户名
            // 将状态的bool类型转为int
            if(result.isDel === true) result.isDel = 1
            else result.isDel = 0
            console.log(result);
            this.updateNew(result)
        }
    },
    mounted() {
        this.getNews()
    }
}
</script>

<style>
.adminNews .tablePic img {
    width: 100%;
}
.adminNews .formPic {
    width: 146px;
    height: 146px;
    position: relative;
    background-color: #fafafa;
    border: 1px dashed rgb(194, 194, 194);
    border-radius: 5px;
    margin-right: 10px;
}
.adminNews .formPic img{
    width: 100%;
    height: auto;
    position: absolute;
    top:50%;
    transform: translateY(-50%);
}
.adminNews .formInfoPic {
    width: 146px;
    height: auto;
}
</style>