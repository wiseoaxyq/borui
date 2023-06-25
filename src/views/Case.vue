<template>
    <div class="case">
        <banner title="行业方案" bgc="../src/assets/img/advantage_2.jpg"></banner>
        <el-tabs v-model="tabName" @tab-change="getCaseProduct">
            <el-tab-pane label="食品行业" name="food">
                <!-- 应用概览 -->
                <div class="caseBox">
                    <h1>应用概览</h1>
                    <el-row :gutter="0">
                    <el-col :xs="12" :sm="8" v-for="(item,index) in caseUse.food" :key="index">
                        <productbox :pic="item.pic" :title="item.titleZh"></productbox>
                    </el-col>
                </el-row>
                </div>
                <!-- 应用视频 -->
                <div class="caseBox">
                    <h1>应用视频</h1>
                    <el-carousel height="500px" indicator-position="none" type="card" :autoplay="false">
                        <el-carousel-item>
                            <video src="../assets/img/test.mp4" controls></video>
                        </el-carousel-item>
                        <el-carousel-item>
                            <video src="../assets/img/test.mp4" controls></video>
                        </el-carousel-item>
                        <el-carousel-item>
                            <video src="../assets/img/test.mp4" controls></video>
                        </el-carousel-item>
                    </el-carousel>
                </div>
                <!-- 相关机型 -->
                <div class="caseBox">
                    <h1>相关机型</h1>
                    <el-row :gutter="0">
                        <el-col :xs="12" :sm="8" :md="6" v-for="(item, index) in productList" :key="index">
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
            </el-tab-pane>
            <el-tab-pane label="3C电子" name="3c">
                <!-- 应用概览 -->
                <div class="caseBox">
                    <h1>应用概览</h1>
                    <el-row :gutter="0">
                    <el-col :xs="12" :sm="8" v-for="(item,index) in caseUse.food" :key="index">
                        <productbox :pic="item.pic" :title="item.titleZh"></productbox>
                    </el-col>
                </el-row>
                </div>
                <!-- 应用视频 -->
                <div class="caseBox">
                    <h1>应用视频</h1>
                    <el-carousel height="500px" indicator-position="none" type="card" :autoplay="false">
                        <el-carousel-item>
                            <video src="../assets/img/test.mp4" controls></video>
                        </el-carousel-item>
                        <el-carousel-item>
                            <video src="../assets/img/test.mp4" controls></video>
                        </el-carousel-item>
                        <el-carousel-item>
                            <video src="../assets/img/test.mp4" controls></video>
                        </el-carousel-item>
                    </el-carousel>
                </div>
                <!-- 相关机型 -->
                <div class="caseBox">
                    <h1>相关机型</h1>
                    <el-row :gutter="0">
                        <el-col :xs="12" :sm="8" :md="6" v-for="(item, index) in productList" :key="index">
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
            </el-tab-pane>
            <el-tab-pane label="五金行业" name="hardware">
                <!-- 应用概览 -->
                <div class="caseBox">
                    <h1>应用概览</h1>
                    <el-row :gutter="0">
                    <el-col :xs="12" :sm="8" v-for="(item,index) in caseUse.hardware" :key="index">
                        <productbox :pic="item.pic" :title="item.titleZh"></productbox>
                    </el-col>
                </el-row>
                </div>
                <!-- 应用视频 -->
                <div class="caseBox">
                    <h1>应用视频</h1>
                    <el-carousel height="500px" indicator-position="none" type="card" :autoplay="false">
                        <el-carousel-item>
                            <video src="../assets/img/test.mp4" controls></video>
                        </el-carousel-item>
                        <el-carousel-item>
                            <video src="../assets/img/test.mp4" controls></video>
                        </el-carousel-item>
                        <el-carousel-item>
                            <video src="../assets/img/test.mp4" controls></video>
                        </el-carousel-item>
                    </el-carousel>
                </div>
                <!-- 相关机型 -->
                <div class="caseBox">
                    <h1>相关机型</h1>
                    <el-row :gutter="0">
                        <el-col :xs="12" :sm="8" :md="6" v-for="(item, index) in productList" :key="index">
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
            </el-tab-pane>
            <el-tab-pane label="包装印刷" name="solutions">
                <!-- 应用概览 -->
                <div class="caseBox">
                    <h1>应用概览</h1>
                    <el-row :gutter="0">
                    <el-col :xs="12" :sm="8" v-for="(item,index) in caseUse.solutions" :key="index">
                        <productbox :pic="item.pic" :title="item.titleZh"></productbox>
                    </el-col>
                </el-row>
                </div>
                <!-- 应用视频 -->
                <div class="caseBox">
                    <h1>应用视频</h1>
                    <el-carousel height="500px" indicator-position="none" type="card" :autoplay="false">
                        <el-carousel-item>
                            <video src="../assets/img/test.mp4" controls></video>
                        </el-carousel-item>
                        <el-carousel-item>
                            <video src="../assets/img/test.mp4" controls></video>
                        </el-carousel-item>
                        <el-carousel-item>
                            <video src="../assets/img/test.mp4" controls></video>
                        </el-carousel-item>
                    </el-carousel>
                </div>
                <!-- 相关机型 -->
                <div class="caseBox">
                    <h1>相关机型</h1>
                    <el-row :gutter="0">
                        <el-col :xs="12" :sm="8" :md="6" v-for="(item, index) in productList" :key="index">
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
            </el-tab-pane>
            <el-tab-pane label="新能源行业" name="newEnergy">
                <!-- 应用概览 -->
                <div class="caseBox">
                    <h1>应用概览</h1>
                    <el-row :gutter="0">
                    <el-col :xs="12" :sm="8" v-for="(item,index) in caseUse.newEnergy" :key="index">
                        <productbox :pic="item.pic" :title="item.titleZh"></productbox>
                    </el-col>
                </el-row>
                </div>
                <!-- 应用视频 -->
                <div class="caseBox">
                    <h1>应用视频</h1>
                    <el-carousel height="500px" indicator-position="none" type="card" :autoplay="false">
                        <el-carousel-item>
                            <video src="../assets/img/test.mp4" controls></video>
                        </el-carousel-item>
                        <el-carousel-item>
                            <video src="../assets/img/test.mp4" controls></video>
                        </el-carousel-item>
                        <el-carousel-item>
                            <video src="../assets/img/test.mp4" controls></video>
                        </el-carousel-item>
                    </el-carousel>
                </div>
                <!-- 相关机型 -->
                <div class="caseBox">
                    <h1>相关机型</h1>
                    <el-row :gutter="0">
                        <el-col :xs="12" :sm="8" :md="6" v-for="(item, index) in productList" :key="index">
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
            </el-tab-pane>
        </el-tabs>
    </div>
