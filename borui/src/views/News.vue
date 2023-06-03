<template>
    <div class="news">
        <banner title="新闻资讯" bgc="../src/assets/img/advantage_3.jpg"></banner>
        <el-tabs v-model="tabName" @tab-change="newsDataGet">
            <el-tab-pane label="新闻资讯" name="新闻资讯">
                <el-row :gutter="0" justify="center">
                    <el-col v-for="(item, index) in newsList" :key="index" :span="8">
                        <router-link :to="{name:'newsdetails', params:{id: item.id}}">
                        <div class="newsBox">
                            <div class="newsPic">
                            <img :src="item.newPic" alt="image"> 
                            </div>
                            <div class="newsText">
                                <h3>{{ item.newTitle }}</h3>
                                <p>{{ Date(item.newDate) }}</p>
                            </div>
                        </div>
                        </router-link>
                    </el-col>
                </el-row>
            </el-tab-pane>
            <el-tab-pane label="行业动态" name="行业动态">
                <el-row :gutter="0" justify="center">
                    <el-col v-for="(item, index) in newsList" :key="index" :span="8">
                        <router-link :to="{name:'newsdetails', params:{id: item.id}}"> 
                        <div class="newsBox">
                            <div class="newsPic">
                            <img :src="item.newPic" alt="image"> 
                            </div>
                            <div class="newsText">
                                <h3>{{ item.newTitle }}</h3>
                                <p>{{ Date(item.newDate) }}</p>
                            </div>
                        </div>
                        </router-link>
                    </el-col>
                </el-row>
            </el-tab-pane>
        </el-tabs>
        
    </div>
</template>

<script>
import axios from 'axios'
import banner from '../components/banner.vue'

export default{
    name:'news',
    data(){
        return {
            newsList:[],
            tabName:"新闻资讯",
        }
    },
    methods:{
        // 获取新闻列表
        newsDataGet(name){
            axios.get('http://127.0.0.1/news/getfilter',{
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
        this.newsDataGet()
    },
    components:{
        banner
    }
}
</script>

<style>
.news{
    padding-bottom: 100px;
}
.newsBox{
    margin: 15px;
}
.newsPic{
    height: 280px;
    overflow: hidden;
    position: relative;
}
.newsPic img{
    float: none;
    height: 100%;
    position: absolute;
    transform: translateX(-50%);
    left: 50%;
    transition: all 0.3s ease-in 0s;
}
.newsBox:hover .newsPic img{
    transform: scale(110%);
    left: -20%;
    transition: all 0.3s ease-in;
}
.newsText{
    background-color: #f8f8f8;
    padding: 20px;
    height: 100px;
    position: relative;
}
.newsBox:hover .newsText{
    background-color: #f2f2f2;
}
.newsText h3{
    display: -webkit-box;
    -webkit-box-orient: vertical;
    overflow: hidden;
    -webkit-line-clamp: 2;
    text-overflow: ellipsis;
}
.newsText p{
    position: absolute;
    bottom: 15px;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    overflow: hidden;
    -webkit-line-clamp: 2;
    text-overflow: ellipsis;
}
</style>