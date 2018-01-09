SET NAMES UTF8;
DROP DATABASE IF EXISTS douban;
CREATE DATABASE douban CHARSET=UTF8;
USE douban;

#用户列表
CREATE TABLE db_user(
	uid INT PRIMARY KEY AUTO_INCREMENT,
	phone VARCHAR(16),
	upwd VARCHAR(32),	
	email VARCHAR(64),
	nickname VARCHAR(64)
);
INSERT INTO db_user VALUES(01,'15618094186','1qaz2wsx','373575654@qq.com','傅空空空空');
INSERT INTO db_user VALUES(NULL,'18352866274','1qaz2wsx','4546546546@qq.com','当当当当');
INSERT INTO db_user VALUES(NULL,'15669263606','1qaz2wsx','8906456345@qq.com','我是谁呀');

#热点内容
CREATE TABLE db_news(
    pid INT PRIMARY KEY AUTO_INCREMENT,
    src VARCHAR(64),
    des VARCHAR(64),
    `count` INT
);
INSERT INTO db_news VALUES(01,'img/p2505456924.webp','千年古银杏，安吉化家坞',24);
INSERT INTO db_news VALUES(NULL,'img/p2504678847.webp','青海青',37);
INSERT INTO db_news VALUES(NULL,'img/p2497863589.webp','月光的「新疆旅行日记」',55);
INSERT INTO db_news VALUES(NULL,'img/p2506015964.webp','我妈摄影作品精选',42);
INSERT INTO db_news VALUES(NULL,'img/p2505522515.webp','意大利伸了个懒腰·续',24);
INSERT INTO db_news VALUES(NULL,'img/p2503867825.webp','绵阳：一座空中城邦',34);
INSERT INTO db_news VALUES(NULL,'img/p2458682033.webp','《果下马》－漫画',54);
INSERT INTO db_news VALUES(NULL,'img/p2162190393.webp','Covers 1000^px+',556);

#热点头条
CREATE TABLE db_news_demo(
    `title` VARCHAR(128),
    author VARCHAR(64) NOT NULL DEFAULT '',
    subtitle VARCHAR(128) NOT NULL DEFAULT ''
);
INSERT INTO db_news_demo VALUES('花椒香煎鸡，干香回甜的家常菜','肥肥鱼的日记','喜欢做家常菜，不仅是因为有回忆的味道，更重要是因为简单好做。家常二字，我的理...');
INSERT INTO db_news_demo VALUES('眼妆 | SURRATT - 日常通勤眼妆教程','','');
INSERT INTO db_news_demo VALUES('是谁掬尽空花，是谁吐露芳华  —— 漫谈电影《芳华》','','');
INSERT INTO db_news_demo VALUES('一周影视大新闻 | 忧桑！我们与这些佳片只差一张香港机票的距离','','');
INSERT INTO db_news_demo VALUES('美国人为什么一定要拿枪','','');
INSERT INTO db_news_demo VALUES('多伦多大鹅守护者','','');
INSERT INTO db_news_demo VALUES('我的二十世纪之夜，及其他小突破｜石黑一雄在瑞典文学院演讲全文','','');
INSERT INTO db_news_demo VALUES('2017年度第一敷衍梗：为XX打call','','');
INSERT INTO db_news_demo VALUES('黄轩变身冷场段子王，温柔形象秒破功 |《瓣嘴3》第22期','','');
INSERT INTO db_news_demo VALUES('2017书业盘点：汉语世界史图书的井喷之势','','');

#热点话题
CREATE TABLE db_topic(
    topic VARCHAR(128),
    people INT
);
INSERT INTO db_topic VALUES('不会错的礼物',28499);
INSERT INTO db_topic VALUES('江歌案凶手陈世峰一审获刑20年',245380);
INSERT INTO db_topic VALUES('电影《芳华》与原著小说有哪些不同？',382449);
INSERT INTO db_topic VALUES('除了《乡愁》，你还喜欢余光中的哪些诗？',100393);
INSERT INTO db_topic VALUES('你的消费观是怎样的？',361162);
INSERT INTO db_topic VALUES('冬天吃什么',165110);

