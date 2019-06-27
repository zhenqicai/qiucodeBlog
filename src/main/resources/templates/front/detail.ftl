<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <#include "/layout/front/header.ftl"  />
    <@header "${(article.title)!}","${(article.tags)!}"/>

    <link href="/static/front/css/detail.css" rel="stylesheet" />
    <link href="/static/front/share/css/share.min.css" rel="stylesheet" />

    <style>
        /*辅助*/
        .message_parent_right pre{padding: 5px 10px; margin:  5px 0; font-size: 12px; border-left: 3px solid #009688;
            background-color: #F8F8F8; font-family: Courier New; overflow: auto;}
        /* 简易编辑器 */
        .fly-edit{position:relative; display: block; top: 1px; left:0; padding:0 10px; border: 1px solid #e6e6e6;
            border-radius: 2px 2px 0 0; background-color: #FBFBFB;}
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

<#--<script>
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

<script>
    var _hmt = _hmt || [];
    (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?ac93934d9b847216e10a2f133187e535";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>-->


<!-- 主体（一般只改变这里的内容） -->
<div class="blog-body">
    <div class="blog-container">
        <blockquote class="layui-elem-quote sitemap shadow">
            <a href="/" title="网站首页">网站首页 > </a>
            <a><cite>${(article.title)!}</cite></a>
        </blockquote>
       <#-- <div>
            <a href="https://cloud.tencent.com/redirect.php?redirect=1025&cps_key=41adf8fde7f1607a1ac7f01c4ec4df25&from=console" target="_blank">
                <img src="/static/front/images/txyunNew.jpg">
            </a>
        </div>-->
        <#--<div class="blog-main">-->
        <!-- 这个一般才是真正的主体内容 -->
        <input id="shareTitle" type="hidden" value="${(article.title)!}" />
        <input id="shareImage" type="hidden" value="${(article.cover_image)!}" />
        <input id="shareDesc" type="hidden" value="${(article.remark)!}" />
        <div class="layui-row layui-col-space15">
            <div class="layui-col-md9 " >
                <div class="article-detail shadow animated zoomIn">


                    <#--<ol>-->
                        <#--<li class="row">
                            <div class="social-share" data-sites="weibo, qq, qzone"></div>
                        </li>
                        <li class="row">
                            <div class="share-component" data-disabled="wechat , facebook, twitter, google"></div>
                        </li>
                        <li class="row">
                            <div class="social-share"></div>
                        </li>
                        <li class="row">
                            <div class="social-share" data-initialized="true">
                                <a href="#" class="social-share-icon icon-weibo"></a>
                                <a href="#" class="social-share-icon icon-qq"></a>
                                <a href="#" class="social-share-icon icon-qzone"></a>
                            </div>
                        </li>
                        <li class="row">
                            <div class="social-share" data-mode="prepend">
                                <a href="javascript:" class="social-share-icon icon-heart"></a>
                            </div>
                        </li>
                        <li class="row">
                            <div id="share-1"></div>
                        </li>-->
                        <#--<li class="row">
                            <div id="share-2"></div>
                        </li>-->
                        <#--<li class="row">
                            <div id="share-3" data-sites="weibo, qq, qzone"></div>
                        </li>
                        <li class="row">
                            <div id="share-4" data-disabled="wechat , facebook, twitter, google"></div>
                        </li>-->
                    <#--</ol>-->

                    <script src="/static/front/share/js/social-share.js"></script>
                    <script src="/static/front/share/js/qrcode.js"></script>





                    <#--<div class="bdsharebuttonbox" data-tag="share_1">
                        <a class="bds_mshare" data-cmd="mshare"></a>
                        <a class="bds_qzone" data-cmd="qzone" href="#"></a>
                        <a class="bds_tsina" data-cmd="tsina"></a>
                        <a class="bds_baidu" data-cmd="baidu"></a>
                        <a class="bds_renren" data-cmd="renren"></a>
                        <a class="bds_tqq" data-cmd="tqq"></a>
                        <a class="bds_more" data-cmd="more">更多</a>
                        <a class="bds_count" data-cmd="count"></a>
                    </div>
                    <script>
                        window._bd_share_config = {
                            common : {
                                bdText : '自定义分享内容',
                                bdDesc : '自定义分享摘要',
                                bdUrl : '自定义分享url地址',
                                bdPic : '/static/front/images/wepay.png'
                            },
                            share : [{
                                "bdSize" : 16
                            }],
                            slide : [{
                                bdImg : 0,
                                bdPos : "right",
                                bdTop : 100
                            }],
                            image : [{
                                viewType : 'list',
                                viewPos : 'top',
                                viewColor : 'black',
                                viewSize : '16',
                                viewList : ['qzone','tsina','huaban','tqq','renren']
                            }],
                            selectShare : [{
                                "bdselectMiniList" : ['qzone','tqq','kaixin001','bdxc','tqf']
                            }]
                        }
                        with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?cdnversion='+~(-new Date()/36e5)];
                    </script>-->

                    <#--<div class="bdsharebuttonbox" data="{'desc':'目前支持自定义qq空间和人人网的摘要内容'}">
                        <a href="#" class="bds_sqq" data-cmd="sqq" title="分享到QQ好友"></a>
                        <a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
                        <a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
                        <a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
                        <a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a>
                    </div>
                    <script>
                        window._bd_share_config={
                            "common": {
                                "bdSnsKey":{},
                                "bdText":"电话分公司DVD发v好地方大V回复",
                                "bdUrl":"http://share.baidu.com/static/base/img/logo.gif?v=cfedaa8d.gif",
                                //"bdDesc" : '发动机GV看能否GV九年级发给吧那个妇女节对方不能加咖啡',
                                "bdMini":"2",
                                "bdMiniList":["qzone","tsina","weixin","tqq","tqf","sqq"],
                                "bdPic":"/static/front/images/wepay.png",
                                "bdStyle":"0",
                                "bdSize":"16"},
                            "share":{},
                            "image":{
                                "viewList":["sqq","weixin","qzone","tsina","tqq"],
                                "viewText":"分享到：",
                                "viewSize":"16"},
                            "selectShare":{
                                "bdContainerClass":null,
                                "bdSelectMiniList":["sqq","weixin","qzone","tsina","tqq"]}};
                        with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
-->
                    <div class="article-detail-title animated bounceInLeft">
                    ${(article.title)!}
                    </div>
                    <div class="article-detail-info">
                        <span style="color: blue">
                            <i class="fa fa-clock-o"></i>
                            <#--创建时间: ${(article.create_time?datetime('yyyy-MM-dd HH:mm:ss'))!}-->
                            创建时间: ${((article.create_time)?string('yyyy-MM-dd HH:mm:ss'))!}
                        </span>
                        <span style="color: blue">
                             <i class="fa fa-user"></i>
                            作者：${(article.author)!}
                        </span>
                        <span style="color: blue">
                             <i class="fa fa-eye"></i>
                            浏览量：${(article.brows_num)!}
                        </span>
                    </div>

                    <div class="row">
                        <div id="share-2">
                        </div>
                    </div>
                    <script>
                        var shareTitle=document.getElementById("shareTitle").value;
                        var shareImage=document.getElementById("shareImage").value;
                        var shareDesc=document.getElementById("shareDesc").value;
                        socialShare('#share-2', {sites: ['qzone', 'qq', 'weibo','wechat'],
                            image:shareImage,
                            description:shareDesc,
                            title:'${article.title}',
                            source:'秋码'});
                    </script>

                    <div class="article-detail-content"><#--${(article.content)!}-->
                        <div id="article-content">
                            <textarea id="append-test" style="display:none;">${(article.content)!}</textarea>
                        </div>
                    </div>


                        <#--<div style="position: relative;left: 753px;">
                            <div class="bdsharebuttonbox" data="{'desc':'目前支持自定义qq空间和人人网的摘要内容'}">
                                <a href="#" class="bds_sqq" data-cmd="sqq" title="分享到QQ好友"></a>
                                <a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
                                <a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
                                <a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
                                <a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a>
                            </div>
                        </div>-->


                </div>

                <!--广告区域-->
                <#--<div>
                    <a href="https://cloud.tencent.com/redirect.php?redirect=1009&cps_key=41adf8fde7f1607a1ac7f01c4ec4df25&from=console" target="_blank">
                        <img style="width:900px;" src="/static/front/images/txyunSSL.jpg">
                    </a>
                </div>-->
                <!-- 评论区域 -->
                <div class="blog-module shadow animated zoomIn" style="box-shadow: 0 1px 8px #a6a6a6;">
                    <#--<div class="layui-container">-->
                    <#--<div class="layui-row">
                        <div class="layui-col-md6">-->

                                <div class="layui-row text-center layui-mt20">
                                    <div id="rmb" class="layui-btn layui-btn-warm layui-hide layui-show-md-inline-block">
                                        <i class="fa fa-rmb"></i> 打赏
                                    </div>
                                    <#--<div class="layui-btn">
                                        <i class="fa fa-thumbs-o-up"></i> 赞 (2646)
                                    </div>-->
                                </div>

                                <#--<button type="button" class="layui-btn layui-btn-radius layui-btn-normal"
                                        id="satisfactoryClick" style="margin-left:75%;">
                                    <i class="fa fa-thumbs-o-up"></i> 赞一个(19)
                                </button>-->
                            <#--</div>
                            <div class="layui-col-md6">
                                <button type="button" class="layui-btn layui-btn-radius layui-btn-warm"
                                        id="dissatisfiedClick">
                                    <i class="fa fa-thumbs-o-down"></i> 呵呵(9)
                                </button>
                            </div>
                        </div>-->
                    <#--</div>-->
                    <fieldset class="layui-elem-field layui-field-title" style="margin-bottom:0">
                        <legend>不来几句?</legend>
                        <div class="layui-field-box" style="margin-top: 20px;">
                            <form class="layui-form">
                                <input type="hidden" id="coverImage" name="coverImage" value="http://111.230.226.158/uploadfile/20180606/005646-提莫.jpg">
                                <input type="hidden" id="article_detail_id" name="blogArticlesId" value="${(article.id)!}">
                                <input type="hidden" id="type" name="type" value="0">

                                    <div class="layui-row">
                                        <#--<div class="layui-form-item">
                                            <label for="coverImage" class="layui-form-label">
                                                头像:
                                            </label>

                                            <div class="layui-col-md1">
                                                <div class="layui-inline">
                                                    <div id="uploadImageDiv" style="margin-top: -10px;">
                                                        <img src="http://111.230.226.158/uploadfile/20180606/005646-提莫.jpg"  style="border-radius:30px;" width="60px" height="60px"
                                                             class="layui-upload-img layui-show">
                                                    </div>

                                                </div>
                                            </div>

                                            <div class="layui-col-md3">
                                                <label for="coverImage" class="layui-form-label" style="color: red;width: 120px;">
                                                    刷新页面更换头像
                                                </label>
                                            </div>
                                        </div>-->

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




                            <div class="article_common">
                                <textarea id="L_content" name="content" class="layui-textarea message_editor" style=" height: 150px; "></textarea>
                                <button class="layui-btn article_common_submit">提交评论</button>

                                <!--共用留言板样式-->
                                <div class="message_list">
                                    <h2 class="mess_new">文章评论</h2>

                                    <div class="hidden_message_param" style="display: none"></div>
                                    <div class="hidden_message_text" style="display: none"></div>

                                    <div id="message_content"></div>
                                </div>

                            </div>



                        </div>
                    </fieldset>
                    <#--<div class="blog-module-title">最新评论</div>-->
                    <#--<ul>
                        <li data-comment-code="vpHZi75Y"><div data-user-code="p5G0NRoS" class="layui-row layui-col-space10"><div class="layui-col-xs2 layui-col-sm1 ozq-head ozq-center"><img src="//q.qlogo.cn/qqapp/101429697/547E783C05CFE2A0F48334ADFB76E2A4/40" alt="Mr_Yofer"></div><div class="layui-col-xs10 layui-col-sm11"><p class="layui-elip"><span class="ozq-user-name">Mr_Yofer</span></p><p class="layui-text">sql一直运行失败!!1<br></p><p class="layui-elip"><a title="时间：2017-11-16 15:44:15"><i class="fa fa-clock-o"></i> 2017-11-16 15:44:15</a><a class="ozq-user-reply"><i class="fa fa-commenting"></i> 回复</a></p></div></div><div data-user-code="54cp88HF" class="layui-row ozq-comment-reply layui-col-space10"><div class="ozq-center layui-col-xs2 layui-col-sm1 ozq-head layui-col-xs-offset1"><img src="//q.qlogo.cn/qqapp/101429697/786E3FEC9E4153BDA5992A383B0F57EB/40" alt="じ辰╆紫天せ"></div><div class="layui-col-xs9 layui-col-sm10"><p class="layui-elip ozq-reply-title"><span class="ozq-user-name">じ辰╆紫天せ</span> 回复 <span class="ozq-user-name">Mr_Yofer</span></p><p class="layui-text">注意mysql（5.7+）版本</p><p class="layui-elip"><a title="时间：2017-11-16 16:47:30"><i class="fa fa-clock-o"></i> 2017-11-16 16:47:30</a><a class="ozq-user-reply"><i class="fa fa-commenting"></i> 回复</a></p></div></div></li>
                    </ul>-->
                    <!--/* 评论 */-->
                   <#-- <section class="layui-row ozq-message ozq-block" id="comment">
                        <div class="layui-row layui-form">
                            <!--/* 提示语 */&ndash;&gt;
                            <fieldset class="layui-elem-field layui-field-title"></fieldset>
                            <textarea class="layui-textarea layui-hide" id="ozq_message_editor"></textarea>
                            <section class="layui-row ozq-article-operation"></section>
                        </div>
                        <div class="layui-form ozq-comment">
                            <div id="ozq-common-page"></div>
                        </div>
                    </section>-->
                    <#--<ul class="blog-comment">

                        &nbsp;&nbsp;&nbsp;无人评论。。。


                    </ul>-->
                </div>
            </div>

            <!--右边小栏目-->
            <#include "/layout/front/right.ftl" />
        </div>
    </div>
</div>
<!-- 底部 -->
<#include "/layout/front/footer.ftl" />
<script src="/static/front/js/base.js"></script>
<script src="/static/front/js/blog.js"></script>

<script src="/static/editormd/js/jquery.min.js"></script>
<script src="/static/editormd/lib/marked.min.js"></script>
<script src="/static/editormd/lib/prettify.min.js"></script>
<script src="/static/editormd/lib/raphael.min.js"></script>
<script src="/static/editormd/lib/underscore.min.js"></script>
<script src="/static/editormd/lib/sequence-diagram.min.js"></script>
<script src="/static/editormd/lib/flowchart.min.js"></script>
<script src="/static/editormd/lib/jquery.flowchart.min.js"></script>
<script src="/static/editormd/editormd.js"></script>

<script>

    layui.use(['flow','code','form','layer'], function () {
        var flow = layui.flow
                ,form = layui.form
                ,layer=layui.layer
                ,$ = layui.jquery;
        layui.code();

        //示范一个公告层
        /*layer.open({
            type: 1
            ,title: false //不显示标题栏
            ,closeBtn: false
            ,area: '640px;'
                       // ,area:['640px', '290px']
            ,shade: 0.8
            ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
            ,btn: ['火速围观', '残忍拒绝']
            ,btnAlign: 'c'
            ,moveType: 1 //拖拽模式，0或者1
            ,content:'<img src="/static/front/images/2019tenxunyun.jpg"></img>'
            //,content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">你知道吗？亲！<br>layer ≠ layui<br><br>layer只是作为Layui的一个弹层模块，由于其用户基数较大，所以常常会有人以为layui是layerui<br><br>layer虽然已被 Layui 收编为内置的弹层模块，但仍然会作为一个独立组件全力维护、升级。<br><br>我们此后的征途是星辰大海 ^_^</div>'
            ,success: function(layero){
                var btn = layero.find('.layui-layer-btn');
                btn.find('.layui-layer-btn0').attr({
                    href: 'http://t.cn/EIRsvvr'
                    ,target: '_blank'
                });
            }
        });*/

        $("#rmb").click(function(){
            //var alipay = alipay === null || alipay === undefined || alipay === "" ? "/static/assets/img/noqrcode.jpg" : alipay;
            //var wechat = wechat === null || wechat === undefined || wechat === "" ? "/static/assets/img/noqrcode.jpg" : wechat;
            var alipay="/static/front/images/alipay.png";
            var wechat="/static/front/images/wepay.png";
            layer.open({
                type: 1,
                title: false,
                closeBtn: true,
                area: ['680px', '380px'],
                //shadeClose: true,
                skin: 'text-center',
                content:
                '<div class="layui-fluid">' +
                '   <div class="layui-row layui-mt20">' +
                '       <div class="layui-col-md6">' +
                '           <img src="' + wechat + '" >' +
                //'           <p class="text-center">微信</p>' +
                '       </div>' +
                '       <div class="layui-col-md6">' +
                '           <img src="' + alipay + '" >' +
                //'           <p class="text-center">支付宝</p>' +
                '       </div>' +
                '   </div> ' +
                '</div>'
            });
        })


        var article_id = $('#article_detail_id').val();


        //流加载数据
        flow.load({
                    elem: '#message_content' //流加载容器
                    , scrollElem: '#message_content' //滚动条所在元素，一般不用填，此处只是演示需要。
                    , isAuto: false
                    , isLazyimg: true
                    , done: function (page, next) { //加载下一页
                        var lis = [];
                        $.post("/message/list", {pageIndex: page,pageSize:10,articleId:article_id}, function (res) {
                            /*var param={pageIndex: page,articleId:article_id}
                            $.ajax({
                                url:'/message/list',
                                type: 'post',
                                //async: false,
                                dataType: "json",
                                data:param,
                                //traditional: true,
                                function (res){*/
                            /*var data = res.data;
                            for (var i = 0; i < data.length; i++) {
                                var html = '';
                                var style = '';
                                if (data[i].children.length != 0) {
                                    var children = data[i].children;
                                    style = 'border-bottom: 1px solid #1AA195;';
                                    for (var p = 0; p < children.length; p++) {
                                        html += '<div class="layui-row message_children"> ' +
                                                '<div class="layui-col-xs2 layui-col-md1 message_children_left"> ' +
                                                '<img  class="" src="' + children[p].headurl + '" /></div> ' +
                                                '<div class="layui-col-xs10 layui-col-md11 message_children_right"> ' +
                                                '<div class="top"><span class="name">' + children[p].nickname + '</span> ' +
                                                '回复 <span class="name">' + children[p].replyNickName + '</span> ' +
                                                '<span class="time">' + children[p].createAt + '</span>' +
                                                '来自 <span data-id="' + data[i].id + '" class="os">' + children[p].os + '</span> 客户端</div> ' +
                                                '<div class="content">' + children[p].content + '</div> ' +
                                                '<div class="bottom"> ' +
                                                '<span data-user="' + children[p].id + '"   data-id="' + data[i].id + '"   class="replay">回复</span> <!--<span class="del">删除</span>--></div> </div> </div>';
                                    }
                                } else {
                                    html = '';
                                    style = '';
                                }
                                var innerHtml = '  <div class="messages" style="' + style + '">' +
                                        '<div class="layui-row message_parent"> ' +
                                        '<div class="layui-col-xs2 layui-col-md1 message_parent_left"> ' +
                                        '<img  class="" src="' + data[i].headurl + '" /> </div> ' +
                                        '<div class="layui-col-xs10 layui-col-md11 message_parent_right"> ' +
                                        '<div class="top"><span class="name">' + data[i].nickname + ' </span><span class="time">' + data[i].createAt + '</span>' +
                                        '来自 <span data-id="' + data[i].id + '" class="os">' + data[i].os + '</span> 客户端</div> ' +
                                        '<div class="content">' + data[i].content + '</div>' +
                                        '<div class="bottom">' +
                                        '<span  data-user="' + data[i].id + '"  data-id="' + data[i].id + '" class="replay">回复</span> ' +
                                        '<!--<span class="del">删除</span>--></div> </div> </div> ' + html + ' </div>';
                                lis.push(innerHtml);
                            }
                            next(lis.join(''), page < res.pageCount);*/






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
                                                '<div class="bottom">' +
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
                            next(lis.join(''), page < res.pageCount); //假设总页数为 6
                            //}
                        });
                    }
                });


        //固定右边侧边栏
        function sticky(){
            var listHeight = $(".layui-container>.layui-row>.layui-col-md9").outerHeight(true);
            var stickHeight = $(".layui-container #affix-side").parents(".layui-col-md3").outerHeight(true);
            return stickHeight < listHeight;
        }

        $(function(){
            var testEditormdView = editormd.markdownToHTML("article-content", {
                htmlDecode      : "style,script,<iframe",  // you can filter tags decode
                emoji           : true,
                taskList        : true,
                tex             : true,  // 默认不解析
                flowChart       : true,  // 默认不解析
                sequenceDiagram : true,  // 默认不解析 // 默认不解析
            });
            var affix= new hcSticky("#affix-side", {
                stickTo: '#blog-body'
                , innerSticker: '#blogtag'
                , queries: {980: {disable: true}}
                , top: 75
                , onStart: function () {
                    if (!sticky()) {
                        affix.destroy();
                    }
                }
            })
            grid.getArticleMsg(20,1)
        })


        //赞
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

    /*var $;
    layui.use(['form','layer', 'upload'], function () {
        var form = layui.form;
        $ = layui.jquery;
        var layer = layui.layer;
        var upload = layui.upload;

        /!*$(function(){
            var testEditormdView = editormd.markdownToHTML("article-content", {
                htmlDecode      : "style,script,<iframe",  // you can filter tags decode
                emoji           : true,
                taskList        : true,
                tex             : true,  // 默认不解析
                flowChart       : true,  // 默认不解析
                sequenceDiagram : true,  // 默认不解析 // 默认不解析
            });
        })*!/

        // 监听提交
        form.on('submit(comment)', function (data) {
            console.log("请求数据", data);
            return;
            $.ajax({
                url: '/commentArticles/front/add',
                type: 'post',
                data: data.field,
                async: false, dataType: "json", traditional: true,
                success: function (msg) {
                    layer.msg("你的意见是站长不懈的动力, 感谢你的反馈! ");
                    //location.reload();
                }, error: function () {
                    var index = parent.layer.getFrameIndex(window.name);
                    parent.layer.close(index);
                    window.top.layer.msg('请求失败', {icon: 5,  area: ['120px', '80px'], anim: 2});
                }
            });
            return false;
        });

        form.render();

        // 文章点赞
        $("#satisfactoryClick").click(function () {
            $("#satisfactoryClick").fadeOut("slow");
            $("#dissatisfiedClick").fadeOut("slow");

            $.ajax({
                url: '/commentArticles/front/thumbs/55/1',
                type: 'get',
                async: false, dataType: "json", traditional: true,
                success: function (msg) {
                    layer.msg("少侠好眼力!");
                }, error: function () {
                    var index = parent.layer.getFrameIndex(window.name);
                    parent.layer.close(index);
                    window.top.layer.msg('请求失败', {icon: 5,  area: ['120px', '80px'], anim: 2});
                }
            });
        });
        // 文章差评
        $("#dissatisfiedClick").click(function () {
            $("#satisfactoryClick").fadeOut("slow");
            $("#dissatisfiedClick").fadeOut("slow");
            $.ajax({
                url: '/commentArticles/front/thumbs/55/0',
                type: 'get',
                async: false, dataType: "json", traditional: true,
                success: function (msg) {
                    layer.msg("你的意见是站长不懈的动力, 感谢你的反馈! ");
                }, error: function () {
                    var index = parent.layer.getFrameIndex(window.name);
                    parent.layer.close(index);
                    window.top.layer.msg('请求失败', {icon: 5,  area: ['120px', '80px'], anim: 2});
                }
            });
        });
    });
    // 评论点赞
    function satisfactoryCommentClick (commentId) {
        $.ajax({
            url: '/commentArticles/front/thumbs/commmet/'+commentId+'/1',
            type: 'get',
            async: false, dataType: "json", traditional: true,
            success: function (msg) {
                layer.msg("你的意见是站长不懈的动力, 感谢你的反馈! ");
                location.reload();
            }, error: function () {
                var index = parent.layer.getFrameIndex(window.name);
                parent.layer.close(index);
                window.top.layer.msg('请求失败', {icon: 5,  area: ['120px', '80px'], anim: 2});
            }
        });
    }
    // 评论差评
    function dissatisfiedCommentClick (commentId) {
        $.ajax({
            url: '/commentArticles/front/thumbs/commmet/'+commentId+'/0',
            type: 'get',
            async: false, dataType: "json", traditional: true,
            success: function (msg) {
                layer.msg("你的意见是站长不懈的动力, 感谢你的反馈! ");
                location.reload();
            }, error: function () {
                var index = parent.layer.getFrameIndex(window.name);
                parent.layer.close(index);
                window.top.layer.msg('请求失败', {icon: 5,  area: ['120px', '80px'], anim: 2});
            }
        });
    }*/
</script>
</body>
</html>