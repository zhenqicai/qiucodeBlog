var $,tab,skyconsWeather,path;
layui.define(['bodyTab','comm','form','element','layer','jquery'],function(exports){
     var form = layui.form,
         layer = layui.layer,
         element = layui.element,
         comm = layui.comm,
         $ = layui.jquery,
         path = comm.getRoot();
        tab = layui.bodyTab({
            openTabNum : 50,  //最大可打开窗口数量
            url: "/menu/loadMenu"
            //http://localhost/qf/public/api.php/api/Index/getRuleList
           //url : "/admin/Api/getRuleList"    //获取菜单json地址

     });


        var base = {};
        base.init = function () {
            //更换皮肤
            var skin = window.sessionStorage.getItem("skin");
            if(skin){  //如果更换过皮肤
                if(window.sessionStorage.getItem("skinValue") != "自定义"){
                    $("body").addClass(window.sessionStorage.getItem("skin"));
                }else{
                    $(".layui-layout-admin .layui-header").css("background-color",skin.split(',')[0]);
                    $(".layui-bg-black").css("background-color",skin.split(',')[1]);
                    $(".hideMenu").css("background-color",skin.split(',')[2]);
                }
            }
            $(".changeSkin").click(function(){
                layer.open({
                    title : "更换皮肤",
                    area : ["310px","280px"],
                    type : "1",
                    content : '<div class="skins_box">'+
                    '<form class="layui-form">'+
                    '<div class="layui-form-item">'+
                    '<input type="radio" name="skin" value="默认" title="默认" lay-filter="default" checked="">'+
                    '<input type="radio" name="skin" value="橙色" title="橙色" lay-filter="orange">'+
                    '<input type="radio" name="skin" value="蓝色" title="蓝色" lay-filter="blue">'+
                    '<input type="radio" name="skin" value="自定义" title="自定义" lay-filter="custom">'+
                    '<div class="skinCustom">'+
                    '<input type="text" class="layui-input topColor" name="topSkin" placeholder="顶部颜色" />'+
                    '<input type="text" class="layui-input leftColor" name="leftSkin" placeholder="左侧颜色" />'+
                    '<input type="text" class="layui-input menuColor" name="btnSkin" placeholder="顶部菜单按钮" />'+
                    '</div>'+
                    '</div>'+
                    '<div class="layui-form-item skinBtn">'+
                    '<a href="javascript:;" class="layui-btn layui-btn-small layui-btn-normal" lay-submit="" lay-filter="changeSkin">确定更换</a>'+
                    '<a href="javascript:;" class="layui-btn layui-btn-small layui-btn-primary" lay-submit="" lay-filter="noChangeSkin">我再想想</a>'+
                    '</div>'+
                    '</form>'+
                    '</div>',
                    success : function(index, layero){
                        if(window.sessionStorage.getItem("skinValue")){
                            $(".skins_box input[value="+window.sessionStorage.getItem("skinValue")+"]").attr("checked","checked");
                        };
                        if($(".skins_box input[value=自定义]").attr("checked")){
                            $(".skinCustom").css("visibility","inherit");
                            $(".topColor").val(skin.split(',')[0]);
                            $(".leftColor").val(skin.split(',')[1]);
                            $(".menuColor").val(skin.split(',')[2]);
                        };
                        form.render();
                        $(".skins_box").removeClass("layui-hide");
                        $(".skins_box .layui-form-radio").on("click",function(){
                            var skinColor;
                            if($(this).find("span").text() == "橙色"){
                                skinColor = "orange";
                            }else if($(this).find("span").text() == "蓝色"){
                                skinColor = "blue";
                            }else if($(this).find("span").text() == "默认"){
                                skinColor = "";
                            }
                            if($(this).find("span").text() != "自定义"){
                                $("body").removeAttr("class").addClass("main_body "+skinColor+"");
                                $(".skinCustom").removeAttr("style");
                                $(".layui-bg-black,.hideMenu,.layui-layout-admin .layui-header").removeAttr("style");
                            }else{
                                $(".skinCustom").css("visibility","inherit");
                            }
                        })
                        var skinStr,skinColor;
                        $(".topColor").blur(function(){
                            $(".layui-layout-admin .layui-header").css("background-color",$(this).val());
                        })
                        $(".leftColor").blur(function(){
                            $(".layui-bg-black").css("background-color",$(this).val());
                        })
                        $(".menuColor").blur(function(){
                            $(".hideMenu").css("background-color",$(this).val());
                        })

                        form.on("submit(changeSkin)",function(data){
                            if(data.field.skin != "自定义"){
                                if(data.field.skin == "橙色"){
                                    skinColor = "orange";
                                }else if(data.field.skin == "蓝色"){
                                    skinColor = "blue";
                                }else if(data.field.skin == "默认"){
                                    skinColor = "";
                                }
                                window.sessionStorage.setItem("skin",skinColor);
                            }else{
                                skinStr = $(".topColor").val()+','+$(".leftColor").val()+','+$(".menuColor").val();
                                window.sessionStorage.setItem("skin",skinStr);
                            }
                            window.sessionStorage.setItem("skinValue",data.field.skin);
                            layer.closeAll("page");
                        });
                        form.on("submit(noChangeSkin)",function(){
                            $("body").removeAttr("class").addClass("main_body "+window.sessionStorage.getItem("skin")+"");
                            layer.closeAll("page");
                        });
                    },
                    cancel : function(){
                        $("body").removeAttr("class").addClass("main_body "+window.sessionStorage.getItem("skin")+"");
                    }
                })
            });


            //隐藏左侧导航
            $(".hideMenu").click(function(){
                $(".layui-layout-admin").toggleClass("showMenu");
                //渲染顶部窗口
                tab.tabMove();
            });


            //渲染左侧菜单
            tab.render();


            //手机设备的简单适配
            var treeMobile = $('.site-tree-mobile'), shadeMobile = $('.site-mobile-shade');


            treeMobile.on('click', function(){
                $('body').addClass('site-mobile');
            });
            shadeMobile.on('click', function(){
                $('body').removeClass('site-mobile');
            });


            // 添加新窗口
            $("body").on("click",".layui-nav .layui-nav-item a",function(){
                //如果不存在子级
                if($(this).siblings().length == 0){
                    addTab($(this));
                    $(this).parent("li").siblings().removeClass("layui-nav-itemed");
                    $('body').removeClass('site-mobile');  //移动端点击菜单关闭菜单层
                }
            });

            //关闭其他
            $(".closePageOther").on("click",function(){
                if($("#top_tabs li").length>2 && $("#top_tabs li.layui-this cite").text()!="后台首页"){
                    var menu = JSON.parse(window.sessionStorage.getItem("menu"));
                    $("#top_tabs li").each(function(){
                        if($(this).attr("lay-id") != '' && !$(this).hasClass("layui-this")){
                            element.tabDelete("bodyTab",$(this).attr("lay-id")).init();
                            //此处将当前窗口重新获取放入session，避免一个个删除来回循环造成的不必要工作量
                            for(var i=0;i<menu.length;i++){
                                if($("#top_tabs li.layui-this cite").text() == menu[i].title){
                                    menu.splice(0,menu.length,menu[i]);
                                    window.sessionStorage.setItem("menu",JSON.stringify(menu));
                                }
                            }
                        }
                    })
                }else if($("#top_tabs li.layui-this cite").text()=="后台首页" && $("#top_tabs li").length>1){
                    element.tabDelete("bodyTab",$("#top_tabs li:last").attr("lay-id")).init();
                    window.sessionStorage.removeItem("menu");
                    menu = [];
                    window.sessionStorage.removeItem("curmenu");
                }else{
                    layer.msg("没有可以关闭的窗口了@_@");
                }
                //渲染顶部窗口
                tab.tabMove();
            });

            //关闭全部
            $(".closePageAll").on("click",function(){
                if($("#top_tabs li").length > 1){
                    $("#top_tabs li").each(function(){
                        if($(this).attr("lay-id") != ''){
                            element.tabDelete("bodyTab",$(this).attr("lay-id")).init();
                            window.sessionStorage.removeItem("menu");
                            menu = [];
                            window.sessionStorage.removeItem("curmenu");
                        }
                    })
                }else{
                    layer.msg("没有可以关闭的窗口了@_@");
                }
                //渲染顶部窗口
                tab.tabMove();
            });


            
            //用户注销
            $('#admin_loginOut').click(function () {

                layer.confirm('确定注销登录吗？',{icon:3, title:'提示信息'},function(index){
                    $.post("/admin/Admin/loginOut",function(res){
                        if(res.code==1){
                            layer.msg(res.msg,{
                                time:1500,
                                icon:1
                            },function(){
                               window.location.reload();
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
               

            });




        };

        exports('base',base);
});







//打开新窗口
function addTab(_this){
    tab.tabAdd(_this);
}


