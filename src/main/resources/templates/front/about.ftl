<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<#include "/layout/front/header.ftl"  />
<@header "关于秋码","关于秋码;ssm;Java;福建"/>
    <link href="/static/front/css/timeline.css" rel="stylesheet" />
<style>
    .align-center {
        text-align: center;
    }
    .aboutinfo {
        text-align: center;
        padding: 0 15px;
    }
    .aboutinfo-nickname {
        font-size: 32px;
        font-weight: bold;
        margin: 0 0 15px 0;
    }
    .aboutinfo-introduce {
        margin: 20px auto;
        font-size: 18px;
        width: 90%;
    }
    .aboutinfo-abstract {
        width: 90%;
        margin: 0 auto;
    }
    .myinfo {
        line-height: 34px;
        padding: 5px;
        text-align: center;
    }

    .fly-panel {
        margin-bottom: 15px;
        border-radius: 2px;
        background-color: #fff;
        box-shadow: 0 1px 2px 0 rgba(0, 0, 0, .05);
    }
    .myinfo img {
        width: 100px;
        margin: 10px;
        border-radius: 100px;
    }
    .mynickname {
        font-size: 24px;
        font-weight: 800;
    }
</style>
</head>
<body style="background-color: #ecf0f5;overflow-x:hidden">
<#include "/layout/front/nav.ftl" />

<script>
    (function(){
        var bp = document.createElement('script');
        var curProtocol = window.location.protocol.split(':')[0];
        if (curProtocol === 'https') {
            bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
        }
        else {
            bp.src = 'http://push.zhanzhang.baidu.com/push.js';
        }
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(bp, s);
    })();
</script>

