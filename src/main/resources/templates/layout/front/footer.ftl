<!-- 底部 -->
<footer class="blog-footer">
    <p>
        <span>Copyright</span><span>&copy;</span><span>2018</span><#--<a
            href="/index.jsp">Graduation Project</a>--><span>Design By 秋码</span>
    </p>
    <p>
        <#--<a href="http://www.miibeian.gov.cn/" target="_blank">赣ICP备18001541号</a>-->
    </p>
</footer>
<ul class="layui-fixbar" style="display: block;">
    <li class="layui-icon layui-fixbar-top" lay-type="top" style="display: list-item;"></li>
</ul>
<!--侧边导航 手机尺寸-->
<#--dynamic-navigation-->
<#--<ul class="layui-nav layui-nav-tree layui-nav-side blog-nav-left layui-hide" lay-filter="nav" >
    <li class="layui-nav-item layui-this">
        <a href="/"><i class="layui-icon" style="font-size: 16px;"></i>&nbsp;&nbsp;博客主页</a>
    </li>
    <li class="layui-nav-item">
        <a href="/timeline"><i class="layui-icon" style="font-size: 16px;"></i>&nbsp;&nbsp;点点滴滴</a>
    </li>
    <li class="layui-nav-item">
        <a href="/message"><i class="layui-icon" style="font-size: 16px;"></i>&nbsp;&nbsp;给我留言</a>
    </li>
    <li class="layui-nav-item">
        <a href="/about"><i class="layui-icon" style="font-size: 16px;"></i>&nbsp;&nbsp;关于本站</a>
    </li>
&lt;#&ndash;<li class="layui-nav-item">
    <a href="/search" target="_blank"><i class="layui-icon" style="font-size: 16px;"></i>&nbsp;&nbsp;搜索</a>
</li>&ndash;&gt;
    <span class="layui-nav-bar"></span>
</ul>-->


<style>
    .layui-nav-side {
        z-index: 20181006;
        width: 0;
        /*padding-top: 12px;
        background: #eeeeee;*/
        margin-top: 65px;
        -webkit-border-radius: 0;
        -moz-border-radius: 0;
        border-radius: 0;
        -webkit-box-shadow: 0 1px 2px #afafaf;
        -moz-box-shadow: 0 1px 2px #afafaf;
        box-shadow: 0 1px 2px #afafaf;
    }
</style>

<ul class="layui-nav layui-nav-tree layui-nav-side" >
    <li class="layui-nav-item">
        <a href="/" class="layui-this"><i class="layui-icon" style="font-size: 16px;"></i> &nbsp;博客首页</a>
    </li>
    <li class="layui-nav-item">
        <a href="/timeline"><i class="layui-icon" style="font-size: 16px;" style="font-size: 16px;"></i>&nbsp;&nbsp;点点滴滴</a>
    </li>
    <li class="layui-nav-item">
        <a href="/message"><i class="layui-icon" style="font-size: 16px;"></i>&nbsp;&nbsp;给我留言</a>

    </li>
    <#--<li class="layui-nav-item">
        <a href="/search" class="">
        <i class="layui-icon"></i> 搜索</a>
    </li>-->
    <li class="layui-nav-item">
        <a href="/about"><i class="layui-icon" style="font-size: 16px;"></i>&nbsp;&nbsp;关于本站</a>
    </li>
    <span class="layui-nav-bar"></span>
</ul>




<!--侧边导航 手机尺寸-->
<#--<ul class="layui-nav layui-nav-tree layui-nav-side blog-nav-left layui-hide" lay-filter="nav" style="background-color: #00c0ef;">
    <li class="layui-nav-item layui-this" id="lay-nav-1">
        <a href="${ctx}">
            <i class="fa fa-home fa-fw"></i>&nbsp;博客首页
        </a>
    </li>
    <li class="layui-nav-item" id="lay-nav-3">
        <a href="${ctx}timeLine/front/loadListPage">
            <i class="fa fa-clock-o fa-fw"></i>&nbsp;时间线
        </a>
    </li>
    <li class="layui-nav-item" id="lay-nav-4">
        <a href="${ctx}photoAlbum/front/loadListPage">
            <i class="fa fa-photo fa-fw"></i>&nbsp;相册
        </a>
    </li>
    <li class="layui-nav-item" id="lay-nav-2">
        <a href="${ctx}commentArticles/front/leavingMessage">
            <i class="fa fa-comment fa-fw"></i>&nbsp;给我留言
        </a>
    </li>
    <li class="layui-nav-item" id="lay-nav-5">
        <a href="${ctx}commentArticles/front/changyan">
            <i class="fa fa-comments fa-fw"></i>&nbsp;畅言
        </a>
    </li>
    <li class="layui-nav-item" id="lay-nav-6">
        <a href="https://github.com/songshuiyang/blogsys-parent" target="_blank">
            <i class="fa fa-file-code-o fa-fw"></i>&nbsp;获取源码
        </a>
    </li>
</ul>-->
<!--遮罩-->
<#--<div class="blog-mask animated layui-hide"></div>-->

<!-- layui.js -->
<script src="/static/layui/layui.js"></script>
<script src="/static/front/js/hc-sticky.min.js"></script>
<!-- 全局脚本 -->
<script src="/static/front/js/global.js"></script>
<script src="/static/front/js/search.js"></script>
