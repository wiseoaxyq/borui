<template>
    <div class="home">
        <!-- banner -->
        <el-carousel height="580px">
            <el-carousel-item v-for="(item, index) in homeBanner" :key="index">
                <img :src="item.pic" :alt="item.title">
            </el-carousel-item>
        </el-carousel>
        <!-- 产品中心 -->
        <div class="productCenter">
            <router-link to="product"><h1>产品中心</h1></router-link>
            <div class="xhx"></div>
            <el-tabs v-model="tabName" @tab-change="homeDataFilter">
                <el-tab-pane label="全自动点胶点漆机" name="101">
                    <el-row :gutter="20">
                        <el-col :span="6" v-for="item in productList.slice(0,4)" :key="item.id">
                            <router-link :to="{ name: 'productdetails', params: { id: item.id }}">
                            <div class="tabItem">
                                <div class="itemImg">
                                    <img :src="item.invPic" alt="image">
                                </div>
                                <h2>{{item.invName}}</h2>
                            </div>
                            </router-link>
                        </el-col>
                    </el-row>
                </el-tab-pane>
                <el-tab-pane label="全自动视觉点钻贴片机" name="201">
                    <el-row :gutter="20">
                        <el-col :span="6" v-for="item in productList.slice(0,4)" :key="item.id">
                            <router-link :to="{ name: 'productdetails', params: { id: item.id }}">
                            <div class="tabItem">
                                <div class="itemImg">
                                    <img :src="item.invPic" alt="image">
                                </div>
                                <h2>{{item.invName}}</h2>
                            </div>
                            </router-link>
                        </el-col>
                    </el-row>
                </el-tab-pane>
                <el-tab-pane label="全自动食品裱花机" name="301">
                    <el-row :gutter="20">
                        <el-col :span="6" v-for="item in productList.slice(0,4)" :key="item.id">
                            <router-link :to="{ name: 'productdetails', params: { id: item.id }}">
                            <div class="tabItem">
                                <div class="itemImg">
                                    <img :src="item.invPic" alt="image">
                                </div>
                                <h2>{{item.invName}}</h2>
                            </div>
                            </router-link>
                        </el-col>
                    </el-row>
                </el-tab-pane>
            </el-tabs>
        </div>
        <!-- 行业方案 -->
        <div class="homeCase">
            <router-link to="case"><h1>行业方案</h1></router-link>
            <div class="xhx"></div>
            <el-tabs model-value="first">
                <el-tab-pane label="食品行业" name="first">
                    <el-row :gutter="20">
                        <el-col :span="13" v-for="(item,index) in caseList" :key="index" v-show="item.tag === 'food'">
                            <div class="tabItemFirst">
                                <div class="tabItemFirstTitle">
                                    <h2>{{ item.titleZh }}</h2>
                                    <h2>{{ item.titleEn }}</h2>
                                </div>
                                <img :src="item.pic" alt="">
                            </div>
                        </el-col>
                        <el-col :span="10">
                            <el-row :gutter="20">
                                <el-col :span="12" v-for="(item,index) in caseProduct.slice(0,4)" :key="index" >
                                    <div class="tabItem">
                                        <h2>{{item.title}}</h2>
                                        <div class="itemImg">
                                            <img :src="item.pic" alt="image">
                                        </div>
                                    </div>
                                </el-col>
                            </el-row>
                        </el-col>
                    </el-row>
                </el-tab-pane>
                <el-tab-pane label="3C电子" name="second">
                    <el-row :gutter="20">
                        <el-col :span="13" v-for="(item,index) in caseList" :key="index" v-show="item.tag === '3c'">
                            <div class="tabItemFirst">
                                <div class="tabItemFirstTitle">
                                    <h2>{{ item.titleZh }}</h2>
                                    <h2>{{ item.titleEn }}</h2>
                                </div>
                                <img :src="item.pic" alt="">
                            </div>
                        </el-col>
                        <el-col :span="10">
                            <el-row :gutter="20">
                                <el-col :span="12" v-for="(item,index) in caseProduct.slice(0,4)" :key="index" >
                                    <div class="tabItem">
                                        <h2>{{item.title}}</h2>
                                        <div class="itemImg">
                                            <img :src="item.pic" alt="image">
                                        </div>
                                    </div>
                                </el-col>
                            </el-row>
                        </el-col>
                    </el-row>
                </el-tab-pane>
                <el-tab-pane label="五金行业" name="third">
                    <el-row :gutter="20">
                        <el-col :span="13" v-for="(item,index) in caseList" :key="index" v-show="item.tag === 'hardware'">
                            <div class="tabItemFirst">
                                <div class="tabItemFirstTitle">
                                    <h2>{{ item.titleZh }}</h2>
                                    <h2>{{ item.titleEn }}</h2>
                                </div>
                                <img :src="item.pic" alt="">
                            </div>
                        </el-col>
                        <el-col :span="10">
                            <el-row :gutter="20">
                                <el-col :span="12" v-for="(item,index) in caseProduct.slice(0,4)" :key="index" >
                                    <div class="tabItem">
                                        <h2>{{item.title}}</h2>
                                        <div class="itemImg">
                                            <img :src="item.pic" alt="image">
                                        </div>
                                    </div>
                                </el-col>
                            </el-row>
                        </el-col>
                    </el-row>
                </el-tab-pane>
                <el-tab-pane label="包装印刷" name="four">
                    <el-row :gutter="20">
                        <el-col :span="13" v-for="(item,index) in caseList" :key="index" v-show="item.tag === 'solutions'">
                            <div class="tabItemFirst">
                                <div class="tabItemFirstTitle">
                                    <h2>{{ item.titleZh }}</h2>
                                    <h2>{{ item.titleEn }}</h2>
                                </div>
                                <img :src="item.pic" alt="">
                            </div>
                        </el-col>
                        <el-col :span="10">
                            <el-row :gutter="20">
                                <el-col :span="12" v-for="(item,index) in caseProduct.slice(0,4)" :key="index" >
                                    <div class="tabItem">
                                        <h2>{{item.title}}</h2>
                                        <div class="itemImg">
                                            <img :src="item.pic" alt="image">
                                        </div>
                                    </div>
                                </el-col>
                            </el-row>
                        </el-col>
                    </el-row>
                </el-tab-pane>
                <el-tab-pane label="新能源行业" name="five">
                    <el-row :gutter="20">
                        <el-col :span="13" v-for="(item,index) in caseList" :key="index" v-show="item.tag === 'newEnergy'">
                            <div class="tabItemFirst">
                                <div class="tabItemFirstTitle">
                                    <h2>{{ item.titleZh }}</h2>
                                    <h2>{{ item.titleEn }}</h2>
                                </div>
                                <img :src="item.pic" alt="">
                            </div>
                        </el-col>
                        <el-col :span="10">
                            <el-row :gutter="20">
                                <el-col :span="12" v-for="(item,index) in caseProduct.slice(0,4)" :key="index" >
                                    <div class="tabItem">
                                        <h2>{{item.title}}</h2>
                                        <div class="itemImg">
                                            <img :src="item.pic" alt="image">
                                        </div>
                                    </div>
                                </el-col>
                            </el-row>
                        </el-col>
                    </el-row>
                </el-tab-pane>
            </el-tabs>
        </div>
        <!-- 核心优势 -->
        <div class="advantage">
            <h1>自主创新 专业品质</h1>
            <p>行走在行业技术前沿的柏锐，以推动行业技术发展进步为己任用持续的创新超越，创造行业新未来</p>
            <el-row :gutter="20" justify="center">
                <el-col :span="4">
                    <div class="advantageBox">
                        <img src="../assets/img/product_group_3_img.png" alt="image">
                        <div class="advantageText">
                            <el-icon :size="80"><TrophyBase /></el-icon>
                            <h3>品质柏锐</h3>
                            <p>卓越的品质，是走向世界的桥梁，对品质提升孜孜以求，以持续满足客户需求作为精益制造的源动力，多年制造经验累积，成就柏锐专业品质。</p>
                        </div>
                    </div>
                </el-col>
                <el-col :span="4">
                    <div class="advantageBox">
                        <img src="../assets/img/product_group_3_img.png" alt="image">
                        <div class="advantageText">
                            <el-icon :size="80"><EditPen /></el-icon>
                            <h3>创新柏锐</h3>
                            <p>柏锐的设备已覆盖了行业多个应用领域，拥有齐全的规格型号，不断满足着客户的个性化需求。并走出了一条国际合作，技术引进，自主创新的发展之路。</p>
                        </div>
                    </div>
                </el-col>
                <el-col :span="4">
                    <div class="advantageBox">
                        <img src="../assets/img/product_group_3_img.png" alt="image">
                        <div class="advantageText">
                            <el-icon :size="80"><DataLine /></el-icon>
                            <h3>高效柏锐</h3>
                            <p>通过创新管理方式和服务体系，打造了品质管控，科学管理，高效对接的内部协作流程，提升了客户服务效率及内部运行效率。</p>
                        </div>
                    </div>
                </el-col>
                <el-col :span="4">
                    <div class="advantageBox">
                        <img src="../assets/img/product_group_3_img.png" alt="image">
                        <div class="advantageText">
                            <el-icon :size="80"><Cpu /></el-icon>
                            <h3>智慧柏锐</h3>
                            <p>柏锐着力打造行业流延膜智造一体化系统平台，将自动化控制技术，设备制造流程与原料配方数据平台融合，为行业探索出了一条新型的智造之路。</p>
                        </div>
                    </div>
                </el-col>
            </el-row>
            <h1>实力智造·行业典范</h1>
            <p>依托深厚的技术积累，柏锐打造了技术引进，国际合作，自主研发相结合的模式，不断刷新着行业发展的新高度</p>
            <el-row justify="center">
                <el-col :span="6">
                    <div class="advantageBox2">
                        <img src="../assets/img/home_top.jpg" alt="image">
                        <div class="advantageText2">
                            <h3>国家高新技术企业</h3>
                            <p>国家高新技术企业，XX项发明专利，产品型号规格齐全，丰富的工艺配方数据库</p>
                        </div>
                    </div>
                </el-col>
                <el-col :span="10">
                    <div class="advantageBox2">
                        <img src="../assets/img/advantage_2.jpg" alt="image">
                        <div class="advantageText2">
                            <h3>智能技术推进行业发展</h3>
                            <p>卓越的品质，是走向世界的桥梁，对品质提升孜孜以求，以持续满足客户需求作为精益制造的源动力，多年制造经验累积，成就柏锐专业品质。</p>
                        </div>
                    </div>
                </el-col>
                <el-col :span="10">
                    <div class="advantageBox2">
                        <img src="../assets/img/advantage_3.jpg" alt="image">
                        <div class="advantageText2">
                            <h3>专业制造品质可靠</h3>
                            <p>技术团队经验丰富，现代化的生产基地，原装进口零部件，以严格的制造标准与品质检测</p>
                        </div>
                    </div>
                </el-col>
                <el-col :span="6">
                    <div class="advantageBox2">
                        <img src="../assets/img/advantage_4.jpg" alt="image">
                        <div class="advantageText2">
                            <h3>市场认可远销海外</h3>
                            <p>品牌和产品的认可度高，国际化市场开拓产品已远销全球多个国家与地区</p>
                        </div>
                    </div>
                </el-col>
            </el-row>
        </div>
        <!-- 新闻中心 -->
        <div class="homeNews">
            <router-link to="news"><h1>新闻中心</h1></router-link>
            <div class="xhx"></div>
            <el-row :gutter="20" justify="center">
                <el-col v-for="item in newsList.slice(0,2)" :key="item.id" v-show="item.newTags === '新闻资讯'" :span="6">
                    <el-tag type="info">新闻资讯</el-tag>
                    <div class="newBox">
                        <div class="newPic">
                            <img :src="item.newPic" alt="image">
                        </div>
                        <div class="newText">
                            <h3>{{ item.newTitle }}</h3>
                            <p>{{ Date(item.newDate) }}</p>
                        </div>
                    </div>
                </el-col>
                <el-col :span="6">
                    <el-tag type="info">行业动态</el-tag>
                    <el-scrollbar height="460px" always>
                        <ul>
                            <li v-for="item in newsList" :key="item.id" v-show="item.newTags === '行业动态'">
                                <div class="newText">
                                    <h3>{{ item.newTitle }}</h3>
                                    <p>{{ Date(item.newDate) }}</p>
                                </div>
                            </li>
                        </ul>
                    </el-scrollbar>
                </el-col>
            </el-row>
        </div>
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
import axios from 'axios'

