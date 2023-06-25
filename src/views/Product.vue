<template>
    <div class="product">
        <!-- <banner title="产品中心" bgc="../src/assets/img/case_bg.jpg"></banner> -->
        <!-- <h1>产品中心</h1> -->
        <!-- <div class="xhx"></div> -->

        <!-- banner -->
        <el-carousel height="580px" class="homeBanner">
            <el-carousel-item v-for="item in homeBanner" :key="item.id">
                <img :src="item.url" :alt="item.notes">
            </el-carousel-item>
        </el-carousel>
        <!-- 热销产品 -->
        <div class="hot">
            <h1>热销机型</h1>
            <el-row :gutter="0" justify="center">
                <el-col :span="6" v-for="item in productList.slice(0,3)" :key="item.id">
                    <router-link :to="{ name: 'productdetails', params: { id: item.id }}">
                    <div class="hotItem">
                        <div class="hotImg">
                            <img :src="item.invPic" alt="image">
                            <h2>{{ item.invName }}</h2>
                            <p>查看详情 ></p>
                        </div>
                    </div>
                    </router-link>
                </el-col>
            </el-row>
        </div>
        <!-- 产品列表 -->
        <el-tabs v-model="tabName" @tab-change="dataFilter">
            <el-tab-pane label="全部产品" name="0">
                <el-row :gutter="0">
                    <el-col :xs="12" :sm="8" v-for="item in productList" :key="item.id">
                        <router-link :to="{ name: 'productdetails', params: { id: item.id }}">
                            <productbox :pic="item.invPic" :title="item.invName"></productbox>
                        </router-link>
                    </el-col>
                </el-row>
            </el-tab-pane>
            <el-tab-pane label="全自动点胶点漆机" name="101">
                <!-- 二级分类 -->
                <el-button class="filter2" v-for ="item in productFilter2" :key="item.id" @click="dataFilter2(item.filterId)">{{ item.filterName }}</el-button>
                <el-row :gutter="0">    
                    <el-col :xs="12" :sm="8" v-for="item in productList2" :key="item.id">
                        <router-link :to="{ name: 'productdetails', params: { id: item.id }}">
                            <productbox :pic="item.invPic" :title="item.invName"></productbox>
                        </router-link>
                    </el-col>
                </el-row>
            </el-tab-pane>
            <el-tab-pane label="全自动视觉点钻贴片机" name="201">
                <!-- 二级分类 -->
                <el-button class="filter2" v-for ="item in productFilter2" :key="item.id" @click="dataFilter2(item.filterId)">{{ item.filterName }}</el-button>
                <el-row :gutter="0">
                    <el-col :xs="12" :sm="8" v-for="item in productList2" :key="item.id">
                        <router-link :to="{ name: 'productdetails', params: { id: item.id }}">
                            <productbox :pic="item.invPic" :title="item.invName"></productbox>
                        </router-link>
                    </el-col>
                </el-row>
            </el-tab-pane>
            <el-tab-pane label="全自动食品裱花机" name="301">
                <!-- 二级分类 -->
                <el-button class="filter2" v-for ="item in productFilter2" :key="item.id" @click="dataFilter2(item.filterId)">{{ item.filterName }}</el-button>
                <el-row :gutter="0">
                    <el-col :xs="12" :sm="8" v-for="item in productList2" :key="item.id">
                        <router-link :to="{ name: 'productdetails', params: { id: item.id }}">
                            <productbox :pic="item.invPic" :title="item.invName"></productbox>
                        </router-link>
                    </el-col>
                </el-row>
            </el-tab-pane>
        </el-tabs>
        <!-- 走进柏锐 -->
        <div class="homeAbout">
            <!-- <h1>走进柏锐</h1>
            <p>About BoRui</p> -->
            <el-row :gutter="20">
                <el-col :span="9" :offset="13">
                    <div class="aboutMes">
                        <h1>东莞市柏锐智能科技有限公司</h1>
                        <p>东莞市柏锐智能科技有限公司成立于2008年，是一家专注于各种粘稠度流体非标设备的研发设计、生产制造及销售的生产厂家。公司有着19年的行业经验，拥有厂房1598平米，专业团队20余人。是国内极少数具有软硬件自主研发生产的源头厂家。</p>
                        <p>此外，公司被评为广东省高新技术企业，拥有拥有国家知识产权管理体系标准，欧盟CE认证，软件著作版权，发明专利，实用新型专利，外观专利等40+项荣誉证书。</p>
                        <p>公司主要产品有：视觉点胶机器人、视觉食品裱花机器人、视觉点钻机器人、视觉点胶贴辅机器人以及按照客户的工艺要求定制的机器。</p>
                    </div>
                </el-col>
                <el-col :span="9" :offset="13">
                    <div class="aboutVideo">
                        <video src="../assets/img/test.mp4" controls></video>
                    </div>
                </el-col>
            </el-row>
        </div>
    </div>
