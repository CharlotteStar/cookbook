const express = require("express");
const pool = require("../pool.js");
var router = express.Router();

//添加评论
router.get("/add", (req, res) => { 
  var obj = req.query;
  var sql = "INSERT INTO user_pinglun SET ?";
  pool.query(sql, [obj], (err, result) => { 
    if (err) throw err;
    res.send({ code: 1, msg: "发表评论成功" });
  })
})

/*获取评论*/
router.get("/get", (req, res) => {
  var did = req.query.did;
  var sql = "SELECT avatar,uname,content,time,pid,uid FROM cp_user,user_pinglun WHERE user_id=uid AND cp_id=? ORDER BY time DESC";
  pool.query(sql, [did], (err, result) => { 
    if (err) throw err;
    res.send({ code: 1, msg: "查询成功", data: result });
  })
})

module.exports = router;