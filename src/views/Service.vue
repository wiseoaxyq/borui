<template>
    <div class="service">
        <banner title="服务中心" bgc="../src/assets/img/contact.jpg"></banner>
        <el-tabs v-model="tabName">
            <el-tab-pane label="客户培训" name="0" class="serverBox">
                <h1>全面丰富的培训课程 专家讲师全程跟进</h1>
                <div class="iconBox">
                    <div class="serverIconBox" v-for="(item,index) in iconList" :key="index">
                        <div class="serverIcon">
                            <img :src="item.icon" alt="image">
                        </div>
                        <p>{{ item.title }}</p>
                    </div>
                </div>
                <h1>培训政策</h1>
                <el-row justify="center">
                    <el-col :xs="24" :sm="12" class="aboutText">
                        <el-scrollbar height="640px">
                        <h3>用户培训内容:</h3>
                        <p>1、用户培训是市场服务体系的重要环节。除了前期和客户充分的技术交流，创轩激光通常会在客户验收时对其进行完整的技术培训。+项荣誉证书。</p>
                        <p>2、讲解设备的主要性能、结构及原理。</p>
                        <p>3、讲解设备的安全防护知识、注意事项。</p>
                        <p>4、培训开关机顺序，日常维护以及简单故障的排除。</p>
                        <p>5、常规部件、易损件的更换方法、注意事项。</p>
                        <p>6、培训各种相关软件的使用以及加工工艺参数、方法。</p>
                        <p>用户培训形式:现场培训、远程指导、视频教程等。</p>
                        <h3>小贴士：</h3>
                        <p>1、国内客户送货上门、安装及调试，提供免费培训。</p>
                        <p>2、对所售产品实行一年免费保修，终身维护，并为配套的控制软件提供免费的升级服务。</p>
                        <p>3、不定期安排工程师免费上门检查、维护设备，对所售设备实行全天候服务。</p>
                        </el-scrollbar>
                    </el-col>
                    <el-col :xs="0" :sm="12" class="aboutPicBox">
                        <div class="aboutPic">
                            <img src="../assets/img/jianjietopmin.jpg" alt="">
                        </div>
                        <div class="aboutPic">
                            <img src="../assets/img/home_do.jpg" alt="">
                        </div>
                    </el-col>
                </el-row>
            </el-tab-pane>
            <el-tab-pane label="技术支持" name="1" class="serverBox">
                <div style="margin: 20px 0px;">
                    <h2 style="margin: 10px 0;">这里所有的柏锐人都必将竭诚为您服务</h2>
                    <p>创轩激光专注于电子、服装、广告、金属制品、家具制品、工艺制品等广泛行业中的激光打标、切割等运用设备的研发与制造，提供顶级成套流水线解决方案，非标产品的订制及其解决方案等。十年市场运作经验累积，已为全球几十个国家和地区的用户量身定制出经济效益分析报告，在此基础上优化工艺设备和生产流程，实现了业务的可持续发展。</p>
                </div>
                <el-row>
                    <el-col :xs="24" :sm="12" v-for="(item,index) in supportText" :key="index">
                        <div class="supportBox">
                            <h3 style="margin-bottom: 10px;">{{ item.title }}</h3>
                            <p>{{ item.t1 }}</p>
                            <p>{{ item.t2 }}</p>
                        </div>
                    </el-col>
                </el-row>
                <div style="margin: 20px 0px;">
                    <h2 style="margin: 10px 0;">完善细致的服务流程</h2>
                    <p>我们以客户利益为本，以服务为核心，为客户量身打造高性价比的产品，提供完善细致的服务，十年如一日</p>
                </div>
                <el-row>
                    <el-col :xs="16" :sm="16" :md="12">
                        <div class="supportBox2Bg"></div>
                    </el-col>
                    <el-col :xs="8" :sm="8" :md="6" v-for="(item,index) in supportText2" :key="index">
                        <div class="supportBox2">
                            <div>
                                <h3>{{ item.title }}</h3>
                                <p>{{ item.t1 }}</p>
                            </div>
                        </div>
                    </el-col>
                </el-row>

            </el-tab-pane>
            <el-tab-pane label="常见问题" name="2" class="serverBox">
                <el-collapse model-value="1" accordion>
                <el-collapse-item title="我不会操作机器，也不懂技术怎么办?" name="1">
                    <div>机器运到客户现场后，我们会安排专业技术工程师上门安装指导、培训，确保您或者操作员工可以熟练掌握机器使用。您也可以随时来我厂学习，不另外收取任何费用。</div>
                </el-collapse-item>
                <el-collapse-item title="运输费怎么算的呢？" name="2">
                    <div>无论您在国内哪里，我们都会免费为您送货上门，免费安装指导，为您规划最合理的放置设备位置。</div>
                </el-collapse-item>
                <el-collapse-item title="公司实力如何，有没有质量保障呢？" name="3">
                    <div>
                        柏锐科技自2008年成立以来，专注于各种粘稠度流体非标设备的研发、生产，并一直不断创新、进步。让我们有信心和能力为客户提供满意的服务。
                    </div>
                    <div>
                        公司有着19年的行业经验，拥有厂房1598平米，专业团队20余人。是国内极少数具有软硬件自主研发生产的源头厂家。
                    </div>
                    <div>
                        柏锐科技至今已获得各类专利技术40余项，同时也通过欧盟CE认证，客户可以放心购买、使用。
                    </div>
                </el-collapse-item>
                <el-collapse-item title="我可以先拿材料打样到你们公司打样吗？" name="4">
                    <div>
                        可以的。前期我们会为您提供免费打样服务，有技术人员为您提供专业的打样服务，并有专业人员全程接待跟进，达到您的满意满意效果后，再接着往下谈。
                    </div>
                </el-collapse-item>
                <el-collapse-item title="机器的保修期是多少？" name="5">
                    <div>
                        柏锐科技机器有一年的保修期（配件和易损件除外），在保修期内您将免费获得上门服务（国内），保修期外需支付一定的费用，视实际情况而定。（先确认故障原因，再报价，后维修;不需更换配件时只收取工时费，所有价格公开透明，为客户提供终身售后服务。）
                    </div>
                </el-collapse-item>
                </el-collapse>
            </el-tab-pane>
            <el-tab-pane label="设备配件" name="3" class="serverBox"></el-tab-pane>
            <el-tab-pane label="保养知识" name="4" class="serverBox">
                <el-collapse model-value="1" accordion>
                <el-collapse-item title="Consistency" name="1">
                    <div>
                    Consistent with real life: in line with the process and logic of real
                    life, and comply with languages and habits that the users are used to;
                    </div>
                    <div>
                    Consistent within interface: all elements should be consistent, such
                    as: design style, icons and texts, position of elements, etc.
                    </div>
                </el-collapse-item>
                <el-collapse-item title="Feedback" name="2">
                    <div>
                    Operation feedback: enable the users to clearly perceive their
                    operations by style updates and interactive effects;
                    </div>
                    <div>
                    Visual feedback: reflect current state by updating or rearranging
                    elements of the page.
                    </div>
                </el-collapse-item>
                <el-collapse-item title="Efficiency" name="3">
                    <div>
                    Simplify the process: keep operating process simple and intuitive;
                    </div>
                    <div>
                    Definite and clear: enunciate your intentions clearly so that the
                    users can quickly understand and make decisions;
                    </div>
                    <div>
                    Easy to identify: the interface should be straightforward, which helps
                    the users to identify and frees them from memorizing and recalling.
                    </div>
                </el-collapse-item>
                <el-collapse-item title="Controllability" name="4">
                    <div>
                    Decision making: giving advices about operations is acceptable, but do
                    not make decisions for the users;
                    </div>
                    <div>
                    Controlled consequences: users should be granted the freedom to
                    operate, including canceling, aborting or terminating current
                    operation.
                    </div>
                </el-collapse-item>
                </el-collapse>
            </el-tab-pane>
            <el-tab-pane label="下载中心" name="5" class="serverBox">
                <el-row>
                    <el-col :span="6" v-for="item in fileList" :key="item.id">
                        <div class="downloadsBox">
                            <img :src="fileImg" alt="file">
                            <p>{{ item.title }}</p>
                            <!-- <p>{{ item.createDate }}</p> -->
                            <el-button type="primary">
                                <a :href="item.url" target="_blank">下载</a>
                            </el-button>
                        </div>
                    </el-col>
                </el-row>
            </el-tab-pane>
        </el-tabs>
    </div>
