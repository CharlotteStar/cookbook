const mysql = require("mysql");

//创建连接池
var pool = mysql.createPool({
  host: 'w.rdc.sae.sina.com.cn',
  port: 3306,
  user: '31xl3jy1wz',
  password: 'iwykl4yji2x12ih140iwj5kh0llmyxjxwylyixi4',
  database: 'app_caiputianxia',
  connectionLimit:15
});

module.exports = pool;