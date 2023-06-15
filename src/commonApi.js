import axios from 'axios'

function dataGet() {
    axios.get('http://127.0.0.1/productList/get').then(res => {
        // console.log(res.data);
        this.productList = res.data

    }).catch(err => {
        console.log("获取数据失败：" + err);
    })
}

function dataFilter(name){
    if(name === '0'){
        this.dataGet();
    }else{
        axios.get('http://127.0.0.1/productList/getfilter',{
            params:{
                invtags: name
            }
        }).then(res => {
            // console.log(res.data);
            this.productList = res.data

        }).catch(err => {
            console.log("获取数据失败：" + err);
        })
    }
}

export default{
    dataGet,
    dataFilter
}