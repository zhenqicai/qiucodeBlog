<!DOCTYPE html>
<html>
<#--{include file="public/header" title="旧时光博客管理系统"  /}-->
<#include "/layout/admin/header.ftl"  />
<@header "秋叶博客管理系统"/>
<link rel="stylesheet" href="//at.alicdn.com/t/font_tnyc012u2rlwstt9.css" media="all" />
<body class="main_body">
<!--存储当前登录用户的ID-->
<#--<input style="display: none;" value="{$Think.session.qf_admin.id}" id="qf_admin_id" />-->
<div class="layui-layout layui-layout-admin">
    <!--加载中间部分网页内容-->
    <#--{include file="public/top"  /}-->
<#include "/layout/admin/top.ftl" />
</div>
<!--加载底部-->
<#--{include file="public/footer"  /}-->

<#include "/layout/admin/footer.ftl" />
<script type="text/javascript">
    layui.config({
        base: '/static/admin/js/'
    }).use(['base'],function(){
        var base =  layui.base,
                $ =layui.jquery;
        base.init();
    });
</script>
</body>
</html>


