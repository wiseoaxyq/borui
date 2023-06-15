<template>
    <div>
        <el-upload
          v-model:file-list="imageUrl"
          action="http://127.0.0.1/upload"
          list-type="picture-card"
          :on-preview="handlePictureCardPreview"
          :on-remove="handleRemove"
          :on-success="handleAvatarSuccess"
        >
          <el-icon><Plus /></el-icon>
        </el-upload>

        <el-dialog v-model="dialogVisible">
          <img w-full :src="dialogImageUrl" alt="Preview Image" />
        </el-dialog>
    </div>
</template>

<!-- <script lang="ts" setup>
import { ref } from 'vue'
import { ElMessage } from 'element-plus'
import { Plus } from '@element-plus/icons-vue'

import type { UploadProps } from 'element-plus'

// 保存图片内存中的临时地址
const imageUrl = ref('')

// 回调：图片上传成功后的
const handleAvatarSuccess: UploadProps['onSuccess'] = (
  response,
  uploadFile
) => {
  imageUrl.value = URL.createObjectURL(uploadFile.raw!)
//   console.log(uploadFile.response);
}

// 回调：图片上传前，检查类型和大小
const beforeAvatarUpload: UploadProps['beforeUpload'] = (rawFile) => {
  if (rawFile.type !== 'image/png') {
    ElMessage.error('Avatar picture must be PNG format!')
    return false
  } else if (rawFile.size / 1024 / 1024 > 2) {
    ElMessage.error('Avatar picture size can not exceed 2MB!')
    return false
  }
  return true
}
</script> -->

<script>
import axios from 'axios'

export default{
    data(){
        return{
            // 保存图片内存中的临时地址
            imageUrl: [],
            trueUrl:[],
            dialogVisible: false,
            dialogImageUrl:[],
            files:[]
        }
    },
    methods:{
        // // 回调：图片上传成功后的
        handleAvatarSuccess(response,uploadFile){
            // console.log(response);
            this.trueUrl = response
            // 子传父
            this.$emit('uploadSuccess',this.trueUrl)
        },
        
        // // 回调：图片上传前，检查类型和大小
        // beforeAvatarUpload(rawFile){
        //     if (rawFile.type !== 'image/png') {
        //         this.$message.error('图片类型需要为 PNG')
        //         return false
        //     }else if (rawFile.size / 1024 / 1024 > 2) {
        //         this.$message.error('图片大小不能大于 2M')
        //         return false
        //     }
        //     return true
        // },

        // 回调：删除照片
        handleRemove(uploadFile){
          // console.log(uploadFile);
          this.$emit('uploadDel',uploadFile.response);
          axios.post('http://127.0.0.1/delfiles', uploadFile).then(res=>{
            console.log(res.data);
          });
        },
        handlePictureCardPreview(uploadFile){
          this.dialogImageUrl = uploadFile.response
          console.log(this.dialogImageUrl);
          this.dialogVisible = true
        },
        clearData(){
          // console.log(this.imageUrl)
          this.imageUrl=[]
        }
    }
}
</script>

<style scoped>
.avatar-uploader .avatar {
  width: 178px;
  height: 178px;
  display: block;
}
</style>

<style>
</style>