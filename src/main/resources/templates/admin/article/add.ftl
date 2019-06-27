<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>添加文章页面</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css"  media="all">
    <link href="/static/editormd/css/editormd.css" type="text/css"
          rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/static/admin/css/tagsinput/jquery.tagsinput.min.css">
    <#--<link href="/static/admin/css/jquery.tagit.css" rel="stylesheet">
    <link href="/static/admin/css/tagit.ui-zendesk.css" rel="stylesheet">-->
</head>

<body style="background-color: #fff;">
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend style="font-size: 14px;">新增文章</legend>
</fieldset>

<style>
    img{
        height: auto;
    }
</style>

<div class="layui-field-box">
    <form method="post" class="layui-form" action="#"  enctype="multipart/form-data">
        <!--表单令牌-->
        <#--{:token()}-->
        <div class="layui-form-item">
            <label class="layui-form-label">文章标题 *</label>
            <div class="layui-input-block">
                <input  type="text" name="title" lay-verify="title"  autocomplete="off" placeholder="请输入文章标题" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <#--<label class="layui-form-label">内容 *</label>-->
            <#--<div class="layui-input-block">-->

                <div id="article_editor">
                    <textarea id="my-editormd-markdown-doc" name="my-editormd-markdown-doc" style="display:none;"></textarea>
                    <!-- 用于后端获取md稳当内容，Java中：request.getParameter("my-editormd-html-code")。  -->
                    <textarea id="my-editormd-html-code" name="my-editormd-html-code" style="display:none;"></textarea>
                </div>
                <!-- <textarea   class="layui-textarea" name="content" lay-verify="content" id="LAY_article_editor"></textarea>-->
           <#-- </div>-->
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">文章说明 *</label>
            <div class="layui-input-block">
                <textarea name="remark" placeholder="文章说明" lay-verify="remark" class="layui-textarea"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">文章缩略图</label>
            <div class="layui-input-block">
                <input type="text" name="coverImage" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">文章类型 *</label>
            <div class="layui-input-block">
                <select name="typeid"  lay-filter="" lay-verify="typeid" >
                    <option value="0">请选择</option>
                <#--{volist name="article_type" id= "v"}-->
                <#list categorys as category>
                    <option value="${category.id}">${category.name}</option>
                <#--{/volist}-->
                </#list>
                </select>
            </div>
        </div>

        <div class="layui-form-item tags">
            <label class="layui-form-label">文章标签</label>
            <div class="layui-input-block">
                <input type="text" id="tagName" class="layui-input">
            </div>
        </div>

        <#--<div class="layui-form-item" pane="">
            <label class="layui-form-label">文章标签 *</label>
            <div class="layui-input-block">
                <input  type="hidden" name="tags"   id="fieldTags" autocomplete="off"  placeholder="请输入标签" class="layui-input">
                &lt;#&ndash;<input type="text" name="tags"  value="#(article.tags??)">&ndash;&gt;
                <ul id="tags" class="am-selected-text"></ul>
                &lt;#&ndash;{volist name="article_tag" id="v"}&ndash;&gt;
                &lt;#&ndash;<#list tags as tag>
                <input type="checkbox"  name="tags" title="${tag.name}"   lay-skin="primary" value="${tag.id}"  >
                </#list>&ndash;&gt;
                    &lt;#&ndash;{/volist}&ndash;&gt;
            </div>
        </div>-->

        <div class="layui-form-item" >
            <label class="layui-form-label">原创/转载 *</label>
            <div class="layui-input-block" >
                <input type="radio" name="is_reprint" lay-filter="is_reprint" value="1" title="原创" checked="">
                <input type="radio" name="is_reprint" lay-filter="is_reprint" value="2" title="转载">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">文章作者 *</label>
            <div class="layui-input-block">
                <input  type="text" name="author" lay-verify="author"  autocomplete="off" placeholder="请输入文章作者" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item" >
            <label class="layui-form-label">文章状态 *</label>
            <div class="layui-input-block" >
                <input type="radio" name="status" value="1" title="发出" checked="">
                <input type="radio" name="status" value="0" title="草稿">
            </div>
        </div>

        <div class="layui-form-item" style="text-align: center;">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="add_article" style="margin-top: 30px;">提交</button>
                <#--<button id ='submit' class="layui-btn" lay-submit="" lay-filter="add_article" style="margin-top: 30px;"></button>-->
            </div>
        </div>
    </form>
</div>

<#--{include file="public/footer"  /}-->
<#include "/layout/admin/footer.ftl"  />

<#--<script type="text/javascript" src="__PUBLIC__/static/common/edit/wang/wangEditor.js"></script>-->
<script type="text/javascript" charset="utf-8"
        src="/static/editormd/editormd.min.js"></script>
<#--<script type="text/javascript" src="#(ctx)/assets/admin/js/plugins/tagit/js/jquery-ui.min.js"></script>-->
<#--<script type="text/javascript" src="/static/admin/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/static/admin/js/tag-it.js"></script>-->

<script src="/static/admin/css/tagsinput/jquery.tagsinput.min.js"></script>

