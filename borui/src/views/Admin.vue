<template>
  <div class="admin">
    this is admin.vue
    <el-button @click="logout">退出登录</el-button>
  </div>
</template>

<script>
export default{
  name:'admin',
  data(){
    return{

    }
  },
  methods:{
    logout(){
      localStorage.removeItem('token');
      // console.log(localStorage);
      this.$router.push({path:'/login'});
    }
  }
}
</script>

<style>
.admin{
  margin: 100px;
}
</style>