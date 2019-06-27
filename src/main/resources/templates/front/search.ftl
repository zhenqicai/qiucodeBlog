<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<#include "/layout/front/header.ftl"  />
<@header "秋码分享 | 一个游离于山间之上的Java爱好者","秋码;Java个人博客;Java爱好者;技术分享"/>
</head>
<body style="background-color: #ecf0f5;overflow-x:hidden">
<!--贼罩层和皮肤-->
<#--<div class="overflay"></div>-->
<#include "/layout/front/nav.ftl" />
<!-- 主体（一般只改变这里的内容） -->
<div id="main-body" class="layui-container" style="margin-top: 100px;">
    <!-- 这个一般才是真正的主体内容 -->
    <div class="layui-row layui-col-space15">
        <div>
            <a href="https://cloud.tencent.com/redirect.php?redirect=1032&cps_key=41adf8fde7f1607a1ac7f01c4ec4df25&from=console" target="_blank">
              <img src="/static/front/images/txyunAMD.jpg">
            </a>
        </div>
        <!--左边文章列表-->
        <div class="layui-col-md9" id="blog-main-left">
            <!-- 文章主体内容流加载 -->
        </div>
        <!--右边小栏目-->
        <#include "/layout/front/right.ftl" />
    </div>
<#--</div>-->
<!-- 底部 -->
<#include "/layout/front/footer.ftl" />

<!-- 本页脚本 -->
<script src="/static/front/js/search.js"></script>
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
<script>
    // 百度分享
    //window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"1","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"16"},"slide":{"type":"slide","bdImg":"6","bdPos":"right","bdTop":"250"}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)]

    layui.use(["jquery"], function () {
        var $ = layui.jquery;
        var util=layui.util;

        //固定右边侧边栏
        function sticky(){
            var listHeight = $(".layui-container>.layui-row>.layui-col-md9").outerHeight(true);
            var stickHeight = $(".layui-container #affix-side").parents(".layui-col-md3").outerHeight(true);
            return stickHeight < listHeight;
        }
        $(function(){
            $(".search-input").parent().parent().addClass("layui-this");
            $(".search-input").focus();
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
        })

    });
</script>

</body>
</html>