<template>
  <div class="admin">
    <el-container>
      <!-- 头部 -->
      <el-header>
        <div class="logo">
          <img src="../assets/img/toplogo.png" alt="logo">
        </div>
        <el-button @click="logout" class="logout" type="danger">{{uname}}-退出登录</el-button>
      </el-header>
      <el-container class="adminView">
        <!-- 导航列表 -->
        <el-aside width="200px">
          <el-menu
          default-active="2"
          :router="router"
          class="adminMenu"
          >
            <el-menu-item index="/admin/user">用户管理</el-menu-item>
            <el-menu-item index="/admin/product">产品管理</el-menu-item>
            <el-menu-item index="/admin/news">文章管理</el-menu-item>
            <el-menu-item index="/admin/message">留言管理</el-menu-item>
            <el-menu-item index="/admin/banner">轮播图管理</el-menu-item>
            <el-menu-item index="/admin/casebanner">行业封面管理</el-menu-item>
            <el-menu-item index="/admin/downloads">下载文件管理</el-menu-item>
          </el-menu>
        </el-aside>
        <!-- 视图 -->
        <el-main style="border:1px solid #f2f2f2">
          <router-view />
        </el-main>
      </el-container>
    </el-container>
  </div>
</template>

<script>
export default{
  name:'admin',
  data(){
    return{ 
      router: true,
      uname:''
    }
  },
  methods:{
    logout(){
      localStorage.removeItem('token');
      localStorage.removeItem('user');
      // console.log(localStorage);
      this.$router.push({path:'/login'});
    }
  },
  mounted(){
    // console.log(localStorage);
    this.uname = localStorage.user
  }
}
</script>

<style>
.adminView{
  position: relative;
  /* width: 100vw; */
  height: calc(100vh - 60px);
}

/* 退出按钮 */
.logout{
  position: relative;
  top:50%;
  right: 5px;
  transform: translateY(-50%);
}

/* 导航列表 */
.adminMenu{
  background-color: #09244e;
  height: 100%;
}
.admin .el-menu-item{
  color: #fff;
}
.admin .el-menu-item:hover{
  background-color: #486ca4;
}
.admin .el-menu-item.is-active{
  background-color: #486ca4;
}
</style>