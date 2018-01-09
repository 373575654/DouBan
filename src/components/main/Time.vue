<template>
  <div id="anony-time" class="section">
      <div class="wrapper">
        <div class="sidenav">
            <h2 class="section-title"><a href="">豆瓣时间</a></h2>
        </div>
        <div class="main" id="hot-column">
            <h2>
                热门专栏 &nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·
                <span class="pl">&nbsp;(<a href="" target="_self">更多</a>)</span>
            </h2>
            <ul class="time-list">
                <li v-for="(value,index) in timelist" :key="index">
                    <a class="cover listen  " href="">
                        <img :src="require('../../assets/'+value.src)" alt="">
                    </a>
                    <a class="title" href="">{{value.title}}</a>
                    <span class="type">音频专栏</span>
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
            timelist:[]
        }
    },
    created:function(){
        this.$http.get('http://127.0.0.1:3002/time/time')
        .then(function(response){
            this.timelist=response.data.data;
        });
    }
}
</script>
<style>
    .section:nth-child(2n) {
        padding: 40px 0 20px;
        background: #f7f7f7;
    }
    .section .sidenav {
        float: left;
        width: 100px;
        margin-right: 20px;
    }
    #hot-column{
        line-height: 0;
    }
    #anony-time .section-title a {
        color: #494949;
        font-size:24px;
    }
    #anony-time .time-list{
        padding:0;
    }
    #anony-time .time-list li {
        display: inline-block;
        width: 100px;
        vertical-align: top;
        margin-right: 60px;
        text-align: center;
        margin-bottom: 30px;
    }
    #anony-time .time-list li .cover {
        display: block;
        margin-bottom: 10px;
        position: relative;
    }
    #anony-time .time-list li .cover:before {
        position: absolute;
        top: 0;
        left: 0;
        content: '';
        display: block;
        width: 100%;
        height: 100%;
        background-color: transparent;
    }
    #anony-time .time-list li .cover.listen:after {
        background: url(../../assets/img/ic_audio_w@2x.png) center/14px no-repeat;
    }
    #anony-time .time-list li .cover:after {
        content: '';
        position: absolute;
        width: 12px;
        height: 12px;
        bottom: 10px;
        right: 10px;
    }
    #anony-time .time-list li img {
        width: 100px;
        height: 141px;
    }
    #anony-time .time-list li .title {
        color: #333333;
        font-size: 13px;
        line-height: 1.38;
    }
    #anony-time .time-list li .type {
        color: #999999;
        line-height: 1;
        margin-top: 10px;
        display: block;
        font-size:12px;
    }
</style>

