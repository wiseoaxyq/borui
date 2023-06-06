<template>
    <div class="banner">
      <div class="mm">
        <img :src="bgc" alt="bg">
      </div>
      <div class="banner-title">
        <p>{{title}}</p>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    name: "Banner",
    props: {
      title: {
        type: String,
        default: ""
      },
      bgc: {
        type: String,
        default: "../src/assets/img/bgtop.jpg"
      }
    }
  };
  </script>
  
  <style>
    .banner {
        width: 100%;
        height: 300px;
        display: flex;
        position: relative;
        overflow: hidden;
        background-color: #fff;
        margin-bottom: 100px;
        margin-top: 70px;
    }
  
    .mm {
      position: absolute;
      width: 100%;
      height: 100%;
  
      padding: 10px;
      margin: -10px;
      filter: blur(3px);
  
      /* background-image: url(../assets/img/bgtop.jpg); */
      background-position: center;
      background-size: 100%;
    }
    .mm img{
      width: 100%;
    }
  
  
    .banner-title {
      position: absolute;
      color: #fff;
      font-size: 45px;
      font-weight: 400;
      line-height: 300px;
      text-align: center;
      width: 100%;
      /* mix-blend-mode: darken; */
      text-shadow: 2px 2px 10px gray;
    }
  </style>