</template>

<script>
import banner from '../components/banner.vue'
import axios from 'axios'

export default{
    name:'service',
    data(){
        return{
            tabName: '0',
            iconList:[
                {icon:'../src/assets/img/server_icon_0.png',title:'系统培训'},
                {icon:'../src/assets/img/server_icon_1.png',title:'设备知识培训'},
                {icon:'../src/assets/img/server_icon_2.png',title:'核心部件重点培训'},
                {icon:'../src/assets/img/server_icon_3.png',title:'操作技巧培训'},
                {icon:'../src/assets/img/server_icon_4.png',title:'安装调试培训'},
                {icon:'../src/assets/img/server_icon_5.png',title:'故障检修培训'},
                {icon:'../src/assets/img/server_icon_6.png',title:'保养常识培训'},
                {icon:'../src/assets/img/server_icon_7.png',title:'配件选配安装培训'},
                {icon:'../src/assets/img/server_icon_8.png',title:'流水线配置培训'},
                {icon:'../src/assets/img/server_icon_9.png',title:'材料加工工艺培训'}
            ],
            fileList:[],
            fileImg:'./src/assets/img/pdf.png',
            supportText:[
                {title:'精准管控',t1:'精准管控成本核算，科学计算预期收益，实现降本增效，盈利可期。',t2:'从前期设备选型、方案规划，到中期设备产能优化提升，再到后期的售后服务，我们有专业的项目团队全程跟踪，为您规避风险，提升项目价值，服务链贯穿始终。'},
                {title:'私人定制',t1:'根据客户实际需求，制定多套工艺方案进行对比分析，选定合理的方案，实现私人定制。',t2:'我们的服务贯穿现场地形环境勘测、生产线工艺设计、原料检测、成本要求分析、项目投资预算、设备安装调试等各个环节。'},
                {title:'共同见证',t1:'聚焦全球几十个国家和地区的成功案例，实地考察从单机到整条流水生产线的每一道工序。',t2:'上万家客户运营收益比清晰可考，共同检验从设计研发团队到安装维修团队的整套服务体系，见证整个工艺项目体系的投资价值实现。'},
                {title:'培训支持',t1:'我们为客户派遣的技术人员提供全面系统的培训，以便更好地满足生产工艺项目或设备需求。技术人员实践操作期间，我们的培训讲师也将持续跟进项目运营，投入充足的力度和支持，确保项目的有序开展。',t2:''},
            ],
            supportText2:[
                {title:'01',t1:'专业解答客户咨询'},
                {title:'02',t1:'推荐合适的产品'},
                {title:'03',t1:'量身定制解决方案'},
                {title:'04',t1:'严格检验准时发货'},
                {title:'05',t1:'协助拟定生产方案'},
                {title:'06',t1:'指导设备置放'},
                {title:'07',t1:'指导安装与调试'},
                {title:'08',t1:'技术培训与维修'},
                {title:'09',t1:'定期回访'},
                {title:'10',t1:'提供技术改进方案和设备信息'},
            ]
        }
    },
    methods:{
        getFiles(){
            axios.get('http://127.0.0.1:3000/downloads/getallfiles').then(res=>{
                this.fileList = res.data;
            }).catch(err =>{
                console.log("数据获取失败"+err);
            })
        }
    },
    components:{
        banner
    },
    mounted(){
        this.getFiles()
    }
}
</script>

