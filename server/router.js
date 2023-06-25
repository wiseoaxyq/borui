let express = require('express')
let router = express.Router()
let productList = require('./API/productList')
let news = require('./API/news')
let messageBorder = require('./API/messageBoard')
let user = require('./API/user')
let banner = require('./API/banner')
let caseBanner = require('./API/caseBanner')
let downloads = require('./API/downloads')

const multer = require('multer')
const fs = require('fs')
const path = require('path')
const { log } = require('console')

// 产品
router.get('/productList/get',productList.getAll)
router.get('/productList/getfilter',productList.getFilter)
router.get('/productList/filter2',productList.Filter2)
router.get('/productList/getfilter2',productList.getFilter2)
router.get('/productList/getid',productList.getId)
router.get('/productList/gethot',productList.getHot)
router.get('/productList/getcaseproduct',productList.getCaseProduct)
router.get('/productList/getallinfo',productList.getAllInfo)
router.get('/productList/insproduct',productList.insProduct)
router.get('/productList/filterlist',productList.filterList)
router.get('/productList/filterlist2',productList.filterList2)
router.get('/productList/delproduct',productList.delProduct)
router.get('/productList/updateproduct',productList.updateProduct)

// 新闻
router.get('/news/get',news.getNewsAll)
router.get('/news/getfilter',news.getNewsFilter)
router.get('/news/getnewid',news.getNewId)
router.get('/news/getallinfo',news.getAllInfo)
router.get('/news/insnew',news.insNew)
router.get('/news/delnew',news.delNew)
router.get('/news/updatenew',news.updateNew)

// 留言板
router.get('/message/postmessage',messageBorder.postMessageBoard)
router.get('/message/getallinfo',messageBorder.getAllMessage)

// 用户列表
router.get('/user/getuser',user.getUser)
router.get('/user/getname',user.getName)
router.get('/user/insuser',user.insUser)
router.get('/user/updateuser',user.updateUser)
router.get('/user/deluser',user.delUser)

// banner
router.get('/banner/getallbanner',banner.getAllBanner)
router.get('/banner/getfilter',banner.getFilter)
router.get('/banner/insbanner',banner.insBanner)
router.get('/banner/delbanner',banner.delBanner)
router.get('/banner/updatebanner',banner.updateBanner)

// caseBanner
router.get('/casebanner/getallbanner',caseBanner.getAllCaseBanenr)
router.get('/casebanner/getfilter',caseBanner.getFilter)
// router.get('/casebanner/insbanner',caseBanner.insBanner)
// router.get('/casebanner/delbanner',caseBanner.delBanner)
router.get('/casebanner/updatebanner',caseBanner.updateBanner)

// downloads
router.get('/downloads/getallfiles',downloads.getAllFiles)
router.get('/downloads/insfile',downloads.insFile)
router.get('/downloads/delfile',downloads.delFile)

// 单文件上传
router.post('/upload',multer({
    dest:'./tmp/my-uploads'
}).single('file'),(req,res)=>{
    // console.log(req.file.path.replace(/\\/g, '/'));
    // console.log(path.parse(req.file.originalname).ext);
    // 拼接文件后缀
    let oldname = req.file.path
    let newname = req.file.path + path.parse(req.file.originalname).ext
    fs.renameSync(oldname,newname)
    res.send('./'+req.file.path.replace(/\\/g, '/') + path.parse(req.file.originalname).ext)
})

// 文件列表上传
router.post('/uploadlist',multer({
    dest:'./tmp/my-uploads'
}).array('file'),(req,res)=>{
    // 拼接文件后缀
    // console.log(req.files[0].path);
    let oldname = req.files[0].path
    let newname = req.files[0].path + path.parse(req.files[0].originalname).ext
    fs.renameSync(oldname,newname)
    res.send('./'+req.files[0].path.replace(/\\/g, '/') + path.parse(req.files[0].originalname).ext)
})

// 删除文件（图片）
router.post('/delfiles',(req, res)=>{
    const filePath = req.body;
    // console.log(filePath);
    fs.unlink(filePath.pic, (err)=>{
        if(err){
            res.send({code: 202, mseesag:err})
        }else{
            res.send({code: 200, message: 'del success'})
        }
    })
});

// 批量删除文件（图片）
router.post('/delfileslist',(req, res)=>{
    const filePath = req.body;
    // console.log(filePath);
    for (let i = 0; i < filePath.pic.length; i++) {
        const element = filePath.pic[i];
        fs.unlink(element, (err)=>{
            if(err){
                // res.send({code: 202, mseesag:err})
                console.log(err);
            }else{
                // res.send({code: 200, message: 'del success'})
                console.log('del success');
            }
        })
    }
});

// 下载中心文件上传
router.post('/uploadfile',multer({
    dest:'./tmp/my-files'
}).single('file'),(req,res)=>{
    // 拼接文件后缀
    // console.log(req);
    let oldname = req.file.path
    let newname = req.file.path + path.parse(req.file.originalname).ext
    fs.renameSync(oldname,newname)
    res.send('./'+req.file.path.replace(/\\/g, '/') + path.parse(req.file.originalname).ext)
})

// 删除文件（文件）
router.post('/delfilesurl',(req, res)=>{
    const filePath = req.body;
    // console.log(filePath);
    fs.unlink(filePath.url, (err)=>{
        if(err){
            res.send({code: 202, mseesag:err})
        }else{
            res.send({code: 200, message: 'del success'})
        }
    })
});

module.exports = router