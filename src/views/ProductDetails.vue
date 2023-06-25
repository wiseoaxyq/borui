<template>
    <div class="productdetails" v-for="item in product" :key="item.id">
        <el-row :gutter="20" justify="center">
            <el-col :span="12">
                <div class="picBox">
                    <img :src="item.invPic" alt="product" />
                </div>
            </el-col>
            <el-col :span="12">
                <div class="textBox">
                    <div class="title">
                       <h2>{{ item.invName }}</h2><h2>{{ item.invStd }}</h2> 
                    </div>
                    <div class="text">
                        <p v-html="item.invInfoText.replace(/\n/gm, '<br>')"></p>
                    </div>
                </div>
            </el-col>
            <el-col :span="24">
                <div class="productInfo" v-for="(val,key,index) in productInfoPic" :key="key">
                    <img :src="val" alt="">
                </div>
            </el-col>
        </el-row>
    </div>
</template>

<script>
import axios from 'axios';

    export default{
        name:'productdetails',
        data(){
            return{
                product:[],
                pid: '',
                productInfoPic:[]
            }
        },
        methods:{
            dataIdGet(id) {
                axios.get('http://127.0.0.1:3000/productList/getid',{
                    params:{
                        id: id
                    }
                }).then(res => {
                    // console.log(res.data);
                    this.product = res.data
                    // 产品详情图json字符串转json数组
                    this.productInfoPic = JSON.parse(res.data[0].invInfoPic)
                    // console.log(this.productInfoPic);
                }).catch(err => {
                    console.log("获取数据失败：" + err);
                })
            }
        },
        created(){
            this.pid = this.$route.params.id;
        },
        mounted(){
            this.dataIdGet(this.pid)
        }
    }
</script>

<style scoped>
.productdetails{
    margin: 0 auto;
    margin-top: 60px;
    width: 60%;
}
.picBox{
    border: 1px solid #d3d3d3;
    text-align: center;
    max-height: 600px;
    overflow: hidden;
}
.picBox img{
    width: 80%;
    height: auto;
}
.textBox{
    max-height: 600px;
}
.title{
    margin-bottom: 10px;
}
.text{
    line-height: 30px;
}
.productInfo{
    text-align: center;
    margin-top: 100px;
}
.productInfo img{
    width: 100%;
}
</style>