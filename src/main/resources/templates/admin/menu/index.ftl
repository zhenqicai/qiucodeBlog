<!DOCTYPE html>
<html lang="en">
<#--{include file="public/header" title="菜单列表"  /}-->
<#include "/layout/admin/header.ftl"  />
<@header "菜单列表"/>
<style>
    .layui-field-title {
        margin: 10px 10px;

    }
    .rule_top{ margin: 10px 15px; padding: 10px 15px;}


    body .layui-tree-skin-yellow .layui-tree-branch{color: #EDCA50;}


</style>

<body>

<blockquote class="layui-elem-quote rule_top">

    <div class="layui-inline">
        <a id="add_rule" class="layui-btn layui-btn-normal"><i class="layui-icon">&#xe654;</i> 新增根菜单</a>
    </div>
</blockquote>

<fieldset class="layui-elem-field layui-field-title" >
    <legend style="font-size: 14px;">菜单列表</legend>
</fieldset>

<div class="layui-container" style=" width: 100%; height: 780px;">

    <div class="layui-row">
        <div class="layui-col-md3" style="height: 760px; border-right: 2px solid #eee; margin: 5px 0">
            <ul id="demo" style="padding: 5px 10px;"></ul>
        </div>
        <div class="layui-col-md9" style="padding: 0 10px;">
            <table class="layui-table">
                <thead>
                <tr>
                    <th>菜单名称</th>
                    <th>菜单权限</th>
                    <th>排序</th>
                    <th>图标</th>
                    <th>状态</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody class="select_rule">
                </tbody>
            </table>
        </div>
    </div>
</div>
<#--{include file="public/footer"  /}-->
<#include "/layout/admin/footer.ftl"  />
<script>
    layui.use(['tree','form','layer'], function() {
        var $ = layui.jquery,
                layer = layui.layer,
                form = layui.form;
        var menuList=[];
        $.ajax({
            type:'get',
            url:'/menu/loadThirdMenu',
            dataType:'json',
            success:function(data){
                menuList=data;
                var html = "";
                layui.tree({
                    elem:'#demo',
                    skin:'yellow',
                    target:'_self',
                    click:function(item){

                        $('.select_rule').html('');
                        var statusName="";
                        if(item.status==1)
                            statusName="正常";
                        else
                            statusName="禁止";
                        html= '<tr><td>'+item.name+'</td> ' +
                                '<td>'+item.hrefName+'</td> '+
                                '<td>'+item.sort+'</td>' +
                                '<td>'+item.css+'</td> ' +
                                '<td>'+statusName+'</td> ' +
                                '<td> <a class="layui-btn layui-btn-mini add_child_rule"  data-id="'+item.id+'"><i class="layui-icon">&#xe654;</i>  添加子菜单</a> ' +
                                '<a class="layui-btn layui-btn-normal layui-btn-mini edit_rule" data-id="'+item.id+'"><i class="layui-icon">&#xe642;</i> 修改</a> ' +
                                '<a class="layui-btn layui-btn-danger layui-btn-mini del_rule" data-id="'+item.id+'"><i class="layui-icon">&#xe640;</i> 删除</a> ' +
                                '</td> ' +
                                '</tr>';
                        $('.select_rule').html(html);
                    },
                    nodes:menuList
                })
            }
        });

        //添加父菜单
        $('#add_rule').on('click',function () {
            layer.open({
                type: 2,
                //content: ["{:url('Rule/add',['pid'=>'0'])}"],
                content:["/menu/loadAdd?pid=0"],
                area: ['50%', '80%']
            });
        });
        //添加字菜单
        $("body").on("click",".add_child_rule",function(){
            var url =   window.location.pathname;
            tmpHPage = url.split( "/" );
            tmpHPage.pop();
            url =  tmpHPage.join("/");
            var _this = $(this);
            var id =  _this.attr("data-id");
            layer.open({
                type: 2,
                content:  url+"/loadAdd?pid="+id,
                area: ['50%', '80%']
            });
        })



        //修改菜单
        $("body").on("click",".edit_rule",function(){
            var url =   window.location.pathname;
            tmpHPage = url.split( "/" );
            tmpHPage.pop();
            url =  tmpHPage.join("/");
            var _this = $(this);
            var id =  _this.attr("data-id");
            layer.open({
                type: 2,
                content:  url+"/loadEdit?id="+id,
                area: ['50%', '80%']
            });
        });

        //修改菜单
        $("body").on("click",".del_rule",function(){
            var _this = $(this);
            var id =  _this.attr("data-id");
            layer.confirm('是否删除该菜单？', {
                icon:2,
                btn: ['确定','取消'] //按钮
            }, function(){
                $.post("/menu/delete",{'id':id},function (res) {
                    if(res.code==1){
                        layer.msg(res.msg,{
                            icon:1
                        },function () {
                            window.location.reload();

                        });
                    }else{
                        layer.msg(res.msg,{
                            icon:2
                        });
                    }
                })
            }, function(){
                layer.msg('您取消了',{
                    icon:1,
                    time:1000
                });
            });
        });


    });
</script>

</body>
</html>