export default{
    name:'home',
    data(){
        return{
            homeBanner:[
                    {pic:"http://www.borui1698.com/uploadfile/image/20220524/20220524141027_670735165.jpg", title:"全自动视觉点胶机"},
                    {pic:"http://www.borui1698.com/uploadfile/image/20220524/20220524141038_2087688612.jpg", title:"全自动视觉点钻机"},
                    {pic:"http://www.borui1698.com/uploadfile/image/20220524/20220524141058_502257188.jpg", title:"食品级裱花机"},
            ],
            caseProduct:[
                    {
                        title: "视觉点胶机",
                        pic: "http://www.borui1698.com/uploadfile/image/20180908/20180908110739_1085594107.jpg",
                        value: "first"
                    },
                    {
                        title: "视觉点胶机",
                        pic: "http://www.borui1698.com/uploadfile/image/20180908/20180908110739_1085594107.jpg",
                        value: "first"
                    },
                    {
                        title: "视觉点胶机",
                        pic: "http://www.borui1698.com/uploadfile/image/20180908/20180908110739_1085594107.jpg",
                        value: "first"
                    },
                    {
                        title: "视觉点钻机",
                        pic: "http://www.borui1698.com/uploadfile/image/20180908/20180908110739_1085594107.jpg",
                        value: "second"
                    },
                    {
                        title: "视觉点钻机",
                        pic: "http://www.borui1698.com/uploadfile/image/20180908/20180908110739_1085594107.jpg",
                        value: "second"
                    },
                    {
                        title: "视觉点钻机",
                        pic: "http://www.borui1698.com/uploadfile/image/20180908/20180908110739_1085594107.jpg",
                        value: "second"
                    },
                    {
                        title: "食品裱花机",
                        pic: "http://www.borui1698.com/uploadfile/image/20200922/20200922095723_1002932004.jpg",
                        value: "third"
                    },
                    {
                        title: "食品裱花机",
                        pic: "http://www.borui1698.com/uploadfile/image/20200922/20200922095723_1002932004.jpg",
                        value: "third"
                    },
                    {
                        title: "食品裱花机",
                        pic: "http://www.borui1698.com/uploadfile/image/20200922/20200922095723_1002932004.jpg",
                        value: "third"
                    },
                    {
                        title: "食品裱花机",
                        pic: "http://www.borui1698.com/uploadfile/image/20200922/20200922095723_1002932004.jpg",
                        value: "third"
                    }
            ],
            caseList:[
                    {
                       titleZh:"食品行业解决方案",
                       titleEn:"Food Industry Solutions",
                       pic:"http://www.borui1698.com/uploadfile/image/20210930/20210930101938_839942849.jpg",
                       tag:"food" 
                    },
                    {
                       titleZh:"3C电子行业解决方案",
                       titleEn:"3C Electronics Industry Solutions",
                       pic:"http://www.borui1698.com/uploadfile/image/20210930/20210930101938_839942849.jpg",
                       tag:"3c" 
                    },
                    {
                       titleZh:"五金行业解决方案",
                       titleEn:"Hardware Industry Solutions",
                       pic:"http://www.borui1698.com/uploadfile/image/20210930/20210930101938_839942849.jpg",
                       tag:"hardware" 
                    },
                    {
                       titleZh:"包装印刷行业解决方案",
                       titleEn:"Solutions for the Packaging and Printing Industry",
                       pic:"http://www.borui1698.com/uploadfile/image/20210930/20210930101938_839942849.jpg",
                       tag:"solutions" 
                    },
                    {
                       titleZh:"新能源行业解决方案",
                       titleEn:"New Energy Industry Solutions",
                       pic:"http://www.borui1698.com/uploadfile/image/20210930/20210930101938_839942849.jpg",
                       tag:"newEnergy" 
                    }
            ],
            newsList:[],
            tabName:'101',
            productList:[]
        }
    },
    methods:{
        homeDataFilter(name){
            axios.get('http://127.0.0.1/productList/getfilter',{
                params:{
                    invtags: name
                }
            }).then(res => {
                this.productList = res.data

            }).catch(err => {
                console.log("获取数据失败：" + err);
            })
        },
        homeNewsDataGet(name){
            axios.get('http://127.0.0.1/news/get',{
                params:{
                    newtags: this.tabName
                }
            }).then(res =>{
                this.newsList = res.data;
                console.log(this.newsList);
            }).catch(err =>{
                console.log("获取数据失败："+err);
            })
        }
    },
    mounted(){
        this.homeDataFilter(this.tabName)
        this.homeNewsDataGet()
    }
}
</script>