<!-- 主体（一般只改变这里的内容） -->
<div id="main-body" class="layui-container" style="margin-top: 100px;">

    <#--<div>
        <a href="https://cloud.tencent.com/redirect.php?redirect=1025&cps_key=41adf8fde7f1607a1ac7f01c4ec4df25&from=console" target="_blank">
            <img src="/static/front/images/txyunNew.jpg">
        </a>
    </div>-->
    <!-- 这个一般才是真正的主体内容 -->
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md9">
            <div class="fly-panel-main">

                <div class="layui-tab layui-tab-brief about-tab" lay-filter="docDemoTabBrief">
                    <ul class="layui-tab-title align-center">
                        <li class="layui-this">关于博客</li>
                        <li class="">关于作者</li>
                                                 <li class="">友情公众号</li>
                        <#--<li>友情链接</li>
                        <li>留言墙</li>-->
                    </ul>
                    <div class="layui-tab-content align-center">
                        <div class="layui-tab-item layui-show">
                            <div class="aboutinfo">

                                <p id="sitename" class="aboutinfo-nickname">秋码记录网</p>
                                <p id="siteoutline" class="aboutinfo-introduce">
                                    一个记录工作、生活等琐碎的站点
                                </p>

                                <fieldset class="layui-elem-field layui-field-title">
                                    <legend>简介</legend>
                                    <div id="siteinfo" class="layui-field-box aboutinfo-abstract">
                                        <i class="fa fa-check"></i>表示本站已实现。<i class="fa fa-close"></i>表示还未实现，正在努力完善中,尽情期待……
                                        <ul class="aboutinfo-location">
                                            <li><i class="fa fa-check"></i>首页文章列表</li>
                                            <li><i class="fa fa-check"></i>文章详情</li>
                                            <li><i class="fa fa-check"></i>文章评论</li>
                                            <li><i class="fa fa-check"></i>留言</li>
                                            <li><i class="fa fa-close"></i>站内文章搜索</li>
                                            <li><i class="fa fa-close"></i>订阅本站</li>
                                            <li><i class="fa fa-close"></i>第三方登录</li>
                                            <li>其他还有什么功能，笔者暂时想不出来，如果你有什么想法请在留言处！说出你的想法，笔者尽可能去实现它！</li>
                                            <li><i class="fa fa-close"></i><span style="font-size: 35px;">……</span></li>
                                        </ul>
                                        <hr>

                                        <p>没有什么特别的……</p>
                                        <p>其实很就就有打算做个关于记录工作、生活方面的站点了！</p>
                                        <p>
                                            <span style="text-align: center;">1.界面用的是比较流行的Freemarker模板引擎渲染.</span>
                                        </p>
                                        <p>
                                            <span style="text-align: center;">2.关于后台架构，无非就是Spring+SpringMVC+Mybatis.</span>
                                        </p>
                                        <p>
                                            <span style="text-align: center;">3.数据库用的mysql.</span>
                                        </p>
                                        <p>
                                            <span style="text-align: center;">4.服务器方面，国内还是很多云服务器可以进行选购的！</span>
                                        </p>
                                        <p>
                                            <span style="text-align: center;"><b><i>恩、好像就这些……</i></b></span>
                                        </p>
                                        <p>
                                            <span style="text-align: center;"><br></span>
                                        </p>
                                    </div>
                                    <h1 style="text-align: center; font-weight: bold; font-size: 16px;">The End</h1>
                                </fieldset>

                            </div>

                        </div>
                        <div class="layui-tab-item">
                            <div class="fly-panel myinfo">
                                <img id="myhead" class="myavatar" src="/static/front/images/aboutAuthor.png" onerror="errorFigure(this)" alt="joy">

                                <p id="myname" class="mynickname">秋码</p>
                                <#--<p id="oneword" class="myintroduce">QQ：1063721800</p>-->
                                <p class="mylocation">
                                    <i class="fa fa-location-arrow"></i>&nbsp;
                                    <span id="myaddress">福建-福州</span>
                                </p>
                                <#--<hr>-->
                                <#--<div id="mylink" class="mylink">
                                    <a target="_blank" title="QQ交流" href="http://wpa.qq.com/msgrd?v=3&amp;uin=1063721800&amp;site=qq&amp;menu=yes">
                                        <i class="fa fa-qq fa-2x"></i>
                                    </a>
                                    <a target="_blank" title="给我写信" href="http://mail.qq.com/cgi-bin/qm_share?t=qm_mailme&amp;email=1063721800@qq.com">
                                        <i class="fa fa-envelope fa-2x"></i>
                                    </a>
                                    <a target="_blank" title="新浪微博" href="http://weibo.com/ytwodogs">
                                        <i class="fa fa-weibo fa-2x"></i></a><a target="_blank" title="github" href="https://github.com/aaa106"><i class="fa fa-git fa-2x"></i>
                                    </a>
                                </div>-->
                                <fieldset class="layui-elem-field layui-field-title">
                                    <legend>简介</legend>

                                    <div id="myinfo" class="layui-field-box aboutinfo-abstract">
                                        不知该说什么，那就什么也不说，这样好像不太好吧！明明是关于作者，你竟然什么也不说，让浏览
                                        你站点的人怎么说你吗？这个家伙啊！点击了关于本站栏目，再看关于作者，这个家伙竟然什么也没写。
                                        是不想多说呢？还是另有原因，咱暂且不论，正所谓<font color="red">江湖梦已醒，笑傲曲未终。</font>
                                    </div>
                                    <h1 style="text-align: center; font-weight: bold; font-size: 16px;">The End</h1>
                                </fieldset>
                            </div>

                        </div>

                       <div class="layui-tab-item">
                            <div class="aboutinfo">
                                <!--<div class="aboutinfo-figure">
                                    <img src="images/handshake.png" alt="友情链接">
                                </div>-->
                                <p class="aboutinfo-nickname">友情公众号</p>
                                <hr>
                                 <h4>添加友情公众号须知：发送到笔者的邮箱：<font color="red">emple_3usoft@163.com</font></h4>
                                                                <p class="aboutinfo-location">
                                                                        <i class="fa fa-check"></i>微信公众号名称&nbsp;
                                    <i class="fa fa-check"></i>微信公众号二维码&nbsp;
                                </p>
                              

                                <div class="aboutinfo-contact">
                                    <img src="/static/front/images/linklinzhenhuawxgz.png" alt="友情链接">
                                </div>
                                
                            </div>

                        </div>


                        <#--<div class="layui-tab-item">
                            <div class="aboutinfo">
                                <div class="aboutinfo-figure">
                                    <img src="images/handshake.png" alt="友情链接">
                                </div>
                                <p class="aboutinfo-nickname">友情链接</p>
                                <p class="aboutinfo-introduce">Name：<span id="spansitename">二狗码头</span>&nbsp;&nbsp;&nbsp;&nbsp;Site：www.twodogs.top</p>
                                <p class="aboutinfo-location">
                                    <i class="fa fa-check"></i>原创优先&nbsp;
                                    <i class="fa fa-check"></i>技术优先&nbsp;
                                    <i class="fa fa-close"></i>经常宕机&nbsp;
                                    <i class="fa fa-close"></i>不合法规&nbsp;
                                    <i class="fa fa-close"></i>插边球站&nbsp;
                                    <i class="fa fa-close"></i>红标报毒

                                </p>
                                <hr>
                                <div class="aboutinfo-contact">
                                    <p style="font-size: 2em;">互换友链，携手并进！</p>
                                </div>
                                <fieldset class="layui-elem-field layui-field-title">
                                    <legend>Friend Link</legend>
                                    <div class="layui-field-box">
                                        <ul id="ulfriendlink" class="layui-row layui-col-space15"><li class="layui-col-xs12 layui-col-sm6 layui-col-md3"><a target="_blank" href="http://www.layui.com/" title="Layui" class="friendlink-item"><div class="layui-col-xs3 layui-col-sm3 layui-col-md3"><img src="images/friendlink.png" onerror="errorLink(this)" class="layui-col-xs3 layui-col-sm3 layui-col-md3" alt="Layui"></div><div class="layui-col-xs9 layui-col-sm9 layui-col-md9"><p class="friendlink-item-title">Layui</p><p>http://www.layui.com/</p></div></a></li><li class="layui-col-xs12 layui-col-sm6 layui-col-md3"><a target="_blank" href="http://ihcr.top" title="Layui" class="friendlink-item"><div class="layui-col-xs3 layui-col-sm3 layui-col-md3"><img src="images/friendlink.png" onerror="errorLink(this)" class="layui-col-xs3 layui-col-sm3 layui-col-md3" alt="翰林的小站"></div><div class="layui-col-xs9 layui-col-sm9 layui-col-md9"><p class="friendlink-item-title">翰林的小站</p><p>http://ihcr.top</p></div></a></li><li class="layui-col-xs12 layui-col-sm6 layui-col-md3"><a target="_blank" href="http://www.wanandroid.com" title="Layui" class="friendlink-item"><div class="layui-col-xs3 layui-col-sm3 layui-col-md3"><img src="images/friendlink.png" onerror="errorLink(this)" class="layui-col-xs3 layui-col-sm3 layui-col-md3" alt="玩Android"></div><div class="layui-col-xs9 layui-col-sm9 layui-col-md9"><p class="friendlink-item-title">玩Android</p><p>http://www.wanandroid.com</p></div></a></li><li class="layui-col-xs12 layui-col-sm6 layui-col-md3"><a target="_blank" href="https://coding-dream.github.io/" title="Layui" class="friendlink-item"><div class="layui-col-xs3 layui-col-sm3 layui-col-md3"><img src="images/friendlink.png" onerror="errorLink(this)" class="layui-col-xs3 layui-col-sm3 layui-col-md3" alt="coding-dream"></div><div class="layui-col-xs9 layui-col-sm9 layui-col-md9"><p class="friendlink-item-title">coding-dream</p><p>https://coding-dream.github.io/</p></div></a></li><li class="layui-col-xs12 layui-col-sm6 layui-col-md3"><a target="_blank" href="https://zgboke.org" title="Layui" class="friendlink-item"><div class="layui-col-xs3 layui-col-sm3 layui-col-md3"><img src="images/friendlink.png" onerror="errorLink(this)" class="layui-col-xs3 layui-col-sm3 layui-col-md3" alt="中国博客联盟"></div><div class="layui-col-xs9 layui-col-sm9 layui-col-md9"><p class="friendlink-item-title">中国博客联盟</p><p>https://zgboke.org</p></div></a></li><li class="layui-col-xs12 layui-col-sm6 layui-col-md3"><a target="_blank" href="https://www.javagood.cn/" title="Layui" class="friendlink-item"><div class="layui-col-xs3 layui-col-sm3 layui-col-md3"><img src="images/friendlink.png" onerror="errorLink(this)" class="layui-col-xs3 layui-col-sm3 layui-col-md3" alt="java宝典"></div><div class="layui-col-xs9 layui-col-sm9 layui-col-md9"><p class="friendlink-item-title">java宝典</p><p>https://www.javagood.cn/</p></div></a></li></ul>
                                    </div>
                                </fieldset>

                            </div>

                        </div>-->
                        <#--<div class="layui-tab-item">
                            <div class="fly-panel detail-box">
                                <div class="aboutinfo-figure">
                                    <img src="images/messagewall.png" alt="留言墙">
                                </div>
                                <p class="aboutinfo-nickname">留言墙</p>
                                <p class="aboutinfo-introduce">本页面可留言、吐槽、提问。欢迎灌水，杜绝广告！</p>

                                <div class="layui-form layui-form-pane">
                                    <form action="">
                                        <div class="layui-form-item layui-form-text">

                                            <div class="layui-input-block">
                                                <textarea id="L_content" name="content" lay-verify="content" placeholder="请输入内容" class="layui-textarea fly-editor layui-hide"></textarea><div class="layui-layedit"><div class="layui-unselect layui-layedit-tool"><i class="layui-icon layedit-tool-face" title="表情" layedit-event="face" "=""></i><span class="layedit-tool-mid"></span><i class="layui-icon layedit-tool-b" title="加粗" lay-command="Bold" layedit-event="b" "=""></i><i class="layui-icon layedit-tool-i" title="斜体" lay-command="italic" layedit-event="i" "=""></i><i class="layui-icon layedit-tool-u" title="下划线" lay-command="underline" layedit-event="u" "=""></i><i class="layui-icon layedit-tool-d" title="删除线" lay-command="strikeThrough" layedit-event="d" "=""></i><span class="layedit-tool-mid"></span><i class="layui-icon layedit-tool-link" title="插入链接" layedit-event="link" "=""></i></div><div class="layui-layedit-iframe"><iframe id="LAY_layedit_1" name="LAY_layedit_1" textarea="L_content" frameborder="0" style="height: 150px;"></iframe></div></div>
                                            </div>
                                        </div>
                                        <div class="layui-form-item">
                                            <button class="layui-btn" lay-filter="formReply" lay-submit="">提交留言</button>
                                        </div>
                                    </form>
                                </div>
                                <fieldset class="layui-elem-field layui-field-title" style="text-align: center;">
                                    <legend>留言</legend>
                                </fieldset>
                            </div>

                        </div>-->
                    </div>
                </div>

            </div>

            <!--广告区域-->
            <#--<div>
                <a href="https://cloud.tencent.com/redirect.php?redirect=1009&cps_key=41adf8fde7f1607a1ac7f01c4ec4df25&from=console" target="_blank">
                    <img style="width:900px;" src="/static/front/images/txyunSSL.jpg">
                </a>
            </div>-->
        </div>
        <!--右边小栏目-->
        <#include "/layout/front/right.ftl" />
    </div>

