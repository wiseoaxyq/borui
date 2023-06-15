<template>
    <div>
        <el-upload
            class="avatar-uploader"
            action="http://127.0.0.1/upload"
            :show-file-list="true"
            :file-list="files"
            :on-success="handleAvatarSuccess"
            :before-upload="beforeAvatarUpload"
            :on-remove="handleRemove"
            :limit="1"
        >
            <img v-if="imageUrl" :src="imageUrl" class="avatar" />
            <el-icon v-else class="avatar-uploader-icon"><Plus /></el-icon>
        </el-upload>
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
            imageUrl: '',
            trueUrl:'',
            files:[]
        }
    },
    methods:{
        // 回调：图片上传成功后的
        handleAvatarSuccess(response,uploadFile){
            this.imageUrl = URL.createObjectURL(uploadFile.raw)
            // console.log(response);
            this.trueUrl = response
            // 子传父
            this.$emit('uploadSuccess',this.trueUrl)
        },
        // 回调：图片上传前，检查类型和大小
        beforeAvatarUpload(rawFile){
            if (rawFile.type !== 'image/png') {
                this.$message.error('图片类型需要为 PNG')
                return false
            }else if (rawFile.size / 1024 / 1024 > 2) {
                this.$message.error('图片大小不能大于 2M')
                return false
            }
            return true
        },
        // 回调：删除照片
        handleRemove(uploadFile){
          this.$emit('uploadDel',uploadFile.response);
          this.imageUrl = ''
          // console.log(this.files);
          axios.post('http://127.0.0.1/delfiles', uploadFile).then(res=>{
            console.log(res.data);
          })
        },
        clearData(){
          // console.log(this.files);
          this.imageUrl = ''  // 清除预览图
          this.files=[]  //清除文件列表
        }
    }
}
</script>

<style scoped>
.avatar-uploader .avatar {
  width: 146px;
  height: 146px;
  display: block;
}
</style>

<style>
.avatar-uploader .el-upload {
  border: 1px dashed var(--el-border-color);
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
  transition: var(--el-transition-duration-fast);
}

.avatar-uploader .el-upload:hover {
  border-color: var(--el-color-primary);
}

.el-icon.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 146px;
  height: 146px;
  text-align: center;
}
</style>