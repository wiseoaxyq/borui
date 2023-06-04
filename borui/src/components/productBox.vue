<template>
  <div class="tabItem">
    <div class="itemImg">
      <img :src="pic" alt="image">
    </div>
    <h2>{{title}}</h2>
  </div>
</template>
  
<script>
export default {
  name: "productBox",
  props: {
    title: {
      type: String,
      default: ""
    },
    pic: {
      type: String,
      default: "../src/assets/img/product.png"
    }
  }
};
  </script>
  
<style>
.tabItem{
    margin: 10px;
    /* padding-bottom: 10px; */
    background-color: #fff;
    border-radius: 10px;
    overflow: hidden;
}
.itemImg{
    overflow: hidden;
    background-image: url(../src/assets/img/product_bg.jpg);
    background-size: 100% 100%;
}
.itemImg img{
    width: 100%;
    transition: all 0.5s ease-in 0s;
}
.itemImg img:hover{
    transform: scale(110%);
    transition: all 0.5s ease-in;
}
.tabItem h2{
    font-size: 1em;
    padding: 10px 0px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    color: black;
}
</style>