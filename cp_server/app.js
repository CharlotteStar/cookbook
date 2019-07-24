//引入模块
const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const session = require("express-session");
const userRouter = require("./routes/user.js");
const tjRouter = require("./routes/tuijian.js");
const cpRouter = require("./routes/caipu.js");

//创建express对象
var server = express();
//绑定监听端口
server.listen(9999);

server.use(bodyParser.urlencoded({
  extended: false
}))

//跨域
server.use(cors({
  origin:['http://127.0.0.1:8080',"http://localhost:8080"],
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
server.use("/caipu", cpRouter)


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