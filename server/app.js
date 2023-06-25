let express = require('express')
let app = express()
let cors = require('cors')
let bodyParser = require('body-parser')
let router = require('./router')
const user = require('./API/user')

app.use(bodyParser.json());    // 配置解析，用于解析json和urlencoded格式的数据
app.use(bodyParser.urlencoded({extended: false}));
app.use(cors());    // 配置跨域
app.use(router);    // 挂载路由


// 登录验证
app.post('/login',user.userLogon);

// 注意：这里并没有加验证Token是否正确的逻辑
app.get('/user', verifyToken, (req, res) => {
    res.send('Welcome back, ' + req.user.username);
  });
  
  // Token验证函数
  function verifyToken(req, res, next) {
    // 从请求头获取Token
    const authHeader = req.headers.authorization;
    const token = authHeader && authHeader.split(' ')[1];
    if (token == null) {
      return res.status(401).send('Unauthorized');
    }
    // 验证Token
    jwt.verify(token, secretKey, (err, user) => {
      if (err) {
        return res.status(403).send('Forbidden');
      }
      req.user = user;
      next();
    });
  }

app.listen(3000, ()=>{
    console.log('服务器启动成功');
})