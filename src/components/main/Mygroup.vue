<template>
  <div id="anony-group" class="section">
    <div class="wrapper">
        <div class="sidenav">
            <h2 class="section-title">
                <a href="">小组</a>
            </h2>
            <div class="side-links nav-anon">
                <ul>
                    <li v-for="(value,index) in left_list" :key="index"><a href="">{{value}}</a></li>
                </ul>
            </div>
        </div>
        <div class="side">
            <div class="mod">
                <h2>小组分类&nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·</h2>
                <div class="cate group-cate" v-for="(value,index) in title" :key="index">
                    <ul>
                        <li class="cate-label"><a href="">{{value}}</a></li>
                        <li v-for="(tmp,i) in subtitle[index]" :key="i">
                            <a href="">{{tmp}}</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="main">
            <h2>
                热门小组&nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·
                <span class="pl">&nbsp;(<a href="" target="_self">更多</a>)</span>
            </h2>
            <div class="group-list list">
                <ul>
                    <li v-for="(value,index) in groups" :key="index">
                        <div class="pic">
                            <a href=""><img :src="require('../../assets/'+value.src)" width="48"></a>
                        </div>
                        <div class="info">
                            <div class="title">
                                <a href="">{{value.title}}</a>
                            </div>
                            {{value.count}} 个成员
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
  </div>
</template>
<script>
  export default{
    data:function(){
        return{
            left_list:["精选","文化","行摄","娱乐","时尚","生活","科技"],
            title:["兴趣»","生活»","购物»","社会»","艺术»","学术»","情感»","闲聊»"],
            subtitle:[
                ["旅行","摄影","影视","音乐","文学","游戏","动漫","运动","戏曲","桌游","怪癖"],
                ["健康","美食","宠物","美容","化妆","护肤","服饰","公益","家庭","育儿","汽车"],
                ["淘宝","二手","团购","数码","品牌","文具"],
                ["求职","租房","励志","留学","出国","理财","传媒","创业","考试"],
                ["设计","手工","展览","曲艺","舞蹈","雕塑","纹身"],
                ["人文","社科","自然","建筑","国学","语言","宗教","哲学","软件","硬件","互联网"],
                ["恋爱","心情","心理学","星座","塔罗","LES","GAY"],
                ["吐槽","笑话","直播","八卦","发泄"] 
            ],
            groups:[]
        }
    },
    created:function(){
        this.$http.get('http://localhost:3002/group/group')
        .then(function(response){
            this.groups=response.data.data;
        });
    }
  }  
</script>
<style>
    #anony-group .section-title a{
        color:#007982;
        font-size:24px;
    }
    #anony-group a:hover{
        color:#fff;
    }
    .section .sidenav{
        float: left;
        width: 100px;
        margin-right: 20px;
    }
    #anony-group ul{
        padding:0;
    }
    .side-links li {
        position: relative;
        margin-top: 7px;
        font-size: 14px;
    }
    .side-links {
        margin-bottom: 40px;
    }
    #anony-group a{
        color: #017a85;
        font-size:14px;
    }
    #anony-group .cate .cate-label a:hover{
        color:#fff;
    }
    .section .side {
        float: right;
        width: 265px;
        margin-left: 30px;
    }
    .mod {
        margin-bottom: 30px;
        width:auto;
    }
    .cate {
        margin-bottom: 10px;
    }
    .cate ul {
        margin-left: -10px;
    }
    .cate ul li{
        display: inline-block;
        zoom: 1;
        margin-left: 10px;
    }
    #anony-group .cate ul li:not(.cate-label) a{
        font-size:12px;
    }
    .cate .cate-label {
        width: 100%;
        margin-bottom: 2px;
        font-size: 14px;
        color: #333;
    }
    #anony-group .cate .cate-label a{
        color: #333;
    }
    #anony-group .group-list ul {
        margin-left: -30px;
        margin-top: -30px;
    }
    #anony-group .group-list li {
        display: inline-block;
        width: 248px;
        margin-left: 30px;
        margin-top: 30px;
        text-align: left;
        overflow: hidden;
        zoom: 1;
        color: #999;
    }
    #anony-group .group-list .pic {
        float: left;
        margin-right: 15px;
        margin-bottom:10px;
    }
    #anony-group .group-list a{
        font-size:12px;
    }
    #anony-group .info {
        margin-bottom: 5px;
        font-size: 12px;
    }
</style>
