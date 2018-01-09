<template>
    <div id="anony-movie" class="section">
        <div class="wrapper">
            <div class="sidenav">
                <h2 class="section-title">
                    <a href="">电影</a>
                </h2>
                <div class="side-links nav-anon">
                    <ul style="padding:0;">           
                        <li><a href="">影讯&amp;购票</a></li>
                        <li class="site-nav-bt">
                            <a href="">选电影</a>
                            <img style="top: -5px; position: relative;" src="../../assets/img/new_menu.gif">
                        </li>
                        <li><a href="">电视剧</a></li>
                        <li><a href="">排行榜</a></li>
                        <li><a href="">分类</a></li>
                        <li><a href="">影评</a></li>
                        <li class="site-nav-bt"><a href="">预告片</a></li>
                        <li><a href="">问答</a></li>
                    </ul>
                </div>
            </div>
            <div class="side">
                <div class="mod" style="height:170px;">
                    <h2>
                        影片分类&nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·
                        <span class="pl">&nbsp;(<a href="" target="_self">更多</a>)</span>
                    </h2>
                    <div class="tags list">
                        <ul style="padding:0;">
                            <li v-for="(value,index) in list" :key="index"><a href="">{{value}}</a></li>
                        </ul>
                    </div>
                </div>
                <div class="mod">
                    <h2>
                        近期热门&nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·
                        <span class="pl">&nbsp;(<a href="">更多</a>)</span>
                    </h2>
                    <div class="list1 movie-charts">
                        <ol>
                            <li v-for="(value,index) in recent_hot" :key="index">
                                <a href="">{{value.name}}</a>
                            </li>
                        </ol>
                    </div>
                </div>
            </div>
            <div class="main">
                <h2>
                    正在热映&nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·
                    <span class="pl">&nbsp;(<a href="">更多</a>)</span>
                </h2>
                <div class="movie-list list" style="margin-top:-30px;">
                    <ul style="padding:0;"> 
                        <li v-for="(value,index) in movie_list" :key="index">
                            <div class="pic">
                                <a href=""><img :src="require('../../assets/'+value.src)"></a>
                            </div>
                            <div class="title">
                                <a href="">{{value.name}}</a>
                            </div>
                            <div class="rating">
                                <span :class="value.star" v-if="value.rate!='暂无评分'"></span><i>{{value.rate}}</i>
                            </div>
                            <a href="" class="bn-link bn-ticket">选座购票</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="ad">
            <a href="">
                <img src="../../assets/img/762678ebe197d33.jpg" alt="">
            </a>
        </div>
    </div>
</template>
<script>
export default {
    data:function(){
        return{
            list:["爱情","喜剧","剧情","动画","科幻","动作","经典","悬疑","犯罪","青春",
                  "惊悚","文艺","搞笑","纪录片","励志","战争","恐怖","黑色幽默",
                  "美国","日本","香港","英国","中国","韩国","法国","台湾","中国大陆","德国"],
            recent_hot:[],
            movie_list:[],
            isZanWu:false
        }
    },
    created:function(){
        this.$http.get('http://localhost:3002/movie/movie')
        .then(function(response){
            this.movie_list=response.data.movies;
            this.recent_hot=response.data.hot;
        });
    }
}
</script>
<style>
    #anony-movie a{
        color: #27a;        
    }
    #anony-movie a:hover{
        color:#fff;
    }
    .sidenav a{
        font-size:24px;
    }
    .side-links {
        margin-bottom: 40px;
    }
    #anony-movie .side-links li {
        position: relative;
        margin-top: 5px;
    }
    #anony-movie .side-links li a{
        font-size: 14px;
    }
    .section .side {
        float: right;
        width: 265px;
        margin-left: 30px;
    }
    .tags ul {
        margin-top: -4px;
    }
    .tags li {
        width: 4em;
        margin-top: 4px;
        text-align: left;
        float: left;
        font-size: 12px;
    }
    #anony-movie .movie-charts ol {
        margin: 0;
        padding: 0;
    }
    #anony-movie .movie-charts li {
        margin-bottom: 6px;
        padding-bottom: 5px;
        list-style-type: decimal;
        list-style-position: inside;
        border-bottom: 1px solid #eaeaea;
        font-size:12px;
    }
    #anony-movie .movie-charts li a {
        margin-left: 5px;       
    }
    #anony-movie .movie-list .pic {
        height: 145px;
        overflow: hidden;
    }
    #anony-movie .movie-list img {
        width: 100px;
    }
    .movie-list li{
        float:left;
        font-size: 12px;
        vertical-align: top;
        zoom:1;
        text-align: center;
        width: 24.8%;
        word-spacing: normal;
        margin-top: 40px;
    }
    .movie-list .title{
        line-height: 1.45;
        font-size: 13px;
        margin: 5px 0;
        word-wrap: break-word;
    }
    #anony-movie .movie-list .title a{
        color:#333;
    }
    .rating {
        margin-bottom: 4px;
    }
    .rating span.allstar35 {
        background-position: 0 -33px;
    }
    .rating span.allstar25 {
        background-position: 0 -55px;
    }
    .rating span.allstar40 {
        background-position: 0 -22px;
    }
    .rating span.allstar45 {
        background-position: 0 -11px;
    }
    .rating span{
        display: inline-block;
        zoom: 1;
        background: url(../../assets/img/ic_rating_s.png) no-repeat;
        width: 55px;
        height: 11px;
        margin: 0 3px 0 0;
        overflow: hidden;
    }
    .rating span.txt-tip {
        display: inline-block;
        margin-left: 4px;
        height:15px;
        background: none;
    }

    .rating i {
        margin-left: 4px;
        color: #e09015;
    }
    #anony-movie .bn-link{
        display:inline-block;
        margin-top:10px;
        background: #1c8bd0;
        color: #fff;
        zoom: 1;
        vertical-align: middle;
        padding: 2px 10px;
        border-radius: 2px;
    }
    #anony-movie .bn-link.zanwu{
        margin-top:9px;
    }
    #anony-movie .bn-link:hover{
        background: #047fcb;
    }
    .ad{
        width: 950px;
        margin: 40px auto 15px;
    }
    .ad img {
        width: 950px;
        height: 90px;
    }
</style>
