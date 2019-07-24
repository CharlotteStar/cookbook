const express = require("express");
const pool = require("../pool.js");
var router = express.Router();

//登录验证
//邮箱验证
router.post("/email_login", (req, res) => { 
  var email = req.body.account;
  var upwd = req.body.upwd;
  pool.query("SELECT email FROM cp_user WHERE email=?", [email], (err, result) => {
    if (err) throw err;
    if (result.length == 0) {
      res.send({ code: "0", msg: "邮箱未注册" })
    } else { 
      pool.query("SELECT * FROM cp_user WHERE email=? AND upwd=md5(?)", [email, upwd], (err, result) => {
        if (err) throw err;
        if (result.length == 0) {
          res.send({ code: 0, msg: "密码不正确" });
        } else {
          req.session.uid = result[0].uid;    //将用户id保存到session对象中
          res.send({ code: 1, msg: "登陆成功", data: result });
        }
      });
    }
  })
})
//手机号验证
router.post("/phone_login", (req, res) => { 
  var phone = req.body.account;
  var upwd = req.body.upwd;
  pool.query("SELECT email FROM cp_user WHERE phone=?", [phone], (err, result) => {
    if (err) throw err;
    if (result.length == 0) {
      res.send({ code: "0", msg: "手机号未注册" })
    } else { 
      pool.query("SELECT * FROM cp_user WHERE phone=? AND upwd=md5(?)", [phone,upwd], (err, result) => {
        if (err) throw err;
        if (result.length == 0) {
          res.send({ code: 0, msg: "密码不正确" });
        } else { 
          req.session.uid = result[0].uid;    //将用户id保存到session对象中
          res.send({ code: 1, msg: "登陆成功", data: result });
        }
      })
    }
  })
})



//用户注册
router.post("/register", (req, res) => { 
  var phone_reg=/^1[3-9][0-9]{9}$/;
  var obj = req.body;
  var sql, account;
  if (phone_reg.test(obj.phone)) {
    sql = "INSERT INTO cp_user  (phone,upwd,uname) VALUES (?,md5(?),?)";
    account = obj.phone;
  } else { 
    sql = "INSERT INTO cp_user  (email,upwd,uname) VALUES (?,md5(?),?)";
    account = obj.email;
  }
  pool.query(sql, [account,obj.upwd,obj.uname], (err, result) => { 
    if (err) throw err;
    if (result.affectedRows > 0) {
      res.send({ code: 1, msg: "注册成功" })
    } else { 
      res.send({ code: 0, msg: "注册失败" });
    }
  })
});
//验证用户邮箱是否已注册
router.get("/ver_email", (req, res) => { 
  var email = req.query.email;
  pool.query("SELECT * FROM cp_user WHERE email=?", [email], (err, result) => { 
    if (err) throw err;
    if (result.length > 0) {
      res.send({ code: 0, msg: "邮箱已注册" })
    } else { 
      res.send({ code: 1, msg: "邮箱可以注册" });
    }
  })
})
//验证手机是否已注册
router.get("/ver_phone", (req, res) => { 
  var phone = req.query.phone;
  pool.query("SELECT * FROM cp_user WHERE phone=?", [phone], (err, result) => { 
    if (err) throw err;
    if (result.length > 0) {
      res.send({ code: 0, msg: "手机号已注册" })
    } else { 
      res.send({ code: 1, msg: "手机号可以注册" });
    }
  })
})

module.exports = router;