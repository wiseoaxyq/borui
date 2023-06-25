let db = require('../db/index')

// 查询banner（后台管理）
exports.getAllCaseBanenr = (req, res) => {
    var sql = `select * from borui_casebanner`
    db.query(sql, (err,data) =>{
        if(err){
            return res.send('错误：'+err.message);
        }
        res.send(data)
    })
}

// 查询banner分类
exports.getFilter = (req, res) => {
    var sql = `select * from borui_casebanner where filter = ?`
    db.query(sql,[req.query.filter], (err,data) =>{
        if(err){
            return res.send('错误：'+err.message);
        }
        res.send(data)
    })
}

// 新增banner
exports.insBanner = (req,res)=>{
    var sql = `insert into borui_casebanner 
    (id,url,titleZh,titleEn,filter,note) values (?,?,?,?,?,?)`;
    db.query(sql,
        [req.query.id,req.query.url,req.query.titlezh,
            req.query.titleen,req.query.filter,req.query.note],
        (err,data)=>{
            if(err){
                return res.send('错误'+err.message)
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

// 删除banner
exports.delBanner = (req,res) => {
    var sql = `delete from borui_casebanner where id = ?`;
    db.query(sql, [req.query.id], (err,data) =>{
        if(err){
            return res.send('错误：'+err.message)
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

// 更新banner
exports.updateBanner = (req, res) => {
    var sql = `UPDATE borui_casebanner 
    SET url = ?,titleZh = ?,titleEn = ?,filter = ?,note = ? WHERE id = ?`;
    db.query(sql, [req.query.url,req.query.titlezh,
        req.query.titleen,req.query.filter,req.query.note, 
        req.query.id], (err, data) =>{
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