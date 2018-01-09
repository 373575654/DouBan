<template>
  <div id="wrapper">
    <div id="content">
      <div class="grid-16-8 clearfix">
        <div class="article">
          <div id="statuses">
            <div id="db-isay" class="mod isay isay-disable has-commodity ">
              <form name="mbform" method="post" action="">
                <ul class="isay-links">
                  <li class="isay-main active"><a href="javascript:;">说句话</a></li>
                  <li class="isay-pic"><a href="javascript:;">发照片</a></li>
                  <li class="isay-share"><a href="javascript:;">推荐网页</a></li>
                  <li class="notes-link"><a href="" title="添加日记">写日记</a></li>
                </ul>
                <div class="item">
                  <p class="highlighter mention-highlighter"></p>
                  <p class="highlighter error-highlighter"></p>
                  <label id="isay-label" for="isay-cont">分享生活点滴...</label>
                  <textarea tabindex="1" id="isay-cont" name="comment" rows="1"></textarea>
                </div>                   
                <div id="isay-act-field" class="isay-act"></div>
                <div class="btn">
                  <span id="isay-counter"></span>
                  <span class="bn-submit bn-flat js-verify-account"><input id="isay-submit" tabindex="1" type="submit" value="发布"></span>
                  <a href="javascript:;" class="lnk-share-tools">添加网页推荐工具</a>
                </div>
              </form>
              <div class="btn-group">
                <form charset="utf-8" id="isay-upload" action="" enctype="multipart/form-data" method="post"><div style="display:none;"></div>
                <input id="isay-upload-inp" tabindex="2" autocomplete="off" name="image" title="可传多张照片" type="file" multiple="" accept="image/jpg,image/jpeg,image/bmp,image/gif,image/png,">
                </form>
                <a href="javascript:;" class="ico ico-pic" title="上传照片">照片</a>
                <a href="javascript:;" class="ico ico-topic" title="添加话题" style="background-position: -1px -65px;">话题</a>
              </div>
            </div>
            <div class="stream-items">
              <!--动态获取用户的状态-->
              <div class="new-status status-wrapper" v-for="(value,index) in list" :key="index">                
                <div class="status-item">
                  <div class="mod">
                    <div class="hd ">
                      <div class="usr-pic">
                        <a href="javascript:;" :title="value.user"><img :src="require('../../assets/'+value.avatar)"></a>
                      </div>
                      <div class="text">
                        <a href="javascript:;" class="lnk-people">{{value.user}}</a>的日记:
                      </div>
                    </div>
                    <div class="bd editor">
                      <div class="block note-block">
                        <div class="pic">
                          <div class="pic-wrap">
                              <a href=""><img :src="require('../../assets/'+value.src)"></a>
                              <span class="valign"></span>
                          </div>
                        </div>
                        <div class="content">
                          <div class="title">
                            <a href="javascript:;">{{value.title}}</a>
                          </div>
                          <p>{{value.desc}}</p>
                        </div>
                      </div>
                      <div class="actions">
                        <span class="created_at">
                            {{value.time}}<span class="ghost">，来自 <a href="">热门精选</a></span>
                        </span>
                    </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="aside">
          <!--正在发生-->
          <div class="notify-mod" style="position: static;">
              <h2>豆瓣正在发生&nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·</h2>
              <ul style="padding-left:0;">
                <li>
                  <a href="javascript:;">石黑一雄系列X豆瓣独家手账上线</a>
                </li>
                <li>
                  <a href="javascript:;">豆瓣2017年度音乐榜单</a>
                </li>
              </ul>
          </div>
          <div class="mod event-mod">
            <div class="hd" style="border-bottom:1px dotted #ddd;">
              <h2>
                购票直通车
                <span class="pl rr">
                  <a href="javascript:;">
                    更多»
                  </a>
                </span>
              </h2>
            </div>
            <div class="guanfang" @mouseover="MouseOver" @mouseout="MouseOut">
              <ul class="crow simple-list-1col" style="padding-left:0;margin-top:0px;">
                <li class="list-entry" v-for="(value,index) in events" :key="index">
                  <a class="ll" href="">
                    <img alt="" :src="require('../../assets/'+value.src)" width="48">
                  </a>
                  <div class="info">
                    <p class="event-title">
                      <a href="javascript:;">{{value.title}}</a>
                    </p>
                    <p class="tip">
                      {{value.time}}<br>  
                      <span class="on-selling-events-price">¥ {{value.price}}</span>
                    </p>
                  </div>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div id="footer"></div>
  </div>
