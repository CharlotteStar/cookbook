const express = require("express");
const pool = require("../pool.js");
var router = express.Router();

//三餐推荐
router.get("/sancan", (req, res) => { 
  var sql = "SELECT * FROM cp_tj_sancan";
  pool.query(sql, (err, result) => { 
    if (err) throw err;
    res.send({ code: "1", msg: "查询成功", data: result });
  })
})

router.get("/qita", (req, res) => {
  var sql='select did,pic,title,browse,uname,avatar,type_name from cp_tj,cp_user,cp_details where uid=tj_user_id and cp_id=did ORDER BY browse DESC;'
  pool.query(sql, (err, result) => {
    if (err) throw err;
    res.send({ code: 1, msg: "查询成功", data: result });
  })
});

//获取推荐列表的数据
router.get("/tuijian", (req, res) => { 
  var pages = req.query.pages*1;
  var count = req.query.count*1;
  var start = (pages - 1) * count;
  var sql = "SELECT did,pic,title,browse,uname,avatar FROM cp_details,cp_user WHERE user_id=uid ORDER BY browse DESC LIMIT ?,?";
  pool.query(sql, [start, count], (err, result) => { 
    if (err) throw err;
    res.send({ code: 1, msg: "查询成功", data: result });
  })
})
//关注
router.get("/focus",(req,res)=>{
  var uid=req.query.uid;
  var focus=req.query.focus;
  pool.query("UPDATE cp_user SET focus=? WHERE uid=? ",[focus,uid],(err,result)=>{
    if(err)throw err;
    res.send("1")
  })
}) 
module.exports = router;