#豆瓣时间
CREATE TABLE db_time(
    src VARCHAR(64),
    `title` VARCHAR(128)
);
INSERT INTO db_time VALUES('img/c4972ec0-e3bf-11e7-9d88-0242ac110021.jpg','一个故事的诞生——22堂创意思维写作课');
INSERT INTO db_time VALUES('img/f9493ac4-d428-11e7-a75c-0242ac11002e.jpg','黑镜人生——网络生活的传播学肖像');
INSERT INTO db_time VALUES('img/6da43bc4-cdd7-11e7-bb25-0242ac110014.png','哲学闪耀时——不一样的西方哲学史');
INSERT INTO db_time VALUES('img/b5d54766-c3ab-11e7-9bba-0242ac110008.jpg','亲密而独立——洞悉爱情的20堂心理课');
INSERT INTO db_time VALUES('img/1c148a64-c50a-11e7-953c-0242ac110012.jpg','雷神的世界——冰火之地的北欧神话');
INSERT INTO db_time VALUES('img/f90e218a-b8aa-11e7-9cc5-0242ac110021.jpg','52倍人生——戴锦华大师电影课');
INSERT INTO db_time VALUES('img/4ed34930-d4b5-11e7-91bc-0242ac110018.jpg','解衣磅礴看国宝——台北故宫书画特展精华');
INSERT INTO db_time VALUES('img/8a67026e-ba13-11e7-9f54-0242ac110038.png','民谣与台湾故事——胡德夫的音乐时间');
INSERT INTO db_time VALUES('img/50d72036-b010-11e7-a539-0242ac110017.png','觉知即新生——终止童年创伤的心理修复课');
INSERT INTO db_time VALUES('img/d3f40a18-9f78-11e7-b531-0242ac11002d.png','丹青贵公子——艺苑传奇赵孟頫');

#视频列表
CREATE TABLE db_video(
    `href` VARCHAR(128),
    src VARCHAR(64),
    `title` VARCHAR(128)
);
INSERT INTO db_video VALUES('https://www.douban.com/note/636543704/','img/file-1505369246.jpg','《如是》第十二期丨如是：这是我的路，你的呢？');
INSERT INTO db_video VALUES('https://www.douban.com/note/634975903/','img/file-1505369232.jpg','《如是》第十一期丨王珮瑜：撕裂的生活很痛，但我喜欢');
INSERT INTO db_video VALUES('https://www.douban.com/note/633227132/','img/file-1505369217.jpg','《如是》第十期｜西川：凡是能够使我获得再生之感的东西，都是诗意');
INSERT INTO db_video VALUES('https://www.douban.com/note/649797709/','img/file-1513785775.jpg','黄轩变身冷场段子王，温柔形象秒破功');
INSERT INTO db_video VALUES('https://www.douban.com/note/648906562/','img/file-1513181073.jpg','大写加粗的直男刘昊然，也有被撩到脸红的时候');
INSERT INTO db_video VALUES('https://www.douban.com/note/647995846/','img/file-1512574225.jpg','资深偶像韩庚狠甩包袱，自封谐星里的美男子');

#电影列表
CREATE TABLE db_movie(
    src VARCHAR(64),
    `name` VARCHAR(32),
    rate VARCHAR(8),
    star VARCHAR(16) NOT NULL DEFAULT ''
);
INSERT INTO db_movie VALUES('img/p2507024497.webp','妖猫传','6.9','allstar35');
INSERT INTO db_movie VALUES('img/p2505785547.webp','机器之血','5.1','allstar25');
INSERT INTO db_movie VALUES('img/p2507227732.webp','芳华','7.8','allstar40');
INSERT INTO db_movie VALUES('img/p2506228506.webp','心理罪之城市之光','6.2','allstar35');
INSERT INTO db_movie VALUES('img/p2503997609.webp','寻梦环游记','9.1','allstar45');
INSERT INTO db_movie VALUES('img/p2506466229.webp','帕丁顿熊2','8.3','allstar45');
INSERT INTO db_movie VALUES('img/p2503544593.webp','解忧杂货店','暂无评分','');
INSERT INTO db_movie VALUES('img/p2507566212.webp','奇门遁甲','4.8','allstar25');

