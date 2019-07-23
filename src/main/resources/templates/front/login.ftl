<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="shortcut icon" href="/static/favicon.ico">
    <title>秋码分享管理后台</title>
    <link rel="stylesheet" href="/static/admin/css/login.css">
    <link rel="stylesheet" href="/static/layui/css/layui.css"  media="all">
</head>


<style>
    .blog-login-bg {
        background-image: url("/static/admin/images/login.jpg");
    }
    .blog-login-box {
        width: 450px;
        height: 320px;
        margin: 10% auto;
        background-color: rgba(0, 0, 0, 0.5);
        border-radius: 10px;
        color: aliceblue;
    }

    .blog-login-box header {
        height: 39px;
        padding: 10px;
        border-bottom: 1px solid aliceblue;
    }

    .blog-login-box header h1 {
        text-align: center;
        font-size: 25px;
        line-height: 40px;
    }

    .blog-login-box .blog-login-main {
        height: 185px;
        padding: 30px 90px 0;
    }

    .blog-login-main .layui-form-item {
        position: relative;
    }

    .blog-login-main .layui-form-item .blog-login-icon {
        position: absolute;
        color: #cccccc;
        top: 10px;
        left: 10px;
    }

    .blog-login-main .layui-form-item input {
        padding-left: 34px;
    }

    .blog-login-box footer {
        height: 35px;
        padding: 10px 10px 0 10px;
    }

    .blog-login-box footer p {
        line-height: 35px;
        text-align: center;
    }

    .blog-pull-left {
        float: left !important;
    }

    .blog-pull-right {
        /*  float: right !important;*/
        text-align: center;
        margin-top: 20px;

    }

    .blog-clear {
        clear: both;
    }

    .blog-login-remember {
        line-height: 38px;
    }

    .blog-login-remember .layui-form-switch {
        margin-top: 0px;
    }

    .blog-login-code-box {
        position: relative;
        padding:10px;
    }
    .blog-login-code-box input{
        position: absolute;
        width: 100px;
    }
    .blog-login-code-box img{
        cursor: pointer;
        position: absolute;
        left: 115px;
        height: 38px;
    }
</style>

<body class="blog-login-bg">
<div class="blog-login-box">
    <header>
        <h1><a href="">秋码博客</a></h1>
    </header>
    <div class="blog-login-main">
        <form action="" class="layui-form" method="post">
            <input name="key" type="hidden" value="${key}"/>
            <div class="layui-form-item">
                <label class="blog-login-icon">
                    <i class="layui-icon"></i>
                </label>
                <input type="text" name="username" lay-verify="username" autocomplete="off" placeholder="这里输入登录名" class="layui-input">
            </div>
            <div class="layui-form-item">
                <label class="blog-login-icon">
                    <i class="layui-icon"></i>
                </label>
                <input type="password" name="password" lay-verify="password" autocomplete="off" placeholder="这里输入密码" class="layui-input">
            </div>
            <div class="layui-form-item">
                <div class="blog-pull-right">
                    <button class="layui-btn layui-btn-primary" lay-submit="" lay-filter="login">
                        <i class="layui-icon"></i> 登录
                    </button>
                </div>
                <div class="blog-clear"></div>
            </div>
        </form>
    </div>
</div>
<script src="/static/layui/layui.js" charset="utf-8"></script>
<script src="/static/admin/js/crypto-js.js" charset="utf-8"></script>
<script>
    var $,layer;
    layui.use(['layer', 'form'], function () {
        layer = layui.layer,
                $ = layui.jquery,
                form = layui.form;
        form.verify({
            username: function (value) {
                if (value === '')
                    return '请先输入用户名。<img src="__PUBLIC__/static/common/layui/images/face/4.gif" alt="[可怜]">';
            },
            password: function (value) {
                if (value === '')
                    return '请输入用户名密码。<img src="__PUBLIC__/static/common/layui/images/face/4.gif" alt="[可怜]">';
            }
        });
        var errorCount = 0;
        form.on('submit(login)', function (data) {
            debugger
            if (errorCount > 5) {
            }else{
                var key = CryptoJS.enc.Utf8.parse(data.field.key);
                var password = CryptoJS.enc.Utf8.parse(data.field.password);
                var encrypted = CryptoJS.AES.encrypt(password, key, {mode: CryptoJS.mode.ECB, padding: CryptoJS.pad.Pkcs7});
                var encryptedPwd = encrypted.toString();

                data.field.password=encryptedPwd;
                submit($,data.field);
            }
            return false;
        });
    });



    /**
     * 提交方法
     * @param $
     * @param params
     */
    function submit($,params)
    {
        debugger
        $.post("/login",params,function (res) {
            if (res.code ==1)
            {
                layer.msg(res.msg,{icon:1,time:1000},function (index) {
                    layer.close(index);
                    window.location.href = res.url;
                });
            }
            else
            {
                layer.msg(res.msg,{icon:2,time:2000});
            }
        });
    }
</script>

</body>

</html>




