let db = require('../db/index')

// 查询文件列表
exports.getAllFiles = (req, res) => {
    var sql = `select * from borui_download`
    db.query(sql, (err,data) =>{
        if(err){
            return res.send('错误：'+err.message);
        }
        res.send(data)
    })
}

// 上传文件
exports.insFile = (req,res)=>{
    var sql = `insert into borui_download
    (id,title,url,note,createDate) values (?,?,?,?,now())`;
    db.query(sql,
        [req.query.id, req.query.title, req.query.url, req.query.note]
        , (err, data)=>{
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
// 删除文件
exports.delFile = (req,res)=>{
    var sql = `delete from borui_download where id = ?`;
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