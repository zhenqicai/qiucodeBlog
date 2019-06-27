var _contextPath="/blog_v2.0";
layui.use(['element','layer','util','form'],function(){
    var $=layui.jquery;
    var layer=layui.layer;
    layui.util.fixbar({
        bar1:'&#xe641;',
        click:function(type){
            if(type==='bar1'){
                var sear=new RegExp('layui-hide');
                if(sear.test($('.blog-share').attr('class'))){
                    shareIn();
                }else{
                    shareOut();
                }
            }
        }
    });
    $("#loginOut").mouseover(function(){
        layer.tips('点击退出',this,{tips:3});
    });
    $('.child-nav span').click(function(){
        $(this).addClass('child-nav-btn-this').siblings().removeClass('child-nav-btn-this');
    });
    $('.blog-navicon').click(function(){
        var sear=new RegExp('layui-hide');
        if(sear.test($('.blog-nav-left').attr('class'))){
            leftIn();
        }else{
            leftOut();
        }
    });
    $('.blog-mask').click(function(){
        leftOut();
    });
    $('.blog-body,.blog-footer').click(function(){
        shareOut();
        categoryOut();
    });
    $('.category-toggle').click(function(e){
        e.stopPropagation();
        categroyIn();
    });
    $('.article-category').click(function(){
        categoryOut();
    });
    $('.article-category > a').click(function(e){
        e.stopPropagation();
    });
    function shareIn(){
        $('.blog-share').unbind('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend');
        $('.blog-share').removeClass('shareOut');
        $('.blog-share').addClass('shareIn');
        $('.blog-share').removeClass('layui-hide');
        $('.blog-share').addClass('layui-show');
    }
    function shareOut(){
        $('.blog-share').on('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend',function(){
            $('.blog-share').addClass('layui-hide');
        });
        $('.blog-share').removeClass('shareIn');
        $('.blog-share').addClass('shareOut');
        $('.blog-share').removeClass('layui-show');
    }
    function leftIn(){
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
    function leftOut(){
        $('.blog-mask').on('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend',function(){
            $('.blog-mask').addClass('layui-hide');
        });
        $('.blog-nav-left').on('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend',function(){
            $('.blog-nav-left').addClass('layui-hide');
        });
        $('.blog-mask').removeClass('maskIn');
        $('.blog-mask').addClass('maskOut');
        $('.blog-mask').removeClass('layui-show');
        $('.blog-nav-left').removeClass('leftIn');
        $('.blog-nav-left').addClass('leftOut');
        $('.blog-nav-left').removeClass('layui-show');
    }
    function categroyIn(){$('.category-toggle').addClass('layui-hide');$('.article-category').unbind('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend');$('.article-category').removeClass('categoryOut');$('.article-category').addClass('categoryIn');$('.article-category').addClass('layui-show');}
    function categoryOut(){$('.article-category').on('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend',function(){$('.article-category').removeClass('layui-show');$('.category-toggle').removeClass('layui-hide');});$('.article-category').removeClass('categoryIn');$('.article-category').addClass('categoryOut');}
    $(function(){});$(".user-out").click(function(){MyLocalStorage.remove("user");isUser();var url=window.location.href;if(url.indexOf("user.html")>=1){window.location.href=_contextPath+"/login.html"}});});window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdStyle":"0","bdSize":"32"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];var MyLocalStorage={put:function(key,stringVal,time){try{if(!localStorage){return false;}
    if(!time||isNaN(time)){time=60;}
    var cacheExpireDate=(new Date()-1)+time*1000;var cacheVal={val:stringVal,exp:cacheExpireDate};localStorage.setItem(key,JSON.stringify(cacheVal));}catch(e){}},get:function(key){try{if(!localStorage){return false;}
    var cacheVal=localStorage.getItem(key);var result=JSON.parse(cacheVal);var now=new Date()-1;if(!result){return null;}
    if(now>result.exp){this.remove(key);return "";}
    return result.val;}catch(e){this.remove(key);return null;}},remove:function(key){if(!localStorage){return false;}
    localStorage.removeItem(key);},clear:function(){if(!localStorage){return false;}
    localStorage.clear();}};function formatDate(str){var strs=str.split(" ");var ymd=strs[0].split("-");var hms=strs[1].split(":");return new Date(ymd[0],ymd[1]-1||0,ymd[2]||0,hms[0]||0,hms[1]||0,hms[2]||0);}
function classifyList(classifyId){$("#parentArticleList").empty();$("#parentArticleList").append("<div class=\"flow-default\" id=\"articleList\"></div>");layui.use('flow',function(){var flow=layui.flow;flow.load({elem:'#articleList',done:function(page,next){setTimeout(function(){$.post("/article/list",{page:page,pageSize:5,classify:classifyId},function(data){var lis=[];for(var i=0;i<data.data.length;i++){var content=delHtmlTag(data.data[i].content);if(content.length>=80){content=content.substring(0,86);}
    lis.push("<div class=\"article shadow animated zoomIn\">\n"+
        "                		<div class=\"article-left \">\n"+
        "                			<img src=\"/static/img/"+data.data[i].imageName+"\" alt=\""+data.data[i].title+"\"/>\n"+
        "                		</div>\n"+
        "                		<div class=\"article-right\">\n"+
        "                        	<div class=\"article-title\">\n");if(data.data[i].isTop==1){lis.push("<span class=\"article_is_top\">置顶</span>&nbsp;");}
    if(data.data[i].isOriginal==1){lis.push("<span class=\"article_is_yc\">原创</span>&nbsp;");}else{lis.push("<span class=\"article_is_zz\">转载</span>&nbsp;");}
    lis.push("                        		<a href=\"/foreground/detail/"+data.data[i].articleId+"\">"+data.data[i].title+"</a>\n"+
        "                        	</div>\n"+
        "                        	<div class=\"article-abstract\">\n"+
        "                          	"+content+"</div>\n"+
        "                        </div>\n"+
        "                        <div class=\"clear\"></div>\n"+
        "                        <div class=\"article-footer\">\n"+
        "	                        <span><i class=\"fa fa-clock-o\"></i>&nbsp;&nbsp;"+data.data[i].publishDate+"</span>\n"+
        "	                        <span class=\"article-author\"><i class=\"fa fa-user\"></i>&nbsp;&nbsp;' "+data.data[i].author+"</span>\n"+
        "	                        <span><i class=\"fa fa-tag\"></i>&nbsp;&nbsp;<a href=\"javascript:classifyList("+data.data[i].classify.classifyId+");\"> "+data.data[i].classify.classifyName+"</a></span>\n"+
        "	                        <span class=\"article-viewinfo\"><i class=\"fa fa-eye\"></i>&nbsp;"+data.data[i].click+"</span>\n"+
        "	                        <span class=\"article-viewinfo\"><i class=\"fa fa-commenting\"></i>&nbsp;"+data.data[i].commentNum+"</span>\n"+
        "                    	</div>\n"+
        "                	</div>");}
    next(lis.join(''),page<data.totalPage);});});}});});}
function delHtmlTag(str){return str.replace(/<[^>]+>/g,"");}