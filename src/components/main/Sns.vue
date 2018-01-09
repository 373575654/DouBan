<template>
  <div id="anony-sns" class="section">
      <div class="wrapper">
          <div class="ad">
              <a href="">
                  <img src="../../assets/img/95b8e2e4957353c.jpg" alt="">
              </a>
          </div>
          <div class="side">
              <div class="adv">
                  <div>
                      <img src="../../assets/img/ab4926fff1bf365.jpg" alt="">
                      <p>广告</p>
                  </div>                  
              </div>
              <div class="online">
                <ul>
                    <div class="mod">
                        <h2>
                            热门话题
                            &nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;
                            <span class="pl">&nbsp;(<a href="/gallery/" target="_self">去话题广场</a>)</span>
                        </h2>
                        <ul>     
                            <li class="rec_topics" v-for="(value,index) in topic" :key="index">
                                <a href="" class="rec_topics_name">{{value.topic}}</a>
                                <span class="rec_topics_subtitle">{{value.people}}人浏览</span>
                            </li>                      
                        </ul>
                    </div>
                </ul>
              </div>
          </div>
          <div class="main">
              <div class="mod">
                <h2>
                    热点内容&nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·
                    <span class="pl">&nbsp;(<a href="" @click.prevent="ChangeNews">换一换</a>)</span>
                </h2>
                <div class="albums">
                    <ul>
                        <li v-for="(value,index) in newsA" :key="index" v-if="!isShow">
                            <div class="pic">
                                <a href=""><img :src="require('../../assets/'+value.src)"></a>
                            </div>
                            <a href="">{{value.des}}</a>
                            <span class="num">{{value.count}}张照片</span>
                        </li>
                        <li v-for="(value,index) in newsB" :key="index" v-if="isShow">
                            <div class="pic">
                                <a href=""><img :src="require('../../assets/'+value.src)"></a>
                            </div>
                            <a href="">{{value.des}}</a>
                            <span class="num">{{value.count}}张照片</span>
                        </li>
                    </ul>
                </div>
                <div class="notes">
                    <ul id="notes-info">
                        <li class="first" v-for="(value,index) in news_demo" :key="index" v-if="index==0">
                            <div class="title"><a href="">{{value.title}}</a></div>
                            <div class="author">{{value.author}}</div>
                            <p>{{value.subtitle}}</p>
                        </li>
                        <li v-for="(value,index) in news_demo" :key="index" v-if="index>0">
                            <a href="">{{value.title}}</a>
                        </li>
                    </ul>
                </div>
              </div>
          </div>
      </div>
  </div>
</template>
<script>
export default {
    data:function(){
        return{
            topic:[],
            news:[],
            newsA:[],
            newsB:[],
            news_demo:[],
            isShow:false
        }
    },
    created:function(){
        this.$http.get('http://127.0.0.1:3002/news/albums')
        .then(function(response){
            //console.log(response.data);
            this.topic=response.data.topic;
            this.news=response.data.news;
            this.news_demo=response.data.news_demo;
            this.newsA=this.news.slice(0,4);
            this.newsB=this.news.slice(4,8);
        });
    },
    methods:{
        ChangeNews:function(){
            this.isShow=!this.isShow;
        }
    }
}
</script>
<style>
    a{
        cursor: pointer;
    }
    .section {
        padding: 10px 0;
        margin-bottom: 30px;
        min-height: 200px;
    }
    .section .wrapper {
        zoom: 1;
    }
    .wrapper {
        width: 950px;
        margin: 0 auto;
    }
    .section .side {
        float: right;
        width: 265px;
        margin-left: 30px;
        margin-top:10px;
    }
    .ad img{
        width:950px;
        height: 90px;
    }
    .adv{
        margin:10px 0;
        height:125px;
    }
    .adv div{
        position: relative;
        height:100%;
    }
    .adv img{
        width:250px;
        height: 125px;
        position: absolute;
    }
    .adv p{
        line-height: 1;
        text-align: center;
        background-color: rgba(0, 0, 0, 0.3);
        font-size: 12px;
        position: absolute;
        right: 15px;
        bottom: -12px;
        padding: 4px;
        color: rgb(255, 255, 255);
    }
    .online{
        margin-top:20px;
    }
    #anony-sns .online ul {
        margin-top: -4px;
        padding-left:0;
    }
    .mod {
        margin-bottom: 30px;
    }
    h2 {
        font: 15px Arial, Helvetica, sans-serif;
        color: #072;
        margin: 0 0 12px 0;
        line-height: 150%;
    }
    .pl {
        font: 12px Arial, Helvetica, sans-serif;
        line-height: 150%;
        color: #666666;
    }
    #anony-sns .online ul {
        margin-top: -4px;
    }
    .rec_topics {
        line-height: 1;
        margin-bottom: 15px;
    }
    .rec_topics a{
        color: #37a;
    }
    .rec_topics_name {
        display: inline-block;
        margin-bottom: 6px;
        font-size: 14px;
        line-height: 1.3;
        color: #3377aa;
    }
    .rec_topics_subtitle {
        display: block;
        margin-bottom: 15px;
        font-size: 13px;
        line-height: 1;
        color: #aaaaaa;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }
    .section .main {
        overflow: hidden;
        zoom: 1;
        margin-top:14px;
    }
    #anony-sns .albums {
        float: left;
        width: 350px;
        color: #999;
        font-size: 0;
        letter-spacing: -0.31em;
    }
    #anony-sns .albums ul {
        margin: -10px 0 0 -10px;
        padding:0;
    }
    #anony-sns .albums li {
        display: inline-block;
        zoom: 1;
        letter-spacing: normal;
        word-spacing: normal;
        width: 170px;
        vertical-align: top;
        font-size: 12px;
        margin: 10px 0 0 10px;
    }
    #anony-sns .albums .pic {
        display: inline-block;
        zoom: 1;
        width: 170px;
        max-height: 170px;
        overflow: hidden;
        vertical-align: middle;
        white-space: nowrap;
    }
    #anony-sns .albums .pic img {
        width: 170px;
    }
    .main a{
        color:#37a;
    }
    .main{
        line-height: 1.62;
    }
    a img {
        border-width: 0;
        vertical-align: middle;
    }
    #anony-sns .notes {
        overflow: hidden;
        zoom: 1;
        color: #666;
        font-size: 12px;
    }
    #anony-sns .notes ul{
        margin-top: 0;
    }
    #anony-sns .notes .first {
        margin-top: 0;
    }
    #anony-sns .notes .author {
        color: #999;
    }
    #anony-sns .notes p {
        margin: 0;
    }
    #anony-sns .notes li {
        margin-top: 12px;
        word-wrap: break-word;
    }
    .section a:hover {
        color: #fff;
        text-decoration: none;
        background: #37a;
    }
    #notes-info{
        margin-left:30px;
    }
</style>

