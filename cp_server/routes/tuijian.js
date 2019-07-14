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




module.exports = router;