<template>
    <div id="anony-reg-new">
        <div class="wrapper">          
            <div class="login">
                <form id="lzform" name="lzform" method="post" action="">
                    <fieldset>
                        <legend>登录</legend>
                        <input type="hidden" value="index_nav" name="source">
                        <div class="item item-account">
                            <input type="text" name="form_email" id="form_email" value="" class="inp" placeholder="邮箱 / 手机号" tabindex="1" style="width:100%;" v-model.lazy="account">
                        </div>
                        <div class="item item-passwd">
                            <input name="form_password" placeholder="密码" id="form_password" class="inp" type="password" tabindex="2" v-model.lazy="upwd">
                            <div class="opt">
                                <a href="https://www.douban.com/accounts/resetpassword">帮助</a>
                            </div>
                        </div>
                        <div class="item item-submit">
                            <input value="登录豆瓣" type="submit" class="bn-submit" tabindex="4" @click.prevent="Loginsubmit">
                            <router-link to='/register' class="lnk-reg">注册账号</router-link>
                        </div>
                        <div class="item-action">
                            <label for="form_remember">
                                <input name="remember" type="checkbox" id="form_remember" tabindex="4" style="margin:0 5px 0 0;">记住我
                            </label>
                            <ul class="item-action-third">
                                <li><a class="wechat" href="" target="_blank" title="微信登录">微信登录</a></li>
                                <li><a class="weibo" href="" target="_blank" title="微博登录">微博登录</a></li>
                            </ul>
                        </div>
                    </fieldset>
                </form>
            </div>
            <div class="app">
                <p class="app-title">豆瓣<span>5.0</span></p>
                <p class="app-slogan"><span>我们的精神角落</span></p>
                <a href="" class="lnk-app">下载豆瓣 App</a>
                <div class="app-qr">
                    <a href="javascript: void 0;" class="lnk-qr" id="expand-qr"><img src="../../assets/img/icon_qrcode_green.png" width="28" height="28"></a>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    data:function(){
        return{
            account:"",
            upwd:""
        }
    },
    methods:{
        Loginsubmit:function(){
            if(this.account!=''&&this.upwd!=''){
                this.$http.get("http://localhost:3002/login/login/"+this.account+"/"+this.upwd)
                .then(function(response){
                    if(response.data.code==1){
                        this.$router.push("/mydb");
                    }else{
                        this.$router.push("/login?account="+this.account+"&upwd="+this.upwd);
                    }
                });
            }else if(this.account==''||this.upwd==''){
                this.$router.push("/login?account="+this.account+"&upwd="+this.upwd);
            }
        }
    }
}
</script>
<style>
    ul, ol {
        list-style: none;
    }
    a:visited {
        color: #669;
        text-decoration: none;
    }
    a:link {
        color: #37a;
        text-decoration: none;
    }
    a {
        cursor: pointer;
        text-decoration: none;
    }
    form {
        margin: 0;
        padding: 0;
        border: 0px;
    }
    label {
        font-family: Tahoma;
        vertical-align: middle;
    }
    label {
        cursor: default;
    }
    #anony-reg-new {
        height:179px;
        background-image: url(../../assets/img/doubanapp5_bg.png);
        background-size: contain;
        background-position: -webkit-calc(50% - 305px) top;
        background-position: calc(50% - 305px) top;
        background-repeat: no-repeat;
        background-color: #edf4ed;
    }
    #anony-reg-new .wrapper {
        position: relative;
        padding: 28px 0 4px;
        overflow: visible;
        zoom: 1;
        height:100%;
    }
    #anony-reg-new .wrapper:before {
        content: "";
        position: absolute;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        z-index: 0;
        background-image: url(../../assets/img/doubanapp5.png);
        background-repeat: no-repeat;
        background-position: 0 -150px;
    }
    .wrapper {
        width: 950px;
        margin: 0 auto;
    }
    #anony-reg-new .wrapper .login {
        position: relative;
    }

    #anony-reg-new .wrapper .login, #anony-reg-new .wrapper .app {
        z-index: 2;
    }
    #anony-reg-new .login {
        width: 270px;
        float: right;
        margin-bottom: 15px;
        font-size: 0;
        letter-spacing: -.31em;
    }
    #anony-reg-new .login fieldset {
        margin: 0;
        padding: 0;
        border: none;
    }
    #anony-reg-new .login legend {
        display: none;
    }
    fieldset legend {
        color: #666;
        padding: 0 5px;
    }
    input {
        margin-right: 3px;
        vertical-align: middle;
        outline: none;
    }

    input {
        font-size: 12px;
    }
    #anony-reg-new .login .item, #anony-reg-new .login .item-submit {
        vertical-align: top;
        text-align: left;
        font-size: 0;
        letter-spacing: normal;
        word-spacing: normal;
    }

    #anony-reg-new .login .item {
        position: relative;
        margin-bottom: 4px;
    }
    #anony-reg-new .login .item .inp {
        border: 1px solid #DBE5DB;
        border-radius: 2px;
        width: 252px;
        padding: 0 8px;
        height: 30px;
        line-height: 30px;
        font-size: 12px;
    }
    #anony-reg-new .login .item.item-passwd {
        position: relative;
        border: 1px solid #DBE5DB !important;
        border-radius: 2px;
        background: #fff;
        width: 268px;
    }
    #anony-reg-new .login .item.item-passwd input {
        border: 0;
        width: 220px;
    }
    #anony-reg-new .login .item.item-passwd .opt {
        position: absolute;
        top: 0;
        right: 10px;
        font-size: 12px;
        line-height: 35px;
    }
    #anony-reg-new .login .item.item-passwd .opt a {
        color: #ccc;
    }
    #anony-reg-new .login .item-submit {
        margin-top: 6px;
    }

    #anony-reg-new .login .item, #anony-reg-new .login .item-submit {
        vertical-align: top;
        text-align: left;
        font-size: 0;
        letter-spacing: normal;
        word-spacing: normal;
    }

    #anony-reg-new .login .item {
        position: relative;
        margin-bottom: 4px;
    }
    #anony-reg-new .login .bn-submit {
        padding: 0 22px;
        margin-right: 0;
        height: 30px;
        font-size: 12px;
        border: none;
        border-radius: 2px;
        cursor: pointer;
        background: #30A080;
        border-color: #30A080;
        color: #fff;
        color: #fff;
        width: 89px;
        box-sizing: content-box;
    }
    #anony-reg-new .lnk-reg:link {
        color: #30A080;
        background: transparent;
    }

    #anony-reg-new .lnk-reg {
        display: inline-block;
        zoom: 1;
        padding: 8px 21px 7px;
        vertical-align: top;
        border-radius: 2px;
        border: 1px solid #30A080;
        font-size: 12px;
        color: #30A080;
        line-height: 1;
        width: 130px;
        text-align: center;
        margin-left: 4px;
    }
    #anony-reg-new .login .bn-submit:hover {
        background-color: #2a8c70;
    }
    #anony-reg-new .lnk-reg:hover {
        color: #2a8c70;
        border-color: #2a8c70;
        background: transparent;
    }
    #anony-reg-new .login .item-action {
        font-size: 12px;
        margin-top: 8px;
        overflow: hidden;
        color: #666;
    }
    #anony-reg-new .login .item-action-third {
        float: right;
        font-size: 0;
        margin-top: 3px;
        margin-right: 4px;
    }
    #anony-reg-new .login .item-action-third li {
        display: inline-block;
    }
    #anony-reg-new .login .item-action-third a {
        color: #37a;
    }
    #anony-reg-new .login .item-action-third a:before {
        content: "";
        display: inline-block;
        width: 14px;
        height: 12px;
        background-repeat: no-repeat;
        background-position: bottom;
    }
    #anony-reg-new .login .wechat:before {
        background-image: url(../../assets/img/wechat.png);
    }
    #anony-reg-new .login .item-action-third li+li {
        margin-left: 8px;
    }
    #anony-reg-new .login .weibo:before {
        background-image: url(../../assets/img/weibo.png);
    }
    #anony-reg-new .wrapper .app {
        z-index: 2;
    }

    #anony-reg-new .app {
        position: absolute;
        height: 120px;
        top: 0;
        bottom: 0;
        margin: auto 0 auto 430px;
    }
    #anony-reg-new .app-title {
        margin: 7px 0;
        font-size: 25px;
        color: #111;
        line-height: 24px;
        text-rendering: optimizelegibility;
    }
    #anony-reg-new .app-title span {
        color: #111;
        margin-left: 10px;
    }
    #anony-reg-new .app-slogan {
        margin: 0 0 30px;
        font-size: 0;
        color: #111;
        text-rendering: optimizelegibility;
    }
    #anony-reg-new .app-slogan span {
        font-size: 12px;
        letter-spacing: 2px;
    }
    #anony-reg-new .lnk-app:link{
        background: #00B51D;
        color: #FFF;
    }
    #anony-reg-new .lnk-app {
        display: inline-block;
        zoom: 1;
        padding: 9px 21px;
        margin-right: 2px;
        vertical-align: top;
        border-radius: 2px;
        font-size: 12px;
        background: #00B51D;
        color: #FFF;
        line-height: 1;
    }
    #anony-reg-new .app-qr {
        display: inline-block;
        zoom: 1;
        position: relative;
    }
</style>

