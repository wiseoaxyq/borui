<template>
    <div class="about">
        <banner title="关于柏锐" bgc="../src/assets/img/about2.jpg"></banner>
        <el-tabs v-model="tabName">
            <el-tab-pane label="企业介绍" name="0">
                <div class="aboutBanner">
                    <img src="../assets/img/home_top2.jpg" alt="">
                </div>
                <el-row justify="center">
                    <el-col :span="12" class="aboutText">
                        <el-scrollbar height="640px">
                        <h1>东莞市柏锐智能科技有限公司</h1>
                        <p>东莞市柏锐智能科技有限公司成立于2008年，是一家专注于各种粘稠度流体非标设备的研发设计、生产制造及销售的生产厂家。公司有着19年的行业经验，拥有厂房1598平米，专业团队20余人。是国内极少数具有软硬件自主研发生产的源头厂家。</p>
                        <p>此外，公司被评为广东省高新技术企业，拥有拥有国家知识产权管理体系标准，欧盟CE认证，软件著作版权，发明专利，实用新型专利，外观专利等40+项荣誉证书。</p>
                        <p>公司主要产品有：视觉点胶机器人、视觉食品裱花机器人、视觉点钻机器人、视觉点胶贴辅机器人以及按照客户的工艺要求定制的机器。</p>
                        <p>1、柏锐愿景：视觉设备引领全球。</p>
                        <p>2、柏锐理念：共创，共担，共赢。</p>
                        <p>3、柏锐精神：勤奋，真诚，团结，精进。</p>
                        <p>4、柏锐使命：为客户创造利益，为团队搭建平台，为社会创造价值。</p>
                        <p>5、柏锐提倡：知行合一，止行于善。</p>
                        </el-scrollbar>
                    </el-col>
                    <el-col :span="12" class="aboutPicBox">
                        <div class="aboutPic">
                            <img src="../assets/img/jianjietopmin.jpg" alt="">
                        </div>
                        <div class="aboutPic">
                            <img src="../assets/img/home_do.jpg" alt="">
                        </div>
                    </el-col>
                </el-row>
            </el-tab-pane>
            <el-tab-pane label="使命愿景" name="1">
                <el-row justify="center">
                    <el-col :span="24">
                        <div class="aboutBox aboutAdvantageBox">
                            <img src="../assets/img/bgtop.jpg" alt="image">
                            <div class="aboutAdvantageText">
                                <h3>柏锐愿景</h3>
                                <p>视觉设备引领全球。</p>
                            </div>
                        </div>
                    </el-col>
                    <el-col :span="10">
                        <div class="aboutBox aboutAdvantageBox">
                            <img src="../assets/img/home_top.jpg" alt="image">
                            <div class="aboutAdvantageText">
                                <h3>柏锐理念</h3>
                                <p>共创，共担，共赢。</p>
                            </div>
                        </div>
                    </el-col>
                    <el-col :span="14">
                        <div class="aboutBox aboutAdvantageBox">
                            <img src="../assets/img/advantage_2.jpg" alt="image">
                            <div class="aboutAdvantageText">
                                <h3>柏锐精神</h3>
                                <p>勤奋，真诚，团结，精进。</p>
                            </div>
                        </div>
                    </el-col>
                    <el-col :span="14">
                        <div class="aboutBox aboutAdvantageBox">
                            <img src="../assets/img/advantage_3.jpg" alt="image">
                            <div class="aboutAdvantageText">
                                <h3>柏锐使命</h3>
                                <p>为客户创造利益，为团队搭建平台，为社会创造价值。</p>
                            </div>
                        </div>
                    </el-col>
                    <el-col :span="10">
                        <div class="aboutBox aboutAdvantageBox">
                            <img src="../assets/img/advantage_4.jpg" alt="image">
                            <div class="aboutAdvantageText">
                                <h3>柏锐提倡</h3>
                                <p>知行合一，止行于善。</p>
                            </div>
                        </div>
                    </el-col>
                </el-row>
            </el-tab-pane>
            <el-tab-pane label="企业风采" name="2">
                <el-row justify="center" class="about2">
                    <el-col :span="16">
                        <div class="aboutBox about2Pic">
                            <img src="../assets/img/home_top3.jpg" alt="">
                        </div>
                    </el-col>
                    <el-col :span="8">
                        <div class="aboutBox about2Text">
                            <div class="about2TextTop">
                                <h1>办公环境</h1>
                                <p>宽敞明亮的办公室，充满了浓厚的文化底蕴，倾洒的阳光让办公环境富有生气，让整个办公空间瞬间变得灵动，仿佛有一股新鲜的气息冲击着。</p>
                            </div>
                            <div class="about2TextFooter">
                                <h1>办公楼 <el-icon><CaretBottom /></el-icon></h1>
                            </div>
                        </div>
                    </el-col>
                    <el-col :span="8">
                        <div class="aboutBox about2Pic">
                            <img src="../assets/img/home_top3.jpg" alt="">
                        </div>
                    </el-col>
                    <el-col :span="8">
                        <div class="aboutBox about2Pic">
                            <img src="../assets/img/home_top3.jpg" alt="">
                        </div>
                    </el-col>
                    <el-col :span="8">
                        <div class="aboutBox about2Pic">
                            <img src="../assets/img/home_top3.jpg" alt="">
                        </div>
                    </el-col>
                </el-row>
                <el-row justify="center" class="about2">
                    <el-col :span="16">
                        <div class="aboutBox about2Pic">
                            <img src="../assets/img/home_top3.jpg" alt="">
                        </div>
                    </el-col>
                    <el-col :span="8">
                        <div class="aboutBox about2Text">
                            <div class="about2TextTop">
                                <h1>车间环境</h1>
                                <p>东莞市柏锐智能科技有限公司，专注于各种粘稠度流体非标设备的研发设计、生产制造及销售的生产厂家，从创立伊始就建立了集产品设计，研发，制造，销售，服务为一体的点胶机组专业制造模式，能满足不同企业客户的个性化需求。</p>
                            </div>
                            <div class="about2TextFooter">
                                <h1>车间一角 <el-icon><CaretBottom /></el-icon></h1>
                            </div>
                        </div>
                    </el-col>
                    <el-col :span="8">
                        <div class="aboutBox about2Pic">
                            <img src="../assets/img/home_top3.jpg" alt="">
                        </div>
                    </el-col>
                    <el-col :span="8">
                        <div class="aboutBox about2Pic">
                            <img src="../assets/img/home_top3.jpg" alt="">
                        </div>
                    </el-col>
                    <el-col :span="8">
                        <div class="aboutBox about2Pic">
                            <img src="../assets/img/home_top3.jpg" alt="">
                        </div>
                    </el-col>
                </el-row>
                <el-row justify="center" class="about2">
                    <el-col :span="16">
                        <div class="aboutBox about2Pic">
                            <img src="../assets/img/home_top3.jpg" alt="">
                        </div>
                    </el-col>
                    <el-col :span="8">
                        <div class="aboutBox about2Text">
                            <div class="about2TextTop">
                                <h1>精英团队</h1>
                                <p>公司自成立至今，形成了一支由机械硬件设计师，自动化软件高级工程师，技术检测工程师，专业营销人员，售后技术服务专员等组成的富有责任，诚信，敬业精神的团队。凭借专业能力和服务精神，立足行业使用需求为客户提供性能稳定，技术优良的机组设备。</p>
                            </div>
                            <div class="about2TextFooter">
                                <h1>生产团队 <el-icon><CaretBottom /></el-icon></h1>
                            </div>
                        </div>
                    </el-col>
                    <el-col :span="8">
                        <div class="aboutBox about2Pic">
                            <img src="../assets/img/home_top3.jpg" alt="">
                        </div>
                    </el-col>
                    <el-col :span="8">
                        <div class="aboutBox about2Pic">
                            <img src="../assets/img/home_top3.jpg" alt="">
                        </div>
                    </el-col>
                    <el-col :span="8">
                        <div class="aboutBox about2Pic">
                            <img src="../assets/img/home_top3.jpg" alt="">
                        </div>
                    </el-col>
                </el-row>
            </el-tab-pane>
            <el-tab-pane label="荣誉资质" name="3">
                <el-row class="about2">
                    <el-col :span="8">
                        <div class="aboutBox about3Pic">
                            <img src="../assets/img/patent/2.jpg" alt="">
                        </div>
                    </el-col>
                    <el-col :span="8">
                        <div class="aboutBox about3Pic">
                            <img src="../assets/img/patent/3.jpg" alt="">
                        </div>
                    </el-col>
                    <el-col :span="8">
                        <div class="aboutBox about3Pic">
                            <img src="../assets/img/patent/4.jpg" alt="">
                        </div>
                    </el-col>
                    <el-col :span="8">
                        <div class="aboutBox about3Pic">
                            <img src="../assets/img/patent/5.jpg" alt="">
                        </div>
                    </el-col>
                    <el-col :span="8">
                        <div class="aboutBox about3Pic">
                            <img src="../assets/img/patent/6.jpg" alt="">
                        </div>
                    </el-col>
                    <el-col :span="8">
                        <div class="aboutBox about3Pic">
                            <img src="../assets/img/patent/7.jpg" alt="">
                        </div>
                    </el-col>
                    <el-col :span="8">
                        <div class="aboutBox about3Pic">
                            <img src="../assets/img/patent/8.jpg" alt="">
                        </div>
                    </el-col>
                    <el-col :span="8">
                        <div class="aboutBox about3Pic">
                            <img src="../assets/img/patent/9.jpg" alt="">
                        </div>
                    </el-col>
                    <el-col :span="8">
                        <div class="aboutBox about3Pic">
                            <img src="../assets/img/patent/10.jpg" alt="">
                        </div>
                    </el-col>
                    <el-col :span="8">
                        <div class="aboutBox about3Pic">
                            <img src="../assets/img/patent/11.jpg" alt="">
                        </div>
                    </el-col>
                    <el-col :span="8">
                        <div class="aboutBox about3Pic">
                            <img src="../assets/img/patent/12.jpg" alt="">
                        </div>
                    </el-col>
                    <el-col :span="8">
                        <div class="aboutBox about3Pic">
                            <img src="../assets/img/patent/13.jpg" alt="">
                        </div>
                    </el-col>
                    <el-col :span="8">
                        <div class="aboutBox about3Pic">
                            <img src="../assets/img/patent/14.jpg" alt="">
                        </div>
                    </el-col>
                    <el-col :span="8">
                        <div class="aboutBox about3Pic">
                            <img src="../assets/img/patent/15.jpg" alt="">
                        </div>
                    </el-col>
                    <el-col :span="8">
                        <div class="aboutBox about3Pic">
                            <img src="../assets/img/patent/16.jpg" alt="">
                        </div>
                    </el-col>
                    <el-col :span="8">
                        <div class="aboutBox about3Pic">
                            <img src="../assets/img/patent/17.jpg" alt="">
                        </div>
                    </el-col>  
                </el-row>
            </el-tab-pane>
        </el-tabs>
    </div>
