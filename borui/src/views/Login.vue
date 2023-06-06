<template>
    <div id="login">
      <div id="login-form" @keyup.enter="login">
        <h1>后台管理</h1>
          <label for="username"><i class="el-icon-user-solid" style="color: #c1c1c1"></i></label>
          <input type="text" placeholder="用户名" name="username" id="username" autocapitalize="off" v-model.trim=username aria-autocomplete="off">
          <label for="password"><i class="el-icon-right" style="color: #c1c1c1"></i></label>
          <input type="password" placeholder="密码" name="password" id="password" autocapitalize="off" v-model.trim="password">
          <div>
            <el-button type="primary" v-on:click="login">登录</el-button>
            <el-button type="info">重置</el-button>
          </div>
      </div>
    </div>
  </template>
  
  <script>
  import axios from 'axios'

  export default {
    name: "login",
    data() {
      return {
        username: '',
        password: '',
        error:''
      }
    },
    methods:{
        login(){
            axios.post('http://127.0.0.1/login',{
              username: this.username,
              password: this.password
            }).then(response =>{
              localStorage.setItem('token', response.data.token);
              this.$router.push({path:'/admin'});
            }).catch(error =>{
              if(error.response){
                this.error = error.response.data;
              }else if(error.request){
                this.error = 'Server not responding';
              }else{
                this.error = 'An error occurred';
              }
            })
        }
    }
  }
  </script>
  
  <style>
  #login {
    width: 100vw;
    height: 100vh;
    overflow: hidden;
    position: relative;
    background-image: url("../assets/img/home_do.jpg");
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-position: center;
    background-size: cover;
  }
  
  #login-form {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 50vw;
    min-width: 300px;
    max-width: 400px;
    display: flex;
    flex-direction: column;
    background-color: rgba(0, 0, 0, 0.7);
    border-radius: 15px;
    box-shadow: 0 15px 25px rgba(0, 0, 0, .5);
  }
  
    #login-form h1 {
      width: 60%;
      margin: 50px auto 20px;
      color: #c1c1c1;
      text-align: center;
    }
  
    #login-form input {
      width: 60%;
      margin: 15px auto;
      outline: none;
      border: none;
      padding: 10px;
      border-bottom: 1px solid #fff;
      background: transparent;
      color: white;
    }
  
    #login-form label {
      width: 60%;
      margin: 0 auto;
      position: relative;
      top: 30px;
      left: -15px;
    }
  
    #login-form div {
      width: 60%;
      margin: 10px auto;
      display: flex;
      justify-content: center;
      align-content: center;
    }
  
    #login-form button {
      background-color: rgba(9, 108, 144, 0.5);
      margin: 10px 25px 40px 25px;
    }
  
    #login-form p {
      width: 60%;
      margin: 8px auto;
      position: relative;
      left: -15px;
      color: #ff0000;
      font-size: 8px;
    }
  
  input {
    -webkit-text-fill-color: #ffffff !important;
    transition: background-color 5000s ease-in-out ,width 1s ease-out!important;
  }
  </style>
  