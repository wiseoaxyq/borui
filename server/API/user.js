const db = require('../db/index')
const jwt = require('jsonwebtoken');

// 秘钥，可以根据实际情况修改，但这仅仅是示例
const secretKey = 'mysecretkey';

exports.userLogon = (req,res)=>{
    const {username, password} = req.body;

    // 查询是否存在该用户
    db.query('select * from borui_user where username = ? and password = ?',[username, password],(error,results)=>{
        if(error){
            res.status(500).send('服务器出现错误，请联系管理员');
        }else if(results.length === 0){
            res.status(401).send('用户名或密码错误');
        }else{
            // 生成JWT token
            const user = {username};
            const token = jwt.sign({user}, secretKey);
            res.send({token});
        }
    })
}

// 查询用户名
exports.getName = (req, res) => {
    var sql = 'select name from borui_user where username = ?'
    db.query(sql, [req.query.username], (err,data) =>{
        if(err){
            return res.send('错误：'+err.message);
        }
        res.send(data)
    })
}

// 查询用户列表
exports.getUser = (req, res) => {
    var sql = `select id,name,username,md5(password) as password,
    case role when 'sa' then '管理员' else '员工' end as role,
    note from borui_user order by createDate desc`
    db.query(sql, (err,data) =>{
        if(err){
            return res.send('错误：'+err.message);
        }
        res.send(data)
    })
}

// 新增用户
exports.insUser = (req, res) => {
    var sql = `insert into borui_user 
    (id,name,username,password,role,note,createDate) 
    values (?,?,?,?,?,?,now())`;
    db.query(sql, [req.query.id, req.query.name, req.query.username, req.query.password, req.query.role, req.query.note], (err, data) =>{
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

// 修改用户
exports.updateUser = (req, res) => {
    var sql = `UPDATE borui_user 
    SET name = ?,username = ?,password = ?,role = ?,note = ? 
    WHERE id = ?`;
    db.query(sql, [req.query.name, req.query.username, 
        req.query.password, req.query.role, req.query.note, 
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

// 删除用户
exports.delUser = (req,res) => {
    var sql = `delete from borui_user where id = ?`;
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