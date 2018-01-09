<template>
    <div id="anony-video" class="section">
        <div class="wrapper">
            <div class="sidenav">
                <h2 class="section-title"><a href="">视频</a></h2>
            </div>
            <div class="main">
                <a href="">
                    <h2>
                        如是&nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·
                    </h2>
                </a>
                <ul class="video-list video-rushi">
                    <li v-for="(value,index) in VideoList" :key="index" v-if="index<3">
                        <div class="video-cover">
                            <a  
                                href="#"
                                :style="{backgroundImage:'url(' + require('../../assets/'+value.src) + ')'}"
                                class="backgroundImage"
                            >
                                <span></span>
                            </a>
                        </div>
                        <a class="video-title" href="">{{value.title}}</a>
                    </li>
                </ul>
                <a href="">  
                    <h2>
                        瓣嘴&nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·
                    </h2>
                </a>
                <ul class="video-list video-banzui">
                    <li v-for="(value,index) in VideoList" :key="index" v-if="index>2">
                        <div class="video-cover">
                            <a href=""
                               :style="{backgroundImage:'url(' + require('../../assets/'+value.src) + ')'}"
                               class="backgroundImage"
                            ><span></span></a>
                        </div>
                        <a class="video-title" href="">{{value.title}}</a>
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
            VideoList:[]
        }
    },
    created:function(){
        this.$http.get('http://localhost:3002/video/video')
        .then(function(response){
            //console.log(response.data.data);
            this.VideoList=response.data.data;
        });
    }
}
</script>
<style>
    #anony-video h2 {
        margin-bottom: 15px;
    }
    #anony-video .section-title a {
        color: #494949;
        font-size:24px;
    }
    #anony-video .video-list.video-rushi {
        margin-bottom: 25px;
    }
    .main ul{
        padding:0;
    }
    #anony-video .video-list li {
        display: inline-block;
        width: 250px;
        vertical-align: top;
        margin-right: 30px;
    }
    #anony-video .video-list li .video-cover {
        height: 140px;
        margin-bottom: 11px;
    }
    #anony-video .video-list li .video-cover a {
        position: relative;
        display: block;
        color: #fff;
        height: 100%;
    }
    .backgroundImage{
        background:no-repeat center/cover;
    }
    #anony-video .backgroundImage:hover{
        background:no-repeat center/cover;
    }
    #anony-video .video-list li .video-cover a:before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        margin: auto;
        background-color: transparent;
        background-image: linear-gradient(to bottom,transparent,rgba(0,0,0,0.25));
    }
    #anony-video .video-list li .video-cover a span {
        position: absolute;
        right: 10px;
        bottom: 10px;
    }
    #anony-video .video-list li .video-cover a:after {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        margin: auto;
        background: url(../../assets/img/play.png) center/18px no-repeat;
    }
    #anony-video .video-list li .video-title {
        font-size: 13px;
        line-height: 1.54;
        color: #494949;
    }
    #anony-video .video-list li:last-child {
        margin-right: 0;
    }
    #anony-video .video-list li a.video-title:hover{
        color:#fff;
    }
</style>
