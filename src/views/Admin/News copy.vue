<template>
  <div class="adminNews">
      <el-button type="primary" class="userAddBtn" @click="dialogAdd = true">新增</el-button>
      <span style="font-size: 18px;">文章管理</span>
      <el-table :data="tableData" border style="width: 100%;" max-height="calc(100vh - 120px)">
          <el-table-column type="index" label="序号" width="60"/>
          <el-table-column prop="id" label="ID" width="60"/>
          <el-table-column prop="newTitle" label="新闻标题" />
          <el-table-column prop="newInfo" label="新闻内容" class="newInfo" show-overflow-tooltip/>
          <el-table-column label="封面图片" >
              <template #default="scope">
                  <div class="tablePic">
                      <img :src="scope.row.newPic" alt="">
                  </div>
              </template>
          </el-table-column>
          <el-table-column prop="newTags" label="文章分类" width="100"/>
          <el-table-column prop="newDate" label="创作日期" />
          <el-table-column prop="person" label="作者" width="60"/>
          <el-table-column prop="isdels" label="状态" width="60"/>
          <el-table-column label="操作" width="160">
              <template #default="scope">
                  <el-button type="primary" plain @click="getUpdateProduct(scope.$index)">修改</el-button>
                  <el-button type="danger" @click="delProduct(scope.row)">删除</el-button>
              </template>
          </el-table-column>
      </el-table>

      <!-- 新增按钮的弹窗 -->
      <el-dialog v-model="dialogAdd" title="新增产品" :before-close="closeAddDialog">
          <el-form label-width="100px" :inline="true">
              <el-form-item label="新闻标题：">
                  <el-input v-model="dialogForm.newTitle" placeholder="新闻标题"/>
              </el-form-item>
              <el-form-item label="文章分类：">
                  <el-select v-model="dialogForm.newTags" placeholder="请选择" @change="getFilterList2">
                      <el-option v-for="(item,index) in filter1" :key="index" :label="item.filterName" :value="item.filterId" />
                  </el-select>
              </el-form-item>
              <el-form-item label="封面图片：">
                  <upload @uploadSuccess="getInfo" ref="upload" @uploadDel="delInfo"></upload>
              </el-form-item>
              <el-form-item label="新闻内容：">
                  <el-input v-model="dialogForm.newInfo" type="textarea" placeholder="新闻内容"/>
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
      <el-dialog v-model="dialogUpdate" title="修改用户" :before-close="closeUpdateDialog">
          <el-form label-width="100px" :inline="false" ref="dialogForm" :model="dialogForm">
              <el-form-item label="产品编码：">
                  <el-input v-model="dialogForm.invCode" placeholder="产品编码"/>
              </el-form-item>
              <el-form-item label="产品名称：">
                  <el-input v-model="dialogForm.invName" placeholder="产品名称"/>
              </el-form-item>
              <el-form-item label="规格型号：">
                  <el-input v-model="dialogForm.invStd" placeholder="规格型号"/>
              </el-form-item>
              <el-form-item label="产品分类：">
                  <el-select v-model="dialogForm.invTags" placeholder="请选择" @change="getFilterList2">
                      <el-option v-for="(item,index) in filter1" :key="index" :label="item.filterName" :value="item.filterId" />
                  </el-select>
              </el-form-item>
              <el-form-item label="子分类：">
                  <el-select v-model="dialogForm.invTags2" placeholder="请选择">
                      <el-option v-for="(item,index) in filter2" :key="index" :label="item.filterName" :value="item.filterId" />
                  </el-select>
              </el-form-item>
              <el-form-item label="相关行业：">
                  <el-checkbox-group v-model="dialogForm.caseTags">
                      <el-checkbox label="food" name="food">食品行业</el-checkbox>
                      <el-checkbox label="3c" name="3c">3C电子</el-checkbox>
                      <el-checkbox label="hardware" name="hardware">五金行业</el-checkbox>
                      <el-checkbox label="solutions" name="solutions">包装印刷</el-checkbox>
                      <el-checkbox label="newEnergy" name="newEnergy">新能源行业</el-checkbox>
                  </el-checkbox-group>
              </el-form-item>
              <el-form-item label="原产品图：">
                  <img class="formPic" :src="invPic" alt="image">
              </el-form-item>
              <el-form-item label="新产品图：">
                  <upload @uploadSuccess="getInfo" ref="upload2" @uploadDel="delInfo"></upload>
              </el-form-item>
              <el-form-item label="原详情图：">
                  <div v-for="(item, index) in invInfoPicForm" :key="index">
                      <img class="formInfoPic" :src="item" alt="image">
                      <el-button style="display: block;" type="danger" @click="delOldInfoPic(item)">删除</el-button>
                  </div>
              </el-form-item>
              <el-form-item label="新详情图：">
                  <uploads @uploadSuccess="getInfo2" ref="uploads2" @uploadDel="delInfo2"></uploads>
              </el-form-item>
              <el-form-item label="产品介绍：">
                  <el-input v-model="dialogForm.invInfoText" type="textarea" placeholder="产品介绍"/>
              </el-form-item>
              <el-form-item label="备注：">
                  <el-input v-model="dialogForm.notes" type="textarea" placeholder="备注"/>
              </el-form-item>
              <el-form-item label="是否生效">
                  <el-switch v-model="dialogForm.isDel" />
              </el-form-item>
          </el-form>
          <template #footer>
              <span class="dialog-footer">
                  <el-button @click="closeUpdateDialog">取消</el-button>
                  <el-button type="primary" @click="updateProductTest">提交</el-button>
              </span>
          </template>
      </el-dialog>
  </div>
