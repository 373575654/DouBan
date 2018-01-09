<template>
  <div class="wrapper">
    <div id="header"><a href="" class="logo">登录豆瓣</a></div>
    <div id="content">
        <h1>登录豆瓣</h1>
        <div class="article">
            <form id="lzform" name="lzform" method="post">
                <div style="display:none;">
                    <img src="../assets/img/blank.gif">
                </div>
                <input name="source" type="hidden" value="index_nav">
                <input name="redir" type="hidden" value="">
                <div id="item-error" style="display:block;">
                    <p class="error" v-if="isShow">账号不能为空</p>
                    <p class="error" v-if="isShow3">密码不能为空</p>
                    <p class="error" v-if="isCorrect">帐号和密码不匹配</p>
                </div>
                <div class="item-right">
                    <a href="">手机验证码登录</a>
                </div>
                <div class="item">
                    <label>帐号</label>
                    <input id="email" name="form_email" type="text" class="basic-input" maxlength="60" placeholder="邮箱/手机号/用户名" tabindex="1" v-model.lazy="account" >
                    <span id="form_email_err" class="error-tip" v-if="isShow1">请输入正确的邮箱/手机号/用户名</span>
                </div>
                <div class="item">
                    <label>密码</label>
                    <input id="password" name="form_password" type="password" class="basic-input" maxlength="20" tabindex="2" v-model.lazy="upwd">
                    <span id="form_password_err" class="error-tip" v-if="isShow2">请输入密码</span>
                </div>
                <div class="item">
                    <label>&nbsp;</label>
                    <p class="remember">
                    <input type="checkbox" id="remember" name="remember" tabindex="4">
                    <label for="remember" class="remember">下次自动登录</label>
                    | <a href="">忘记密码了</a>
                    </p>
                </div>
                <div class="item">
                    <label>&nbsp;</label>
                    <input type="submit" value="登录" name="login" class="btn-submit" tabindex="5" @click.prevent="submitinfo">
                </div>
                <div class="item item-3rd">
                    <label>
                    第三方登录：
                    </label>
                    <a target="_top" href="" class="item-wechat"><img src="../assets/img/connect_wechat.png" title="微信"></a>
                    <a target="_top" href="" class="item-weibo"><img src="../assets/img/connect_sina_weibo.png" title="新浪微博"></a>
                </div>
            </form>
        </div>
        <ul id="side-nav" class="aside">
            <li>&gt;&nbsp;还没有豆瓣帐号？<a rel="nofollow" href="http://localhost:8082/#/register">立即注册</a></li>
            <li>&gt;&nbsp;<a href="">点击下载豆瓣移动应用</a></li>
        </ul>
    </div>
    <div id="footer">
        <span id="icp" class="fleft gray-link">
            © 2005－2017 douban.com, all rights reserved
        </span>
        <span class="fright">
            <a href="">关于豆瓣</a>
            · <a href="">在豆瓣工作</a>
            · <a href="">联系我们</a>
            · <a href="">免责声明</a>    
            · <a href="">帮助中心</a>
            · <a href="">开发者</a>
            · <a href="">移动应用</a>
            · <a href="">豆瓣广告</a>
        </span>
    </div>
  </div>
</template>
<script>
    export default{
        data:function(){
            return{
                account:"",
                upwd:"",
                isShow:false,
                isCorrect:false,
                isShow1:false,
                isShow2:false,
                isShow3:false
            }
        },
        methods:{
            submitinfo:function(){
                this.isShow3=false;
                this.isShow=false;
                if(this.account==''&&this.upwd==''){
                    this.isShow1=true;
                    this.isShow2=true;
                }else if(this.account==''){
                    this.isShow1=true;
                    this.isShow2=false;                
                }else if(this.upwd==''){
                    this.isShow2=true;
                    this.isShow1=false;
                }
                else{
                    this.isShow1=false;
                    this.isShow2=false;
                    this.$http.get("http://localhost:3002/login/login/"+this.account+"/"+this.upwd)
                    .then(function(response){
                        if(response.data.code>0){
                            this.$router.push("/mydb");
                        }else{
                            this.isCorrect=true;
                            this.isShow=false;
                            this.isShow3=false;
                        }
                    });
                }
            }
        },
        mounted:function(){
            var url=location.hash.split("?")[1];
            console.log(url);
            var i1=url.indexOf("=");
            var i2=url.indexOf("&");
            var i3=url.lastIndexOf("=");
            var account=url.substring(i1+1,i2);
            var upwd=url.substring(i3+1);
            if(account==''&&upwd==''){
                this.isShow=true;
            }else if(account!=''&&upwd!=''){
                this.isCorrect=true;
                this.account=account;
            }else if(account!=''&&upwd==''){
                this.isShow=false;
                this.isShow3=true;
                this.account=account;
            }
        }
    }
