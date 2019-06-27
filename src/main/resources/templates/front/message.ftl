
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<#include "/layout/front/header.ftl"  />
<@header "给我留言","留言簿;留言;秋码;Java"/>
    <link href="/static/front/css/detail.css" rel="stylesheet" />
    <style>
        /*辅助*/
        pre{
            padding: 5px 10px;
            margin:  5px 0;
            font-size: 12px;
            border-left: 3px solid #009688;
            background-color: #F8F8F8;
            font-family: Courier New; overflow: auto;
        }
        /* 简易编辑器 */
        .fly-edit{
            position:relative;
            display: block;
            top: 1px;
            left:0;
            padding:0 10px;
            border: 1px solid #e6e6e6;
            border-radius: 2px 2px 0 0;
            background-color: #FBFBFB;
        }
        .fly-edit span{cursor:pointer; padding:0 10px; line-height: 38px; color:#009E94;}
        .fly-edit span i{padding-right:6px; font-size: 18px;}
        .fly-edit span:hover{color:#5DB276;}
        body .layui-edit-face{ border:none; background:none;}
        body .layui-edit-face  .layui-layer-content{padding:0; background-color:#fff; color:#666; box-shadow:none}
        .layui-edit-face .layui-layer-TipsG{display:none;}
        .layui-edit-face ul{position:relative; width:372px; padding:10px; border:1px solid #D9D9D9; background-color:#fff; box-shadow: 0 0 20px rgba(0,0,0,.2);}
        .layui-edit-face ul li{cursor: pointer; float: left; border: 1px solid #e8e8e8; height: 22px; width: 26px; overflow: hidden; margin: -1px 0 0 -1px; padding: 4px 2px; text-align: center;}
        .layui-edit-face ul li:hover{position: relative; z-index: 2; border: 1px solid #eb7350; background: #fff9ec;}

    </style>
</head>
<body style="background-color: #ecf0f5;overflow-x:hidden">
<#include "/layout/front/nav.ftl" />


<#--<script src="/static/front/js/hc-sticky.min.js"></script>-->
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
        <a href="https://cloud.tencent.com/redirect.php?redirect=1032&cps_key=41adf8fde7f1607a1ac7f01c4ec4df25&from=console" target="_blank">
            <img src="/static/front/images/txyunAMD.jpg">
        </a>
    </div>-->
    <!-- 这个一般才是真正的主体内容 -->
    <div class="layui-row layui-col-space15">
        <!--左边文章列表-->
        <div class="layui-col-md9 blog_message_content_left" >
            <!-- 文章主体内容流加载 -->
            <blockquote class="layui-elem-quote">
                <span class="layui-breadcrumb">
                    <a><cite>首页</cite></a>
                    <a><cite>留言</cite></a>
                </span>
            </blockquote>
            <form class="layui-form">
                <div class="layui-row">
                    <div class="layui-col-md5">
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label for="author" class="layui-form-label">
                                    你的大名：
                                </label>
                                <div class="layui-input-block input-div">
                                    <input class="layui-input" type="text" id="author" name="author"  placeholder="必填">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-md5">
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label for="email" class="layui-form-label">
                                    邮箱地址：
                                </label>
                                <div class="layui-input-block input-div">
                                    <input class="layui-input" type="text" id="email" name="email"  placeholder="必填">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <div class="article_common" >
                <textarea id="L_content" name="content" class="layui-textarea message_editor" style=" height: 150px; "></textarea>
                <button class="layui-btn article_common_submit">提交留言</button>
            </div>
            <div class="message_list">
                <h2 class="mess_new">秋码个人站点留言</h2>
                <div class="hidden_message_param" style="display: none"></div>
                <div class="hidden_message_text" style="display: none"></div>
                <div id="message_content">

                </div>
            </div>
        </div>
        <!--右边小栏目-->
        <#include "/layout/front/right.ftl" />
        <div class="clear"></div>
    </div>
</div>
<#--</div>-->
<!-- 底部 -->
<#include "/layout/front/footer.ftl" />
<script src="/static/front/js/base.js"></script>
<script src="/static/front/js/blog.js"></script>

<script>
    // 百度分享
    //window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"1","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"16"},"slide":{"type":"slide","bdImg":"6","bdPos":"right","bdTop":"250"}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)]

    //layui.use(["jquery"], function () {
    layui.use(['flow','code','form'], function () {
        var flow = layui.flow
                ,form = layui.form
                ,$ = layui.jquery;
        layui.code();

        var grid={
            getMessage:function(limit,pageNum){
                $("#message_content").empty();
                //流加载数据
                flow.load({
                    elem: '#message_content' //流加载容器
                    /*, scrollElem: '#message_content' //滚动条所在元素，一般不用填，此处只是演示需要。
                    , isAuto: false
                    , isLazyimg: true*/
                    , isAuto: true
                    ,//end: "<div><a href='https://cloud.tencent.com/redirect.php?redirect=1011&cps_key=41adf8fde7f1607a1ac7f01c4ec4df25&from=console' target='_blank'><img src='/static/front/images/txyunMysql.png'></a></div><a href='#'>别滑了,木有了<i class='layui-icon' style='font-size:15px;'>&#xe60c;</i></a>"
                    end:'如果你想看到更多，那就留言一下吧！'
                    , done: function (page, next) { //加载下一页
                        var lis = [];
                        $.post("/message/list", {pageIndex: page,pageSize:limit}, function (res) {
                            var data = res.data;
                            var totalPage=res.totalPage;//总页数
                            var currentPage=res.currentPage;//当前页
                            for (var i = 0; i < data.length; i++) {
                                var   html = '';
                                var style ='';
                                if(data[i].children.length!=0){
                                    var children = data[i].children;
                                    style = 'border-bottom: 1px solid #1AA195;';
                                    for (var p = 0; p < children.length; p++) {
                                        html += '<div class="layui-row message_children"> ' +
                                                '<div class="layui-col-xs2 layui-col-md1 message_children_left"> ' +
                                                '<img  class="" src="'+children[p].headurl+'" /></div> ' +
                                                '<div class="layui-col-xs10 layui-col-md11 message_children_right"> ' +
                                                '<div class="top"><span class="name">'+children[p].nickname+'</span> ' +
                                                '回复 <span class="name">'+children[p].replyNickName+'</span> ' +
                                                '<span class="time">'+children[p].createAt+'</span>' +
                                                '来自 <span data-id="'+data[i].id+'" class="os">'+children[p].os+'</span> 客户端</div> ' +
                                                '<div class="content">'+children[p].content+'</div> ' +
                                                '<div class="bottom"><!--<span data-id="'+children[p].id+'" class="zan">赞  (<cite>'+children[p].zan_count+'</cite>)</span>--> ' +
                                                '<span data-user="'+children[p].id+'"   data-id="'+data[i].id+'"   class="replay">回复</span> <!--<span class="del">删除</span>--></div> </div> </div>';
                                    }
                                }else{
                                    html ='';
                                    style='';
                                }
                                var innerHtml = '  <div class="messages" style="'+style+'">' +
                                        '<div class="layui-row message_parent"> ' +
                                        '<div class="layui-col-xs2 layui-col-md1 message_parent_left"> ' +
                                        '<img  class="" src="'+data[i].headurl+'" /> </div> ' +
                                        '<div class="layui-col-xs10 layui-col-md11 message_parent_right"> ' +
                                        '<div class="top"><span class="name">'+data[i].nickname+' </span><span class="time">'+data[i].createAt+'</span>' +
                                        '来自 <span data-id="'+data[i].id+'" class="os">'+data[i].os+'</span> 客户端</div> ' +
                                        '<div class="content">'+data[i].content+'</div>' +
                                        '<div class="bottom">' +
                                        '<span  data-user="'+data[i].id+'"  data-id="'+data[i].id+'" class="replay">回复</span> ' +
                                        '<!--<span class="del">删除</span>--></div> </div> </div> '+html+' </div>';
                                lis.push(innerHtml);
                            }
                            //next(lis.join(''), page < res.pageCount); //假设总页数为 6
                            next(lis.join(''),currentPage<totalPage);
                            //next(lis.join(''), page < res.pageNum);
                        });
                    }
                });
            }
        }

        //留言点+赞
        $("body").on("click",".zan",function(){
            var _this = $(this);
            var message_id = _this.attr('data-id');
            var user_id =  $('.user_id').html();
            if("undefined" === typeof(user_id) ){
                layer.msg('请先登录',{
                    icon:2,
                    time:2000
                });
                return false;
            }
            //点赞评论跟留言
            $.post("{:url('index/Message/addZan')}",{message_id:message_id},function (res) {
                if(res.code==1){
                    layer.msg(res.msg,{
                        time:1000,
                        icon:1
                    },function () {
                        //处理业务
                        var  zan =   parseInt(_this.children('cite').text());
                        _this.children('cite').text(zan+1);
                    });
                }else {
                    layer.msg(res.msg,{
                        icon:2
                    });
                }

            });

            // layer.msg('该功能待开发');
        });
        //回复
        $("body").on("click",".replay",function(){
            var _this = $(this);
            var nickname =  $(this).parent('div.bottom').siblings().eq(0).children('span.name').eq(0).text();
            text = '@'+ nickname.replace(/\s/g, '')+' ';
            //@的人到输入框中
            $('.message_editor').val(text);
            $('.message_editor').focus();
            //输入框值改变
            $('.message_editor').change(function () {
                if($(this).val().length==0){
                    $('.hidden_message_param').text('');
                    $('.hidden_message_text').text('');
                }
            });
            //绑定需要的参数到隐藏div中
            var id =  _this.attr('data-id');
            var reply_id =  _this.attr('data-user');
            $('.hidden_message_param').text(id+','+ reply_id +','+ nickname);
            $('.hidden_message_text').text(text);
            //  $('html,body').animate({scrollTop:$('.message_editor').offset().top-240},100);
            // layer.msg('该功能待开发');
        });


        //固定右边侧边栏
        function sticky(){
            var listHeight = $(".layui-container>.layui-row>.layui-col-md9").outerHeight(true);
            var stickHeight = $(".layui-container #affix-side").parents(".layui-col-md3").outerHeight(true);
            return stickHeight < listHeight;
        }
        $(function(){
            $(".fa-comment-o").parent().parent().addClass("layui-this");
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
            grid.getMessage(10,1);
        })

    });
</script>
</body>
</html>












  <#--  <script>
        var _hmt = _hmt || [];
        (function() {
            var hm = document.createElement("script");
            hm.src = "https://hm.baidu.com/hm.js?ebde62a3c8d8ba0c9aa5007b88c9b6d0";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
    </script>         </head>

<style>

<div style="display: none;" id="bind_email_view">
    <div class="layui-field-box">
        <form method="post" class="layui-form" action="" >
            <div class="layui-form-item">
                <label style="width:40px; text-align: left;" class="layui-form-label">邮箱 *</label>
                <div class="layui-input-block"  style="margin-left: 80px;" >
                    <input type="email" name="email" lay-verify="email"  autocomplete="off" placeholder="请输入绑定的邮箱" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="">
                <label style="width:40px;text-align: right;" class="layui-form-label">密码 *</label>
                <div class="layui-input-block"  style="margin-left: 80px; ">
                    <input  type="password" name="bind_user_password" lay-verify="bind_user_password"   autocomplete="off" placeholder="用于登录的密码" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" >
                <div class="layui-input-block">
                    <button style=" margin-left: 20%; " class="layui-btn" lay-submit="" lay-filter="bind_email">提交</button>
                </div>
            </div>
        </form>
    </div>

</div>
<div class="layui-container blog_message_content">
    <div class="layui-row">
        <div class="layui-col-md8 blog_message_content_left" >
            <blockquote class="layui-elem-quote">
            <span class="layui-breadcrumb">
            <a><cite>首页</cite></a>
          <a><cite>留言</cite></a>
           </span>
            </blockquote>
            <div class="message" >
                <textarea id="L_content" name="content" class="layui-textarea  message_editor " style=" height: 150px; "></textarea>
                <button class="layui-btn message_submit">提交留言</button>
            </div>
            <div class="message_list">
                <h2 class="mess_new">旧时光博客留言</h2>


                <div class="hidden_message_param" style="display: none"></div>
                <div class="hidden_message_text" style="display: none"></div>

                <div id="message_content">


                </div>


            </div>
        </div>

        <!--引入右边公用文件&ndash;&gt;
        <div class="layui-col-md4 blog_content_right">

            <div class="layui-col-md12 blog_index_carousel_right_my">


                <div class="aboutinfo-figure" style="margin-left: 90px">
                    <img src="/static/blog/images/face.jpg" alt="Absolutely">
                </div>
                <li style="text-align: center;"><i class="fa fa-location-arrow"></i>&nbsp;中国 - 郑州</li>
                <li style="text-align: center;font-size: 18px;margin-top: 20px;font-weight: 900">旧时光 / 琪哥</li>
                <!--   <li>职业 : 软件工程师</li> &ndash;&gt;
                <li style="color: #8B8682  ;text-align: center;margin-top: 5px;font-size: 15px;font-style:oblique">虽然过去不能改变，未来可以。</li>
            </div>
            <!-- <h2>我的名片</h2>
            <ul>
                <li>网名 : 旧时光 / 琪哥</li>
                <li>职业 : 软件工程师</li>
                <li>邮箱 : 1040657944@qq.com</li>
                <li>爱好 : 爬山、摄影、看书</li>
                <li>QQ交流群:773131858</li>
                <li>开源地址：<a href="https://gitee.com/zq1040657944/old_time_blog" target="_blank">请点击我</a></li>
            </ul> &ndash;&gt;


            <div class="layui-col-md12 blog_content_right_tag" >
                <h2>文章标签</h2>
                <a href="/tag/1" ><span  class="layui-badge  layui-bg-orange">Linux</span></a>
                <a href="/tag/2" ><span  class="layui-badge  layui-badge">svn</span></a>
                <a href="/tag/3" ><span  class="layui-badge  layui-bg-blue">tp5</span></a>
                <a href="/tag/4" ><span  class="layui-badge  layui-bg-black">sqlserver</span></a>
                <a href="/tag/5" ><span  class="layui-badge  layui-badge">快捷登录</span></a>
                <a href="/tag/6" ><span  class="layui-badge  layui-bg-orange">redis</span></a>
                <a href="/tag/7" ><span  class="layui-badge  layui-bg-black">php</span></a>
                <a href="/tag/8" ><span  class="layui-badge  layui-bg-blue">算法</span></a>
                <a href="/tag/9" ><span  class="layui-badge  layui-bg-orange">mysql</span></a>
            </div>
            <div class="layui-col-md12 blog_content_right_file" >
                <h2>文章归档</h2>
                <ol>
                    <li><a href="/date/2018-08" title="2018年-08月">2018年-08月</a></li>
                    <li><a href="/date/2018-07" title="2018年-07月">2018年-07月</a></li>
                    <li><a href="/date/2018-06" title="2018年-06月">2018年-06月</a></li>
                    <li><a href="/date/2018-05" title="2018年-05月">2018年-05月</a></li>
                    <li><a href="/date/2018-04" title="2018年-04月">2018年-04月</a></li>
                    <li><a href="/date/2018-04" title="2018年-04月">2018年-04月</a></li>
                    <li><a href="/date/2016-12" title="2016年-12月">2016年-12月</a></li>
                </ol>
            </div>
            <div class="layui-col-md12 blog_content_right_hot_article" >
                <h2>热门文章</h2>
                <ol>
                    <li><a href="/1.html">Linux搭建svn服务器</a></li>
                    <li><a href="/3.html">thinkphp5.0使用sqlserver数据库</a></li>
                    <li><a href="/5.html">网站改版上线啦！旧时光博客V3.0</a></li>
                    <li><a href="/6.html">糟糕的一天</a></li>
                    <li><a href="/7.html"><PHP 输出九九乘法表 for循环 递归>《正三角》《倒三角》</a></li>
                </ol>
            </div>
            <div class="layui-col-md12 blog_content_right_link" >
                <h2>友情链接</h2>
                <ol>
                    <li><a href="http://www.liuzhaoping.com" target="_blank">刘兆平博客</a></li>
                    <li><a href="https://mr-houzi.com" target="_blank">猴子星球</a></li>
                    <li><a href="https://www.dinphy.wang/" target="_blank">Dinphy - 简乐</a></li>
                    <li><a href="http://www.long225.cn" target="_blank">Long博客</a></li>
                    <li><a href="http://www.cnthink.net/" target="_blank">纪年组</a></li>
                    <li><a href="https://godbmw.com" target="_blank">董沅鑫个人网站</a></li>
                </ol>
            </div>
            <div class="layui-col-md12 blog_content_right_count" >
                <h2>网站统计</h2>
                <ul>
                    <li>建站日期 : 2018-04-03</li>
                    <li>文章总数 : 5 条</li>
                    <li>运行天数 : 162 天</li>
                    <li>标签总数 : 9 个</li>
                    <li>最后更新 : 2018-04-20</li>
                    <li></li>
                </ul>
            </div>

        </div>
    </div>
</div>


<div class="blog_mask  layui-hide"></div>

<!--引入底部文件&ndash;&gt;
<footer class="blog-footer">
    <ul>
        <li class="text-center">
            <b style="color: #ff69b4";>三更灯火五更鸡，正是男儿读书时，黑发不知勤学早，白发方悔读书迟。</b>
        </li>
        <li class="text-center">© 2016 - 2018 旧时光 & 版权所有 ICP证：京ICP备17046230号-2 联系邮箱：<a target="_blank" href="http://mail.qq.com/cgi-bin/qm_share?t=qm_mailme&email=Lh8eGh4YGxkXGhpuX18ATUFD" style="text-decoration:none;">1040657944@qq.com</a>
            <a href="admin/login.html" target="_blank">管理登录</a>
        </li>
    </ul>
</footer>
<script type="text/javascript" src="/static/common/layui/layui.js"></script>
<script src="/static/blog/js/base.js?=3.0.0" charset="utf-8"></script>





<script>
    layui.use(['flow','code','form'], function () {
        var flow = layui.flow
                ,form = layui.form
                ,$ = layui.jquery;
        layui.code();

        //流加载数据
        flow.load({
            elem: '#message_content' //流加载容器
            , scrollElem: '#message_content' //滚动条所在元素，一般不用填，此处只是演示需要。
            , isAuto: false
            , isLazyimg: true
            , done: function (page, next) { //加载下一页
                var lis = [];
                $.post("/message.html", {'page': page}, function (res) {
                    var data = res.data;
                    for (var i = 0; i < data.length; i++) {
                        var   html = '';
                        var style ='';
                        if(data[i].children.length!=0){
                            var children = data[i].children;
                            style = 'border-bottom: 1px solid #1AA195;';
                            for (var p = 0; p < children.length; p++) {
                                html += '<div class="layui-row message_children"> ' +
                                        '<div class="layui-col-xs2 layui-col-md1 message_children_left"> ' +
                                        '<img  class="" src="'+children[p].headurl+'" /></div> ' +
                                        '<div class="layui-col-xs10 layui-col-md11 message_children_right"> ' +
                                        '<div class="top"><span class="name">'+children[p].nickname+'</span> ' +
                                        '回复 <span class="name">'+children[p].reply_nickname+'</span> ' +
                                        '<span class="time">'+children[p].tran_time+'</span>' +
                                        '来自 <span data-id="'+data[i].id+'" class="os">'+children[p].os+'</span> 客户端</div> ' +
                                        '<div class="content">'+children[p].content+'</div> ' +
                                        '<div class="bottom"><span data-id="'+children[p].id+'" class="zan">赞  (<cite>'+children[p].zan_count+'</cite>)</span> ' +
                                        '<span data-user="'+children[p].id+'"   data-id="'+data[i].id+'"   class="replay">回复</span> <!--<span class="del">删除</span>&ndash;&gt;</div> </div> </div>';
                            }
                        }else{
                            html ='';
                            style='';
                        }
                        var innerHtml = '  <div class="messages" style="'+style+'">' +
                                '<div class="layui-row message_parent"> ' +
                                '<div class="layui-col-xs2 layui-col-md1 message_parent_left"> ' +
                                '<img  class="" src="'+data[i].headurl+'" /> </div> ' +
                                '<div class="layui-col-xs10 layui-col-md11 message_parent_right"> ' +
                                '<div class="top"><span class="name">'+data[i].nickname+' </span><span class="time">'+data[i].tran_time+'</span>' +
                                '来自 <span data-id="'+data[i].id+'" class="os">'+data[i].os+'</span> 客户端</div> ' +
                                '<div class="content">'+data[i].content+'</div>' +
                                '<div class="bottom"><span data-id="'+data[i].id+'" class="zan">赞  (<cite>'+data[i].zan_count+'</cite>)</span>' +
                                '<span  data-user="'+data[i].id+'"  data-id="'+data[i].id+'" class="replay">回复</span> ' +
                                '<!--<span class="del">删除</span>&ndash;&gt;</div> </div> </div> '+html+' </div>';
                        lis.push(innerHtml);
                    }
                    next(lis.join(''), page < res.pageCount); //假设总页数为 6
                });
            }
        });


        //留言点+赞
        $("body").on("click",".zan",function(){
            var _this = $(this);
            var message_id = _this.attr('data-id');
            var user_id =  $('.user_id').html();
            if("undefined" === typeof(user_id) ){
                layer.msg('请先登录',{
                    icon:2,
                    time:2000
                });
                return false;
            }
            //点赞评论跟留言
            $.post("/index/message/addzan.html",{message_id:message_id},function (res) {
                if(res.code==1){
                    layer.msg(res.msg,{
                        time:1000,
                        icon:1
                    },function () {
                        //处理业务
                        var  zan =   parseInt(_this.children('cite').text());
                        _this.children('cite').text(zan+1);
                    });
                }else {
                    layer.msg(res.msg,{
                        icon:2
                    });
                }

            });

            // layer.msg('该功能待开发');
        });


        //回复
        $("body").on("click",".replay",function(){
            var _this = $(this);
            var nickname =  $(this).parent('div.bottom').siblings().eq(0).children('span.name').eq(0).text();
            text = '@'+ nickname.replace(/\s/g, '')+' ';
            //@的人到输入框中
            $('.message_editor').val(text);
            $('.message_editor').focus();
            //输入框值改变
            $('.message_editor').change(function () {
                if($(this).val().length==0){
                    $('.hidden_message_param').text('');
                    $('.hidden_message_text').text('');
                }
            });
            //绑定需要的参数到隐藏div中
            var id =  _this.attr('data-id');
            var reply_id =  _this.attr('data-user');
            $('.hidden_message_param').text(id+','+ reply_id +','+ nickname);
            $('.hidden_message_text').text(text);
            //  $('html,body').animate({scrollTop:$('.message_editor').offset().top-240},100);
            // layer.msg('该功能待开发');
        });
    });
</script>
</body>
</html>-->