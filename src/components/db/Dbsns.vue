<template>
  <div id="db-nav-sns" class="nav">
    <div class="nav-wrap">
        <div class="nav-primary">
            <div class="nav-logo">
            </div>
            <div class="nav-search">
                <form action="" method="get">
                    <fieldset>
                    <legend>搜索：</legend>
                    <label for="inp-query" style="display: none;">搜索你感兴趣的内容和人...</label>
                    <div class="inp">
                        <input type="hidden" name="source" value="suggest">
                        <input id="inp-query" name="q" size="22" maxlength="60" autocomplete="off" value="" placeholder="搜索你感兴趣的内容和人...">
                    </div>
                    <div class="inp-btn"><input type="submit" value="搜索"></div>
                    </fieldset>
                </form>
            </div>
            <div class="nav-items">
                <ul>
                    <li><a href="">首页</a></li>
                    <li><a href="">我的豆瓣</a></li>
                    <li>
                        <a href="">
                        浏览发现
                        </a>
                    </li>
                    <li>
                        <a href="">
                        话题广场
                        <img src="../../assets/img/new_menu.gif" alt="new" style="position: absolute; top: -7px; right: -13px;">
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
  </div>
</template>
<script>
    
</script>
<style scoped>
    input{
        border:none;
        outline:none;
    }
    ul{
        list-style: none;
    }
    #db-nav-sns {
        position: relative;
        zoom: 1;
        background: #edf4ed;
    }
    .nav {
        width: 100%;
        min-width: 1040px;
        overflow: hidden;
        zoom: 1;
        margin-bottom: 50px;
    }
    #db-nav-sns .nav-wrap {
        border: none;
    }
    #db-nav-sns .nav-primary {
        overflow: hidden;
        zoom: 1;
    }
    #db-nav-sns .nav-primary {
        width: 1040px;
    }
    .nav .nav-primary {
        position: relative;
        padding: 10px 0 5px;
        overflow: hidden;
        zoom: 1;
        margin:0 auto;
    }
    #db-nav-sns .nav-logo {
        width: 184px;
        height: 57px;
        background-position: 0 10px;
        float: left;
        margin:0 13px 0 0;
        background-image: url(../../assets/img/lg_main_a11_1.png);
        background-repeat: no-repeat;
    }
    #db-nav-sns .nav-search {
        position: absolute;
        right: 0;
    }
    .nav-search {
        position: relative;
        overflow: hidden;
        zoom: 1;
        padding: 10px 0 15px 0;
    }
    .nav-search fieldset {
        border: none;
        padding: 0;
        margin: 0;
        position: static;
    }
    .nav-search legend {
        display: none;
    }
    fieldset legend {
        color: #666;
        padding: 0 5px;
    }
    #db-nav-sns label {
        line-height: 28px;
    }
    .nav-search label {
        position: absolute;
        left: 11px;
        top: 10px;
        line-height: 30px;
        cursor: text;
        color: #bbb;
        width: auto;
    }
    #db-nav-sns .inp {
        width: 278px;
        height: 28px;
        background: #fff;
        border: 1px solid #e1e9e1;
        text-align: left;
        border-radius: 0;
    }
    .nav-search .inp {
        float: left;
        width: 470px;
        height: 34px;
        text-align: center;
        cursor: text;
    }
    #db-nav-sns .inp-btn {
        position: absolute;
        left: auto;
        top: 10px;
        right: 0;
        width: 30px;
        height: 28px;
        border: 1px solid #e1e9e1;
        border-left: none;
        background-color: #fff;
        font-size: 0;
        overflow: hidden;
    }
    #inp-query{
        padding-left:10px;
        height:100%;
    }
    #db-nav-sns .inp-btn input {
        width: 30px;
        height: 28px;
        padding: 0;
        margin: 0;
        line-height: 100px;
        background: transparent url(../../assets/img/bn_srh_1.png) no-repeat 50% 50%;
    }
    #db-nav-sns .nav-items {
        float: left;
        margin-top: 15px;
    }
    #db-nav-sns .nav-items li {
        margin-right: 20px;
        font-size: 16px;
    }
    #db-nav-sns li {
        display: inline;
    }
    #db-nav-sns .nav-items li a {
        position: relative;
    }
    #db-nav-sns a{
        color: #072;
    }
    #db-nav-sns a:hover{
        background-color: #072;
        color: #fff;
        text-decoration: none;
    }
</style>
