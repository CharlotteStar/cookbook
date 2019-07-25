const  express=require("express");
const  pool=require("../pool.js");
var  router=express.Router();


 router.post("/yh_shoucan",(req,res)=>{
  var obj=req.body.uid;
  var sql = "select title,score,uname,avatar,browse,pic,shoucang,benefit,sid from cp_collect,cp_details,cp_user where uid=ct_user_id and did=cp_id and ct_user_id=?";
  pool.query(sql,[obj],(err,result)=>{
    if(err)throw err;   
     res.send(result)
  });
 });
 router.get("/shanchu")
 

module.exports = router;