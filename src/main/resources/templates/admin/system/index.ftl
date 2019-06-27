<!DOCTYPE html>
<html lang="en">
<head>
    <#--{include file="public/header" title="网站系统管理"  /}-->
<#include "/layout/admin/header.ftl"  />
<@header "网站系统管理"/>
</head>

<style>
    .layui-tab-item{position: relative;top: 0;}
</style>
<body>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend style="font-size: 16px;">网站设置</legend>
</fieldset>


<div class="layui-tab" style="margin: 0 5px;">
    <ul class="layui-tab-title">
        <li class="layui-this">网站设置</li>
        <li>基本设置</li>
        <li>SEO优化</li>
    </ul>

    <div class="layui-tab-content">
        <!-- 网站信息设置 -->
        <div class="layui-tab-item layui-show" style="margin-top: 10px">
            <form class="layui-form layui-form-pane" action="" method="post">
                <input type="" name="id" hidden="" value="{$site_Info.id}">
                <div class="layui-form-item">
                    <label class="layui-form-label">博客名称</label>
                    <div class="layui-input-block">
                        <input type="text" name="sys_name"  required  lay-verify="required" placeholder="请输入网站标题" autocomplete="off" class="layui-input" value="{$site_Info.sys_name}">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">备案号</label>
                    <div class="layui-input-block">
                        <input type="text" name="sys_icp"  required  lay-verify="required" placeholder="京ICP备00000000号-2" autocomplete="off" class="layui-input" value="{$site_Info.sys_icp}">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">底部版权</label>
                    <div class="layui-input-block">
                        <input type="text" name="sys_copy"  required  lay-verify="required" placeholder="© 2016 - 2018 旧时光" autocomplete="off" class="layui-input" value="{$site_Info.sys_copy}">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">统计代码</label>
                    <div class="layui-input-block">
                        <textarea name="sys_footer" required lay-verify="required" placeholder="统计代码" class="layui-textarea">{$site_Info.sys_footer}</textarea>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">励志文字</label>
                    <div class="layui-input-block">
                        <input type="text"  name="footer_text"  required  lay-verify="required" placeholder="请输入励志文字" autocomplete="off" class="layui-input" value="{$site_Info.footer_text}">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <?php if(!empty($site_Info['id'])){?>
                        <button class="layui-btn submit" lay-submit="" date-url="{:url('System/edit_system')}" lay-filter="system_base_add">立即提交</button>
                        <?php }else{?>
                        <button class="layui-btn submit" lay-submit="" date-url="{:url('System/add_system')}" lay-filter="system_base_add">立即提交</button>
                        <?php }?>
                    </div>
                </div>
            </form>

        </div>
        <!-- 网站基本设置 -->
        <div class="layui-tab-item">
            <form class="layui-form" action="" style="margin-top: 20px;">
                <div class="layui-inline">
                    <label class="layui-form-label">建站日期</label>
                    <div class="layui-input-inline">
                        <input type="text" name="create_date" id="create_date" {if condition="!empty($base_system)"} value="{$base_system.create_date}" {/if}  lay-verify="date" placeholder="yyyy-MM-dd"  autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item" style="margin-top: 15px;">
                    <label class="layui-form-label">文章总数</label>
                    <div class="layui-input-block">
                        <input type="text" name="article_count" {if condition="!empty($base_system)"} value="{$base_system.article_count}" {/if}  lay-verify="article_count"  autocomplete="off" placeholder="请输入文章总数" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item" style="margin-top: 15px;">
                    <label class="layui-form-label">标签总数</label>
                    <div class="layui-input-block">
                        <input type="text" name="tag_count"  {if condition="!empty($base_system)"} value="{$base_system.tag_count}" {/if}  lay-verify="tag_count" autocomplete="off" placeholder="请输入标签总数" class="layui-input" >
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">最后更新</label>
                    <div class="layui-input-inline">
                        <input type="text" name="last_update" {if condition="!empty($base_system)"} value="{$base_system.last_update}" {/if} id="last_update" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item" style="margin-top: 20px;">
                    <div class="layui-input-block">
                        <button class="layui-btn submit" lay-submit="" date-url="{:url('System/add_base')}" lay-filter="system_base_add">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
        <!-- SEO网站优化 -->
        <div class="layui-tab-item">
            <form class="layui-form" action="" style="margin-top: 20px;">
                <input type="" name="id" hidden="" value="{$seo.id}">
                <div class="layui-form-item">
                    <label class="layui-form-label">网站标题</label>
                    <div class="layui-input-block">
                        <input type="text" name="title"  required  lay-verify="required" placeholder="请输入网站标题,一般不超过80个字符" autocomplete="off" class="layui-input" value="{$seo.title}">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">网站关键字</label>
                    <div class="layui-input-block">
                        <input type="text" name="keywords"  required  lay-verify="required" placeholder="多个关键字请用逗号隔开,一般不超过100个字符" autocomplete="off" class="layui-input" value="{$seo.keywords}">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">网站介绍</label>
                    <div class="layui-input-block">
                        <textarea name="description" required lay-verify="required" placeholder="网站介绍一般不超过200个字符" class="layui-textarea">{$seo.description}</textarea>
                    </div>
                </div>
                <div class="layui-form-item" style="margin-top: 20px;">
                    <div class="layui-input-block">
                        <#--<?php if(!empty($seo['id'])){?>
                        <button class="layui-btn submit" lay-submit="" date-url="{:url('System/edit_system')}" lay-filter="system_base_add">立即提交</button>
                        <?php }else{?>
                        <button class="layui-btn submit" lay-submit="" date-url="{:url('System/add_seo')}" lay-filter="system_base_add">立即提交</button>
                        <?php }?>-->
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<#--{include file="public/footer"  /}-->
<#include "/layout/admin/footer.ftl"  />

</body>

<script>
    layui.use(['form', 'layedit', 'laydate','element'], function(){
        var form = layui.form
                ,layer = layui.layer
                ,layedit = layui.layedit
                ,element = layui.element
                ,laydate = layui.laydate;
        //日期
        laydate.render({
            elem: '#create_date'
        });
        laydate.render({
            elem: '#last_update'
        });
        //自定义验证规则
        form.verify({
            article_count: function(value){
                if(value.length <= 0){
                    return '文章总数不能为空';
                }
            },
            tag_count: function(value){
                if(value.length <= 0){
                    return '标签总数不能为空';
                }
            },
        });
        //监听提交
        form.on('submit(system_base_add)', function(data){
            $url = $(this).attr('date-url');
            var index = layer.msg('新增网站配置，请稍候',{icon: 16,time:false,shade:0.8});
            $.post($url,data.field,function (res) {
                if(res.code==1){
                    layer.close(index);
                    layer.msg(res.msg,{
                        time:1000,
                        icon:1
                    },function () {
                        window.location.reload();
                    });
                }else{
                    layer.close(index);
                    layer.msg(res.msg,{
                        icon:2
                    });
                }
            });

            return false;
        });

    });
</script>
</html>
