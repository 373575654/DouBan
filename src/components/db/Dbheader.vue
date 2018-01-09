<template>
  <div id="db-global-nav" class="global-nav" style="min-width:1040px;">
  <div class="bd">    
    <div class="top-nav-info">
      <ul>
        <li>
          <a id="top-nav-doumail-link" href="">豆邮</a>
        </li>
        <li class="nav-user-account more-active">
          <a target="_blank" href="" class="bn-more" @click.prevent="ShowItems">
            <span>傅空空的帐号</span><span class="arrow"></span>
          </a>
          <div class="more-items" v-if="isShow">
            <table cellpadding="0" cellspacing="0">
              <tbody>
                <tr>
                  <td>
                    <a href="">个人主页</a>
                  </td>
                </tr>
                <tr>
                  <td>
                    <a href="">我的订单</a>
                  </td>
                </tr>
                <tr>
                  <td>
                    <a href="">我的钱包</a>
                  </td>
                </tr>
                <tr>
                  <td>
                    <a href="">帐号管理</a>
                  </td>
                </tr>
                <tr>
                  <td>
                    <a href="">退出</a>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </li>
      </ul>
    </div>
    <div class="top-nav-reminder">
      <a href="" class="lnk-remind">提醒</a>
    </div>
    <div class="top-nav-doubanapp more-active">
      <a href="" class="lnk-doubanapp">下载豆瓣客户端</a>
      <div id="top-nav-appintro" class="more-items" style="display:none;">
        <p class="appintro-title">豆瓣</p>
        <p class="slogan">我们的精神角落</p>
        <p class="qrcode">扫码直接下载</p>
        <div class="download">
          <a href="">iPhone</a>
          <span>·</span>
          <a href="" class="download-android">Android</a>
        </div>
        <div id="doubanapp-tip" style="display: block;">
          <a href="" class="tip-link">豆瓣 5.0 全新发布</a>
          <a href="javascript:;" class="tip-close">×</a>
        </div>
      </div>
    </div>
    <div class="global-nav-items">
      <ul>
        <li class="on">
          <a href="">豆瓣</a>
        </li>
        <li class="">
          <a href="">读书</a>
        </li>
        <li class="">
          <a href="">电影</a>
        </li>
        <li class="">
          <a href="">音乐</a>
        </li>
        <li class="">
          <a href="">同城</a>
        </li>
        <li class="">
          <a href="">小组</a>
        </li>
        <li class="">
          <a href="">阅读</a>
        </li>
        <li class="">
          <a href="">FM</a>
        </li>
        <li class="">
          <a href="">时间</a>
        </li>
        <li class="">
          <a href="">市集</a>
        </li>
        <li>
          <a href="" class="bn-more"><span>更多</span></a>
        </li>
      </ul>
    </div>
  </div>
