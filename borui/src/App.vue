<template>
  <div id="app">
    <el-container>
      <el-header class="menuFixed" v-if="$route.path !=='/login'">
        <div class="logo">
          <img src="./assets/img/toplogo.png" alt="logo">
        </div>
        <el-menu 
          :default-active="defaultActive"
          class="el-menu-demo"
          mode="horizontal"
          @select="handleSelect"
          :router="router"
          :ellipsis="false"
        >
          <!-- <el-menu-item class="logo"><img src="./assets/img/toplogo.png" alt="logo"></el-menu-item> -->
          <el-menu-item index="/">首页</el-menu-item>
          <el-menu-item index="/product">产品中心</el-menu-item>
          <!-- <el-sub-menu index="/product">
            <template #title>产品中心</template>
              <el-menu-item index="/product">全部产品</el-menu-item>
              <el-menu-item index="/productdetails">全自动点胶点漆机</el-menu-item>
              <el-menu-item index="/productdetails">全自动点钻机</el-menu-item>
              <el-menu-item index="/productdetails">全自动贴配机</el-menu-item>
              <el-menu-item index="/productdetails">食品裱花机</el-menu-item>
          </el-sub-menu> -->
          <el-menu-item index="/case">行业方案</el-menu-item>
          <el-menu-item index="/service">客户服务</el-menu-item>
          <el-menu-item index="/news">新闻资讯</el-menu-item>
          <el-menu-item index="/about">关于柏锐</el-menu-item>
          <el-menu-item index="/contact">联系我们</el-menu-item>
        </el-menu>
      </el-header>
      <el-main>
        <router-view></router-view>
      </el-main>
      <el-footer v-if="$route.path !=='/login'">
        <el-backtop :right="50" :bottom="100" />
        <div class="footerLogo">
          <img src="./assets/img/toplogo.png" alt="logo">
        </div>
        <ul class="content-nav">
          <li>
            <p>产品中心</p>
            <span>全自动点胶点漆机</span>
            <span>全自动视觉点钻贴片机</span>
            <span>全自动食品裱花机</span>
          </li>
          <li>
            <p>行业方案</p>
            <span>食品行业</span>
            <span>3C电子</span>
            <span>五金行业</span>
            <span>包装印刷</span>
            <span>新能源行业</span>
          </li>
          <li>
            <p>客户服务</p>
            <span>客户培训</span>
            <span>技术支持</span>
            <span>常见问题</span>
            <span>设备配件</span>
            <span>保养知识</span>
            <span>下载中心</span>
          </li>
          <li>
            <p>新闻资讯</p>
            <span>公司新闻</span>
            <span>行业动态</span>
          </li>
          <li>
            <p>关于柏锐</p>
            <span>企业介绍</span>
            <span>使命愿景</span>
            <span>企业风采</span>
            <span>荣誉资质</span>
          </li>
          <li class="appContact">
            <p>联系方式</p>
            <tr>
              <td class="conTitle">联系人：</td><td>崔小姐-</td><td>13712898815</td>
              
            </tr>
            <tr>
              <td class="conTitle"></td><td>易小姐-</td><td>13729337935</td>
            </tr>
            <tr>
              <td class="conTitle">电话：</td><td>0769-81303390</td>
            </tr>
            <tr>
              <td class="conTitle">邮箱：</td><td>dgljccd1698@163.com</td>
            </tr>
            <tr>
              <td class="conTitle">地址：</td><td>东莞市高埗镇振兴东二横路兆方资本工业园G栋1楼</td>
            </tr>
          </li>
        </ul>
      </el-footer>
    </el-container>
  </div>
</template>

<script>
  export default{
    data(){
      return{
        router: true,
        defaultActive: "/",
        isShow: false
      }
    },
    methods:{
      handleSelect(key){
        this.isShow = this.defaultActive != key;
        window.console.log(this.isShow)
      }
    },
    watch:{
      getScroll(){

      }
    }
  };
</script>

<style>
*{
  padding: 0;
  margin: 0;
}
#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
}

/* header */
.menuFixed{
  position: fixed;
  top: 0px;
  z-index: 999;
  background-color: #fff;
}

.el-header{
  display: flex;
  justify-content: space-between;
  align-content: center;
  width: 100%;
  /* margin: 5px auto; */
  padding: 0 20px;
}
.logo {
  width: 300px;
  /* height: 60px; */
  padding: 10px;
}
.logo img{
  width: 100%;
  /* height: 100%; */
  line-height: 60px;
}

/* main */
.el-main{
  margin: 0;
  padding: 0;
  overflow: hidden;
}

/* footer */
.footerLogo{
  width: 600px;
  margin-top: 20px;
}
.footerLogo img{
  width: 100%;
}
.el-footer{
  width: 100%;
  height: 500px;
  /* background-color: #0e2648; */
  background-color: #f2f2f2;
  color: #000000;
}
.content-nav{
  display: flex;
  justify-content: space-around;
  border-top: 1px solid #d4d4d4;
  margin-top: 20px;
}
.content-nav li{
  display: flex;
  flex-direction: column;
  padding: 20px;
  align-items: flex-start;
}
.content-nav li p{
  font-size: 20px;
  color: #000000;
  padding: 10px 0;
}
.content-nav li span {
  color: #444444c2;
  font-weight: 300;
  padding: 5px 0;
}
.appContact{
  width: 25%;
  /* margin-left: 60px; */
}
.appContact tr{
  line-height: 30px;
}
.conTitle{
  width: 70px;
}
</style>