</template>

<script>
import axios from 'axios';
import upload from '../../components/upload.vue'
import uploads from '../../components/uploads.vue'
import { nanoid } from 'nanoid'
import { ElMessage, ElMessageBox } from 'element-plus'

export default{

  name:'adminNews',
  data(){
      return{
          tableData:[],
          uid:'',
          invPic:'',
          caseTags:'',
          invInfoPic:[],
          invInfoPicForm:[],
          person:'',
          isDel:'',
          dialogAdd: false,
          dialogUpdate: false,
          dialogForm:{
              id:'',newTitle:'',newInfo:'',newPic:'',newTags:'',idDel:''
          },
          dialogFormBackup:[],
          mes:'',
          filter1:[],
          filter2:[],
      }
  },
  methods:{
      // 获取产品列表
      getProduct(){
          axios.get('http://127.0.0.1/news/getallinfo').then(res=>{
              this.tableData = res.data;
              // console.log(this.tableData);
          }).catch(err=>{
              console.log("数据获取失败"+err);
          })
      },
      // 上传主图和详情图赋值
      getInfo(mes){
          this.dialogForm.invPic = mes;
          // console.log("子："+mes+";父："+this.mes);
          // console.log(this.dialogForm.invPic);
      },
      getInfo2(mes){
          this.dialogForm.invInfoPic.push(mes);
          // console.log("子："+mes+";父："+this.mes);
          // console.log(this.dialogForm.invInfoPic);
      },
      // 子组件删除详情图时，父组件同步删除
      delInfo(mes){
          // console.log(this.dialogForm.invPic);
          this.dialogForm.invPic = ''
      },
      delInfo2(mes){
          for (let i = 0; i < this.dialogForm.invInfoPic.length; i++) {
              const element = this.dialogForm.invInfoPic[i];
              if(element === mes){
                  console.log(element);
                  this.dialogForm.invInfoPic.splice(i,1)
                  console.log(this.dialogForm.invInfoPic);
              }
          }
      },
      // 新增产品
      addProduct(){
          this.uid = nanoid()
          this.person = localStorage.user
          this.caseTags = JSON.stringify(this.dialogForm.caseTags)
          this.invInfoPic = JSON.stringify(this.dialogForm.invInfoPic)
          console.log(this.dialogForm);
          axios.get('http://127.0.0.1/productList/insproduct',{
              params:{
                  id:this.uid,
                  invcode:this.dialogForm.invCode,
                  invname:this.dialogForm.invName,
                  invstd:this.dialogForm.invStd,
                  invinfotext:this.dialogForm.invInfoText,
                  invinfopic:this.invInfoPic,
                  invpic:this.dialogForm.invPic,
                  invtags:this.dialogForm.invTags,
                  invtags2:this.dialogForm.invTags2,
                  notes:this.dialogForm.notes,
                  casetags:this.caseTags,
                  person:this.person
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
                  this.getProduct()  //刷新列表
              }else{
                  this.$message({
                      message:'提交失败',
                      type:'error'
                  })
              }
          }).catch(err=>{
              console.log('操作失败：'+err);
              this.$message({
                  message:'提交失败',
                  type:'error'
              })
          })
      },
      // 关闭新增用户弹窗
      closeAddDialog(){
          // console.log(this.dialogForm);
          // 删除已上传的图片
          if(this.dialogForm.invPic != ''){
              axios.post('http://127.0.0.1/deltrueurl',this.dialogForm)
              this.$refs.upload.clearData();
          }
          if(this.dialogForm.invInfoPic != []){
              axios.post('http://127.0.0.1/deltrueurllist',this.dialogForm)
              this.$refs.uploads.clearData();
          }
          this.dialogAdd = false;  //关闭弹窗
          this.dialogForm={
              id:'',invCode:'',invName:'',invStd:'',invPic:'',invTags:'',
              invTags2:'',caseTags:[],invInfoText:'',invInfoPic:[],notes:''
          };  //初始化数据
          this.getProduct()  //刷新列表
          ElMessage({
              type:'info',
              message:'取消操作'
          })
      },
      // 关闭修改用户弹窗
      closeUpdateDialog(){
          // console.log(this.dialogForm);
          // console.log(this.dialogFormBackup);
          this.$refs.dialogForm.resetFields()  //重置表单
          // 删除已上传的图片
          if(this.dialogForm.invPic != this.dialogFormBackup.invPic){
              axios.post('http://127.0.0.1/deltrueurl',this.dialogForm)
              this.$refs.upload2.clearData();
          }
          if(this.dialogForm.invInfoPic != this.dialogFormBackup.invInfoPic){
              // console.log(this.dialogForm.invInfoPic);
              for (let i = 0; i < this.dialogForm.invInfoPic.length; i++) {
                  const element = this.dialogForm.invInfoPic[i];
                  if(element === this.dialogFormBackup.invInfoPic[i]){
                      // console.log(element);
                      this.dialogForm.invInfoPic.splice(i,1)
                  }
              }
              // console.log(this.dialogForm.invInfoPic);
              axios.post('http://127.0.0.1/deltrueurllist',this.dialogForm)
              this.$refs.uploads2.clearData();
          }
          this.dialogForm={
              id:'',invCode:'',invName:'',invStd:'',invPic:'',invTags:'',
              invTags2:'',caseTags:[],invInfoText:'',invInfoPic:[],notes:''
          };  //初始化数据
          this.dialogUpdate = false;  //关闭弹窗
          this.getProduct()  //刷新列表
          ElMessage({
              type:'info',
              message:'取消操作'
          })
      },
      // 获取需要修改的用户信息
      getUpdateProduct(index){
          this.dialogUpdate = true
          this.dialogForm = this.tableData[index]
          const obj = JSON.parse(JSON.stringify(this.tableData[index]));
          this.dialogFormBackup = obj;
          // 修正分类数据
          this.dialogForm.invTags = this.tableData[index].tagId
          this.dialogForm.invTags2 = this.tableData[index].tag2Id
          this.dialogForm.caseTags = JSON.parse(this.tableData[index].caseTags)
          this.invPic = this.dialogForm.invPic
          this.invInfoPicForm = this.dialogForm.invInfoPic
          if(this.tableData[index].isDel === '有效'){
              this.dialogForm.isDel = true
          }else{
              this.dialogForm.isDel = false
          }
          // console.log(this.dialogForm);
          // console.log(this.filter1);
          this.getFilterList2(this.dialogForm.invTags)
          // console.log(this.filter2);
      },
      // 删除旧详情图
      delOldInfoPic(mes){
          for (let i = 0; i < this.dialogForm.invInfoPic.length; i++) {
              const element = this.dialogForm.invInfoPic[i];
              if(element === mes){
                  console.log(element);
                  this.dialogForm.invInfoPic.splice(i,1)
                  console.log(this.dialogForm.invInfoPic);
              }
          }
      },
      // 更新产品
      updateProductTest(){
          if(this.dialogForm.isDel === true){
              this.isDel = 1
          }else{
              this.isDel = 0
          }
          // console.log(this.isDel);
          this.caseTags = JSON.stringify(this.dialogForm.caseTags)
          this.invInfoPic = JSON.stringify(this.dialogForm.invInfoPic)
          axios.get('http://127.0.0.1/productList/updateproduct',{
              params:{
                  invcode: this.dialogForm.invCode,
                  invname: this.dialogForm.invName,
                  invstd: this.dialogForm.invStd,
                  invpic: this.dialogForm.invPic,
                  invtags: this.dialogForm.invTags,
                  invtags2: this.dialogForm.invTags2,
                  invinfotext: this.dialogForm.invInfoText,
                  invinfopic: this.invInfoPic,
                  casetags: this.caseTags,
                  notes: this.dialogForm.notes,
                  isdel: this.isDel,
                  person: localStorage.user,
                  id: this.dialogForm.id
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
                  this.getProduct()  //刷新列表
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
          // console.log(this.dialogForm);
      },
      // 删除产品
      delProduct(row){
          ElMessageBox.confirm(
              '确定删除该产品吗?',
              '删除产品',{
                  confirmButtonText: '确认',
                  cancelButtonText: '取消',
                  type: 'warning'
              }
          ).then(()=>{
              axios.get('http://127.0.0.1/productList/delproduct',{
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
                      this.getProduct()  //刷新列表
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
      },
      // 获取一级分类
      getFilterList(){
          axios.get('http://127.0.0.1/productList/filterlist').then(res=>{
              this.filter1 = res.data;
              // console.log(this.filter1);
          }).catch(err=>{
              console.log('数据获取失败'+err);
          })
      },
      // 获取二级分类
      getFilterList2(val){
          axios.get('http://127.0.0.1/productList/filterlist2',{
              params:{
                  filterfather:val
              }
          }).then(res=>{
              this.filter2 = res.data;
              // console.log(this.filter2);
          }).catch(err=>{
              console.log('数据获取失败'+err);
          })
      }
  },
  mounted(){
      this.getProduct(),
      this.getFilterList()
  },
  components:{
      upload,
      uploads
  }
}
</script>

<style>
.tablePic img{
  width: 100%;
}
.formPic{
  width: 146px;
  height: 146px;
}
.formInfoPic{
  width: 146px;
  height: auto;
}
/* .el-table td.el-table__cell{
  display: -webkit-box;
  -webkit-box-orient: vertical;
  overflow: hidden;
  -webkit-line-clamp: 2;
  text-overflow: ellipsis;
} */
</style>