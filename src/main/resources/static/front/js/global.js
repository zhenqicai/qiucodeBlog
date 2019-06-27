layui.use(['element', 'layer','util', 'form'], function () {
    var $ = layui.jquery;
    var layer=layui.layer;
    var index;
    var $body = $("body");
    $(function(){
        //回到顶部
        utilshowhide()
        var p = 0;
        var t = 0;
        $(window).scroll(function() {
            utilshowhide()
            p = $(this).scrollTop();
            if(t <= p) {
                //console.log("下滑")
                $('.layui-header').addClass('slideUp')
            } else {
                //console.log("上滑")
                $('.layui-header').removeClass('slideUp')
            }
            t = p;
        })
        $('.layui-fixbar .layui-fixbar-top').click(function() {
            $("html,body").animate({
                scrollTop: 0
            }, 300);
        })

        function utilshowhide() {
            if($(document).scrollTop() > 260) {
                $('.layui-fixbar').show()
                $('.layui-header').removeClass('is_top_true')
                $('.layui-header').addClass('is_top_false')
            } else {
                $('.layui-fixbar').hide()
                $('.layui-header').removeClass('is_top_false')
                $('.layui-header').addClass('is_top_true')
            }
        }
    })

    /*layui.util.fixbar({
        bar1:'&#xe641;',
        click:function(type){
            if(type==='bar1'){
                var sear=new RegExp('layui-hide');
                if(sear.test($('.blog-share').attr('class'))){
                    //shareIn();
                }else{
                    //shareOut();
                }
            }
        }
    });*/
    $("#choose,#choosexs").click(function(){
        $(".skin,.overflay").slideToggle();
    });
    $(".overflay").click(function(){
        $(".skin,.overflay").toggle("slow");
    });
    //子栏目导航点击事件
    $('.child-nav span').click(function () {
        layer.msg('切换到相应栏目');
        $(this).addClass('child-nav-btn-this').siblings().removeClass('child-nav-btn-this');
    });

    //侧边导航开关点击事件
    $('.blog-navicon').click(function () {
        /*var sear = new RegExp('layui-hide');
        if (sear.test($('.blog-nav-left').attr('class'))) {
            leftIn();
        } else {
            leftOut();
        }*/



        var $sideNav = $(" .layui-nav-side");
        if ($sideNav.css("width") !== "0px") {
            $sideNav.animate({
                width: "0"
            }, 200);
        } else {
            $sideNav.animate({
                width: "200px"
            }, 200);
            layer.open({
                type: 1
                , title: false
                , shade: [0.6, 'rgba(0, 0, 0, .8)']
                , shadeClose: true
                , closeBtn: 0
            })

        }
    });
    //侧边导航遮罩点击事件
    $('.blog-mask').click(function () {
        leftOut();
    });


    //blog-body和blog-footer点击事件，用来关闭百度分享和类别导航
    $('.blog-body,.blog-footer').click(function () {
        //shareOut();
        categoryOut();
    });
    //类别导航开关点击事件
    $('.category-toggle').click(function (e) {
        e.stopPropagation();    //阻止事件冒泡
        categroyIn();
    });
    //类别导航点击事件，用来关闭类别导航
    $('.article-category').click(function () {
        categoryOut();
    });
    //具体类别点击事件
    $('.article-category > a').click(function (e) {
        e.stopPropagation(); //阻止事件冒泡
    });


    // 加载热文排行
    /*$.get('blogArticles/front/hotArticles' , function (res) {
        layui.each(res, function (index, item) {
            if (index <= 10) {
                var myview="<i class='fa fa-eye'></i>&nbsp;<a href='#' style='color: blue' title='阅读数'> " + item.browsNum+ "</a>"
                $("#blogsrank").append("<li><i class=\"iconfont icon-remen\" style='color: red;margin-left: -28px'></i><a class='animated lightSpeedIn hvr-bob' href=\"blogArticles/front/" + item.id + "\" target='_blank'>" + item.title + "</a>"+myview+"</li>");
            }
        });
    });*/
    //固定右边侧边栏
    /*function sticky(){
        var listHeight = $(".layui-container>.layui-row>.layui-col-md9").outerHeight(true);
        var stickHeight = $(".layui-container #affix-side").parents(".layui-col-md3").outerHeight(true);
        return stickHeight < listHeight;
    }*/

    //显示侧边导航
    function leftIn() {
        $('.blog-mask').unbind('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend');
        $('.blog-nav-left').unbind('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend');

        $('.blog-mask').removeClass('maskOut');
        $('.blog-mask').addClass('maskIn');
        $('.blog-mask').removeClass('layui-hide');
        $('.blog-mask').addClass('layui-show');

        $('.blog-nav-left').removeClass('leftOut');
        $('.blog-nav-left').addClass('leftIn');
        $('.blog-nav-left').removeClass('layui-hide');
        $('.blog-nav-left').addClass('layui-show');
    }
    //隐藏侧边导航
    function leftOut() {
        $('.blog-mask').on('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function () {
            $('.blog-mask').addClass('layui-hide');
        });
        $('.blog-nav-left').on('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function () {
            $('.blog-nav-left').addClass('layui-hide');
        });

        $('.blog-mask').removeClass('maskIn');
        $('.blog-mask').addClass('maskOut');
        $('.blog-mask').removeClass('layui-show');

        $('.blog-nav-left').removeClass('leftIn');
        $('.blog-nav-left').addClass('leftOut');
        $('.blog-nav-left').removeClass('layui-show');
    }
    //显示类别导航
    function categroyIn() {
        $('.category-toggle').addClass('layui-hide');
        $('.article-category').unbind('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend');

        $('.article-category').removeClass('categoryOut');
        $('.article-category').addClass('categoryIn');
        $('.article-category').addClass('layui-show');
    }
    //隐藏类别导航
    function categoryOut() {
        $('.article-category').on('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function () {
            $('.article-category').removeClass('layui-show');
            $('.category-toggle').removeClass('layui-hide');
        });

        $('.article-category').removeClass('categoryIn');
        $('.article-category').addClass('categoryOut');
    }

    //点击显示菜单
    $body.click(function () {
        var $sideNav = $(".layui-nav-side");
        if ($sideNav.css("width") !== "0px") {
            $sideNav.animate({
                width: "0"
            }, 200)
        }
    })
    /*$(function(){
        var affix= new hcSticky("#affix-side", {
            stickTo: '#main-body'
            , innerSticker: '#blogtag'
            , queries: {980: {disable: true}}
            , top: 75
            , onStart: function () {
                if (!sticky()) {
                    affix.destroy();
                }
            }
        })
    })*/

});

Date.prototype.format = function(fmt) {
    var o = {
        "M+" : this.getMonth()+1,                 //月份
        "d+" : this.getDate(),                    //日
        "h+" : this.getHours(),                   //小时
        "m+" : this.getMinutes(),                 //分
        "s+" : this.getSeconds(),                 //秒
        "q+" : Math.floor((this.getMonth()+3)/3), //季度
        "S"  : this.getMilliseconds()             //毫秒
    };
    if(/(y+)/.test(fmt)) {
        fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
    }
    for(var k in o) {
        if(new RegExp("("+ k +")").test(fmt)){
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
        }
    }
    return fmt;
}