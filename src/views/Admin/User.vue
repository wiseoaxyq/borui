<template>
    <div class="user">
        <el-button type="primary" class="userAddBtn" @click="dialogAdd = true">新增</el-button>
        <span style="font-size: 18px;">用户管理</span>
        <el-table :data="tableData" border style="width: 100%;" max-height="calc(100vh - 120px)">
            <el-table-column type="index" label="序号" width="60" />
            <!-- <el-table-column prop="id" label="ID" width="180" /> -->
            <el-table-column prop="name" label="昵称" width="180" />
            <el-table-column prop="username" label="账号" width="180" />
            <el-table-column prop="password" label="密码(md5)" />
            <el-table-column prop="role" label="角色" width="180" />
            <el-table-column prop="note" label="备注" width="180" />
            <el-table-column label="操作" width="180">
                <template #default="scope">
                    <el-button type="primary" plain @click="getUpdateUser(scope.$index)">修改</el-button>
                    <el-button v-if="scope.row.id !=='1'" type="danger" @click="delUser(scope.row)">删除</el-button>
                </template>
            </el-table-column>
        </el-table>

        <!-- 新增按钮的弹窗 -->
        <el-dialog v-model="dialogAdd" title="新增用户" class="dialogForm" :before-close="closeAddDialog">
            <el-form :model="dialogForm" ref="dialogForm" :rules="rules">
                <el-form-item label="昵称：" prop="name">
                    <el-input v-model="dialogForm.name" placeholder="昵称"/>
                </el-form-item>
                <el-form-item label="账号：" prop="username">
                    <el-input v-model="dialogForm.username" placeholder="用户名"/>
                </el-form-item>
                <el-form-item label="密码：" prop="password">
                    <el-input v-model="dialogForm.password" type="password" placeholder="密码"/>
                </el-form-item>
                <el-form-item label="角色：" prop="role">
                    <el-select v-model="dialogForm.role" placeholder="请选择角色">
                        <el-option label="管理员" value="sa" />
                        <el-option label="员工" value="user" />
                    </el-select>
                </el-form-item>
                <el-form-item label="备注：" prop="note">
                    <el-input v-model="dialogForm.note" placeholder="备注"/>
                </el-form-item>
            </el-form>
            <template #footer>
                <span class="dialog-footer">
                    <el-button @click="closeAddDialog">取消</el-button>
                    <el-button type="primary" @click="addUser">提交</el-button>
                </span>
            </template>
        </el-dialog>

        <!-- 修改按钮的弹窗 -->
        <el-dialog v-model="dialogUpdate" title="修改用户" class="dialogForm" :before-close="closeUpdateDialog">
            <el-form :model="dialogForm" ref="dialogForm" :rules="rules">
                <el-form-item label="昵称：" prop="name">
                    <el-input v-model="dialogForm.name" placeholder="昵称"/>
                </el-form-item>
                <el-form-item label="账号：" prop="username">
                    <el-input v-model="dialogForm.username" placeholder="用户名"/>
                </el-form-item>
                <el-form-item label="密码：" prop="password">
                    <el-input v-model="dialogForm.password" placeholder="密码"/>
                </el-form-item>
                <el-form-item label="角色：" prop="role">
                    <el-select v-model="dialogForm.role" placeholder="请选择角色">
                        <el-option label="管理员" value="sa" />
                        <el-option label="员工" value="user" />
                    </el-select>
                </el-form-item>
                <el-form-item label="备注：" prop="note">
                    <el-input v-model="dialogForm.note" placeholder="备注"/>
                </el-form-item>
            </el-form>
            <template #footer>
                <span class="dialog-footer">
                    <el-button @click="closeUpdateDialog">取消</el-button>
                    <el-button type="primary" @click="updateUser">提交</el-button>
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
            uid:'',
            dialogAdd: false,
            dialogUpdate: false,
            dialogForm:{id:'',name:'',username:'',password:'',role:'',note:''},
            rules:{
                name:{required:true,message:'请输入昵称',trigger:'blur'},
                username:{required:true,message:'请输入用户名',trigger:'blur'},
                password:{required:true,message:'请输入密码',trigger:'blur'},
                role:{required:true,message:'请选择角色',trigger:'blur'},
            }
        }
    },
    methods:{
        // 获取用户列表
        getUser(){
            axios.get('http://127.0.0.1:3000/user/getuser').then(res=>{
                this.tableData = res.data;
            }).catch(err =>{
                console.log("数据获取失败"+err);
            })
        },
        // 新增用户
        addUser(){
            this.$refs.dialogForm.validate(valid=>{
                if(valid){  // 检验通过后，调用接口新增
                    this.uid = nanoid();
                    axios.get('http://127.0.0.1:3000/user/insuser',{
                        params:{
                            id: this.uid,
                            name: this.dialogForm.name,
                            username: this.dialogForm.username,
                            password: this.dialogForm.password,
                            role: this.dialogForm.role,
                            note: this.dialogForm.note
                        }
                    }).then(res=>{
                        console.log(res.data);
                        if(res.data.status == 200){
                            this.$message({
                                message:'提交成功',
                                type:'success'
                            })
                            this.dialogForm = {}  //提交后初始化表单
                            this.dialogAdd = false  // 关闭弹窗
                            this.getUser()  //刷新列表
                        }else{
                            this.$message({
                                message:'提交失败',
                                type:'error'
                            })
                        }
                    }).catch(err=>{
                        console.log("操作失败："+err);
                        this.$message({
                            message:'提交失败',
                            type:'error'
                        })
                    })
                }
            })
            
        },
        // 关闭新增弹窗
        closeAddDialog(){
            this.dialogForm = {}  // 初始化数据
            this.getUser()  // 刷新表格
            this.dialogAdd = false;  // 关闭弹窗
        },
        // 关闭修改弹窗
        closeUpdateDialog(){
            this.dialogForm = {}  // 初始化数据
            this.getUser()  // 刷新表格
            this.dialogUpdate = false;  // 关闭弹窗
        },
        // 获取需要修改的用户信息
        getUpdateUser(index){
            this.dialogUpdate = true
            this.dialogForm = this.tableData[index]
        },
        // 修改用户信息
        updateUser(){
            this.$refs.dialogForm.validate(valid=>{
                if(valid){
                    axios.get('http://127.0.0.1:3000/user/updateUser',{
                        params:{
                            id: this.dialogForm.id,
                            name: this.dialogForm.name,
                            username: this.dialogForm.username,
                            password: this.dialogForm.password,
                            role: this.dialogForm.role,
                            note: this.dialogForm.note
                        }
                    }).then(res=>{
                        console.log(res.data);
                        if(res.data.status == 200){
                            this.$message({
                                message:'提交成功',
                                type:'success'
                            })
                            this.dialogForm = {}  //提交后初始化表单
                            this.dialogUpdate = false  // 关闭弹窗
                            this.getUser()  //刷新列表
                        }else{
                            this.$message({
                                message:'提交失败',
                                type:'error'
                            })
                        }
                    }).catch(err=>{
                        console.log("操作失败："+err);
                        alert('提交失败')
                    })
                }
            })
            
        },
        // 删除用户
        delUser(row){
            ElMessageBox.confirm(
                '确定删除该账号吗?',
                '删除账号',{
                    confirmButtonText: '确认',
                    cancelButtonText: '取消',
                    type: 'warning'
                }
            ).then(()=>{
                axios.get('http://127.0.0.1:3000/user/delUser',{
                    params:{
                        id: row.id
                    }
                }).then(res=>{
                    console.log(res.data);
                    if(res.data.status == 200){
                        this.$message({
                            message:'删除成功',
                            type:'success'
                        })
                        this.getUser()  //刷新列表
                    }else{
                        this.$message({
                            message:'删除失败',
                            type:'error'
                        })
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
        }
    },
    mounted(){
        this.getUser()
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