</script>
<style scoped>
    h1 {
        color: #494949;
        display: block;
        font-size: 25px;
        font-weight: bold;
        line-height: 1.1;
        margin: 0;
        padding: 0 0 30px;
        word-wrap: break-word;
    }
    p{
        margin:0;
        padding:0;
    }
    label {
        float: left;
        margin-right: 15px;
        text-align: right;
        width: 60px;
        font-size: 14px;
        line-height: 30px;
        vertical-align: baseline;
        font-weight:unset;
    }
    ul, ol {
        margin-top: 0;
        margin-bottom: 10px;
        list-style: none;
    }
    input{
        outline:none;
    }
    a:link{
        color:#37a;
        font-size: 12px;
        cursor: pointer;
    }
    a:hover{
        color:#fff;
        background: #37a;
        text-decoration: none;
    }
    a.item-wechat:hover,a.item-weibo:hover{
        background: none;
    }
    .wrapper {
        width: 950px;
        margin: 0 auto;
    }
    #header, #content, #footer {
        width: 100%;
        overflow: hidden;
    }
    #header{
        margin-bottom: 40px;
        padding-top:30px;
    }
    a.logo{
        background:transparent url(../assets/img/logo.png) no-repeat;
    }
    .logo {
        float: left;
        width: 215px;
        height: 30px;
        overflow: hidden;
        line-height: 10em;
    }
    #content {
        margin-bottom: 40px;
        min-height:410px;
    }
    .article {
        float: left;
        width: 590px;
    }
    #item-error {
        padding-left: 75px;
    }
    .error,.error-tip {
        color: #fe2617;
        font-size:12px;
    }
    .item-right {
        text-align: right;
        width: 287px;
        margin-bottom:5px;
    }
    .item {
        clear: both;
        margin: 0 0 15px;
        zoom: 1;
        height:30px;
    }
    .basic-input{
        width:200px;
        padding:5px;
        height:100%;
        font-size:14px;
        border-radius: 3px;
        border: 1px solid #c9c9c9;
        vertical-align: middle;
    }
    .item .basic-input:focus {
        border: 1px solid #a9a9a9;
    }
    .error-tip {
        margin-left: 10px;
        font-size:12px;
    }
    .remember {
        cursor: pointer;
        font-size: 12px;
        display: inline;
        width: auto;
        text-align: left;
        float: none;
        margin: 0;
        color: #666;
    }
    .btn-submit {
        cursor: pointer;
        color: #ffffff;
        background: #3fa156;
        border: 1px solid #528641;
        font-size: 14px;
        font-weight: bold;
        padding: 6px 26px;
        border-radius: 3px;
    }
    .item-3rd {
        padding: 5px 0;
        width: 200px;
        margin: 20px 0 0 75px;
        border-top: 1px solid #eee;
        border-bottom: 1px solid #eee;
    }
    .item-3rd label {
        width: auto;
        margin: 0;
        font-size: 12px;
        color: #999;
        line-height: 1.5;
    }
    .item-3rd img {
        margin: 0 5px;
        vertical-align: middle;
    }
    .aside {
        float: right;
        width: 310px;
        color: #666;
    }
    .aside li {
        padding-bottom: 1em;
        font-size: 12px;
    }
    #footer {
        color: #999;
        padding-top: 6px;
        border-top: 1px dashed #ddd;
    }
    .fright {
        float: right;
    }

</style>
