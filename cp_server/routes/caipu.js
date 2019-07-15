const express = require("express");
const pool = require("../pool.js");
var router = express.Router();


//获取菜谱详情的数据
router.get("/details", (req, res) => { 
  var did = req.query.did;
  var sql = "SELECT * FROM cp_details WHERE did=?";
  pool.query(sql, [did], (err, result) => { 
    if (err) throw err;
    var cp_details=result[0]
    var sql = "SELECT * FROM cp_step WHERE cp_id=?";
    pool.query(sql, [did], (err, result) => { 
      if (err) throw err;
      var cp_step = result;
      res.send({ code: 1, msg: "查询成功", cp_details, cp_step });
    })
  })
})

//获取菜谱列表的数据
router.get("/cp_list", (req, res) => {
  var tid = req.query.tid;
  var sql = "SELECT * FROM cp_details WHERE type_id=?";
  pool.query(sql, [tid], (err, result) => {
    if (err) throw err;
    var cp_data=result
    var sql = "SELECT tname FROM cp_type WHERE tid=?";
    pool.query(sql, [tid], (err, result) => {
      if (err) throw err;
      var tname = result[0].tname;
      res.send({ code: 1, msg: "查询成功", cp_data, tname });
    });
  })
});

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
  var sql = "SELECT * FROM cp_type WHERE cp_fenlei_id=?";
  pool.query(sql, [fid], (err, result) => { 
    if (err) throw err;
    res.send({ code: 1, msg: "查询成功", data: result });
  })
})

module.exports = router;