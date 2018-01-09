<template>
   <div id="anony-nav" style="margin-top:10px;">
        <div class="anony-nav-links">
        <ul style="margin-top:20px;">
            <li> 
                <a target="_blank" class="lnk-book" href="">豆瓣读书</a>
            </li>
            <li> 
                <a target="_blank" class="lnk-movie" href="">豆瓣电影</a>
            </li>
            <li> 
                <a target="_blank" class="lnk-music" href="">豆瓣音乐</a>
            </li>
            <li> 
                <a target="_blank" class="lnk-group" href="">豆瓣小组</a>
            </li>
            <li> 
                <a target="_blank" class="lnk-events" href="">豆瓣同城</a>
            </li>
            <li> 
                <a target="_blank" class="lnk-fm" href="">豆瓣FM</a>
            </li>
            <li> 
                <a target="_blank" class="lnk-shijian" href="">豆瓣时间</a>
            </li>
            <li> 
                <a target="_blank" class="lnk-market" href="">豆瓣市集</a>
            </li>
        </ul>
        </div>
        <h1><a href="">豆瓣</a></h1>

        <div class="anony-srh" style="margin-top:5px;margin-left:5px;">
            <form action="" method="get" >
                <span class="inp"><input type="text" maxlength="60" size="12" placeholder="书籍、电影、音乐、小组、小站、成员" name="q" autocomplete="off"></span>
                <span class="bn"><input type="submit" value="搜索"></span>
            </form>
        </div>
   </div>   
</template>
<script>
export default {
  
}
</script>
<style scoped>
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
    #anony-nav {
        width: 950px;
        margin: 0 auto 25px;
    }
    #anony-nav .anony-nav-links {
        float: right;
        margin-top: 6px;
    }
    #anony-nav .anony-nav-links li {
        display: inline-block;
        zoom: 1;
        margin: 0 0 0 17px;
    }
    #anony-nav .anony-nav-links li a {
        display: inline-block;
        zoom: 1;
        width: 40px;
        height: 20px;
        overflow: hidden;
        margin: 0;
        line-height: 20em;
        outline: none;
        vertical-align: middle;
        background: transparent url(../../assets/img/anony_nav_logo.png) no-repeat 100% 100%;
    }
    #anony-nav .anony-nav-links li .lnk-book {
        background-position: 0 0;
    }
    #anony-nav .anony-nav-links li .lnk-movie {
        background-position: -60px 0;
    }
    #anony-nav .anony-nav-links li .lnk-music {
        background-position: -120px 0;
    }
    #anony-nav .anony-nav-links li .lnk-group {
        background-position: -180px 0;
    }
    #anony-nav .anony-nav-links li .lnk-events {
        background-position: -299px 0;
    }
    #anony-nav .anony-nav-links li .lnk-fm {
        background-position: -241px 0;
    }
    #anony-nav .anony-nav-links li .lnk-shijian {
        margin-bottom: 1px;
        background: transparent url(../../assets/img/ic_shijian_home_nav@2x.png) no-repeat 100% 100%;
        background-size: cover;
    }
    #anony-nav .anony-nav-links li .lnk-market {
        width: 42px;
        background-position: -421px 0;
    }
    #anony-nav h1 {
        display: inline-block;
        zoom: 1;
        vertical-align: middle;
        width: 160px;
        height: 34px;
        margin: 0px 30px 0 0;
        padding: 0;
        font-size: 12px;
        font-weight: normal;
        background: url(../../assets/img/logo_db.png) no-repeat 0 0;
        overflow: hidden;
        position: relative;
        top:20px;
    }
    #anony-nav h1 a {
        display: block;
        height: 34px;
        line-height: 10em;
    }
    #anony-nav .anony-srh {
        position: relative;
        display: inline-block;
        zoom: 1;
        vertical-align: middle;
        width: 270px;
        height: 30px;
        border: 1px solid #c3c3c3;
        left: 175px;
        top:-15px;
    }
    #anony-nav .anony-srh .inp {
        display: block;
        height: 30px;
        overflow: hidden;
    }
    #anony-nav .anony-srh .inp input {
        width: 240px;
        border: none;
        font-size: 13px;
        height: 28px;
        padding: 5px;
    }
    input {
        margin-right: 3px;
        vertical-align: middle;
        outline: none;
    }
    #anony-nav .anony-srh .bn {
        position: absolute;
        right: 0;
        top: 0;
        width: 30px;
        height: 30px;
        overflow: hidden;
        cursor: pointer;
        background: url(../../assets/img/bn_srh_1.png) 50% 50% no-repeat;
    }
    #anony-nav .anony-srh .bn input {
        border: none;
        background: transparent;
        overflow: hidden;
        width: 30px;
        height: 30px;
        font-size: 0;
        color: transparent;
        cursor: pointer;
    }
</style>
