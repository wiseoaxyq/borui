<template>
    <div class="newsdetails" v-for="item in news" :key="item.id">
        <div class="title">
            <p>{{ item.newTitle }}</p>
            <span>{{ item.newDate }} -- </span>
            <span>{{ item.person }}</span>
        </div>
        <div class="info">
            <div class="infoPic">
                <img :src="item.newPic" alt="" />
            </div>
            <p v-html="item.newInfo.replace(/\n/gm, '<br>')"></p>
        </div>
    </div>
</template>

<script>
import axios from 'axios';

    export default{
        name:'newsdetails',
        data(){
            return{
                news:[],
                pid: '',
                newsInfo:[]
            }
        },
        methods:{
            newsDataIdGet(id) {
                axios.get('http://127.0.0.1:3000/news/getnewid',{
                    params:{
                        id: id
                    }
                }).then(res => {
                    console.log(res.data);
                    this.news = res.data
                }).catch(err => {
                    console.log("获取数据失败：" + err);
                })
            }
        },
        created(){
            this.pid = this.$route.params.id;
        },
        mounted(){
            this.newsDataIdGet(this.pid)
        }
    }
</script>

<style scoped>
.newsdetails{
    margin: 0 auto;
    margin-top: 60px;
    width: 60%;
}
.title{
    text-align: center;
    margin-bottom: 30px;
    margin-top: 90px;
}
.title p{
    font-size: 2.5em;
    font-weight: bold;
    margin-bottom: 30px;
}
.info{
    line-height: 30px;
    margin-bottom: 90px;
}
.infoPic img{
    width: 100%;
}
.info p{
    font-size: 17px;
}
</style>