</div>
<#--</div>-->
<!-- 底部 -->
<#include "/layout/front/footer.ftl" />

<!-- 本页脚本 -->
<script src="/static/front/js/blog.js"></script>


<script>
    // 百度分享
    //window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"1","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"16"},"slide":{"type":"slide","bdImg":"6","bdPos":"right","bdTop":"250"}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)]

    layui.use(["jquery"], function () {
        var $ = layui.jquery;
        //固定右边侧边栏
        function sticky(){
            var listHeight = $(".layui-container>.layui-row>.layui-col-md9").outerHeight(true);
            var stickHeight = $(".layui-container #affix-side").parents(".layui-col-md3").outerHeight(true);
            return stickHeight < listHeight;
        }
        $(function(){
            $(".fa-info").parent().parent().addClass("layui-this");
            $('label').click(function(){
                $('.event_year>li').removeClass('current');
                $(this).parent('li').addClass('current');
                var year = $(this).attr('for');
                $('#'+year).parent().prevAll('div').slideUp(800);
                $('#'+year).parent().slideDown(800).nextAll('div').slideDown(800);
            });

            var affix= new hcSticky("#affix-side", {
                stickTo: '#main-body'
                , innerSticker: '#blogtag'
                , queries: {980: {disable: true}}
                , top: 75
                , onStart: function () {
                    if (!sticky()) {
                        affix.destroy();
                    }
                }
            })

        });
    });
</script>
</body>
</html>