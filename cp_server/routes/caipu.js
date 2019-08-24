const express = require("express");//引入服务器
const pool = require("../pool.js");//引入连接池
var router = express.Router();//引入路由模块

//获取对应用户的菜谱
//创建路由器
router.get("/user_cp", (req, res) => { 
  var user_id = req.query.uid;
  var sql = "SELECT pic,title FROM cp_details WHERE user_id=?";
  pool.query(sql, [user_id], (err, result) => { 
    if (err) throw err;
    res.send({ code: 1, msg: "查询成功", data: result });
  })
})


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
  var sql = "SELECT * FROM cp_details WHERE type_id like '% "+tid+" %'";
  pool.query(sql, (err, result) => {
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
  var id =req.query.id
  var sql='SELECT * FROM cp_details WHERE user_id=?'
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


//获取菜谱用户的数据
router.get("/user", (req, res) => { 
  var uid = req.query.uid;
  var sql = 'SELECT * FROM cp_user WHERE uid=?';
  pool.query(sql, [uid], (err, result) => {
    if (err) throw err;
    res.send({ code: 1, msg: "查询成功", data: result });
  })
})




//菜谱的浏览量
router.get("/browse", (req, res) => { 
  var browse = req.query.browse;
  var did = req.query.did;
  pool.query("UPDATE cp_details SET browse=? WHERE did=?", [browse,did], (err, result) => { 
    if (err) throw err;
    res.send("修改成功");
  })
})


module.exports = router;