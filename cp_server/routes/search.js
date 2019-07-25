const  express=require("express");
const  pool=require("../pool.js");
var  router=express.Router();

// 热门搜索的数据展示为浏览量高的商品
router.get("/top", (req, res) => {
  var sql = `SELECT * FROM cp_details order by browse desc limit 0,10`;
  pool.query(sql, [], (err, result) => {
    if (err) throw err;
    console.log(result)
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
  // 搜索栏输入不为空的数值,存到后台搜索历史表中
  // if (pname) {
  //   var uid = req.query.uid;
  //   var sql2 = `INSERT INTO user_search VALUES(NULL,?,?)`;
  //   pool.query(sql2, [uid, pname], (err, result) => {
  //     if (err) throw err;
  //     // console.log(result)
  //     return;
  //     res.send(result)
  //   })
  // }
});


module.exports = router;