<script>

    layui.use(['form', 'layedit','upload','code'], function(){
        var form = layui.form
                ,$= layui.jquery
                ,layedit = layui.layedit
                ,layupload = layui.upload
                ,layer = layui.layer;
        layui.code();
        //自定义验证规则
        form.verify({
            typeid: function(value){
                if(value.length <= 0 || value==0){
                    return '请选择文章类型';
                }
            },
            title: function(value){
                if(value.length <4){
                    return '文章标题最少4个字吧';
                }
            },
            remark: function(value){
                if(value.length <= 0){
                    return '文章说明不为空';
                }
            },
            author: function(value){
                if(value.length <= 0){
                    return '文章作者不为空';
                }
            },
            content: function(value){
                if(value.length <10){
                    return '文章内容最少10个字吧';
                }
            }
        });

        //富文本编辑器  (WangEdit)
        /*var E = window.wangEditor;
        var editor = new E('#article_editor');

        //上传图片地址
        editor.customConfig.uploadImgServer = "{:url('Upload/uploadOneImage')}"; // 上传图片到服务器
        //上传文件名称
        editor.customConfig.uploadFileName = 'article_image';
        //上传图片
        editor.customConfig.uploadImgHooks = {

            success: function (xhr, editor, result) {
                // console.log(result);
                // 图片上传并返回结果，图片插入成功之后触发
                // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象，result 是服务器端返回的结果
            },
            fail: function (xhr, editor, result) {
                console.log('fail');
                // 图片上传并返回结果，但图片插入错误时触发
                // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象，result 是服务器端返回的结果
            },
            error: function (xhr, editor) {
                console.log(xhr);
                // 图片上传出错时触发
                // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象
            },
            timeout: function (xhr, editor) {
                // 图片上传超时时触发
                // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象
            },
            // 如果服务器端返回的不是 {errno:0, data: [...]} 这种格式，可使用该配置
            // （但是，服务器端返回的必须是一个 JSON 格式字符串！！！否则会报错）
            customInsert: function (insertImg, result, editor) {
                // 图片上传并返回结果，自定义插入图片的事件（而不是编辑器自动插入图片！！！）
                // insertImg 是插入图片的函数，editor 是编辑器对象，result 是服务器端返回的结果
                // 举例：假如上传图片成功后，服务器端返回的是 {url:'....'} 这种格式，即可这样插入图片：
                var url =  result.url;
                insertImg(url);
                // console.log(result);
                // result 必须是一个 JSON 格式字符串！！！否则报错
            }
        };
        editor.create();    // 或者 var editor = new E( document.getElementById('#editor') )
        //定义预览菜单
        var full =  '<div class="w-e-menu yulan" style="z-index:10001;" title="预览"><i class="layui-icon" style="font-weight: bold;">&#xe609;</i></div>';
        $('.w-e-toolbar').append(full);

        //显示预览
        $('.yulan').on('click',function () {
            layer.open({
                type: 1
                ,title: '预览'
                ,area: ['800px', '90%']
                ,scrollbar: true
                ,content: '<div class="detail-body w-e-text" style="border: 1px solid #eee; overflow-y: hidden; ">'+  editor.txt.html() +'</div>'
            });
        });*/


        //原创/转载  是否显示转载地址
        form.on('radio(is_reprint)', function(data){
            if(data.value==2){
                $('.reprint_url').css('display','block');
            }else{
                $('.reprint_url').css('display','none');
            }
        });

        //监听提交
        form.on('submit(add_article)', function(data){
            //获取编辑器的内容
            data.field.content =   editor.getHTML();//editor.txt.html();
            //var checkArr = [];
            /*var checkArr="";
            $("input[name='tags']").each(function () {
                if ($(this).get(0).checked) {
                    //checkArr.push($(this).val());
                    checkArr+=$(this).val()+",";
                }
            });
            if(checkArr.length == 0){
                layer.msg('请至少选择一个文章标签！',{
                    icon:2
                });
                return false;
            }
            data.field['tags'] = checkArr; */  //选择的用户管理组
            data.field.tags = $("input#tagName").val();
            add_article($,data.field);
            return false;
        });
    });

    var editor;
    $(function () {
        $('input#tagName').tagsInput({
            defaultText: "点我新增标签",
            width: "auto",
            height: "32px",
            minChars: 1,
            onChange: function (a, e) {
                var length = $("input#tagName").val().split(",").length;
                if (length > 4) {
                    layer.msg("最多只能4个！");
                    $("#tagName").removeTag(e)
                }
            }
        })
        editor = editormd("article_editor", { //注意1：这里的就是上面的DIV的id属性值
            width: "90%",
            height: 640,
            syncScrolling: "single",
            path: "/static/editormd/lib/", //注意2：你的路径
            saveHTMLToTextarea: true ,//注意3：这个配置，方便post提交表单

            imageUpload : true,
            imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
            imageUploadURL : "/admin/article/upload",
        });
    });

    //提交
    function  add_article ($,data) {
        var index = layer.msg('新增文章，请稍候',{icon: 16,time:false,shade:0.8});
        $.post("/admin/article/add",data,function (res) {
            if(res.code==1){
                layer.close(index);
                layer.msg(res.msg,{
                    icon:1,
                    time:2000
                },function () {
                    layer.closeAll('iframe');
                    window.parent.location.reload();
                });
            }else{
                layer.close(index);
                layer.msg(res.msg,{
                    icon:2
                });
            }
        })
    }
</script>
</body>
</html>