<template>
    <div class="adminProduct">
        <el-button type="primary" class="userAddBtn" @click="dialogAdd = true">新增</el-button>
        <span style="font-size: 18px;">产品管理</span>
        <el-table :data="tableData" border style="width: 100%;" max-height="calc(100vh - 120px)">
            <el-table-column type="index" label="序号" width="60"/>
            <!-- <el-table-column prop="id" label="ID" /> -->
            <el-table-column prop="invCode" label="产品编码" />
            <el-table-column prop="invName" label="产品名称" />
            <el-table-column prop="invStd" label="规格型号" />
            <el-table-column label="产品图片" >
                <template #default="scope">
                    <div class="tablePic">
                        <img :src="scope.row.invPic" alt="">
                    </div>
                </template>
            </el-table-column>
            <el-table-column prop="invTagsName" label="产品分类" />
            <el-table-column prop="invTags2Name" label="子分类" />
            <el-table-column prop="caseTags" label="相关行业" />
            <el-table-column prop="invInfoText" label="产品介绍" show-overflow-tooltip/>
            <el-table-column label="详情图">
                <template #default="scope">
                    <div class="tablePic">
                        <img v-for="item in tableData[scope.$index].invInfoPic" :key="item.id"
                         :src="item" alt="">
                    </div>
                </template>
            </el-table-column>
            <el-table-column prop="notes" label="备注" />
            <el-table-column prop="isdels" label="状态" />
            <el-table-column label="操作" width="160">
                <template #default="scope">
                    <el-button type="primary" plain @click="getUpdateProduct(scope.$index)">修改</el-button>
                    <el-button type="danger" @click="delProduct(scope.row)">删除</el-button>
                </template>
            </el-table-column>
        </el-table>

        <!-- 新增按钮的弹窗 -->
        <el-dialog v-model="dialogAdd" title="新增产品" :before-close="closeAddDialog">
            <el-form label-width="100px" :model="dialogForm" ref="dialogForm">
                <el-form-item label="产品编码：" prop="invCode">
                    <el-input v-model="dialogForm.invCode" placeholder="产品编码"/>
                </el-form-item>
                <el-form-item label="产品名称：" prop="invName">
                    <el-input v-model="dialogForm.invName" placeholder="产品名称"/>
                </el-form-item>
                <el-form-item label="规格型号：" prop="invStd">
                    <el-input v-model="dialogForm.invStd" placeholder="规格型号"/>
                </el-form-item>
                <el-form-item label="产品分类：" prop="invTags">
                    <el-select v-model="dialogForm.invTags" placeholder="请选择" @change="getFilterList2">
                        <el-option v-for="(item,index) in filter1" :key="index" :label="item.filterName" :value="item.filterId" />
                    </el-select>
                </el-form-item>
                <el-form-item label="子分类：" prop="invTags2">
                    <el-select v-model="dialogForm.invTags2" placeholder="请选择">
                        <el-option v-for="(item,index) in filter2" :key="index" :label="item.filterName" :value="item.filterId" />
                    </el-select>
                </el-form-item>
                <el-form-item label="相关行业：" prop="caseTags">
                    <el-checkbox-group v-model="dialogForm.caseTags">
                        <el-checkbox label="food" name="food">食品行业</el-checkbox>
                        <el-checkbox label="3c" name="3c">3C电子</el-checkbox>
                        <el-checkbox label="hardware" name="hardware">五金行业</el-checkbox>
                        <el-checkbox label="solutions" name="solutions">包装印刷</el-checkbox>
                        <el-checkbox label="newEnergy" name="newEnergy">新能源行业</el-checkbox>
                    </el-checkbox-group>
                </el-form-item>
                <el-form-item label="产品图片：" prop="pic">
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
                <el-form-item label="产品介绍：" prop="invInfoText">
                    <el-input 
                        v-model="dialogForm.invInfoText" 
                        type="textarea" 
                        placeholder="产品介绍（200字以内）"
                        :autosize="{ minRows: 2, maxRows: 6 }"
                    />
                </el-form-item>
                <el-form-item label="详情图：" prop="pics">
                    <el-upload 
                        ref="uploadlist"
                        action="http://127.0.0.1:3000/uploadlist"
                        :auto-upload="false"
                        accept="image/jpeg,image/gif,image/png"
                        list-type="picture-card"
                        :on-success="handleAddSuccessList"
                        :on-change="beforeAvatarUploadList"
                        >
                        <el-icon><Plus /></el-icon>
                    </el-upload>
                </el-form-item>
                <el-form-item label="备注：" prop="notes">
                    <el-input 
                        v-model="dialogForm.notes" 
                        type="textarea" 
                        placeholder="备注"
                        :autosize="{ minRows: 2, maxRows: 6 }"
                    />
                </el-form-item>
                <el-form-item label="是否生效" prop="isDel">
                    <el-switch v-model="dialogForm.isDel" />
                </el-form-item>
            </el-form>
            <template #footer>
                <span class="dialog-footer">
                    <el-button @click="closeAddDialog">取消</el-button>
                    <el-button type="primary" @click="addProduct">提交</el-button>
                </span>
            </template>
        </el-dialog>

        <!-- 修改按钮的弹窗 -->
        <el-dialog v-model="dialogUpdate" title="新增产品" :before-close="closeUpdateDialog">
            <el-form label-width="100px" :model="dialogForm" ref="dialogForm">
                <el-form-item label="产品编码：" prop="invCode">
                    <el-input v-model="dialogForm.invCode" placeholder="产品编码"/>
                </el-form-item>
                <el-form-item label="产品名称：" prop="invName">
                    <el-input v-model="dialogForm.invName" placeholder="产品名称"/>
                </el-form-item>
                <el-form-item label="规格型号：" prop="invStd">
                    <el-input v-model="dialogForm.invStd" placeholder="规格型号"/>
                </el-form-item>
                <el-form-item label="产品分类：" prop="invTags">
                    <el-select v-model="dialogForm.invTags" placeholder="请选择" @change="getFilterList2">
                        <el-option v-for="(item,index) in filter1" :key="index" :label="item.filterName" :value="item.filterId" />
                    </el-select>
                </el-form-item>
                <el-form-item label="子分类：" prop="invTags2">
                    <el-select v-model="dialogForm.invTags2" placeholder="请选择">
                        <el-option v-for="(item,index) in filter2" :key="index" :label="item.filterName" :value="item.filterId" />
                    </el-select>
                </el-form-item>
                <el-form-item label="相关行业：" prop="caseTags">
                    <el-checkbox-group v-model="dialogForm.caseTags">
                        <el-checkbox label="food" name="food">食品行业</el-checkbox>
                        <el-checkbox label="3c" name="3c">3C电子</el-checkbox>
                        <el-checkbox label="hardware" name="hardware">五金行业</el-checkbox>
                        <el-checkbox label="solutions" name="solutions">包装印刷</el-checkbox>
                        <el-checkbox label="newEnergy" name="newEnergy">新能源行业</el-checkbox>
                    </el-checkbox-group>
                </el-form-item>
                <el-form-item label="产品图片：" prop="pic">
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
                        :on-success="handleAddSuccess"
                        :on-change="beforeAvatarUpload"
                        >
                        <el-icon><Plus /></el-icon>
                    </el-upload>
                </el-form-item>
                <el-form-item label="产品介绍：" prop="invInfoText">
                    <el-input 
                        v-model="dialogForm.invInfoText" 
                        type="textarea" 
                        placeholder="产品介绍（200字以内）"
                        :autosize="{ minRows: 2, maxRows: 6 }"
                    />
                </el-form-item>
                <el-form-item label="详情图：" prop="pics">
                    <div class="formPic" v-for="(item,index) in dialogForm.invInfoPic" :key="index">
                        <img :src="item" alt="原封面图">
                        <el-button type="danger" class="formPicBtn" @click="delOldFileList(item)">删除</el-button>
                    </div>
                    <el-upload 
                        ref="uploadlist"
                        action="http://127.0.0.1:3000/uploadlist"
                        :auto-upload="false"
                        accept="image/jpeg,image/gif,image/png"
                        list-type="picture-card"
                        :on-success="handleAddSuccessList"
                        :on-change="beforeAvatarUploadList"
                        >
                        <el-icon><Plus /></el-icon>
                    </el-upload>
                </el-form-item>
                <el-form-item label="备注：" prop="notes">
                    <el-input 
                        v-model="dialogForm.notes" 
                        type="textarea" 
                        placeholder="备注"
                        :autosize="{ minRows: 2, maxRows: 6 }"
                    />
                </el-form-item>
                <el-form-item label="是否生效" prop="isDel">
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

