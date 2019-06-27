<!DOCTYPE html>
<html>
<head>
    <#--{include file="public/header" title="文章列表"  /}-->
<#include "/layout/admin/header.ftl"  />
<@header "文章列表"/>
</head>
<body class="childrenBody">
<blockquote class="layui-elem-quote article_index_nav">
    <div class="layui-inline">
        <div class="layui-input-inline">
            <input type="text" value="" placeholder="请输入文章查询" class="layui-input search_input">
        </div>
        <a class="layui-btn search_article_btn"><i class="layui-icon">&#xe615;</i> 查询</a>
    </div>
    <div class="layui-inline">
        <a class="layui-btn layui-btn-normal add_article_btn"><i class="layui-icon">&#xe654;</i> 新增</a>
    </div>
</blockquote>
<div class="layui-container article_index_content">
    <div class="">
        <table class="layui-hide" id="table_article" lay-filter="article" ></table>
    </div>
</div>
<#--{include file="public/footer"   /}-->
<#include "/layout/admin/footer.ftl"  />
<!--操作模板-->
<script type="text/html" id="article_tool_bar">
    <a class="layui-btn layui-btn-mini" lay-event="edit"><i class="layui-icon">&#xe642;</i> 编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="del"><i class="layui-icon">&#xe640;</i> 删除</a>
</script>

<script type="text/html" id="statusTpl">
    {{#  if(d.status === 0){ }}
    <span style="color: #F581B1;">{{ d.statusName }}</span>
    {{#  } else { }}
    {{ d.statusName }}
    {{#  } }}
</script>

<script type="text/javascript" >
    layui.use(['layer','jquery','laypage','table','form'],function(){
        var  layer = layui.layer,
                laypage = layui.laypage,
                form = layui.form,
                table = layui.table,
                $ = layui.jquery;
        //方法级渲染
        table.render({
            elem: '#table_article'
            //,url: "{:url('Article/index')}"
            ,url:"/admin/article/list"
            ,height:398
            ,cols: [[
                {checkbox: true, fixed: true}
                ,{field:'id', title: 'ID', width:117, sort: true}
                ,{field:'title', title: '标题', width:230}
            ]]
            ,page: true
            ,limits: [5,10,15,20,25,30]
            ,limit: 5 //默认采用10            ,height: 500
            ,id: 'table_article'
        });

        //监听工具条
        table.on('tool(article)', function(obj){
            var data = obj.data;
            if(obj.event === 'del'){
                layer.confirm('确定删除此文章？',{icon:3, title:'提示信息'},function(index){
                    var id = data.id;
                    $.post("{:url('Article/delete')}",{id:id},function(res){
                        if(res.code==1){
                            layer.msg(res.msg,{
                                time:1500,
                                icon:1
                            },function(){
                                obj.del();
                                // table.reload('table_admin');
                            });
                        }else{
                            layer.msg(res.msg,{
                                time:1500,
                                icon:2
                            });
                        }
                    });
                    layer.close(index);
                });
            } else if(obj.event === 'edit'){
                var url =   window.location.pathname;
                tmpHPage = url.split( "/" );
                tmpHPage.pop();
                url =  tmpHPage.join("/");
                var index = layer.open({
                    title : "修改文章信息",
                    type : 2,
                    content : url+"/edit?id="+data.id,
                    success : function(){
                        setTimeout(function(){
                            layer.tips('点击此处返回文章列表', '.layui-layer-setwin .layui-layer-close',{time:1500}, {
                                tips: 3
                            });
                        },500)
                    }
                });
                //改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
                $(window).resize(function(){
                    layer.full(index);
                });
                layer.full(index);
            }
        });


        //通过条件查询
        $(".search_article_btn").click(function(){
            var key = $(".search_input").val();
            var index = layer.msg('查询中，请稍候', {icon: 16, time: false, shade: 0.8});
            //  var url =  window.location.pathname;
            // window.location.href  =url+'?key='+key;
            table.reload('table_article', {
                where: {
                    key:key
                }
            });
            layer.close(index);
        });

        //新增文章
        $(".add_article_btn").click(function(){
            var index = layer.open({
                title : "添加文章",
                type : 2,
                content : "/admin/article/loadAdd",
                success : function(layero, index){
                    setTimeout(function(){
                        layer.tips('点击此处返回文章列表', '.layui-layer-setwin .layui-layer-close',{time:1500}, {
                            tips: 3
                        });
                    },500)
                }
            });
            //改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
            $(window).resize(function(){
                layui.layer.full(index);
            });
            layui.layer.full(index);
        });

    });


</script>
</body>
</html>