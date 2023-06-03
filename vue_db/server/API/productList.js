let db = require('../db/index')

// 查询所有产品
exports.getAll = (req, res)  => {
    var sql = `select id,invName,invPic from borui_productList where isDel = 1`
    db.query(sql, (err, data) => {
        if(err){
            return res.send('错误：'+err.message);
        }
        res.send(data)
    })
}
// 获取一级分类产品
exports.getFilter = (req, res)  => {
    var sql = 
    `select id,invName,invPic,invTags,f1,invTags2,f2 from borui_productList a inner join
    (select filterId,filterName as f1 from borui_product_filterList where filterNote = 1) b on a.invTags = b.filterId inner join 
    (select filterId,filterName as f2 from borui_product_filterList where filterNote = 2) c on a.invTags2 = c.filterId
    where invTags = ? and isDel = 1`
    db.query(sql, [req.query.invtags], (err, data) => {
        if(err){
            return res.send('错误：'+err.message);
        }
        res.send(data)
    })
}
// 获取产品的二级分类
exports.Filter2 = (req, res)  => {
    var sql = `SELECT * FROM borui_product_filterlist where filterNote = 2 and filterFather = ?`
    db.query(sql, [req.query.filterfather], (err, data) => {
        if(err){
            return res.send('错误：'+err.message);
        }
        res.send(data)
    })
}
// 获取二级分类产品
exports.getFilter2 = (req, res)  => {
    var sql = 
    `select id,invName,invPic,invTags,f1,invTags2,f2 from borui_productList a inner join
    (select filterId,filterName as f1 from borui_product_filterList where filterNote = 1) b on a.invTags = b.filterId inner join 
    (select filterId,filterName as f2 from borui_product_filterList where filterNote = 2) c on a.invTags2 = c.filterId
    where invTags2 = ? and isDel = 1`
    db.query(sql, [req.query.invtags2], (err, data) => {
        if(err){
            return res.send('错误：'+err.message);
        }
        res.send(data)
    })
}

// 查询单条产品的所有信息
exports.getId = (req, res)  => {
    var sql = 'select * from borui_productList where id = ? and isDel = 1'
    db.query(sql, [req.query.id], (err, data) => {
        if(err){
            return res.send('错误：'+err.message);
        }
        res.send(data)
    })
}

// 查询热销产品
exports.getHot = (req, res)  => {
    var sql = 'select a.id,a.invName,b.hotPic from borui_productlist a right join borui_hot_product b on a.invCode = b.invCode'
    db.query(sql, (err, data) => {
        if(err){
            return res.send('错误：'+err.message);
        }
        res.send(data)
    })
}

// 查询行业方案相关产品
exports.getCaseProduct = (req, res)  => {
    // json数组的查询方法
    var sql = `SELECT id,invName,invPic FROM borui_productlist where JSON_SEARCH(caseTags, 'all', ?) IS NOT NULL`
    db.query(sql, [req.query.casetags], (err, data) => {
        if(err){
            return res.send('错误：'+err.message);
        }
        res.send(data);
    })
}