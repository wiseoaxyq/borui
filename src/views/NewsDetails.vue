<template>
    <div class="newsdetails" v-for="item in news" :key="item.id">
        <img :src="item.newPic" alt="">
        <p>{{ item.newTitle }}</p>
        <p>编稿人：{{ item.person }}</p>
        <p>发表日期：{{ Date(item.newDate) }}</p>
        <div>
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
                axios.get('http://127.0.0.1/news/getnewid',{
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