</template>

<script>
import banner from '../components/banner.vue';
import axios from 'axios'
import productbox from '../components/productBox.vue'

export default{
    name:'case',
    data(){
        return{
            tabName:'food',
            caseUse:{
                "food":[
                    {
                       titleZh:"食品行业解决方案",
                       titleEn:"Food Industry Solutions",
                       pic:"http://www.borui1698.com/uploadfile/image/20210930/20210930101938_839942849.jpg",
                    },
                    {
                       titleZh:"食品行业解决方案",
                       titleEn:"Food Industry Solutions",
                       pic:"http://www.borui1698.com/uploadfile/image/20210930/20210930101938_839942849.jpg",
                    },
                    {
                       titleZh:"食品行业解决方案",
                       titleEn:"Food Industry Solutions",
                       pic:"http://www.borui1698.com/uploadfile/image/20210930/20210930101938_839942849.jpg",
                    },
                    {
                       titleZh:"食品行业解决方案",
                       titleEn:"Food Industry Solutions",
                       pic:"http://www.borui1698.com/uploadfile/image/20210930/20210930101938_839942849.jpg",
                    },
                    {
                       titleZh:"食品行业解决方案",
                       titleEn:"Food Industry Solutions",
                       pic:"http://www.borui1698.com/uploadfile/image/20210930/20210930101938_839942849.jpg",
                    },
                    {
                       titleZh:"食品行业解决方案",
                       titleEn:"Food Industry Solutions",
                       pic:"http://www.borui1698.com/uploadfile/image/20210930/20210930101938_839942849.jpg",
                    },
                ],
                "3c":[
                    {
                       titleZh:"3C电子行业解决方案",
                       titleEn:"3C Electronics Industry Solutions",
                       pic:"http://www.borui1698.com/uploadfile/image/20210930/20210930101938_839942849.jpg",
                    },
                    {
                       titleZh:"3C电子行业解决方案",
                       titleEn:"3C Electronics Industry Solutions",
                       pic:"http://www.borui1698.com/uploadfile/image/20210930/20210930101938_839942849.jpg",
                    },
                    {
                       titleZh:"3C电子行业解决方案",
                       titleEn:"3C Electronics Industry Solutions",
                       pic:"http://www.borui1698.com/uploadfile/image/20210930/20210930101938_839942849.jpg",
                    }
                ],
                "hardware":[
                    {
                       titleZh:"五金行业解决方案",
                       titleEn:"Hardware Industry Solutions",
                       pic:"http://www.borui1698.com/uploadfile/image/20210930/20210930101938_839942849.jpg",
                    },
                    {
                       titleZh:"五金行业解决方案",
                       titleEn:"Hardware Industry Solutions",
                       pic:"http://www.borui1698.com/uploadfile/image/20210930/20210930101938_839942849.jpg",
                    },
                    {
                       titleZh:"五金行业解决方案",
                       titleEn:"Hardware Industry Solutions",
                       pic:"http://www.borui1698.com/uploadfile/image/20210930/20210930101938_839942849.jpg",
                    }
                ],
                "solutions":[
                    {
                       titleZh:"包装印刷行业解决方案",
                       titleEn:"Solutions for the Packaging and Printing Industry",
                       pic:"http://www.borui1698.com/uploadfile/image/20210930/20210930101938_839942849.jpg",
                    },
                    {
                       titleZh:"包装印刷行业解决方案",
                       titleEn:"Solutions for the Packaging and Printing Industry",
                       pic:"http://www.borui1698.com/uploadfile/image/20210930/20210930101938_839942849.jpg",
                    },
                    {
                       titleZh:"包装印刷行业解决方案",
                       titleEn:"Solutions for the Packaging and Printing Industry",
                       pic:"http://www.borui1698.com/uploadfile/image/20210930/20210930101938_839942849.jpg",
                    }
                ],
                "newEnergy":[
                    {
                       titleZh:"新能源行业解决方案",
                       titleEn:"New Energy Industry Solutions",
                       pic:"http://www.borui1698.com/uploadfile/image/20210930/20210930101938_839942849.jpg",
                    }
                ]
            },
            productList:[]
        }
    },
    methods:{
        getCaseProduct(name){
            axios.get('http://127.0.0.1:3000/productList/getcaseproduct',{
                params:{
                    casetags: name
                }
            }).then(res =>{
                // console.log(res.data);
                this.productList = res.data
            }).catch(err =>{
                console.log("获取数据失败"+err);
            })
        }
    },
    mounted(){
        this.getCaseProduct(this.tabName)
    },
    components:{
        banner,
        productbox
    }
}
</script>

<style>
.case{
    background-color: #f2f2f2;
}
.caseBox h1{
    padding: 50px 0;
    font-size: 36px; 
    text-align: center;
}

/* 应用概览 */
.caseBox .tabItem{
    background-image: none;
    padding: 10px;
}
.caseBox .tabItem h2{
    text-align: center;
    padding: 10px;
}

/* 应用视频 */
.caseBox video{
    width: 100%;
    height: 500px;
    /* border: 1px solid black; */
}

/* 相关机型 */
.caseBox .hotImg img{
    position: relative;
    left: 27%;
}
</style>