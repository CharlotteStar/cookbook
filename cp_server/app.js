//引入模块
const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const session = require("express-session");

const userRouter = require("./routes/user.js");  //用户
const tjRouter = require("./routes/tuijian.js"); //推荐页
const cpRouter = require("./routes/caipu.js");   //菜谱
const shoucan = require("./routes/shoucan.js"); //我的收藏
const search = require("./routes/search.js");   //搜索
const guanzhu = require("./routes/guanzhu.js");   //我的关注
const footprint= require("./routes/footprint.js");  //我的足迹
const pinglun= require("./routes/pinglun.js");  //评论



const pool = require("./pool.js");
//创建express对象
var server = express();//创建web服务器
//绑定监听端口
server.listen(9999);

server.use(bodyParser.urlencoded({
  extended: false,
  limit: '50mb',
  extended: true
}))
// 上传文件的限制大小
server.use(bodyParser.json({ limit: '50mb' }));

//跨域
server.use(cors({
  origin:['http://127.0.0.1:8080',"http://localhost:8080","http://caiputianxia.applinzi.com"],
  credentials: true  //是否验证
}));

//添加session功能
server.use(session({
  secret:'随机字符串',
  cookie:{maxAge:60*1000*30},//过期时间ms
  resave:false,
  saveUninitialized:true
}));//将服务器的session，放在req.session中


//托管静态文件夹
server.use(express.static("public"))

//挂载的路由器
server.use("/user", userRouter);
server.use("/tj", tjRouter);
server.use("/caipu", cpRouter);
server.use("/shoucan",shoucan)
server.use("/search", search);
server.use("/gz", guanzhu);
server.use("/footprint", footprint);
server.use("/pinglun", pinglun);


//用户菜谱页面加载更多
server.get("/menu01_item",(req,res)=>{
  var pno=req.query.pno;
  var ps=req.query.pageSize;
  var uid=req.query.uid;
  console.log(pno,ps)
  if(!pno){pno=1}
  if(!ps){ps=10}
  var obj={code:1,msg:"查询成功"};
  var sql="SELECT pic,title FROM cp_details WHERE user_id=? LIMIT ?,?";
  var off=(pno-1)*ps;
  ps=parseInt(ps);
  pool.query(sql,[uid,off,ps],(err,result)=>{
    if(err)throw err;
    obj.data=result;
    res.send(obj);
    // var sql="SELECT count(*) AS c FROM cp_details";
    // pool.query(sql,(err,result)=>{
    //   if(err)throw err;
    //   var pc=Math.ceil(result[0].c/ps);
    //   obj.pc=pc;
    //   res.send(obj);
    // })
  });
});


// //首先引入https和querystring模块
// var https = require('https');
// var qs = require('querystring');

// var apikey = 'a8dca010bf8a50657c20782164281da5';
// var mobile = '13729412134';
// var text = '';  //注意这里固定格式【此处为后台设置的签名】
// //例子：var text = '【天天测试】感谢您的注册，您的验证码是'+verCode;
// //verCode测试的时候可以直接写个数字

// //这里我们不需要自定义模板和语音验证，国际和国内请求的短信验证是同一个url
// //嫌麻烦的话这里可以直接定义为一个url
// var sms_host = 'sms.yunpian.com';  //请求地址的url
// send_sms_uri = '/v2/sms/single_send.json';  //请求地址的url

// //调用发送验证码，参数请求地址、apikey、手机号、自定义模板内容
// send_sms(send_sms_uri,apikey,mobile,text);

// //send_sms方法
// function send_sms(uri,apikey,mobile,text){
//     var post_data = {  
//     'apikey': apikey,  
//     'mobile':mobile,
//     'text':text,
//     }; 
//     var content = qs.stringify(post_data);  
//     //把发送的数据解析为字符串发送
//     post(uri,content,sms_host);
// }

// function post(uri,content,host){
//     var options = {  
//         hostname: host,
//         port: 443,  
//         path: uri,  
//         method: 'POST',  
//         headers: {  
//             'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'  
//         }  
//     };
//     var req = https.request(options, function (res) {  
//         res.setEncoding('utf8');  
//         res.on('data', function (chunk) {  
//             console.log('BODY: ' + chunk);  
//         });  
//     }); 
//     req.write(content);  

//     req.end();   
// }