#热门电影
CREATE TABLE db_hot_movie(
    mid INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(32),
    score INT
);
INSERT INTO db_hot_movie VALUES(01,'敦刻尔克',100);
INSERT INTO db_hot_movie VALUES(NULL,'天才枪手',99);
INSERT INTO db_hot_movie VALUES(NULL,'王牌特工2：黄金圈',98);
INSERT INTO db_hot_movie VALUES(NULL,'母亲！',97);
INSERT INTO db_hot_movie VALUES(NULL,'英伦对决',96);
INSERT INTO db_hot_movie VALUES(NULL,'小丑回魂',95);
INSERT INTO db_hot_movie VALUES(NULL,'我能说',94);
INSERT INTO db_hot_movie VALUES(NULL,'昼颜 电影版',93);
INSERT INTO db_hot_movie VALUES(NULL,'春宵苦短，少女前进吧！',92);
INSERT INTO db_hot_movie VALUES(NULL,'底特律',91);

#热门小组
CREATE TABLE db_hot_group(
    pid INT PRIMARY KEY AUTO_INCREMENT,
    src VARCHAR(64),
    `title` VARCHAR(64),
    `count` INT
);
INSERT INTO db_hot_group VALUES(01,'img/g407193-15.jpg','帮帮组™加入这个组就有人帮你了！',15375);
INSERT INTO db_hot_group VALUES(NULL,'img/g10083-4.jpg','我爱三毛',44574);
INSERT INTO db_hot_group VALUES(NULL,'img/g210869-9.jpg','沙发客',22055);
INSERT INTO db_hot_group VALUES(NULL,'img/g37688-27.jpg','刘慈欣',23092);
INSERT INTO db_hot_group VALUES(NULL,'img/g20618-4.jpg','西双版纳',10450);
INSERT INTO db_hot_group VALUES(NULL,'img/g402725-3.jpg','记事本圆梦小组',110305);
INSERT INTO db_hot_group VALUES(NULL,'img/g33120-3.jpg','搭讪学',93443);
INSERT INTO db_hot_group VALUES(NULL,'img/g170177-27.jpg','这辈子一定要做几件疯狂的事',91885);
INSERT INTO db_hot_group VALUES(NULL,'img/g109498-1.jpg','自己给自己剪头发',31692);
INSERT INTO db_hot_group VALUES(NULL,'img/g83759-2.jpg','我们就是要做衣服给自己穿',3814);
INSERT INTO db_hot_group VALUES(NULL,'img/g362263-7.jpg','对象太他妈难找了党-单身凸^-^凸',15582);