</template>

<script>
import banner from '../components/banner.vue'

export default{
    name:'about',
    data(){
        return{
            tabName:'0'
        }
    },
    components:{
        banner
    }
}
</script>

<style>
.about{
    padding-bottom: 100px;
}
.aboutBox{
    margin: 3px;
}

/* 企业介绍 */
.aboutBanner{
    max-height: 500px;
    overflow: hidden;
    margin-bottom: 10px;
}
.aboutBanner img{
    width: 100%;
}
.aboutText{
    height: 700px;
    background-color: #f8f8f8;
    line-height: 50px;
    padding: 30px;
    box-sizing: border-box;
    /* overflow: scroll; */
}
.aboutPic{
    max-height: 350px;
    overflow: hidden;
}
.aboutPic img{
    width: 100%;
    height: 350px;
}

/* 使命愿景 */
.aboutAdvantageBox{
    position: relative;
    overflow: hidden;
    max-height: 300px;
}
.aboutAdvantageBox img{
    width: 100%;
    display: block;
    height: 300px;
}
.aboutAdvantageText{
    text-align: left;
    width: 80%;
    position: absolute;
    top: 48%;
    left: 20px;
    color: white;
}

/* 企业风采 */
.about2Pic{
    height: 400px;
    overflow: hidden;
}
.about2Pic img{
    width: 100%;
}
.about2Text{
    background-color: #f8f8f8;
    height: 300px;
    padding: 50px 0;
}
.about2TextTop{
    height: 250px;
    padding: 0 50px;
}
.about2TextFooter{
    height: 100px;
    line-height: 100px;
    background-color: #14448f;
    color: white;
    padding: 0 50px;
}
.about2TextTop h1{
    margin-bottom: 20px;
}
.about2{
    margin-bottom: 100px;
}

/* 荣誉资质 */
.about3Pic{
    overflow: hidden;
}
.about3Pic img{
    width: 100%;
    transform: scale(110%);
    transition: all 0.3s ease-in 0s;
}
.about3Pic img:hover{
    transform: scale(120%);
    transition: all 0.3s ease-in 0s;
}
</style>