export default{

    name:'adminproduct',
    data(){
        return{
            tableData:[],  // 表格数据
            dialogAdd: false,
            dialogUpdate: false,
            dialogForm:{isDel:false,pic:'',picList:[]},  // 弹窗内容
            filter1:[],  // 一级分类列表
            filter2:[],  // 二级分类列表
            fileNum: 0,
            fileListNum: 0
        }
    },
    methods:{
        // 获取产品列表
        getProduct(){
            axios.get('http://127.0.0.1:3000/productList/getallinfo').then(res=>{
                this.tableData = res.data;
                // console.log(this.tableData);
                // 处理json字符串
                for (let i = 0; i < this.tableData.length; i++) {
                    // console.log(JSON.parse(this.tableData[i].invInfoPic));
                    const infopic = JSON.parse(this.tableData[i].invInfoPic)
                    this.tableData[i].invInfoPic = infopic
                }
                // console.log(this.tableData);
            }).catch(err=>{
                console.log("数据获取失败"+err);
            })
        },
        // 新增产品
        addProduct(){
            // 上传图片后,再使用on-success钩子执行保存操作 handleAddSuccess()
            this.$refs.uploadlist.submit()  // 上传详情图
            this.$refs.upload.submit()  // 上传图片

            this.$message.info('正在提交，请稍候...')
            setTimeout(() => {
                // 上传完成后，数据保存到数据库的操作
                let result = this.dialogForm;
                result.id = nanoid()  // 赋值id
                result.person = localStorage.user  // 赋值登录的用户名
                // 将状态的bool类型转为int
                if(result.isDel === true) result.isDel = 1
                else result.isDel = 0
                // json数组转字符串
                result.caseTag = JSON.stringify(result.caseTags)
                result.picList = JSON.stringify(result.picList)
                console.log(result);
                // 上传接口
                axios.get('http://127.0.0.1:3000/productList/insproduct',{
                    params:{
                        id: result.id,
                        invcode: result.invCode,
                        invname: result.invName,
                        invstd: result.invStd,
                        invinfotext: result.invInfoText,
                        invinfopic: result.picList,
                        invpic: result.pic,
                        invtags: result.invTags,
                        invtags2: result.invTags2,
                        notes: result.notes,
                        casetags: result.caseTag,
                        person: result.person,
                        isdel: result.isDel
                    }
                }).then(res=>{
                    console.log(res.data);
                    if(res.data.status == 200){
                        this.$message.success('提交成功')
                        this.dialogForm = {isDel:false,pic:''}  // 初始化表单
                        this.dialogAdd = false  //关闭弹窗
                        this.getProduct()  // 刷新表格
                    }else{
                        this.$message.error('提交失败')
                        // if(result.pic !== ''){
                        //     axios.post('http://127.0.0.1:3000/delfiles', this.dialogForm).then(res=>{
                        //         console.log(res.data);
                        //     })
                        // }
                    }
                }).catch(err=>{
                    console.log('操作失败：' + err);
                    this.$message.error('提交失败，请联系管理员')
                    // if(result.pic !== ''){
                    //     axios.post('http://127.0.0.1:3000/delfiles', this.dialogForm).then(res=>{
                    //         console.log(res.data);
                    //     })
                    // }
                })
            }, 2000);
        },
        // 关闭新增弹窗
        closeAddDialog(){
            this.dialogForm = {isDel:false,pic:'',picList:[]}  // 初始化数据
            this.getProduct()  // 刷新表格
            this.$refs.upload.clearFiles()  // 清空上传列表
            this.$refs.uploadlist.clearFiles()  // 清空上传列表
            this.dialogAdd = false;  //关闭弹窗
        },
        // 关闭修改弹窗
        closeUpdateDialog(){
            this.dialogForm = {isDel:false,pic:'',picList:[]}  // 初始化数据
            this.getProduct()  // 刷新表格
            this.$refs.upload.clearFiles()  // 清空上传列表
            this.$refs.uploadlist.clearFiles()  // 清空上传列表
            this.dialogUpdate = false;  //关闭弹窗
        },
        // 获取需要修改的产品信息（打开修改弹窗）
        getUpdateProduct(index){
            this.dialogUpdate = true
            this.dialogForm = this.tableData[index]  // 获取选择行的数据
            let result = this.dialogForm
            result.caseTags = JSON.parse(this.tableData[index].caseTags) // 相关行业字段，字符串转数组
            result.pic = result.invPic  // 赋值pic，在表单中展示产品图
            result.picList = result.invInfoPic  // 赋值picList，在表单中展示详情图
            // 格式化产品状态字段，用于激活选择滑块
            if(this.tableData[index].isdels === '有效'){result.isDel = true}else{result.isDel = false}
            this.getFilterList2(result.invTags)  // 获取对应的二级分类
        },
        // 删除旧详情图
        delOldFileList(files){
            let result = this.dialogForm.picList
            for(let i=0;i<result.length;i++){
                const element = result[i]
                if(element === files){
                    result.splice(i,1)
                }
            }
        },
        // 更新产品（上传接口）
        updateProduct(result){
            axios.get('http://127.0.0.1:3000/productList/updateproduct',{
                params:{
                    invcode: result.invCode,
                    invname: result.invName,
                    invstd: result.invStd,
                    invpic: result.pic,
                    invtags: result.invTags,
                    invtags2: result.invTags2,
                    invinfotext: result.invInfoText,
                    invinfopic: result.picList,
                    casetags: result.caseTag,
                    notes: result.notes,
                    isdel: result.isDel,
                    person: result.person,
                    id: result.id
                }
            }).then(res=>{
                console.log(res.data);
                if(res.data.status == 200){
                    this.$message.success('提交成功')
                    this.dialogForm = {isDel:false,pic:'',picList:[]}  //提交后初始化表单
                    this.fileNum = 0  // 初始化产品图上传列表
                    this.fileListNum = 0  // // 初始化详情图上传列表
                    this.$refs.upload.clearFiles()  // 清空产品图上传列表
                    this.$refs.uploadlist.clearFiles()  // 清空详情图上传列表
                    this.dialogUpdate = false  // 关闭弹窗
                    this.getProduct()  //刷新列表
                }else{
                    this.$message.error('提交失败')
                    this.fileNum = 0  // 初始化产品图上传列表
                    this.fileListNum = 0  // // 初始化详情图上传列表
                    this.$refs.upload.clearFiles()  // 清空产品图上传列表
                    this.$refs.uploadlist.clearFiles()  // 清空详情图上传列表
                }
            }).catch(err=>{
                console.log('操作失败：' + err);
                this.$message.error('提交失败，请联系管理员')
                this.fileNum = 0  // 初始化产品图上传列表
                    this.fileListNum = 0  // // 初始化详情图上传列表
                    this.$refs.upload.clearFiles()  // 清空产品图上传列表
                    this.$refs.uploadlist.clearFiles()  // 清空详情图上传列表
            })
        },
        // 触发更新产品按钮
        updateBtn(){
            console.log(this.fileNum,this.fileListNum);
            if(this.fileListNum > 0){
                this.$refs.uploadlist.submit()  // 上传详情图
            }
            if(this.fileNum > 0){
                this.$refs.upload.submit()  // 上传产品图
            }
            this.$message.info('正在提交，请稍候...')
            setTimeout(() => {
                let result = this.dialogForm
                result.person = localStorage.user  // 赋值登录的用户名
                if(result.isDel === true){result.isDel = 1}else{result.isDel = 0}  // 将状态的bool类型转为int
                result.caseTag = JSON.stringify(result.caseTags)  // 将相关行业json转为json字符串
                result.picList = JSON.stringify(result.picList)  // 将详情图json转为json字符串
                console.log(result);
                this.updateProduct(result)
            }, 2000);
        },
        // 删除产品
        delProduct(row){
            ElMessageBox.confirm('确定删除该产品吗?','删除产品',{
                confirmButtonText: '确认',
                cancelButtonText: '取消',
                type: 'warning'
            }).then(()=>{
                axios.get('http://127.0.0.1:3000/productList/delproduct',{params:{id: row.id}}
                ).then(res=>{
                    console.log(res.data);
                    if(res.data.status == 200){
                        this.$message.success('删除成功')
                        this.getProduct()  //刷新列表
                        row.pic = row.invInfoPic
                        row.pic.push(row.invPic)
                        // console.log(row);
                        axios.post('http://127.0.0.1:3000/delfileslist',row)
                    }else{this.$message.error('删除失败')}
                }).catch(err=>{
                    console.log("操作失败："+err);
                    this.$message.error('提交失败，请联系管理员')
                })
                // console.log(row.id);
            }).catch(()=>{
                this.$message.info('取消操作')
            })
        },
        // 获取一级分类
        getFilterList(){
            axios.get('http://127.0.0.1:3000/productList/filterlist').then(res=>{
                this.filter1 = res.data;
                // console.log(this.filter1);
            }).catch(err=>{
                console.log('数据获取失败'+err);
            })
        },
        // 获取二级分类
        getFilterList2(val){
            axios.get('http://127.0.0.1:3000/productList/filterlist2',{
                params:{
                    filterfather:val
                }
            }).then(res=>{
                this.filter2 = res.data;
                // console.log(this.filter2);
            }).catch(err=>{
                console.log('数据获取失败'+err);
            })
        },

        // -- 单文件上传组件部分 --

        // 单文件替换上一个上传的文件
        handleExceed(files,uploadFiles){
            // console.log(files);
            // console.log(uploadFiles);
            this.$refs.upload.clearFiles()  // 清空上传列表
            const file = files[0] // 存储新的文件
            this.$refs.upload.handleStart(file)  //手动上传新文件
        },
        // 单文件上传文件到列表前，检查文件大小
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
        // 单文件上传成功后
        handleAddSuccess(response,uploadFile){
            // console.log('response: '+response);
            // console.log(uploadFile);
            this.dialogForm.pic = response;  //返回文件上传后的真实地址，并存入表单
            this.$message.success('产品图片上传成功')
        },
        // 单文件上传成功后
        handleUpdateSuccess(response,uploadFile){
            // console.log('response: '+response);
            // console.log(uploadFile);
            this.dialogForm.pic = response;  //返回文件上传后的真实地址，并存入表单
        },
        
        // -- 文件列表上传组件部分 --

        // 文件列表上传（判断是否有文件上传）
        beforeAvatarUploadList(uploadFile,fileList){
            if(fileList.length > 0){  // 判断是否有文件上传了
                this.fileListNum = fileList.length
            }else{
                console.log('no files');
            }
            return true
        },
        // 文件列表上传成功后
        handleAddSuccessList(response,uploadFile){
            // console.log('response: '+response);
            // console.log(uploadFile);
            this.dialogForm.picList.push(response)  //返回文件上传后的真实地址，并存入表单
            this.$message.success('详情图上传成功')
        },
    },
    mounted(){
        this.getProduct(),
        this.getFilterList()
    }
}
</script>

<style>
.adminProduct .tablePic img {
    width: 100%;
}
.adminProduct .formPic {
    width: 146px;
    height: 146px;
    position: relative;
    background-color: #fafafa;
    border: 1px dashed rgb(194, 194, 194);
    border-radius: 5px;
    margin-right: 10px;
    overflow: hidden;
}
.adminProduct .formPic img{
    height: 100%;
    width: auto;
    position: absolute;
    left:50%;
    top:0;
    transform: translate(-50%);
}
.adminProduct .formPicBtn{
    background-color: rgb(233, 73, 73);
    width: 100%;
    height: 15%;
    position: absolute;
    bottom: 0;
}
.adminProduct .formInfoPic {
    width: 146px;
    height: auto;
}
</style>