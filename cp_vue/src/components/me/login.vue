<template>
  <div class="page-login">
    <me-Top meTitle="用户登录" meTopRight="注册" meTopRightTo="/register"></me-Top>
    <div class="login-operation">
      <mt-field placeholder="手机号/邮箱" class="account" v-model="account"></mt-field>
      <mt-field type="password" placeholder="密码" class="upwd" v-model="upwd"></mt-field>
    </div>
    <div class="login">
      <mt-button class="btn-login" size="large" @click="login">登录</mt-button>
    </div>
    <div class="forgetPwdDiv">
      <router-link to="" class="forgetPwd">忘记密码？</router-link>
    </div>
  </div>
</template>

<script scoped>
import qs from 'qs';
import meTop from './common/meTop.vue'
export default {
  components:{
    meTop
  },
  data(){
    return{
      account:"",
      upwd:""
    }
  },
  methods:{
    login(){
      var email_reg=/^\w+[(\w\-_]*@[\w\-_]+\.[A-Za-z]+$/;
      var phone_reg=/^1[3-9][0-9]{9}$/;
      var data={
        account:this.account,
        upwd:this.upwd
      };
      if(!this.account){
        this.$toast({
          message:"账号不能为空",
          position:"top",
          duration:1500,
        })
      }else if(!this.upwd){
        this.$toast({
          message:"密码不能为空",
          position:"top",
          duration:1500,
        })
      }else if(email_reg.test(this.account)){
        this.axios.post(
          '/user/email_login',
          qs.stringify(data),
          {headers:{'Content-Type':'application/x-www-form-urlencoded'}}
        ).then(res=>{
          window.sessionStorage.uid=res.data.data[0].uid;
          this.$toast({
            message:res.data.msg,
            position:"top",
            duration:1500,
          });
          this.$router.push("/home");
        })
      }else if(phone_reg.test(this.account)){
        this.axios.post(
          "/user/phone_login",
          qs.stringify(data),
          {headers:{'Content-Type':'application/x-www-form-urlencoded'}}
        ).then(res=>{
          var code=res.data.code;
          if(code==1){
            sessionStorage.setItem("user",JSON.stringify(res.data.data));
            this.$toast({
              message:res.data.msg,
              position:"top",
              duration:1500,
              iconClass:"iconfont icon-biaoqing",   
            })
            this.$router.replace("/home");
          }else{
            this.$toast({
              message:res.data.msg,
              position:"top",
              duration:1500,
            })
          }
        })
      }else{
        this.$toast({
          message:"账号格式不正确",
          position:"top",
          duration:1500,
        })
      }
    }
  },
  mounted() { 
    var mint_field_core = document.getElementsByClassName("mint-field-core");
    for (var i = 0; i < mint_field_core.length;i++) { 
      mint_field_core[i].onfocus=function () { 
        this.parentNode.parentNode.classList.add("focus");
      }
      mint_field_core[i].onblur=function () { 
        this.parentNode.parentNode.classList.remove("focus");
      }
    }
  }
}
</script>

<style  scoped>
.page-login{
  background: #f5f5f5;
  height:100vh;
  text-align: center
}
.account,.upwd{
  background:#fff;
}
.login{
  display:flex;
  justify-content: center;
}
.btn-login{
  margin-top:2rem;
  width:90%;
  background:#ff5151;
  color:#fff;
  height:2.6rem;
}
.forgetPwdDiv{
  margin-top:0.75rem;
}
.forgetPwd{
  color:#acacac;
}
</style>