</template>
<script>
export default {
  data:function(){
    return{
      list:[],
      events:[],
      timer:null
    }
  },
  created:function(){
    this.$http.get("http://localhost:3002/status/status")
    .then(function(response){
      this.list=response.data.data;
      //console.log(this.list);
    });

    this.$http.get("http://localhost:3002/events/events")
    .then(function(response){
      this.events=response.data.data;
      //console.log(this.events);
    });
  },
  mounted:function(){
    this.MouseOut();
  },
  methods:{
    MouseOver:function(){
      clearInterval(this.timer);
    },
    MouseOut:function(){
      this.timer=setInterval(function(){
        var height=parseInt(document.querySelector(".simple-list-1col").style.marginTop);
        //console.log(height);
        height-=1;
        document.querySelector(".simple-list-1col").style.marginTop=height+'px';
        if(height==-1400){
          document.querySelector(".simple-list-1col").style.marginTop=0;
        }
      },40);
    }
  }
}
</script>
<style scoped>
  #wrapper a:hover{
    color:#fff;
    background:#37a;
    text-decoration: none;
  }
  input{
    border:none;
    outline: none;
  }
  textarea{
    outline: none;
  }
  ul{
    list-style: none;
  }
  form {
    margin: 0;
    padding: 0;
    border: 0px;
  }
  #wrapper {
    width: 1040px;
    margin:0 auto;
  }
  #content {
    min-height: 420px;
  }
  .clearfix {
    zoom: 1;
  }
  #wrapper .grid-16-8 .article {
    width: 675px;
    padding:0;
    float: left;
  }
  #statuses {
      position: relative;
  }
  #db-isay {
    position: relative;
    padding: 0;
    margin: -5px 0 2em;
    z-index: 1;
  }
  .mod{
    width:auto;
    margin-bottom:35px;
  }
  #db-isay .isay-links {
    position: relative;
    z-index: 2;
    font-size: 0;
    height: 30px;
    line-height: 30px;
    padding-left:0;
  }
  #db-isay .isay-links .isay-main {
    background-position: 0 -90px;
  }
  #db-isay .isay-links li {
    font-size: 14px;
    display: inline-block;
    padding-left: 22px;
    margin-right: 18px;
    background: url(../../assets/img/isay_icons.3.png) no-repeat;
  }
  #db-isay .isay-links .active a {
    color: #111;
    background-color: transparent;
    cursor: default;
  }
  #db-isay .isay-links .isay-pic {
    background: url(../../assets/img/isay_icon_pic.svg) 0 6px no-repeat;
  }
  #db-isay .isay-links .notes-link {
    background-position: 0 -121px;
  }
  #db-isay .bd, #db-isay textarea, #db-isay .highlighter {
    width: 650px;
  }
  textarea {
      resize: none;
  }
   #db-isay .item {
    border: 1px solid #d7d7d7;
    border-radius: 1px;
    position: relative;
    z-index: 0;
    margin-bottom: 0;
    overflow: hidden;
    height:30px;
  }
  .highlighter {
    margin: 0;
    position: absolute;
    z-index: 0;
    top: 1px;
    left: 1px;
    overflow: hidden;
    background: #fff;
    white-space: pre-wrap;
    word-wrap: break-word;
    color: transparent;
    width: 556px;
    padding: 7px 25px 0 7px;
    height: 23px;
    overflow: hidden;
    vertical-align: bottom;
    font-family: tahoma;
    line-height: 1.3;
    border-radius: 2px 2px 0 0;
  }
  .error-highlighter {
    background: transparent;
    height:23px;
  }
  #db-isay #isay-label {
    position: absolute;
    margin: 6px 0 0 6px;
    font-size: 14px;
    color: #aaa;
    pointer-events: none;
    cursor: text;
    vertical-align: middle;
    font-weight:unset;
  }
  #db-isay textarea {
    background: transparent;
    width: 556px;
    padding: 7px 25px 7px 7px;
    overflow: hidden;
    vertical-align: bottom;
    border: none;
    font-family: tahoma;
    line-height: 1.3;
    position: relative;
    z-index: 1;
  }
  #db-isay .isay-act {
    word-break: break-all;
  }
  #db-isay .btn {
    display: none;
    float: none;
    width: auto;
    margin-right: 0;
    text-align: right;
    background: #f4f4f4;
    padding: 8px;
    border: 1px solid #ccc;
    border-top: none;
    position: relative;
  }
  #db-isay .btn-group {
    position: absolute;
    top: 36px;
    right: 0;
    font-size: 0;
    z-index: 1;
  }
  #db-isay .btn-group * {
    font-size: 13px;
  }
  #isay-upload {
    position: absolute;
    width: 21px;
    height: 22px;
    padding: 0;
    overflow: hidden;
    right: 38px;
    top: -1px;
    opacity: 0;
  }
  #isay-upload input {
    cursor: pointer;
    position: absolute;
    height: 22px;
    right: 0;
    margin: 0;
    filter: alpha(opacity=0);
    vertical-align: middle;
    line-height: 100%;
  }
  #db-isay .ico-pic {
    margin-top:10px;
  }
  #db-isay .ico {
    background: url(../../assets/img/isay_icons.3.svg) no-repeat 0 -35px;
    display: inline-block;
    height: 20px;
    width: 18px;
    margin-right: 12px;
    text-indent: 999em;
    overflow: hidden;
    line-height: 20px;
    color: #888;
    font-family: stheiti, tahoma, simsun, sans-serif;
  }
  .stream-items a:hover{
    color:#fff;
    background:#37a;
    text-decoration: none;
  }
  .stream-items .status-wrapper:first-child {
    padding-top: 0;
  }
  .stream-items .status-wrapper {
    border-bottom: 1px solid #e5e5e5;
  }
  .status-wrapper {
    padding: 20px 0;
  }
  .status-item {
    overflow: hidden;
    color: #555;
  }
  .status-item .mod {
    width:auto;
    margin: 0;
  }
  .status-item .hd {
    margin-bottom: 10px;
  }
  .status-item .hd .usr-pic {
    float: left;
    position: relative;
    z-index: 1;
    margin-right: 20px;
  }
  .status-item .hd .text {
    overflow: hidden;
    position: relative;
    font-size: 14px;
    color: #9d9d9d;
  }
  .status-item .hd .text .lnk-people{
    display: inline-block;
    color: #555;
    font-weight:bold;
    margin-right:2px;
  }
  .status-item .bd {
    zoom: 1;
    padding-left: 10%;
    margin-top:-10px;
  }
  .status-item .block {
    overflow: hidden;
    zoom: 1;
    padding: 16px 20px;
    background: #f9f9f9;
  }
  .status-item .mod .note-block .pic {
    position: relative;
    overflow: hidden;
    font-size: 0;
    white-space: nowrap;
    max-height: none;
    width: 122px;
    height: 82px;
    margin-right: 5px;
    margin-left: 24px;
    float:right;
  }
  .status-item .block .content {
    overflow: hidden;
    zoom: 1;
    word-wrap: break-word;
  }
  .status-item .block .title {
    margin-bottom: 4px;
    font-size: 15px;
  }
  .status-item .mod p{
    margin: 0;
    padding: 0;
  }
  .status-item .mod .actions:not(.empty) {
    line-height: 1;
    text-align: left;
    clear: both;
    margin: 20px 0 0;
    color: #aaa;
  }
  .status-item .mod .created_at {
    margin-right: 1.5em;
  }
  .status-item .mod .created_at a {
    color: #999;
  }
  #wrapper .grid-16-8 .aside {
    width: 300px;
    float:right;
  }
  .notify-mod {
    margin: 0 0 20px;
    padding: 16px 0 16px 18px;
    line-height: 1.5;
    background: #f2f7f6;
    border-radius: 4px;
  }
  html h2 {
    font-size: 16px;
  }
  h2 {
    font: 15px Arial, Helvetica, sans-serif;
    color: #072;
    margin: 0 0 12px 0;
    line-height: 150%;
  }
  .notify-mod ul {
    font-size: 14px;
    color: #cedcd9;
  }
  .notify-mod li {
    margin-top: 8px;
  }
  .event-mod .hd {
    overflow: hidden;
  }
  .mod .hd {
    height: 25px;
    margin-bottom: 20px;
  }
  .mod h2 {
    margin-bottom: 0.7em;
    line-height: 1.2;
    color:#333;
  }
  .pl {
    font: 12px Arial, Helvetica, sans-serif;
    line-height: 150%;
    color: #666666;
  }
  .rr {
      float: right;
  }
  .guanfang {
    height: 700px;
    overflow: hidden;
  }
  .simple-list-1col .list-entry{
    clear: both;
    margin-bottom: 25px;
    overflow: hidden;
    zoom: 1;
  }
  .list-entry a.ll{
    margin-right:10px;
    float:left;
  }
  a img{
    border-width:0;
    vertical-align: middle;
  }
  .simple-list-1col .info{
    padding-left:60px;
  }
  .simple-list-1col .event-title{
    font-size:13px;
    margin:-2px 0 4px;
  }
  .simple-list-1col .tip{
    color:#666;
    font-size:12px;
  }
  .on-selling-events-price{
    color:#ff8263;
    font-weight:bold;
  }
</style>
