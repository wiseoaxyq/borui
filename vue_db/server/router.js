let express = require('express')
let router = express.Router()
let productList = require('./API/productList')
let news = require('./API/news')
let messageBorder = require('./API/messageBoard')

// 产品
router.get('/productList/get',productList.getAll)
router.get('/productList/getfilter',productList.getFilter)
router.get('/productList/filter2',productList.Filter2)
router.get('/productList/getfilter2',productList.getFilter2)
router.get('/productList/getid',productList.getId)
router.get('/productList/gethot',productList.getHot)
router.get('/productList/getcaseproduct',productList.getCaseProduct)

// 新闻
router.get('/news/get',news.getNewsAll)
router.get('/news/getfilter',news.getNewsFilter)
router.get('/news/getnewid',news.getNewId)

// 留言板
router.get('/message/postmessage',messageBorder.postMessageBoard)
module.exports = router