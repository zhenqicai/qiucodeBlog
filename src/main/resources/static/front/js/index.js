layui.use(['jquery','carousel','flow','layer'],function(){
    var $=layui.jquery;
    var flow=layui.flow;
    var layer=layui.layer;
    var width=width||window.innerWeight||document.documentElement.clientWidth||document.body.clientWidth;width=width>1200?1170:(width>992?962:width);
    var carousel=layui.carousel;
    carousel.render({
        elem:'#carousel',
        width:width+'px',
        height:'360px',
        indicator:'inside',
        arrow:'always',
        anim:'default'
    });
    $(".home-tips-container span").click(function(){
        layer.msg($(this).text(),
            {time:20000,btn:['明白了']});
    });
    $(".recent-list .hotusers-list-item").mouseover(function(){
        var name=$(this).children(".remark-user-avator").attr("data-name");
        var str="【"+name+"】的评论";
        layer.tips(str,this,{tips:[2,'#666666']});
    });
    $("#QQjl").mouseover(function(){
        layer.tips('QQ交流',this,{tips:1});
    });
    $("#gwxx").mouseover(function(){
        layer.tips('给我写信',this,{tips:1});
    });
    $("#xlwb").mouseover(function(){
        layer.tips('新浪微博',this,{tips:1});
    });
    $("#htgl").mouseover(function(){
        layer.tips('后台管理',this,{tips:1});
    });
    $(function(){
        $(".fa-home").parent().parent().addClass("layui-this");playAnnouncement(5000);
    });
    function playAnnouncement(interval){
        var index=0;
        var $announcement=$('.home-tips-container>span');
        setInterval(function(){
            index++;
            if(index>=$announcement.length){
                index=0;
            }
            $announcement.eq(index).stop(true,true).fadeIn().siblings('span').fadeOut();
        },interval);
    }
    function delHtmlTag(str){
        return str.replace(/<[^>]+>/g,"");
    }
    flow.load({
        elem:'#parentArticleList',
        done:function(page,next){
            setTimeout(function(){
                $.post("/article/list",{page:page,pageSize:10},function(data){
                    var lis=[];
                    for(var i=0;i<data.data.length;i++){
                        var content=delHtmlTag(data.data[i].content);
                        if(content.length>=80){
                            content=content.substring(0,86);
                        }
                    lis.push("<div class=\"article shadow animated zoomIn\">\n"+
                                "<div class=\"article-left \">\n"+
                                   "<img src=\"/static/img/"+data.data[i].imageName+"\" alt=\""+data.data[i].title+"\"/>\n"+
                                "</div>\n"+
                                "<div class=\"article-right\">\n"+
                                   "<div class=\"article-title\">\n");
                    if(data.data[i].isTop==1){
                        lis.push("<span class=\"article_is_top\">置顶</span>&nbsp;");
                    }
                   if(data.data[i].isOriginal==1){
                        lis.push("<span class=\"article_is_yc\">原创</span>&nbsp;");
                    }else{
                       lis.push("<span class=\"article_is_zz\">转载</span>&nbsp;");
                   }
                       lis.push("<a href=\"/foreground/detail/"+data.data[i].articleId+"\">"+data.data[i].title+"</a>\n"+
                                "</div>\n"+
                                "<div class=\"article-abstract\">\n"+
                               ""+content+"</div>\n"+
                               "</div>\n"+
            "<div class=\"clear\"></div>\n"+
            "<div class=\"article-footer\">\n"+
            " <span><i class=\"fa fa-clock-o\"></i>&nbsp;&nbsp;"+data.data[i].publishDate+"</span>\n"+
            "<span class=\"article-author\"><i class=\"fa fa-user\"></i>&nbsp;&nbsp;' "+data.data[i].author+"</span>\n"+
            "<span><i class=\"fa fa-tag\"></i>&nbsp;&nbsp;<a href=\"javascript:classifyList("+data.data[i].classify.classifyId+");\"> "+data.data[i].classify.classifyName+"</a></span>\n"+
            "<span class=\"article-viewinfo\"><i class=\"fa fa-eye\"></i>&nbsp;"+data.data[i].click+"</span>\n"+
            "<span class=\"article-viewinfo\"><i class=\"fa fa-commenting\"></i>&nbsp;"+data.data[i].commentNum+"</span>\n"+
            " </div>\n"+
            " </div>");}
        next(lis.join(''),page<data.totalPage);});});}});});