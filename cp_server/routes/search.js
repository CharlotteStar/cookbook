const  express=require("express");
const  pool=require("../pool.js");
var  router=express.Router();

// 热门搜索的数据展示为浏览量高的商品
router.get("/top", (req, res) => {
  var sql = `SELECT title FROM cp_details order by browse desc limit 0,10`;
  pool.query(sql, [], (err, result) => {
    if (err) throw err;
    res.send(result)
  })
})


// 搜索关键词
router.get("/keyword", (req, res) => {
  var pname = req.query.pname;
  // %% 模糊检索
  var p = `%${pname}%`
  var sql = `SELECT * FROM cp_details where title like ?`;
  pool.query(sql, [p], (err, result) => {
    if (err) throw err;
    res.send(result)
    return;
  })
  //搜索栏输入不为空的数值,存到后台搜索历史表中
  if (pname) {
    var uid = req.query.uid;
    pool.query("select sid from user_search where user_id=? and keyword=?", [uid,pname], (err, result) => { 
      if (err) throw err;
      if (result.length==0) { 
        var sql2 = `INSERT INTO user_search VALUES(NULL,?,?)`;
        pool.query(sql2, [pname,uid], (err, result) => {
          if (err) throw err;
          // console.log(result)
          return;
          res.send(result)
        })
      }
    });
  }
});

//查询对应用户的历史记录
router.get("/history", (req, res) => {
  var uid=req.query.uid  
    var sql = "SELECT keyword FROM user_search WHERE user_id=?";
    pool.query(sql, [uid], (err, result) => { 
        if (err) throw err;
        res.send({ code: 1, msg: "查询成功", data: result });
    })
})

//清空历史记录
router.get("/qingkong", (req, res) => {
    var uid = req.query.uid;
    var sql = "DELETE FROM user_search WHERE user_id=?";
    pool.query(sql, [uid], (err, result) => {
        if (err) throw err;
        res.send({ code: 1 ,msg: "删除成功" });
    })
});

router.get("/getkeyword", (req, res) => {
    var keyword = req.query.keyword;
    var sql = "SELECT sname,pic,sid FROM cp_shicai WHERE sname LIKE ?";
    pool.query(sql, [`%${keyword}%`], (err, result) => { 
        if (err) throw err;
        res.send({ code: 1, msg: "查询成功", data: result });
    })
})

//智能搜索
router.get("/zn_search", (req, res) => {
  var keywords = req.query.keywords;
  var sql = "SELECT * FROM cp_details WHERE  (primary_cl like '%" + keywords[0] + "%' or secondary_cl like '%" + keywords[0] + "%')";
  //如果关键字数组长度大于1循环拼接sql语句
  if (keywords.length > 1) {
    for (var i = 1; i < keywords.length; i++) { 
      sql += ' and (primary_cl like "%' + keywords[i] + '%" or secondary_cl like "%'+keywords[i]+'%")';
    }
  }
  pool.query(sql, (err, result) => { 
    if (err) throw err;
    res.send({ code: 1, msg: "查询成功", data: result });
  })
})


module.exports = router;