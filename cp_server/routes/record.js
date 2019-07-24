// 创建一个用户上传美食信息的路由
const express = require("express");
const pool = require("../pool.js");

const router = express.Router();

//获取用户上传及个人信息
router.get("/record",(req,res)=>{
    var sql = "SELECT * FROM user_img WHERE nid = ?";
    pool.query(sql,[nid],(err,result)=>{
        if(err)throw err;
        res.send({code:1,msg:"查询成功",data:result})
        console.log(123)
    }); 
});
router.get("/recordon")

module.exports = router;