const  express=require("express");
const  pool=require("../pool.js");
var  router=express.Router();


//获取收藏的个数
router.get("/byCount", (req, res) => { 
  var did = req.query.did;
  var sql = "select sid from cp_collect where cp_id=?";
  pool.query(sql, [did], (err, result) => {
    if (err) throw err;
    res.send({ code: 1, msg: "查询成功", data: result.length });
  })
})

//查看是否已收藏
router.get("/is_shoucang",(req,res)=>{
  var uid=req.query.uid;
  var did=req.query.did;
  pool.query("select sid from cp_collect where ct_user_id=? and cp_id=?",[uid,did],(err,result)=>{
   if(err) throw err; 
    if(result.length>0){
        res.send({ code: 1, msg: "查询成功", data: result[0] });
    }else{
        res.send({ code: 0, msg: "查询失败" });
    }
  }); 
});

//获取收藏的数据
 router.post("/yh_shoucan",(req,res)=>{
  var obj=req.body.uid;
  var sql = "select did,title,score,uname,avatar,browse,pic,shoucang,benefit,sid from cp_collect,cp_details,cp_user where uid=ct_user_id and did=cp_id and ct_user_id=?";
  pool.query(sql,[obj],(err,result)=>{
    if(err)throw err;   
     res.send(result)
  });
 });

//添加收藏
router.get("/add", (req, res) => {
  var uid = req.query.uid;
  var did = req.query.did;
  var sql = 'INSERT INTO cp_collect(ct_user_id,cp_id) VALUES (?,?)';
  pool.query(sql, [uid, did], (err, result) => {
    if (err) throw err;
    res.send({ code: 1, msg: "删除成功", data: result });
  })
});

//删除收藏
 router.get("/shangchu",(req,res)=>{
   var sid = req.query.sid;
   pool.query("DELETE FROM cp_collect WHERE sid=?",[sid],(err,result)=>{
     if (err) throw err; 
     if(result.affectedRows>0){
       res.send('1')
     }else{res.send('0')}
   }); 
 });
// 全删
router.get("/quanshan",(req,res)=>{
   var qs=req.query.sids;
   pool.query(`DELETE FROM cp_collect WHERE sid IN (${qs})`,(err,result)=>{
     if(err) throw err;
     if(result.affectedRows>0){
      res.send('1')
     } else {
       res.send('0')
     }
  }); 
})


module.exports = router;