<style>
.serverBox h1{
    padding: 50px 0;
    font-size: 36px; 
    text-align: center;
}
/* 客户培训 */
.iconBox{
    display: flex;
    flex-wrap: wrap;
    position: relative;
    box-sizing: border-box;
}
.serverIconBox{
    text-align: center;
    margin: 20px 0px;
    width: 20%;
}
.serverIcon{
    background-color: #2357af;
    border-radius: 50%;
    width: 80px;
    height: 80px;
    margin: 10px auto;
}
.serverIcon img{
    width: 100%;
    transform: scale(60%);
}

/* 技术支持 */
.supportBox{
    background-color: #f2f2f2;
    height: 160px;
    padding: 20px;
    margin: 10px;
}
.supportBox2{
    background-color: #f2f2f2;
    text-align: center;
    /* width: 150px; */
    height: 150px;
    margin: 10px;
    padding: 10px;
    position: relative;
}
.supportBox2 div{
    width:80%;
    position:absolute;
    top:28%;
    transform: translateY(-50%);
    left: 50%;
    transform: translateX(-50%);
    line-height: 30px;
}
.supportBox2Bg{
    height: 150px;
    margin: 10px;
    padding: 10px;
    background-image: url(../assets/img/about2.jpg);
    background-repeat: no-repeat;
    background-size: 100% 100%;
}

/* 折叠面板动效 */
.el-collapse-item__header.is-active{
    font-size: 20px;
    transition: all 0.2s ease-in;
}
.el-collapse-item__header{
    transition: all 0.2s ease-in 0s;
}

/* 下载中心 */
.downloadsBox{
    text-align: center;
    margin: 20px;
}
.downloadsBox img{
    width: 60px;
}
.downloadsBox p{
    margin: 10px;
}
</style>