</div>
</template>
<script>
export default {
  data:function(){
    return{
      isShow:false
    }
  },
  methods:{
    ShowItems:function(){
      this.isShow=!this.isShow;
    }
  }
}
</script>
<style scoped>
  table {
      border-collapse: collapse;
      border: none;
      padding: 0;
      margin: 0;
  }
  tbody {
      display: table-row-group;
      vertical-align: middle;
      border-color: inherit;
  }
  tr {
      display: table-row;
      vertical-align: inherit;
      border-color: inherit;
  }
  #db-global-nav {
      height: 28px;
      color: #d5d5d5;
      background-color: #545652;
  }
  #db-global-nav {
      font: 12px Helvetica,Arial,sans-serif;
      line-height: 1.62;
      font-size: 12px;
  }
  #db-global-nav .top-nav-info {
      float: right;
      /*margin: 0 12px 0 0;*/
      line-height: 28px;
  }
  #db-global-nav .top-nav-info ul, #db-global-nav .top-nav-info li {
      display: inline-block;
      zoom: 1;
  }
  #db-global-nav ul {
      margin: 0;
      padding: 0;
  }
  #db-global-nav .top-nav-info a {
      display: inline-block;
      zoom: 1;
      margin: 0;
      padding: 0 12px;
      height: 28px;
  }
  #db-global-nav .nav-user-account {
      position: relative;
  }
  #db-global-nav a{
      color: #d5d5d5;
  }
  #db-global-nav a {
      cursor: pointer;
      text-decoration: none;
  }
  #db-global-nav .nav-user-account .more-items {
      left: auto;
      right: 6px;
  }
  #db-global-nav .more-items {
      z-index:100;
      position: absolute;
      left: 0;
  }
  #db-global-nav .more-active .more-items {
    padding: 10px 0;
    border: 1px solid #e6e6e6;
    background: #fff;
    white-space: nowrap;
    top: 28px;
  }
  #db-global-nav table, #db-global-nav td{
      font-size: 12px;
  }
  #db-global-nav td{
      font-size:12px;
  }
  #db-global-nav .more-active .more-items a {
      color: #3d3d3d;
  }
  #db-global-nav .more-active .more-items a {
      display: block;
      padding: 0 20px;
      line-height: 28px;
  }
  #db-global-nav .nav-user-account {
      position: relative;
  }
  #db-global-nav .bn-more span {
      display: inline-block;
      zoom: 1;
      vertical-align: baseline;
  }
  #db-global-nav .arrow {
      position: relative;
      top: -2px;
      left: 2px;
      border-width: 3px 3px 0;
      border-color: #d5d5d5 transparent transparent transparent;
      border-style: solid dashed dashed dashed;
      width: 0;
      height: 0;
      font-size: 0;
      line-height: 0;
  }
  #db-global-nav .top-nav-reminder {
      position: relative;
      float: right;
      margin-right: 5px;
      line-height: 28px;
  }
  #db-global-nav .top-nav-reminder .lnk-remind {
      display: inline-block;
      zoom: 1;
      padding: 0 12px;
      height: 28px;
  }
  #db-global-nav .top-nav-doubanapp {
      position: relative;
      float: right;
      margin-right: 5px;
      line-height: 28px;
  }
  #db-global-nav .top-nav-doubanapp .more-items {
      position:absolute;
      padding: 10px 20px 30px;
      left: -64px;
      width: 211px;
      border-top: none;
      color: #111;
      font-size: 15px;
      line-height: 1.62;
      font-weight: bold;
      text-align: center;
      z-index:100;
  }
  #db-global-nav .top-nav-doubanapp .more-items .appintro-title {
      padding-top: 170px;
      margin-top: 0;
      margin-bottom: 0;
      font-size: 24px;
      font-weight: 400;
      background: url(../../assets/img/nav_doubanapp_6.png) no-repeat center;
  }
  #db-global-nav .top-nav-doubanapp .more-items .slogan {
      margin: 0;
      font-size: 13px;
      letter-spacing: 3px;
      font-weight: 400;
  }
  #db-global-nav .top-nav-doubanapp .more-items .qrcode {
      padding-top: 160px;
      margin-top: 30px;
      font-size: 0;
      background: url(../../assets/img/nav_doubanapp_6_qrcode.png) no-repeat center;
  }
  #db-global-nav .top-nav-doubanapp .download {
      margin-top: 10px;
  }
  #db-global-nav .top-nav-doubanapp .download a {
      color: #37a;
  }
  #db-global-nav .top-nav-doubanapp .download a {
      display: inline;
      font-weight: normal;
      font-size: 12px;
      background: none;
      padding: 0;
  }
  #db-global-nav #doubanapp-tip {
      position: absolute;
      top: 19px;
      border: 1px solid;
      padding: 0 18px 0 10px;
      color: #13bc39;
      background: #fff;
      z-index: 10;
      white-space: nowrap;
  }
  #db-global-nav #doubanapp-tip .tip-link {
      color: #13bc39;
      background: #fff;
  }
  #db-global-nav #doubanapp-tip .tip-close {
      position: absolute;
      right: 6px;
      top:1px;
      width: 15px;
      height: 15px;
      line-height: 26px;
      text-align: center;
      color:#d5d5d5;
  }
  #db-global-nav #doubanapp-tip:after {
      content: "";
      position: absolute;
      top: -5px;
      left: 35px;
      height: 7px;
      width: 7px;
      border: 1px solid #13bc39;
      border-width: 1px 1px 0 0;
      background: #fff;
      transform: rotate(-45deg);
  }
  #db-global-nav .global-nav-items li {
      display: inline-block;
      zoom: 1;
      line-height: 28px;
      font-size: 12px;
      vertical-align: baseline;
  }
  #db-global-nav .global-nav-items a {
      display: inline-block;
      zoom: 1;
      padding: 0 12px;
      height: 28px;
  }
  #db-global-nav a:hover{
      color:#fff;
  }
</style>
