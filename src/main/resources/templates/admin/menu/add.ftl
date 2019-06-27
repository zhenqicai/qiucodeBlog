<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>添加菜单页面</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css"  media="all">
</head>
<style>
</style>
<body style="background-color: #fff;">
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 10px; ">
    <legend style="font-size: 14px;">添加菜单</legend>
</fieldset>

<div class="layui-field-box">
    <form method="post" class="layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">菜单名称</label>
            <div class="layui-input-block">
                <input  type="text" name="name" lay-verify="title"  autocomplete="off" placeholder="请输入菜单名称" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">菜单图标</label>
            <div class="layui-input-block">
                <input type="text" name="css"  autocomplete="off" class="layui-input" placeholder="请输入菜单图标">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">菜单权限</label>
            <div class="layui-input-block">
                <input type="text" name="hrefName" lay-verify="name" placeholder="例如 index/Index/index "  autocomplete="off" class="layui-input">
            </div>
        </div>

    <#--{notempty name="rule"}
    <div class="layui-form-item">
        <label class="layui-form-label">父类菜单</label>
        <div class="layui-input-block">
            <input type="text"  value="{$rule.id}" name="pid"   autocomplete="off" class="layui-input"  style="display: none" >
            <input type="text"  value="{$rule.title}"  autocomplete="off" class="layui-input"  readonly="readonly">
        </div>
    </div>
    {/notempty}-->
        <#if menu?? >
            <div class="layui-form-item">
                <label class="layui-form-label">父类菜单</label>
                <div class="layui-input-block">
                    <input type="text"  value="${menu.id}" name="pid"   autocomplete="off" class="layui-input"  style="display: none" >
                    <input type="text"  value="${menu.menu_name}"  autocomplete="off" class="layui-input"  readonly="readonly">
                </div>
            </div>
        </#if>


        <div class="layui-form-item">
            <label class="layui-form-label">菜单排序</label>
            <div class="layui-input-block">
                <input type="text" name="sort" value=""  placeholder="菜单排序"  autocomplete="off" class="layui-input">
            </div>
        </div>


        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">菜单说明</label>
            <div class="layui-input-block">
                <textarea name="remark" placeholder="请输入内容" class="layui-textarea"></textarea>
            </div>
        </div>

        <div class="layui-form-item" >
            <div class="layui-input-block">
                <button id ='submit' style=" margin-left: 30%;" class="layui-btn" lay-submit="" lay-filter="add_rule">新增</button>
            </div>
        </div>
    </form>
</div>


<#--{include file="public/footer"  /}-->
<#include "/layout/admin/footer.ftl"  />


<script>
    layui.use(['form', 'layer'], function(){
        var form = layui.form
                ,$ = layui.jquery
                ,layer = layui.layer;
        //自定义验证规则
        form.verify({
            title: function(value){
                if(value.length <= 0){
                    return '菜单名称不能为空';
                }
            }
            ,name:function(value){
                if(value.length <= 0){
                    return '菜单权限不能为空';
                }
            }
        });
        //监听提交
        form.on('submit(add_rule)', function(data){
            //调用新增菜单的方法
            add_rule($,data.field,layer);
            return false;
        });
    });


    /**
     * 新增菜单
     * @param $
     * @param data
     * @param layer
     */
    function  add_rule($,data,layer) {
        var index = layer.msg('新增菜单，请稍候',{icon: 16,time:false,shade:0.8});
        $.post("/menu/add",data,function (res) {
            if(res.code==1){
                layer.close(index);
                layer.msg(res.msg,{
                    time:2000,
                    icon:1
                },function () {
                    layer.closeAll('iframe');
                    parent.location.reload();
                });
            }else{
                layer.close(index);
                layer.msg(res.msg,{
                    time:2000,
                    icon:2
                });
            }
        });
    }
</script>


</body>
</html>