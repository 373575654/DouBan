<template>
    <div class="main-content">
        <!-- <h1>这是首页</h1> -->
        <mynav></mynav>
        <news></news>
        <sns></sns>
        <mytime></mytime>
        <myvideo></myvideo>
        <mymovie></mymovie>
        <mygroup></mygroup>
        <myfooter></myfooter>
        <!--导航nav-->
        <div class="demo" style="width:200px;">
            <div class="container" style="overflow:hidden;">
                <div class="row" style="margin-right:-302px;">
                    <div class="col-md-12">
                        <div class="navbar">主菜单
                            <ul class="menu">
                                <li><a href="#anony-nav" class="glyphicon glyphicon-search"></a></li>
                                <li><a href="#anony-movie" class="glyphicon glyphicon-film"></a></li>
                                <li><a href="#anony-time" class="glyphicon glyphicon-book"></a></li>
                                <li><a href="#anony-video" class="glyphicon glyphicon-facetime-video"></a></li>
                                <li><a href="#anony-group" class="glyphicon glyphicon-list-alt"></a></li>
                                <li><a href="#" class="glyphicon glyphicon-home"></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import Mynav from '@/components/main/Mynav';
import News from '@/components/main/News';
import Sns from '@/components/main/Sns';
import Time from '@/components/main/Time';
import Myvideo from '@/components/main/Myvideo';
import Mymovie from '@/components/main/Mymovie';
import Mygroup from '@/components/main/Mygroup';
import Myfooter from '@/components/main/Myfooter';
export default {
    components:{
        mynav:Mynav,
        news:News,
        sns:Sns,
        mytime:Time,
        myvideo:Myvideo,
        mymovie:Mymovie,
        mygroup:Mygroup,
        myfooter:Myfooter
    }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
    .main-content{
        position: relative;
    }
    .demo{
		padding: 2em 0;
		transform: translate3d(0, 0, 0);
        position:fixed;
        left:-450px;
        top:300px;
	}
	.navbar{
		width: 150px;
		height: 150px;
		line-height: 150px;
		border-radius: 50%;
		background: #fff;
		margin: 70px auto;
		position: relative;
		cursor: pointer;
		text-align: center;
		font-size: 1.75em;
		font-weight: bold;
		color: #99b977;
		transition: 0.24s 0.2s;
	}
	.navbar:hover{
		background: rgba(255, 255, 255, 0.75);
	}
	.navbar .menu{
		list-style: none;
		padding: 0;
		margin: 0;
		position: absolute;
		top: -75px;
		left: -75px;
		border: 150px solid transparent;
		cursor: default;
		border-radius: 50%;
		transform: scale(0);
		transition: transform 1.4s 0.07s;
		z-index: -1;
	}
	.navbar:hover .menu{
		transition: transform 0.4s 0.08s, z-index   0s  0.5s;
		transform: scale(1);
		z-index: 1;
	}
	.navbar .menu li{
		position: absolute;
		top: -100px;
		left: -100px;
		transform-origin: 100px 100px;
		transition: all 0.5s 0.1s;
	}
	.navbar:hover .menu li{
		transition: all 0.6s;
	}
	.navbar .menu li a{
		width: 45px;
		height: 45px;
		line-height: 45px;
		border-radius: 50%;
		background: #fff;
		position: absolute;
		font-size: 60%;
		color: #99b977;
		transition: 0.6s;
	}
	.navbar:hover .menu li:nth-child(1){
		transition-delay: 0.02s;
		transform: rotate(85deg);
	}
	.navbar:hover .menu li:nth-child(1) a{
		transition-delay: 0.04s;
		transform: rotate(635deg);
	}
	.navbar:hover .menu li:nth-child(2){
		transition-delay: 0.04s;
		transform: rotate(125deg);
	}
	.navbar:hover .menu li:nth-child(2) a{
		transition-delay: 0.08s;
		transform: rotate(595deg);
	}
	.navbar:hover .menu li:nth-child(3){
		transition-delay: 0.06s;
		transform: rotate(165deg);
	}
	.navbar:hover .menu li:nth-child(3) a{
		transition-delay: 0.12s;
		transform: rotate(555deg);
	}
	.navbar:hover .menu li:nth-child(4){
		transition-delay: 0.08s;
		transform: rotate(205deg);
	}
	.navbar:hover .menu li:nth-child(4) a{
		transition-delay: 0.16s;
		transform: rotate(515deg);
	}
	.navbar:hover .menu li:nth-child(5){
		transition-delay: 0.1s;
		transform: rotate(245deg);
	}
	.navbar:hover .menu li:nth-child(5) a{
		transition-delay: 0.2s;
		transform: rotate(475deg);
	}
	.navbar:hover .menu li:nth-child(6){
		transition-delay: 0.12s;
		transform: rotate(285deg);
	}
	.navbar:hover .menu li:nth-child(6) a{
		transition-delay: 0.24s;
		transform: rotate(435deg);
	}
	.navbar:hover .menu li:nth-child(7){
		transition-delay: 0.14s;
		transform: rotate(325deg);
	}
</style>
