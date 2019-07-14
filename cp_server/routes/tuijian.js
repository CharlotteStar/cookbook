const express = require("express");
const pool = require("../pool.js");
var router = express.Router();

//推荐页的三餐
router.get("/sancan", (req, res) => { 
  var sql = "SELECT * FROM cp_tj_sancan";
  console.log(666);
  pool.query(sql, (err, result) => { 
    if (err) throw err;
    res.send({ code: "1", msg: "查询成功", data: result });
  })
})

//获取菜谱分类的数据
router.get("/classify", (req, res) => { 
  var sql = "SELECT * FROM cp_fenlei";
  pool.query(sql, (err, result) => { 
    if (err) throw err;
    res.send({ code: 1, msg: "查询成功", data:result });
  })
})
//获取菜谱类型的数据
router.get("/type", (req, res) => { 
  var fid = req.query.fid;
  console.log(fid);
  var sql = "SELECT * FROM cp_type WHERE cp_fenlei_id=?";
  pool.query(sql, [fid], (err, result) => { 
    if (err) throw err;
    res.send({ code: 1, msg: "查询成功", data: result });
  })
})

module.exports = router;