#登录之后的页面
CREATE TABLE db_statuses(
	sid INT PRIMARY KEY AUTO_INCREMENT,
	src VARCHAR(64),
	`title` VARCHAR(64),
	`desc` VARCHAR(512),
	user VARCHAR(32),
	avatar VARCHAR(64),
	`time` VARCHAR(32) NOT NULL DEFAULT ''
);
INSERT INTO db_statuses VALUES(01,'img/p47429980.jpg','圣诞节吃饺子是我国特有的习俗',
'【平安夜吃饺子是我国特有的习俗】 圣诞节是中华民族最重要的传统节日之一，
在平安夜当晚吃饺子是我国独特的饮食文化，当年传教士来华告诉教友，耶稣是上帝之子，即天之娇子，但为拯救世人的...',
'家禽腿部保健','img/u26035329-8.jpg','20分钟前'
);
INSERT INTO db_statuses VALUES(NULL,'img/p47401186.jpg','除非朝霞有一天赶上晚霞｜2017年度读书总结',
'2017年，我读了120本书（不包括工具书和杂志），比起去年的200本在数量上少了许多，好在今年因为越发地穷困潦倒，终于强迫自己学会了利用学校的图书馆，买纸质书的支出控制在了2000以内，较...',
'普鲁斯特蓝','img/u128956983-14.jpg','52分钟前'
);
INSERT INTO db_statuses VALUES(NULL,'img/p47445408.jpg','作为一个专业人士，我来告诉你如何办婚礼',
'整个2017年经手了很多场婚礼，中式西式、室内室外、预算高低，可以说是很有经验了。到了年底一直在想，办好一场婚礼都需要哪些必备因素？今天写在这里，希望对筹备婚礼的新人们有帮助，对于...',
'谭不爽','img/u1560589-80.jpg','1小时前'
);
INSERT INTO db_statuses VALUES(NULL,'img/p47443484.jpg','2017，我的后摇选择',
'大家好！我是ER！ 今年是我开始做后摇总结以来听得最少的一年，也许是专辑总量就不比往前了，也许是我个人的兴趣爱好越来越偏移，但年终挑选的时候发现还是有几张专辑让我感到爱不释手，好歹...',
'Eltan Renaxy','img/u50757471-13.jpg','2小时前'
);
INSERT INTO db_statuses VALUES(NULL,'img/p47441325.jpg','宋徽宗可以穿黄龙袍吗？',
'文/图 扬眉剑舞 前阵子《国家宝藏》第一期里的宋徽宗，一身浅黄色绣团龙袍扮相，引起了极大的争议。看过历代帝王肖像的朋友们基本都知道，南熏殿旧藏徽宗御容，穿戴的是大袖红袍、红束带、展...',
'扬眉剑舞','img/u1857052-112.jpg','2小时前'
);
INSERT INTO db_statuses VALUES(NULL,'img/p47426243.jpg','内向的人如何做领导？独处可以用来做情绪管理？｜2017 值得关注的10个心理研究',
'今天KY君为大家带来2017年值得关注的10个心理学研究。我们选择了贴近大家生活的研究来呈现，了解这些研究的结果会对我们的生活有所启示和帮助。 1. 认为自己睡眠有问题，比睡眠实际上有问题...',
'KnowYourself','img/u104562976-20.jpg','今天下午'
);
INSERT INTO db_statuses VALUES(NULL,'img/p47424801.jpg','在我恋爱的那个夏天，请以你的名字呼唤我',
'原文刊登于Sight and Sound 译 | 易往 校 | Stevie 编 | Valen 前 言 卢卡·瓜达尼诺(Luca  Guadagnino)的电影《请以你的名字呼唤我》(Call Me by Your Name,  2017)，是一则精致青涩的爱情...',
'深焦DeepFocus','img/u139444387-5.jpg','今天下午'
);
INSERT INTO db_statuses VALUES(NULL,'img/p47383048.jpg','【护肤】看腻了大牌嘛？来给大家介绍点小众好物（26只年度好物，超级长文流量慎点',
'完全没想到会这么多点赞w好开心呀~谢谢大家的支持，有任何问题意见建议请留言或私信，我会努力为大家解答/及时回复的！为了方便大家参(zhong)考(cao)，每件动物实验及Vegan的状态都标出来了(...',
'Summer-K','img/u47058522-24.jpg','今天下午'
);
INSERT INTO db_statuses VALUES(NULL,'img/p47442438.jpg','冻柿、皮冻与土笋冻',
'虽均带着一个“冻”字——冻柿、皮冻、土笋冻——但未必此冻即彼冻，或为冰冻，或为熬制凝结，不一而足。不过，在冬日习惯吃它，或仅能在冬日制作，又或偶然在冬日品之，成为一无形的连线，...',
'齐物秋水','img/u3790983-100.jpg','今天上午'
);

