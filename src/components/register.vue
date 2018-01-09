<template>
  <div>
      <div class="header">
          <div id="header" style="padding-top:0;">
            <div class="site-nav single-nav">
                <div class="site-nav-logo">
                    <a href="">
                        <img src="../assets/img/logo.png" alt="豆瓣">
                    </a>
                </div>
            </div>
        </div>
      </div>
      <div class="wrapper">
            <h1>欢迎加入豆瓣</h1>
            <div class="article">
                <form name="lzform" method="post" action="">
                    <div class="item extra-tips">
                        <label>邮箱</label>
                        <input id="email" name="alias" type="text" class="basic-input" maxlength="60" tabindex="1" value="" v-model.lazy="email">
                    </div>
                    <div class="suggestion">
                        <div id="email_suggestion"></div>
                    </div>
                    <div class="item extra-tips">
                        <label>密码</label>
                        <input id="password" name="password" type="password" class="basic-input" tabindex="2" maxlength="20" v-model.lazy="upwd" @focus="Upwdfocus" @blur="Upwdblur">
                        <span class="validate-option" v-if="isShow1">至少包含字母和数字，最短8个字符，区分大小写</span>
                        <span class="validate-error" v-if="isShow2">密码不能为空</span>
                    </div>
                    <div class="item extra-tips">
                        <label>名号</label>
                        <input id="name" name="name" type="text" class="basic-input" maxlength="15" tabindex="3" value="" v-model.lazy="nickname" @focus="Namefocus" @blur="Nameblur">
                        <span class="validate-option" v-if="isShow3">中、英文均可，最长14个英文或7个汉字</span>
                        <span class="validate-error" v-if="isShow4">名号不能为空</span>
                    </div>
                    <div class="suggestion">
                        <span class="tips">第一印象很重要，起个响亮的名号吧</span>
                    </div>
                    <div class="item loc-item">
                        <label>常居地</label>
                        <span class="loc">
                            <em id="location">豆瓣猜你在<strong>上海</strong>，没猜对？</em> <a href="https://accounts.douban.com/register#" class="a-btn-location" id="edloc">手动选择</a>
                        </span>
                    </div>
                    <div class="item extra-tips">
                        <label>手机号</label>
                        <div class="basic-input GlobalPhone">
                            <span class="js-choose-district" data-abbr="CN">+86</span>
                            <div>
                                <input id="verify_phone_num" type="text" class="basic-input" maxlength="60" value="" tabindex="1" v-model.lazy="phone" @blur="checkphone">
                            </div>                           
                        </div>
                        <span class="validate-error" id="phone-vali" v-if="isReg">该手机号码已注册</span> 
                    </div>
                    <div class="suggestion">
                        <span class="tips">用手机接收注册验证码 <br>
                        验证的手机号如果没有绑定过帐号，会自动绑定当前帐号</span>
                    </div>
                    <div class="item captcha-item">
                        <label>验证码</label>
                        <input id="code" name="code" type="text" class="basic-input small" maxlength="10" tabindex="2" @blur="yzmblur" v-model.lazy="yzm">
                        <input id="request-phone-code-btn" type="button" value="获取验证码">
                        <span id="tips-error" class="tips"><em></em></span>
                        <span id="tips-info" class="tips"></span>
                        <span class="validate-error" id="frm_error" v-if="isShow5">验证码不能为空</span>
                    </div>
                    <div class="item-error"></div>
                    <div class="item-submit">
                        <label>&nbsp;</label>
                        <input type="submit" name="register" value="注册" id="button" class="btn-submit enabled" tabindex="6" @click.prevent="submitReg">
                    </div>
                </form>
                <!-- 同意本站协议 -->
                <div class="agreement-new" v-if="isShow">
                    <a href="javascript:;" class="agreement-close" @click.prevent="showChange">X</a>
                    <div class="agreement-content">
                        <h3>豆瓣使用协议</h3>
                        <p>本协议为豆瓣《使用协议》的修订版本，自2017年10月16日公布。<a target="_blank" href="https://www.douban.com/about?policy=agreement_archive">查看历史版本</a></p>
                        <p class="b">请您务必审慎阅读、充分理解协议中相关条款内容，特别是粗体标注的内容。您一旦注册豆瓣，即视为您已了解并完全同意本协议各项内容，包括豆瓣对使用协议随时所做的任何修改。如您不同意本协议及/或随时对其的修改，请您立即停止注册及使用豆瓣所提供的全部服务。</p>
                        <div class="content">
                            <h4>1、接受条款</h4>
                            1.1 豆瓣网的运营者及相关关联公司（以下简称“豆瓣”）根据本使用协议的条款及不时发布的规则为您提供基于豆瓣网（包括豆瓣pc端、豆瓣及豆瓣相关客户端、移动网页端等）的互联网服务。本协议的条款可由豆瓣随时修改，修改后的使用协议一经在网站上公布即有效代替原来的使用协议。您一旦在豆瓣网注册，即成为豆瓣用户（以下简称“用户”或“您”），并受本协议的约束。<br>
                            1.2 当您使用豆瓣网单项服务时，您和豆瓣应遵守豆瓣随时公布的与该服务相关的指引和规则。前述所有的指引和规则，均构成本使用协议的一部分。<br>
                            <span class="b">1.3 您应遵守本协议的各项条款，合法合理使用豆瓣提供的服务，否则，豆瓣有权依据本协议中断或终止为您提供服务。同时，豆瓣保留在任何时候收回您所使用的账号的权利。</span><br>
                            <h4>2、服务说明</h4>
                            2.1 豆瓣向用户提供包括但不限于如下服务：发布并分享对图书、电影、音乐等的评论；收藏图书、电影、音乐；在豆瓣中发布话题、日记、上传图片、视频等；在同城中发布或参加各类活动；电子商务服务；付费内容服务等。除非本协议另有其它明示规定，豆瓣增加或强化目前本服务的任何新功能，包括所推出的新产品，均受本使用协议之规范。<br>
                            <span class="b">2.2 用户了解并同意，豆瓣之服务、产品与资料仅依其当前所呈现的状况提供，而且豆瓣明确地表示拒绝对于“服务”、“资料”或“产品”等给予任何明示或暗示之担保或保证，包括但不限于，为商业使用、适合于特定目的或未侵害他人权利之担保或保证等。豆瓣对于因“服务”、 “产品”或“资料”等所产生之任何直接、间接、附带的或因此而导致之衍生性损失概不负责。豆瓣对于任何用户信息或个性化设定之时效、删除、传递错误、未予储存或其它任何问题，均不承担任何责任。</span><br>
                            <span class="b">2.3 您同意豆瓣有权制订关于使用本服务的一般措施及限制，包括但不限于本服务将保留所发布内容或其它发布内容之最长期间，以及一定期间内您使用本服务之次数上限（及/或每次使用时间之上限）。通过本服务发布或传送之任何信息、通讯资料和其它内容，如被删除或未予储存，您同意豆瓣无须承担任何责任。您也同意，豆瓣有权依其自行之考虑，不论通知与否，随时变更这些一般措施及限制。</span><br>
                            <h4>3、您的注册义务</h4>
                            3.1 为了能使用本服务，按照中国法律的要求，您同意以下事项：依本服务注册提示填写您正确的注册邮箱、密码、名号、手机号码等信息，并确保今后更新的登录邮箱、名号、头像及手机号码等资料的真实性、有效性和合法性。<span class="b">若您提供任何违法、不道德或豆瓣认为不适合在豆瓣网上展示的资料；或者豆瓣有理由怀疑您的行为属于程序或恶意操作，豆瓣有权无须事先通知即可暂停或终止您使用账号，并拒绝您于现在和未来使用本服务之全部或任何部分。</span><br>
                            3.2 豆瓣无须对您（任何用户）的任何注册或登记资料承担任何责任，包括但不限于鉴别、核实任何注册或登记资料的真实性、正确性、完整性、适用性及/或是否为最新资料的责任。<br>
                            <h4>4、用户账号、密码及安全</h4>
                            4.1 完成本服务的注册程序并成功注册之后，您可使用您的注册邮箱/手机号码和密码，登录到您在豆瓣网的账号（下称“账号”）。注册完成之时，您便获得了账号的使用权。保护账号安全，是您的责任。<br>
                            4.2 您应对所有使用您的账号的行为负完全的责任。您同意：<br>
                                1）您的豆瓣账号遭到未获授权的使用，或者发生其它任何安全问题时，您将立即通知豆瓣；<br>
                                2）如果您未保管好自己的账号和密码，因此而产生的任何损失或损害，豆瓣不承担任何责任；<br>
                                3）您要对使用账号的所有行为给您、豆瓣或第三方造成的损害负全责，包括您未保管好自己的账号或密码的情形。<br>
                            <span class="b">4.3 由于通过账号可获取到用户的个人信息，且账号的所有权归豆瓣所有，除法律明文规定外，未经豆瓣同意，用户不得将账号转让、出售或出借给他人使用。</span><br>
                            4.4 若您连续六个月未登录豆瓣平台，且不存在未到期的有效业务，豆瓣有权限制您对账号的使用。由此造成的不利后果由您自行承担<br>
                            4.5 您选择将豆瓣账号与第三方账号进行绑定的，除您自行解除绑定关系外，如发生下列任何一种情形，您已绑定的第三方账号也有可能被解除绑定而豆瓣无需对您或任何第三方承担任何责任：<br>
                                1）您违反法律法规、国家政策或本协议的；<br>
                                2）您违反第三方账户用户协议或其相关规定的；<br>
                                3）其他需要解除绑定的情形。<br>
                            <h4>5、用户个人信息保护</h4>
                            5.1 保护您个人信息安全既是法律要求，也是豆瓣长期坚持的一项基本原则。<span class="b">您提供的注册资料及豆瓣保留的有关您的其它资料将受到中国有关法律的保护。豆瓣将根据中国法律、本协议、<a href="https://www.douban.com/about/privacy" target="_blank">《隐私声明》</a>（网址：https://www.douban.com/about/privacy）的规定收集、存储、使用和透露您的个人信息。</span><br>
                            5.2 一般情况下，您可随时浏览、修改您在豆瓣上的信息，但出于安全性和身份识别的考虑，您可能无法修改注册时提供的初始注册信息及其他验证信息。<br>
                            <h4>6、提供者之责任</h4>
                            <span class="b">6.1 根据有关法律法规，豆瓣在此郑重提请您注意，任何经由本服务而发布、上传的文字、音乐、图片、图形、视频或其他资料（以下简称“内容 ”），无论系公开还是非公开传送，均由内容提供者承担责任。</span>豆瓣仅为用户提供信息存储空间服务，无法控制经由本服务传送之内容，因此不保证内容的正确性、完整性或有效性。您已预知使用本服务时，可能会接触到令人不快、不适当或令人厌恶之内容。在任何情况下，豆瓣均不为任何内容负责，但豆瓣有权依法停止传输任何前述内容并采取相应行动，包括但不限于暂停用户使用本服务的全部或部分，保存有关记录，并向有关机关报告等。<br>
                            6.2 您明确了解并同意，基于以下原因而造成的，包括但不限于经济、信誉、数据损失或其他无形损失，豆瓣不承担任何直接、间接、附带、特别、衍生性或惩罚性赔偿责任：<br>
                                1）本服务之使用或无法使用；<br>
                                2）为替换从或通过本服务购买或取得之任何商品、数据、信息、服务，收到的讯息，或与第三方缔结交易而发生的成本；<br>
                                3）您的传输或数据遭到未获授权的存取或改变；<br>
                                4）任何第三方在本服务中所作之声明或行为；<br>
                                5）第三方以任何方式发布或投递欺诈性信息，或诱导用户受到经济损失；<br>
                                6）与本服务相关的其他事宜，但本使用协议有明确规定的除外。
                            <h4>7、服务变更、中断或终止</h4>
                            7.1 豆瓣可能会对服务内容进行变更、也可能会中断、终止服务。<br>
                            7.2 鉴于网络服务的特殊性（包括但不限于服务器的稳定性问题、恶意的网络攻击等行为或豆瓣无法控制的情形），您同意豆瓣有权随时中断或终止部分或全部的服务。<br>
                            7.3 您理解，豆瓣需要定期或不定期对提供服务的平台或相关设备进行维护、升级或其他目的暂停部分或全部服务，如因此类情况而造成服务在合理时间内的中断，豆瓣无需为此承担任何责任。<br>
                            <span class="b">7.4 如发生以下任何一种情形，豆瓣有权随时中断或终止向您提供本协议项下的服务而无需对您或任何第三方承担责任：<br>
                                1）您提供个人资料不真实；<br>
                                2）您违反法律、政策或违反本使用协议。</span><br>
                            <span class="b">7.5 您同意豆瓣基于其自行之考虑，因任何理由，包含但不限于缺乏使用，或豆瓣认为您已经违反本使用协议，终止您的账号或本服务之使用（或服务之任何部分），并将您在本服务内任何内容加以移除并删除。您同意依本使用协议任何规定提供之服务，无需进行事先通知即可中断或终止。您承认并同意，豆瓣可立即关闭或注销您的账号及删除您账号中所有相关信息及文件，及/或禁止继续使用前述文件或本服务。此外，您同意若本服务之使用被中断或终止或您的账号及相关信息和文件被关闭或注销，豆瓣对您或任何第三人均不承担任何责任。</span><br>
                            <h4>8、担保与保证</h4>
                            您明确了解并同意∶<br>
                            1）本使用协议的任何规定不会免除豆瓣因过错而造成您人身伤害或财产损失的任何责任；<br>
                            <span class="b">2）豆瓣不保证以下事项∶<br>
                            　　· 本服务将符合您的要求；<br>
                            　　· 本服务将不受干扰、及时提供、安全可靠或不会出错；<br>
                            　　· 使用本服务取得之结果正确可靠；<br>
                            　　· 您经由本服务购买或取得之任何产品、服务、资讯或其它信息将符合您的期望；</span><br>
                            <span class="b">3）是否使用本服务下载或取得任何资料应由您自行考虑且自负风险，因任何资料之下载而导致的您电脑系统之任何损坏或数据丢失等后果，由您自行承担；</span><br>
                            <span class="b">4）您自豆瓣或经由本服务取得的任何建议或信息，无论是书面或口头形式，除非本使用协议有明确规定，将不构成本使用协议以外之任何保证。</span><br>
                            <h4>9、用户行为</h4>
                            9.1 您应遵守中华人民共和国相关法律法规，并同意对以任何方式使用您的登录账号而使用本服务的任何行为及其结果承担全部责任。如您的行为违反国家法律，您将依法承担全部法律责任；如涉嫌构成犯罪，司法机关将追究您的刑事责任，豆瓣网将严格按照法律规定的义务及司法机关的要求进行配合。<br>
                            同时，如果豆瓣有理由认为您的任何行为，包括但不限于您的任何言论或其它行为违反或可能违反国家法律法规的任何规定，豆瓣可在任何时候不经任何事先通知终止向您提供服务。<br>
                            <span class="b">9.2 您同意将不会利用本服务进行任何违法或不正当的活动，包括但不限于下列行为∶</span><br>
                                1）发布或以其他方式传送含有下列内容之一的信息：　<br>
                                　　· 反对宪法所确定的基本原则的；<br>
                                　　· 危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；<br>
                                　　· 损害国家荣誉和利益的；<br>
                                　　· 煽动民族仇恨、民族歧视、破坏民族团结的；<br>
                                　　· 破坏国家宗教政策，宣扬邪教和封建迷信的；<br>
                                　　· 散布谣言，扰乱社会秩序，破坏社会稳定的；<br>
                                　　· 散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的；<br>
                                　　· 侮辱或者诽谤他人，侵害他人合法权利的；<br>
                                　　· 含有虚假、诈骗、有害、胁迫、侵害他人隐私、骚扰、侵害、中伤、粗俗、猥亵、或其他道德上令人反感的内容；<br>
                                　　· 含有中国法律、法规、（部门）规章以及任何具有法律效力之规范所限制或禁止的其他内容的；<br>
                                　　· 含有豆瓣认为不适合在豆瓣展示的内容；<br>
                                2）以任何方式危害他人的合法权益；<br>
                                3）冒充其他任何人或机构，或以虚伪不实的方式陈述或谎称与任何人或机构有关；<br>
                                4）将依据任何法律、合约或法定关系（例如由于雇佣关系和依据保密合约所得知或揭露之内部资料、专属及机密资料）而知悉但无权传送之任何内容加以发布、发送电子邮件或以其它方式传送；<br>
                                5）将侵害他人著作权、专利权、商标权、商业秘密、或其他专属权利（以下简称“专属权利”）之内容加以发布或以其他方式传送；<br>
                                6）将任何“广告信函”、“促销资料”、“垃圾邮件”、“滥发信件”、“连锁信件”、“直销”或其他任何形式的劝诱资料加以发布、发送或以其它方式传送；<br>
                                7）将设计目的在于干扰、破坏或限制任何计算机软件、硬件或通讯设备功能之计算机病毒（包括但不限于木马程序（trojan horses）、蠕虫（worms）、定时炸弹、删除蝇（cancelbots）（以下简称“病毒”）或其他计算机代码、档案和程序之任何资料，加以发布、发送或以其他方式传送；<br>
                                8）干扰或破坏本服务或与本服务相连线之服务器和网络，或违反任何关于本服务连线网络之规定、程序、政策或规范；<br>
                                9）跟踪、人肉搜索或以其他方式骚扰他人；<br>
                                10）故意或非故意地违反任何适用的当地、国家法律，以及任何具有法律效力的规则；<br>
                                11）未经合法授权而截获、篡改、收集、储存或删除您或他人的个人信息、站内邮件或其他数据资料，或将获知的此类资料用于任何非法或不正当目的。<br>
                                您已认可豆瓣未对用户的使用行为进行全面控制，您使用任何内容时，包括依赖前述内容之正确性、完整性或有效性时，您同意将自行加以判断并承担所有风险，而不依赖于豆瓣。但豆瓣依其自行之考虑，有权拒绝和删除经由本服务提供之违反本条款的或其他引起豆瓣反感的任何内容。<br>
                            9.3 由于您通过本服务提供、发布或传送之内容、您与本服务连线、您违反本使用协议、或您侵害他人任何权利因而衍生或导致任何第三人提出任何索赔或请求，包括但不限于合理的律师费、诉讼费，您同意赔偿豆瓣及其子公司、关联公司、高级职员、代理人、品牌共有人或其他合作伙伴及员工，并使其免受损害，并承担由此引发的全部法律责任。<br>
                            9.4 您同意不对本服务任何部分或本服务之使用或获得，进行复制、拷贝、出售、转售或用于任何其他商业目的。<br>
                            <h4>10、知识产权</h4>
                            <span class="b">10.1 豆瓣在本服务中提供的内容（包括但不限于网页、文字、音频、视频、图片或其他资料等）等知识产权归豆瓣或相关权利人所有。除另有约定外，豆瓣提供本服务时所依托的软件、系统等的著作权、专利权及其他知识产权归豆瓣所有。豆瓣网、豆瓣以及其他豆瓣标识及产品、服务名称，均为豆瓣之商标。未经豆瓣事先书面同意，您不得将豆瓣的商标以任何方式展示或使用或作其它处理，或表示您有权展示、使用或另行处理豆瓣的商标。</span><br>
                            <span class="b">10.2 您在豆瓣网上传或发布的内容，您应保证为其著作权人或已取得合法授权，并且该内容不会侵犯任何第三方的合法权益，您同意授予豆瓣所有上述内容在全球范围内的免费的、不可撤销的、无期限限制的、可再许可或转让的非独家使用权许可，据该许可豆瓣将有权以展示、推广及其他不为我国法律所禁止的方式使用前述内容。</span><br>
                            10.3 豆瓣对您在豆瓣网上传或发布的内容享有优先合作权，若您欲授权第三方使用或以其他形式与第三方合作，应提前告知豆瓣。<br>
                            10.4 您了解并同意，本服务及本服务所使用之相关软件含有受到相关知识产权及其他法律保护之专有保密资料。您也了解并同意，经由本服务或广告商向您呈现之赞助广告或信息所包含之内容，亦受到著作权、商标权、专利权或其他专属权利之法律保护。未经豆瓣或广告商明示授权，您不得修改、出租、出借、出售、散布本服务或软件之任何部分或全部，或据以制作衍生著作，或使用擅自修改后的软件等。豆瓣仅授予您个人、不可移转及非专属之使用权，使您得于在单机计算机上使用其软件之目的，但您不得（且不得允许任何第三人）复制、修改、创作衍生著作、进行还原工程、反向组译，或以其它方式发现原始码，或出售、转让、再授权或提供软件设定担保，或以其它方式移转软件之任何权利。您同意将通过由豆瓣所提供的界面而非任何其它途径使用本服务。<br>
                            <h4>11、用户专属权利</h4>
                            11.1 豆瓣尊重他人合法权益（包括知识产权、名誉权、商誉权等），呼吁您也要尊重他人合法权益。<br>
                            <span class="b">11.2 如果您对他人的合法权益造成了侵害，豆瓣将依国家法律法规的规定，或在适当的情形下，依本协议或其相关规定，删除特定内容或以至终止您对账户的使用。</span><br>
                            11.3 若您认为您的合法权益遭到侵害，请您及时与豆瓣联系（联系邮箱：help@douban.com）并提供详实的举证材料，您也可以查看<a href="https://help.douban.com/complaint/" target="_blank">《豆瓣侵权投诉指引》</a>（链接：https://help.douban.com/complaint/），按照指引提示提交投诉，豆瓣将依法进行处理。<br>
                            <h4>12、国际使用之特别告知</h4>
                            您已了解互联网的无国界性，同意遵守当地所有关于网上行为及内容之法律法规。您特别同意遵守有关从中国或您所在国家或地区输出信息之传输的所有适用法律法规。
                            <h4>13、未成年人使用条款</h4>
                            如您是未成年用户，请在法定监护人的陪同下仔细阅读本使用协议，您及法定监护人应按照法律及本协议规定承担责任。
                            <h4>14、一般条款</h4>
                            <span class="b">14.1 豆瓣公布的<a href="https://www.douban.com/about/guideline" target="_blank">《社区指导原则》</a>（网址：https://www.douban.com/about/guideline）、<a href="https://www.douban.com/about/copyright" target="_blank">《版权声明》</a>（网址：https://www.douban.com/about/copyright）、<a href="https://www.douban.com/about/privacy" target="_blank">《隐私声明》</a>(网址：https://www.douban.com/about/privacy)均是本协议的有效组成部分，本协议及与豆瓣服务相关的指引和规则（包括豆瓣单项服务指引，如：《豆瓣小站服务协议》《豆瓣原创声明》《豆瓣赞赏功能使用协议》等）共同规范您对于本服务之使用行为。在您使用相关服务、使用第三方提供的内容或软件时，亦应遵从所适用之附加条款及条件。</span><br>
                            <span class="b">14.2 本使用协议及您与豆瓣之关系，均适用中华人民共和国法律。您与豆瓣就本服务、本使用协议或其他有关事项发生的争议，应首先友好协商解决，协商不成时应提请豆瓣实际运营者所在地有管辖权的人民法院通过诉讼解决。</span><br>
                            14.3 豆瓣未行使或执行本使用协议任何权利或规定，不构成对前述权利或权利之放弃。<br>
                            14.4 倘若本使用协议之任何规定因与中华人民共和国法律抵触而无效，本使用协议其他规定仍应具有完整的效力及效果。<br>
                            14.5 本使用协议之标题仅供方便而设，不具任何法律或契约效果。<br>
                            14.6 豆瓣对本使用协议享有最终解释权。<br>
                        </div>
                    </div>
                    <div class="agreement-btns">
                        <a href="javascript:;" class="btn"  @click.prevent="hideAgree">同意协议</a>
                    </div>
                </div>
            </div>
            <div class="aside">
                <ul class="sidenav">
                    <li>&gt;&nbsp;已经拥有豆瓣帐号? <a rel="nofollow" href="">直接登录</a></li>
                    <li>&gt;&nbsp;<a href="">点击下载豆瓣移动应用</a></li>
                </ul>
            </div>
      </div>
      <div class="footer">
            <div id="footer">
                <span id="icp" class="fleft gray-link">
                    © 2005－2017 douban.com, all rights reserved
                </span>
                <span class="fright">
                    <a href="">关于豆瓣</a>
                    · <a href="">在豆瓣工作</a>
                    · <a href="">联系我们</a>
                    · <a href="">免责声明</a>
                    
                    · <a href="">帮助中心</a>
                    · <a href="" target="_blank">开发者</a>
                    · <a href="">移动应用</a>
                    · <a href="">豆瓣广告</a>
                </span>
            </div>
      </div>
  </div>
