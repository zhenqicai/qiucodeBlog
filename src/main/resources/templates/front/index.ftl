<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<#include "/layout/front/header.ftl"  />
<@header "秋码分享 | 一个游离于山间之上的Java爱好者","秋码;Java个人博客;Java爱好者;技术分享"/>
</head>
<body style="background-color: #ecf0f5;overflow-x:hidden">
<style>
</style>
<!--<script src="/static/front/js/snow/snowflakes.min.js"></script>
<script src="/static/front/js/snow/datouwang.js"></script>-->
<!--贼罩层和皮肤-->
<#--<div class="overflay"></div>-->
<#include "/layout/front/nav.ftl" />
<!-- 主体（一般只改变这里的内容） -->
<div id="main-body" class="layui-container" style="margin-top: 100px;">
    <!-- 这个一般才是真正的主体内容 -->
    <div class="layui-row layui-col-space15">
        <#--<div>
            <a href="https://cloud.tencent.com/redirect.php?redirect=1032&cps_key=41adf8fde7f1607a1ac7f01c4ec4df25&from=console" target="_blank">
              <img src="/static/front/images/txyunAMD.jpg">
            </a>
        </div>-->        
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
<script src="/static/front/js/blog.js"></script>
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

    layui.use(["jquery","layer"], function () {
        var $ = layui.jquery;
        var util=layui.util;


               //示范一个公告层
        // /layer.open({
            // /type: 1
                        // /,time:3000
                      // / ,scrollbar: false
           // / ,title: false //不显示标题栏
           // / ,closeBtn: true
           // / ,area:  ['490px', '287px']
           // / ,shade: 0.8
           // / ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
            //,btn: ['火速围观', '残忍拒绝']
            //,btnAlign: 'c'
           // / ,moveType: 1 //拖拽模式，0或者1
           // / ,content:'<img src="/static/front/images/pig-year.jpg"></img>'
            //,content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">你知道吗？亲！<br>layer ≠ layui<br><br>layer只是作为Layui的一个弹层模块，由于其用户基数较大，所以常常会有人以为layui是layerui<br><br>layer虽然已被 Layui 收编为内置的弹层模块，但仍然会作为一个独立组件全力维护、升级。<br><br>我们此后的征途是星辰大海 ^_^</div>'
            //,cancel: function(index){
                          //   alert("cancel---->")
                        // }
                        // / ,end: function(){
                            // alert("end------>")
                         // /  }
            // / ,success: function(layero){
                 
                //dynamicLoadJs('/static/front/js/snow/snowflakes.min.js',function(){});
                //dynamicLoadJs('/static/front/js/snow/datouwang.js',function(){});
                                         // / for(var i = 0 ; i < 200 ; i++){
                                       // /createSnow()
                                // / }             
             /*var btn = layero.find('.layui-layer-btn');
                btn.find('.layui-layer-btn0').attr({
                    href: 'https://promotion.aliyun.com/ntms/yunparter/invite.html?userCode=ml8w2cad'
                    ,target: '_blank'
                });*/
           // / }
        // /});


        //固定右边侧边栏
        function sticky(){
            var listHeight = $(".layui-container>.layui-row>.layui-col-md9").outerHeight(true);
            var stickHeight = $(".layui-container #affix-side").parents(".layui-col-md3").outerHeight(true);
            return stickHeight < listHeight;
        }
        $(function(){
            $(".fa-home").parent().parent().addClass("layui-this");
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