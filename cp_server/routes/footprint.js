const  express=require("express");
const  pool=require("../pool.js");
var router = express.Router();

/*获取足迹数据*/
router.get("/get", (req, res) => { 
  var uid = req.query.uid;
  var sql = "SELECT * FROM user_footprint,cp_details WHERE cp_id=did AND fp_user_id=? ORDER BY time DESC";
  pool.query(sql, [uid], (err, result) => { 
    if (err) throw err;
    res.send({ code: 0, msg: "查询成功", data: result });
  })
})

/*更新足迹的时间*/
router.get("/update_time", (req, res) => { 
  var uid = req.query.uid;
  var did = req.query.did;
  var time = req.query.time + '';
  var sql = "UPDATE user_footprint SET time=? WHERE fp_user_id=? AND cp_id=?";
  pool.query(sql, [time, uid, did], (err, result) => { 
    if (err) throw err;
    res.send({ code: 1, msg: "更新成功" });
  })
})

/*添加足迹*/ 
router.get("/add", (req, res) => { 
  var uid = req.query.uid;
  var did = req.query.did;
  var time = req.query.time + '';
  var sql = "INSERT INTO user_footprint(fp_user_id,cp_id,time) VALUES(?,?,?)";
  pool.query(sql, [uid, did,time], (err, result) => { 
    if (err) throw err;
    res.send({ code: 1, msg: '添加成功' });
  })
})


/*验证是否已存在*/
router.get("/isExist", (req, res) => { 
  var uid = req.query.uid;
  var did = req.query.did;
  var sql = "SELECT fid FROM user_footprint WHERE fp_user_id=? AND cp_id=?";
  pool.query(sql, [uid, did], (err, result) => { 
    if (err) throw err;
    if (result.length > 0) {
      res.send({ code: 1, msg: "已存在" })
    } else { 
      res.send({ code: 0, msg: "不存在" })
    }
  })
})

module.exports = router;