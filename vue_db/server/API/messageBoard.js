let db = require('../db/index')

// 用户提交表单到留言板
exports.postMessageBoard = (req, res) => {
    var sql = 'insert into borui_message_board (name,tel,email,address,message) values (?,?,?,?,?)'
    db.query(sql, [req.query.name, req.query.tel, req.query.email, req.query.add, req.query.mes], (err, data) => {
        if(err) {
            return res.send('错误：' + err.message)
        }
        if(data.affectedRows > 0) {
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