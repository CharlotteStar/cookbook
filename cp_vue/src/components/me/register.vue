<template>
  <div class="page-reg">
    <me-top meTitle="用户注册" meTopRight="登录" meTopRightTo="/login"></me-Top>
    <div class="reg-mode">
      <div class="reg-mode-item">
        <div class="phone-reg" :class=" isPhoneReg ? 'selected' : '' " @click="reg_mode">手机注册</div>
      </div>
      <div class="reg-mode-item">
        <div class="email-reg" @click="reg_mode" :class=" isEmailReg ? 'selected' : '' ">邮箱注册</div>
      </div>
    </div>
    <div class="reg-operation">
      <mt-field  placeholder="手机号" :class=" isPhoneReg ? '' : 'd-none' " v-model="phone"></mt-field>
      <mt-field placeholder="邮箱" :class=" isEmailReg ? '' : 'd-none' " v-model="email"></mt-field>
      <mt-field placeholder="密码" v-model="upwd" type="password"></mt-field>
      <mt-field placeholder="验证码" :class=" isPhoneReg ? '' : 'd-none' " v-model="verCode"></mt-field>
    </div>
    <div class="register">
      <mt-button class="btn-reg" size="large" @click="register">注册</mt-button>
    </div>
  </div>
</template>

<script>
import qs from 'qs';
import meTop from './common/meTop.vue'
export default {
  components:{
    meTop
  },
  data(){
    return {
      isPhoneReg:true,   //是否手机验证
      isEmailReg:false,  //是否邮箱验证
      email:"",
      phone:"",
      upwd:"",
      verCode:""
    }
  },
  methods:{
    register(){
      var email_reg=/^\w+[(\w\-_]*@[\w\-_]+\.[A-Za-z]+$/;
      var phone_reg=/^1[3-9][0-9]{9}$/;
      var email=this.email;
      var phone=this.phone;
      var upwd=this.upwd;
      var uname='ms'+Math.random().toString(10).substr(2,6);//随机用户名
      var toast=(message,icon)=>{   //验证提示信息
        this.$toast({
          message:message,
          position:"top",
          duration:1500,
          iconClass:"iconfont "+icon
        })
      }
      if(this.isEmailReg){   //邮箱的注册验证
        if(!email){
          toast("邮箱不能为空","icon-biaoqing1");
        }else if(!upwd){
          toast("密码不能为空","icon-biaoqing1");
        }else if(!email_reg.test(email)){
          toast("邮箱格式不正确","icon-biaoqing1");
        }else if(upwd.length<6){
          toast("密码长度不能少于六位","icon-biaoqing1");
        }else{
          this.axios.get(
            "/user/ver_email",
            {params:{email}}
          ).then(res=>{
            var code=res.data.code;
            if(code==0){
              toast(res.data.msg,"icon-biaoqing1");
            }else{
              var data={email,upwd,uname};
              this.axios.post(
                "/user/register",
                qs.stringify(data),
                {headers:{'Content-Type':'application/x-www-form-urlencoded'}}
              ).then(res=>{
                if(res.data.code==1){
                  toast(res.data.msg,"icon-biaoqing");
                  this.$router.push("/login")
                }else{
                  toast(res.data.msg,"icon-biaoqing");
                }
              })
            }
          })
        }
      }else if(this.isPhoneReg){  //手机号的验证注册
        if(!phone){
          toast("手机号不能为空","icon-biaoqing1");
        }else if(!upwd){
          toast("密码不能为空","icon-biaoqing1");
        }else if(!phone_reg.test(phone)){
          toast("手机号格式不正确","icon-biaoqing1");
        }else if(upwd.length<6){
          toast("密码长度不能少于六位","icon-biaoqing1");
        }else{
          this.axios.get(
            "/user/ver_phone",
            {params:{phone}}
          ).then(res=>{
            if(res.data.code==0){
              toast(res.data.msg,"icon-biaoqing1");
            }
            else{
              var data={phone,upwd,uname}
              this.axios.post(
                "/user/register",
                qs.stringify(data),
                {headers:{'Content-Type':'application/x-www-form-urlencoded'}}
              ).then(res=>{
                toast(res.data.msg,"icon-biaoqing");
                this.$router.push("/login")
              })
            }
          })
        }
      }
    },
    reg_mode(e){
      var bool=this.isPhoneReg;
      this.isPhoneReg=this.isEmailReg;
      this.isEmailReg=bool;
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

<style scoped>
.page-reg{
  background: #f5f5f5;
  height:100vh;
  text-align: center;
}
.reg-mode{
  display:flex;
  justify-content: center;
  align-items: center;
  padding:0 1rem;
}
.reg-mode .reg-mode-item:first-child>div{
  border-radius:4px 0 0 4px ;
}
.reg-mode .reg-mode-item:last-child>div{
  border-radius:0 4px 4px 0;
}
.reg-mode .reg-mode-item{
  flex-grow: 1;
  color:#ff5151;
}
.reg-mode .phone-reg,
.reg-mode .email-reg{
  background:#fff;
  padding:0.25rem ;
  border:1px solid #ff5151;
}
.reg-mode-item .selected{
  background:#ff5151;
  color:#fff;
}
.reg-operation{
  margin-top:45px;
}
.register{
  display:flex;
  justify-content: center;
}
.btn-reg{
  margin-top:2rem;
  width:90%;
  background:#ff5151;
  color:#fff;
  height:2.6rem;
}
.reg-operation .d-none{
  display:none;
}
</style>