<style>
*{
    padding: 0;
    margin: 0;
}
a{
    color: black;
    text-decoration: none;
}
/* banner */
.el-carousel-item{
    position: relative;
}
.el-carousel img{
    /* width: 100%; */
    height: 580px;
    position: absolute;
    transform: translateX(-50%);
    left: 50%;
}

/* 产品中心 */
.productCenter, .homeCase, .homeNews, .advantage, .homeAbout{
    margin: 10px auto;
    padding: 100px 0;
    text-align: center;
    /* border: 1px solid; */
    background-color: #fff;
}
.productCenter h1, .homeCase h1, .homeNews h1, .advantage h1{
    font-size: 36px;
    margin: 10px;
}
.xhx{
    width: 50px;
    border-bottom: 2px solid #2662c5;
    margin: 0 auto;
}
.el-tabs{
    margin: 10px auto;
    width: 80%;
}
.el-tabs__item{
    font-size: 20px;
}
.tabItem{
    margin: 10px;
    /* padding-bottom: 10px; */
    background-color: #fff;
    border-radius: 10px;
    overflow: hidden;
}
.itemImg{
    overflow: hidden;
    background-image: url(../assets/img/product_bg.jpg);
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

/* 行业方案 */
.homeCase{
    background-image: url(../assets/img/case_bg.jpg);
    background-size: 100% 100%;
    background-repeat: no-repeat;
}
.homeCase h1{
    color: white;
}
.homeCase .el-tabs__item{
    color: white;
}
.homeCase .el-tabs__item:hover{
    color: #409eff;
}
.homeCase .el-tabs__item.is-active{
    color: #409eff;
}
.tabItemFirst{
    margin: 10px;
    position: relative;
    overflow: hidden;
}
.tabItemFirst img{
    width: 100%;
    height: 100%;
    padding: 0 0 15px 15px;
}
.tabItemFirstTitle{
    text-align: left;
    position: absolute;
    bottom: 25px;
    left: 25px;
}
.tabItemFirstTitle h2{
    font-size: 1.5em;
}

/* 新闻中心 */
.homeNews .el-col{
    /* border: 1px solid black; */
    text-align: left;
}
.newBox{
    height: 460px;
}
.newPic{
    height: 345px;
    overflow: hidden;
    position: relative;
}
.newPic img{
    /* width: 100%; */
    height: 100%;
    position: absolute;
    left: 50%;
    transform: translateX(-50%);
    transition: all 0.3s ease-in;
    /* object-fit: cover; */
}
.newBox:hover .newPic img{
    left: -50%;
    transform: scale(150%);
    transition: all 0.3s ease-in;
}
.newText{
    background-color: #f8f8f8;
    border-bottom: 1px solid #e5e5e5;
    height: 75px;
    padding: 20px;
    position: relative;
}
.newText:hover{
    background-color: #f2f2f2;
}
.newText h3{
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    color: black;
}
.newText p{
    color: rgb(129, 129, 129);
    margin-top: 10px;
    /* position: absolute; */
    /* bottom: 20px; */
    display: -webkit-box;
    -webkit-box-orient: vertical;
    overflow: hidden;
    -webkit-line-clamp: 2;
    text-overflow: ellipsis;
}

/* 核心优势 */
.advantage{
    background-color: #f2f2f2;
}
.advantage>p{
    margin-bottom: 50px;
}
.advantageBox{
    margin-bottom: 50px;
}
.advantageBox img{
    width: 100%;
    display: block;
}
.advantageText{
    margin: 0 auto;
    background-color: #fff;
    padding: 20px;
    padding-top: 60px;
    position: relative;
    height: 150px;
}
.advantageText h3{
    margin-bottom: 10px;
    color: #00358d;
}
.advantageText p{
    font-size: 14px;
}
.advantage .el-icon{
    background-color: #fff;
    border-radius: 50%;
    padding: 15px;
    position: absolute;
    top: -55px;
    left: 50%;
    margin-left: -55px;
}
.advantageBox2{
    margin: 3px;
    position: relative;
}
.advantageBox2 img{
    width: 100%;
    display: block;
    height: 280px;
}
.advantageText2{
    text-align: left;
    width: 80%;
    position: absolute;
    top: 48%;
    left: 20px;
    color: white;
}

/* 走进柏锐 */
.homeAbout{
    width: 100%;
    background-image: url(../assets/img/about.jpg);
    background-size: 100% 100%;
    background-repeat: no-repeat;
}
.aboutMes{
    text-align: left;
    font-size: 18px;
}
.aboutMes p{
    margin: 20px 10px;
    text-indent: 36px;
}
.aboutVideo video{
    width: 90%;
    height: 400px;
    /* border: 1px solid black; */
}
</style>