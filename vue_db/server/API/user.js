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