</template>

<script>
import axios from 'axios';
import banner from '../components/banner.vue'
import productbox from '../components/productBox.vue'

export default {
    name: 'product',
    data() {
        return {
            productList: [],
            productList2:[],
            productFilter2:[],
            // productHot:[],
            tabName:'0',
            homeBanner:[],
            bannerFilter:'product'
        }
    },
    methods: {
        // banner
        getBanner(){
            axios.get('http://127.0.0.1:3000/banner/getfilter',{
                params:{
                    filter: this.bannerFilter
                }
            }).then(res => {
                this.homeBanner = res.data
            }).catch(err => {
                console.log("获取数据失败：" + err);
            })
        },
        // 获取所有产品数据
        dataGet() {
            axios.get('http://127.0.0.1:3000/productList/get').then(res => {
                // console.log(res.data);
                this.productList = res.data

            }).catch(err => {
                console.log("获取数据失败：" + err);
            })
        },
        // 获取一级分类产品数据
        dataFilter(name){
            if(name === '0'){
                this.dataGet();
            }else{
                axios.get('http://127.0.0.1:3000/productList/getfilter',{
                    params:{
                        invtags: name
                    }
                }).then(res => {
                    // console.log(res.data);
                    this.productList = res.data
                    this.productList2 = res.data
                    this.tabName = name
                    this.filter2(name)
                }).catch(err => {
                    console.log("获取数据失败：" + err);
                })
            }
        },
        // 获取产品的二级分类
        filter2(key){
            axios.get('http://127.0.0.1:3000/productList/filter2',{
                params:{
                    filterfather: key
                }
            }).then(res =>{
                // console.log(res.data);
                this.productFilter2 = res.data
            }).catch(err =>{
                console.log("获取数据失败："+err);
            })
        },
        // 获取二级分类产品数据
        dataFilter2(key){
            // console.log(key);
            axios.get('http://127.0.0.1:3000/productList/getfilter2',{
                params:{
                    invtags2: key
                }
            }).then(res =>{
                // console.log(res.data);
                this.productList2 = res.data
            }).catch(err =>{
                console.log("获取数据失败："+err);
            })
        },
        // 获取热销产品数据
        // dataHot() {
        //     axios.get('http://127.0.0.1:3000/productList/getHot').then(res => {
        //         // console.log(res.data);
        //         this.productHot = res.data

        //     }).catch(err => {
        //         console.log("获取数据失败：" + err);
        //     })
        // },
    },
    mounted() {
        // onload加载所有数据
        this.getBanner()
        this.dataGet()
        // this.dataHot()
    },
    components:{
        banner,
        productbox
    }
}
</script>

<style>
.hot{
    background-color: #fff;
    padding-bottom: 50px;
    margin-bottom: 20px;
}
.hot h1{
    padding: 50px 0;
    font-size: 36px; 
}
.hotItem{
    /* border: 1px solid black; */
    margin: 10px;
    border-radius: 10px;
    overflow: hidden;
}
.hotImg{
    overflow: hidden;
    position: relative;
    text-align: left;
    background-image: url(../assets/img/product_bg.jpg);
    background-size: 100% 100%;
}
.hotImg img{
    width: 100%;
    z-index: 0;
    width: 100%;
    position: relative;
    left: 27%;
    transition: all 0.5s ease-in 0s;
}
.hotImg img:hover{
    transform: scale(110%);
    transition: all 0.5s ease-in;
}
.hotImg h2{
    position: absolute;
    z-index: 2;
    top: 0px;
    padding: 20px;
}
.hotImg p{
    position: absolute;
    z-index: 2;
    bottom: 0;
    padding: 20px;
}

.product{
    background-color: #f2f2f2;
    /* margin: 10px auto; */
    text-align: center;
}
/* .product h1{
    font-size: 36px;
    margin: 10px;
} */
/* .product .tabItem{
    padding: 30px 10px;
} */
.product .tabItem h2{
    margin: 5px 0;
}
.filter2{
    border: none;
    padding: 20px;
    background-color: #205183;
    color: white;
    margin: 25px 0.5px !important;
    border-radius: 0%;
}
</style>