#同城票务滚动
CREATE TABLE db_events(
	eid INT PRIMARY KEY AUTO_INCREMENT,
	src VARCHAR(64),
	`title` VARCHAR(64),
	`time` VARCHAR(64),
	price INT
);
INSERT INTO db_events VALUES(01,'img/745df0d00a23bdc.jpg','国家艺术基金2017年度资助项目 话剧《广陵散》','2018年01月20日 19:15 ~ 2018年01月21日 21:15',169);
INSERT INTO db_events VALUES(NULL,'img/dfde6342b8ea6f0.jpg','【德国·柏林交响乐团】2018新年•音乐会（开幕演出）','2018年01月01日 19:30 ~ 2018年01月02日 21:30',800);
INSERT INTO db_events VALUES(NULL,'img/20bd24bf569249f.jpg','开心麻花爆笑舞台剧《乌龙山伯爵》 第17轮','2017年12月20日 ~ 2017年12月31日 每天 19:30 - 21:30',80);
INSERT INTO db_events VALUES(NULL,'img/ded8fff3b7a9211.jpg','阿加莎推理巨作《捕鼠器》（2017经典版）','09月20日 19:30 ~ 2018年02月11日 21:30',115);
INSERT INTO db_events VALUES(NULL,'img/5714b2f6dd126af.jpg','萨尔茨堡爱乐乐团2018上海迎新跨年音乐会','12月31日 19:30-23:30',300);
INSERT INTO db_events VALUES(NULL,'img/4e1dbf7205f07dc.jpg','英国莎士比亚环球剧院戏剧放映《第十二夜》《威尼斯商人》《暴风雨》','2018年01月21日 19:00 ~ 2018年03月03日 21:00',111);
INSERT INTO db_events VALUES(NULL,'img/6e2b65d7aed3794.jpg','上海K11 2017年度重磅大展','2018年01月03日 10:00-10:00',95);
INSERT INTO db_events VALUES(NULL,'img/d095ba3c9241ee7.jpg','世界小提琴大师艾拉·马利肯《魔琴之夜》音乐会','2018年01月25日 19:30-19:30',80);
INSERT INTO db_events VALUES(NULL,'img/fd2d35a1a27aed4.jpg','【万有音乐系】麦斯米兰 “Sea of Silence” 寂静如海 2018巡回演唱会-上海站','2018年04月18日 19:30-21:30',97);
INSERT INTO db_events VALUES(NULL,'img/4ce84139303139c.jpg','黎明Leon Random Run 2017演唱会','2018年01月06日 19:30-21:30',455);
INSERT INTO db_events VALUES(NULL,'img/b9ca645d64cb1a5.jpg','维也纳春之声交响乐团 新年音乐会','12月28日 19:30 ~ 12月29日 21:30',170);
INSERT INTO db_events VALUES(NULL,'img/63e4770871c6cb5.jpg','奇迹：贝利尼家族与文艺复兴特展','09月28日 10:00 ~ 12月23日 17:00',65);
INSERT INTO db_events VALUES(NULL,'img/df753afc32ec704.jpg','不灭传奇·好莱坞黄金时代真迹展（限量优惠套票）','11月11日 10:00 ~ 2018年02月21日 21:00',98);
INSERT INTO db_events VALUES(NULL,'img/db8a263e13ac15d.jpg','平行世界的非分之想—互动娱乐展','2017年11月28日 ~ 2018年02月28日 每天 10:00 - 22:00',79);
INSERT INTO db_events VALUES(NULL,'img/1faa7a52203b1d3.jpg','CDE Live摇滚音乐剧《疯狂花店》中文版','2017年12月05日 ~ 2017年12月12日 每天 19:30 - 21:30',168);
INSERT INTO db_events VALUES(NULL,'img/ccc8f5684925de5.jpg','苏宁艺术馆','11月26日 10:00 ~ 2018年12月31日 17:00',120);
INSERT INTO db_events VALUES(NULL,'img/f8b6b198715f72f.jpg','上海彩虹室内乐团新年音乐会','2018年01月01日 16:00-18:00',128);
INSERT INTO db_events VALUES(NULL,'img/71ea592f38a3e48(1).jpg','浪漫辉煌四十年-理查德·克莱德曼全球纪念巡演2018上海新年音乐会','2018年01月01日 19:30-21:30',264);
INSERT INTO db_events VALUES(NULL,'img/22a4efe82b77488.jpg','音乐剧《过去五年》中文版','12月22日 19:30 ~ 2018年01月01日 14:30',86);
INSERT INTO db_events VALUES(NULL,'img/f74715a4169164d.jpg','台湾果陀剧场《最后14堂星期二的课》2018年上海13度感动上演','2018年01月05日 19:30 ~ 2018年01月07日 16:30',210);