</template>
<script>
export default {
  data:function(){
      return{
          isShow:true,
          email:'',
          phone:'',
          upwd:'',
          nickname:'',
          yzm:'',
          isShow1:false,
          isShow2:false,
          isShow3:false,
          isShow4:false,
          isShow5:false,
          isReg:false
      }
  },
  methods:{
      showChange:function(){
        this.isShow=!this.isShow;
        this.$router.push("/");
      },
      hideAgree:function(){
          this.isShow=!this.isShow;
      },
      Upwdfocus:function(){
        this.isShow1=true;
        this.isShow2=false;
      },
      Upwdblur:function(){
        this.isShow1=false;
        if(this.upwd=="")
            this.isShow2=true;
      },
      Namefocus:function(){
        this.isShow3=true;
        this.isShow4=false;
      },
      Nameblur:function(){
        this.isShow3=false;
        if(this.nickname=='')
            this.isShow4=true;
      },
      yzmblur:function(){
        if(this.yzm=='')
            this.isShow5=true;
        else
            this.isShow5=false;
      },
      checkphone:function(){
        if(this.phone!=''){
            this.$http.post("http://localhost:3002/phone/phone",{"phone":this.phone},{emulateJSON:true})
            .then(function(response){
                if(response.data.code==-1){
                    this.isReg=true;
                }else{
                    this.isReg=false;
                }
            });
        }
      },
      submitReg:function(){
          if(this.phone!=''&&this.email!=''&&this.nickname!=''&&this.upwd!=''){
              this.$http.post("http://localhost:3002/register/register",
                {"email":this.email,"phone":this.phone,"upwd":this.upwd,"nickname":this.nickname},
                {emulateJSON:true})
                .then(function(response){
                    if(response.data.code>0){
                        this.$router.push("/");
                    }
            });
          }
      }
  }
}
</script>
<style scoped>
    a:hover{
        text-decoration: none;
    }
    input{
        outline: none;
        border:none;
    }
    h1 {
        display: block;
        margin: 0;
        padding: 0 0 15px 0;
        font-size: 25px;
        font-weight: bold;
        color: #494949;
        line-height: 1.1;
    }
    form {
        position: relative;
        left: 0;
        top: 0;
    }
    label {
        display: inline-block;
        float: left;
        margin-right: 15px;
        text-align: right;
        width: 60px;
        font-size: 14px;
        line-height: 30px;
        vertical-align: middle;
        font-weight:unset;
    }
    h3{
        font-size: 24px;
    }
    p {
        margin: 1em 0;
        font: 12px Helvetica,Arial,sans-serif;
        line-height: 1.62;
    }
    .wrapper, .header, .footer {
        width: 950px;
        margin: 0 auto 40px;
        overflow: hidden;
        zoom: 1;
    }
    .single-nav {
        padding-top: 30px;
    }
    .article {
        padding-bottom: 1em;
    }
    .article {
        float: left;
        width: 590px;
        margin-right: 50px;
    }
    .item {
        clear: both;
        margin: 15px 0;
        height:30px;
    }
    .basic-input {
        width: 200px;
        padding: 5px;
        height: 100%;
        font-size: 14px;
        border-radius: 3px;
        border: 1px solid #c9c9c9;
    }
    .item .basic-input:focus {
        border: 1px solid #a9a9a9;
    }
    .extra-tips .validate-error, .extra-tips .validate-option {
        padding-left: 10px;
        background: url(../assets/img/tips_arrow.gif) no-repeat;
    }
    .extra-tips .validate-option {
        background-position: left 4px;
    }
    .extra-tips .validate-error {
        background-position: left -52px;
    }
    .validate-option {
        color: #808080;        
    }    
    .validate-error {
        color: #fe2617;
    }
    #phone-vali{
        position: relative;
        top: -27px;
        left: 220px;
    }
    .item span{
        font-size: 12px;
    }
    .suggestion {
        padding-left: 75px;
    }
    .tips, #location {
        font-size: 12px;
        color: #808080;
    }
    .loc {
        font-size: 12px;
        line-height: 30px;
    }
    em {
        font-style: normal;
    }
    #location strong {
        color: #111111;
        font-weight: normal;
    }
    .GlobalPhone {
        display: inline-block;
        vertical-align: middle;
    }
    .GlobalPhone {
        display: table;
        padding: 0;
        height: 28px;
        width: 210px;
        font-size: 0;
        position: relative;
    }
    .GlobalPhone>span {
        text-align: center;
        padding: 0 7px;
        cursor: pointer;
        color: #494949;
        white-space: nowrap;
    }
    .GlobalPhone>span, .GlobalPhone input {
        line-height: 28px;
    }
    .GlobalPhone>* {
        font-size: 14px;
        display: table-cell;
        vertical-align: top;
    }
    .GlobalPhone>span:after {
        content: "";
        display: inline-block;
        height: 15px;
        border-right: 1px solid #ccc;
        vertical-align: middle;
        margin-left: 7px;
    }
    .GlobalPhone input[type="text"] {
        padding: 0 7px 0 0;
        border: 0;
        height: 88%;
        width: 98%;
        box-sizing: border-box;
        margin-top:2px;
    }
    .GlobalPhone input[type="text"]:focus{
        border: 0;
        outline: 0;
    }
    .captcha-item {
        zoom: 1;
    }
    .captcha-item .basic-input {
        width: 95px;
    }
    #request-phone-code-btn {
        cursor: pointer;
        background: #fff;
        border: 1px solid #c9c9c9;
        font-size: 13px;
        padding: 5px 15px;
        border-radius: 3px;
        margin-top:-3px;
        vertical-align: middle;
    }
    .captcha-item span.validate-error {
        padding-left: 10px;
        background: url(../assets/img/tips_arrow.gif) no-repeat left -52px;
    }
    .item-submit {
        margin-top: 25px;
    }
    .enabled {
        color: #ffffff;
        background: #3fa156;
        border: 1px solid #528641;
    }
    .btn-submit {
        cursor: pointer;
        font-size: 14px;
        font-weight: bold;
        padding: 6px 26px;
        border-radius: 3px;
    }
    /*同意本站协议*/
    .agreement-new {
        width: 800px;
        border-radius: 5px;
        padding: 10px;
        position: absolute;
        top: 120px;
        left: 50%;
        margin-left: -400px;
        background: rgba(0,0,0,0.2);
    }
    .agreement-close {
        position: absolute;
        top: 15px;
        right: 15px;
    }
    .agreement-content {
        padding: 20px;
        background: #fff;
    }
    .agreement-content {
        padding: 20px;
        background: #fff;
    }
    .agreement-content h3 {
        font-size: 18px;
        font-weight: bold;
        margin-top:5px;
    }
    .agreement-content strong, .agreement-content .b {
        font-weight: bold;
    }
    .agreement-content .content {
        height: 280px;
        border: 1px solid #ccc;
        padding: 10px;
        overflow: auto;
        font-size: 12px;
    }
    .agreement-content h4 {
        margin-top: 12px;
        font-weight: bold;
        font-size:100%;
    }
    .agreement-btns {
        padding: 0 0 20px;
    }
    .agreement-btns {
        padding-top: 9px;
        text-align: center;
        background: #fff;
    }
    .agreement-btns .btn {
        display: inline-block;
        border-radius: 5px;
        padding: 10px 20px;
        color: #fff;
        cursor: pointer;
        background: #3BA94D;
    }
    .aside {
        color: #666;
        overflow: hidden;
        zoom: 1;
    }
    .sidenav {
        margin-top: 1em;
    }
    .sidenav li {
        margin-bottom: 1em;
        font-size: 12px;
    }
    .sidenav li a{
        font-size: 12px;
        color:#37a;
    }
    #footer {
        color: #999;
        padding-top: 6px;
        border-top: 1px dashed #ddd;
        font-size: 12px;
    }
</style>
