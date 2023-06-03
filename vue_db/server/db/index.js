// 数据库连接文件
let mysql = require('mysql')

let db = mysql.createPool({
    host: '127.0.0.1',
    user: 'root',
    password: '123456',
    database: 'mysql'
})

module.exports = db