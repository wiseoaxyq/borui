let db = require('../db/index')

// 展示新闻
exports.getNewsAll = (req, res) => {
    var sql = 'select id,newTitle,newPic,newDate,newTags from borui_news where isDel = 1 order by newDate desc'
    db.query(sql, (err,data) =>{
        if(err){
            return res.send('错误：'+err.message);
        }
        res.send(data)
    })
}
// 查询所有新闻（分类）
exports.getNewsFilter = (req, res) => {
    var sql = 'select id,newTitle,newPic,newDate from borui_news where newTags = ? and isDel = 1'
    db.query(sql, [req.query.newtags], (err,data) =>{
        if(err){
            return res.send('错误：'+err.message);
        }
        res.send(data)
    })
}
// 查询单条新闻的所有信息
exports.getNewId = (req,res) => {
    var sql = 'select * from borui_news where id = ? and isDel = 1'
    db.query(sql, [req.query.id], (err,data) => {
        if(err){
            return res.send('错误：'+err.message);
        }
        res.send(data)
    })
}
// 查询新闻信息（用于管理）
exports.getAllInfo = (req, res) => {
    var sql = `select *,
    case isDel when 1 then '发布' else '下架' end as isdels 
    from borui_news order by newDate desc`
    db.query(sql, (err,data) =>{
        if(err){
            return res.send('错误：'+err.message);
        }
        res.send(data)
    })
}
// 新增文章
exports.insNew = (req,res)=>{
    var sql = `insert into borui_news
    (id,newTitle,newPic,newInfo,newTags,newDate,person,isDel)
    values (?,?,?,?,?,now(),?,?)`;
    db.query(sql,
        [req.query.id, req.query.newtitle, req.query.newpic, req.query.newinfo,
        req.query.newtags, req.query.person, req.query.isdel], (err, data)=>{
            if(err){
                // console.log(req.query);
                return res.send('错误'+err.message);
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
// 删除文章
exports.delNew = (req,res)=>{
    var sql = `delete from borui_news where id = ?`;
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
// 更新文章
exports.updateNew = (req,res)=>{
    var sql = `update borui_news set
    newTitle=?,newPic=?,newInfo=?,newTags=?,newDate=now(),person=?,isDel=?
    where id = ?`
    db.query(sql, [req.query.newtitle, req.query.newpic, req.query.newinfo,
        req.query.newtags, req.query.person, req.query.isdel, req.query.id], (err,data)=>{
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