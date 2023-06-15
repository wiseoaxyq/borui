<template>
    <div class="productdetails" v-for="item in product" :key="item.id">
        <img :src="item.invPic" alt="">
        <p>{{ item.invName }}</p>
        <p>{{ item.invStd }}</p>
        <div class="productInfo" v-for="(val,key,index) in productInfo" :key="key">
            <p>{{ val }}</p>
        </div>
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
                productInfo:[]
            }
        },
        methods:{
            dataIdGet(id) {
                axios.get('http://127.0.0.1/productList/getid',{
                    params:{
                        id: id
                    }
                }).then(res => {
                    // console.log(res.data);
                    this.product = res.data
                    // 产品介绍json字符串转json对象赋值给前端
                    this.productInfo =  JSON.parse(res.data[0].invInfo)
                    // console.log(res.data);
                    // console.log(this.product);
                    // console.log(this.productInfo);
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