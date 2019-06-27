layui.config({
    base: '/static/front/js/'
}).use(['carousel', 'form','element','laypage','layedit','util','edit'], function() {
    var $ = layui.jquery,
        carousel = layui.carousel,
        form = layui.form,
        laypage = layui.laypage,
        layedit = layui.layedit,
        util = layui.util,
        element = layui.element, //导航的hover效果、二级菜单等功能，需要依赖element模块
        //comm = layui.comm;
        edit = layui.edit;



    //加载留言编辑器
    edit.layEditor({
        //elem: '.article_common_editor'
        elem:'.message_editor'
    });

//提交文章评论
    $('.article_common_submit').on('click',function () {
    //form.on('submit(comment)', function (data) {
        var user_id =  $('.user_id').html();
        //var content =  $.trim($('.article_common_editor').val());
        var content =  $.trim($('.message_editor').val());
        var param =  $('.hidden_message_param').text();
        var text =  $('.hidden_message_text').text();
        var author=$('#author').val();//评论者昵称
        var email=$('#email').val();//评论者邮箱

        var id = $('#article_detail_id').val();
        /*if("undefined" === typeof(user_id) ){
            layer.msg('请先登录',{
                icon:2,
                time:2000
            });
            return false;
        }*/
        if(author.length==0){
            layer.msg('必填项不能为空',{
                icon:2,
                time:2000
            });
            return false;
        }
        if(email.length==0 ){
            layer.msg('必填项不能为空',{
                icon:2,
                time:2000
            });
            return false;
        }
        if(content.length<=0 && text.length==0){
            layer.msg('评论不能为空',{
                icon:2,
                time:2000
            });
            return false;
        }

        var position = content.lastIndexOf(text);//查找最后一个出现的位置
        if(text.length!=0 && position==-1){
            layer.msg('留言不能为空',{
                icon:2,
                time:2000
            });
            return false;
        }

        author=edit.escape(author);
        email=edit.escape(email);
        content = edit.content(content);


        //提交
        var common_index = layer.msg('发表评论中，请稍候',{icon: 16,time:false,shade:0.8});
       // $.post('message/add',{content:content,article_id:id,param:param},function (res) {
        var param2={
            articleId:id,
            nickname:author,
            email:email,
            /*type:1,*/
            content:content,
            param:param
        }
        $.ajax({
            url: '/message/add',
            /*xhrFields: {
                withCredentials: !0
            },*/
            type: 'POST',
            dataType:'json',
            contentType:'application/json',
            data: JSON.stringify(param2),
            success: function (res) {
                 console.log(res);

                 if(res.code==1){
                     layer.close(common_index);
                     layer.msg(res.msg,{
                         time:1000,
                         icon:1
                     },function () {
                         window.location.reload();
                     })
                 }else{
                     layer.close(common_index);
                     layer.msg(res.msg,{
                         icon:2
                     });
                 }
            }
        })
        /*$.post('/message/add',{param:param},function (res) {
            if(res.code==1){
                alert(22222)
                //layer.close(common_index);
                /!*layer.msg(res.msg,{
                    time:1000,
                    icon:1
                },function () {
                    //window.location.reload();
                });*!/
            }else {
                alert(33333)
                //layer.close(common_index);
                /!*layer.msg(res.msg,{
                    icon:2
                });*!/
            }
        });*/
    });
})
