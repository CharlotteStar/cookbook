const  express=require("express");
const  pool=require("../pool.js");
var router = express.Router();


/*取消关注*/
router.get("/del", (req, res) => { 
  var gid = req.query.gid;
  var sql = "DELETE FROM user_guanzhu WHERE gid=?";
  pool.query(sql, [gid], (err, result) => { 
    if (err) throw err;
    res.send({ code: 1, msg: "取消关注" });
  })
})

/*获取关注的数量*/
router.get("/count", (req,res) => { 
  var uid = req.query.uid;
  var sql="SELECT gid FROM user_guanzhu WHERE open_id=?"
  pool.query(sql, [uid], (err, result) => { 
    if (err) throw err;
    res.send({ code: 1, msg: "查询成功", data: result.length });
  })
})

/*添加关注*/
router.get("/add", (req, res) => { 
  var uid = req.query.uid;
  var open_id = req.query.open_id;
  var sql = "INSERT INTO user_guanzhu(gz_user_id,open_id) VALUES(?,?)";
  pool.query(sql, [uid,open_id], (err, result) => { 
    if (err) throw err;
    res.send({code:1,msg:"关注成功"});
  })
})

/*是否已关注*/
router.get("/isGz", (req, res) => { 
  var uid = req.query.uid;
  var open_id = req.query.open_id;
  var sql = "SELECT gid FROM user_guanzhu WHERE gz_user_id=? AND open_id=?";
  pool.query(sql, [uid, open_id], (err, result) => { 
    if (err) throw err;
    if (result.length > 0) {
      res.send({ code: 1, msg: "已关注", data: result[0] });
    } else { 
      res.send({ code: 0, msg: "未关注" });
    }
  })
}) 

module.exports = router;