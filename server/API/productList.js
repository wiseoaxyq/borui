let db = require('../db/index')

// 查询所有产品列表（用于展示）
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
    var sql = `SELECT id,invName,invPic FROM borui_productlist where JSON_SEARCH(caseTags, 'all', ?) IS NOT NULL and isDel = 1`
    db.query(sql, [req.query.casetags], (err, data) => {
        if(err){
            return res.send('错误：'+err.message);
        }
        res.send(data);
    })
}
// 查询所有产品的信息（用于管理）
exports.getAllInfo = (req, res)  => {
    var sql = `SELECT list.*,filter1.filterName AS invTagsName,filter2.filterName AS invTags2Name,
    CASE isDel WHEN 1 THEN '有效' ELSE '无效' END AS isdels
    FROM borui_productList AS list
    LEFT JOIN ( SELECT filterId, filterName FROM borui_product_filterlist WHERE filterNote = 1 ) AS filter1 
    ON list.invTags = filter1.filterId
    LEFT JOIN ( SELECT filterId, filterName FROM borui_product_filterlist WHERE filterNote = 2 ) AS filter2 
    ON list.invTags2 = filter2.filterId 
    ORDER BY createDate DESC`
    db.query(sql, (err, data) => {
        if(err){
            return res.send('错误：'+err.message);
        }
        res.send(data)
    })
}
// 新增产品
exports.insProduct = (req, res) => {
    var sql = `insert into borui_productlist
    (id,invCode,invName,invStd,invInfoText,invInfoPic,invPic,
    invTags,invTags2,notes,isDel,caseTags,createDate,person) 
    values (?,?,?,?,?,?,?,?,?,?,?,?,now(),?)`;
    db.query(sql, 
        [req.query.id, req.query.invcode, req.query.invname, 
        req.query.invstd, req.query.invinfotext,req.query.invinfopic, 
        req.query.invpic,req.query.invtags,req.query.invtags2,req.query.notes,
        req.query.isdel,req.query.casetags,req.query.person], (err, data) =>{
        if(err){
            return res.send('错误：'+err.message)
        }
        if(data.affectedRows > 0){
            res.send({
                status: 200,
                message:'success'
            })
        }else{
            res.send({
                status: 202,
                message:'error'
            })
        }
    })
}
// 获取一级分类列表
exports.filterList = (req, res)=>{
    var sql = `select filterId,filterName from borui_product_filterlist where filterNote = 1`
    db.query(sql,(err,data)=>{
        if(err){
            return res.send('错误：'+err.message)
        }
        res.send(data)
    })
}
// 获取二级分类列表
exports.filterList2 = (req, res)=>{
    var sql = `select filterId,filterName 
    from borui_product_filterlist 
    where filterNote = 2 and filterFather = ?`
    db.query(sql,[req.query.filterfather],(err,data)=>{
        if(err){
            return res.send('错误：'+err.message)
        }
        res.send(data)
    })
}
// 删除产品
exports.delProduct = (req,res) =>{
    var sql = `delete from borui_productlist where id = ?`;
    db.query(sql, [req.query.id], (err,data)=>{
        if(err){
            return res.send('错误'+err.message)
        }
        if(data.affectedRows > 0){
            res.send({
                status: 200,
                message: 'success'
            })
        }else{
            res.send({
                status: 202,
                message: 'error'
            })
        }
    })
}
// 更新产品
exports.updateProduct = (req, res) => {
    var sql = `update borui_productlist 
    set invCode = ?, invName = ?, invStd = ?, invPic = ?,
    invTags = ?, invTags2 = ?, invInfoText = ?, invInfoPic = ?, 
    caseTags = ?, notes = ?, isDel = ?, createDate = now(), person = ?
    where id = ?`;
    db.query(sql, [req.query.invcode, req.query.invname, req.query.invstd,
        req.query.invpic, req.query.invtags, req.query.invtags2, req.query.invinfotext,
        req.query.invinfopic, req.query.casetags, req.query.notes, req.query.isdel,
        req.query.person, req.query.id], (err,data)=>{
        if(err){
            return res.send('错误：'+err.message)
        }
        if(data.affectedRows > 0){
            res.send({
                status: 200,
                message:'success'
            })
        }else{
            res.send({
                status: 202,
                message:'error'
            })
        }
    })
}