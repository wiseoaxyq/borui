let db = require('../db/index')

// 查询所有新闻
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