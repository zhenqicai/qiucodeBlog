layui.config({
    base: '/static/front/js/'
}).use(['element', 'layer', 'util', 'form','carousel','flow','edit'], function () {
    var carousel = layui.carousel;
    var layer = layui.layer;
    var $ = layui.jquery;
    var flow = layui.flow;
    var edit = layui.edit;
    var count=0;

    // 轮播图
    carousel.render({
        elem: '#carousel'
        ,width: '100%' //设置容器宽度
        ,arrow: 'always' //始终显示箭头
        //,anim: 'updown' //切换动画方式
    });

    var grid={
        /**
         * 加载文章数据
         * @param type  0:不带参数 1:文章分类 2: 文章标签
         * @param value 参数值
         * @param limit 页数
         * @param pageNumber 第几页
         */
        getBlog:function(isSearch,limit,pageNumber){
            $("#blog-main-left").empty();
            flow.load({
                elem: '#blog-main-left', //指定列表容器
                isAuto: true,
                end: "<div><a href='https://cloud.tencent.com/redirect.php?redirect=1011&cps_key=41adf8fde7f1607a1ac7f01c4ec4df25&from=console' target='_blank'><img src='/static/front/images/txyunMysql.png'></a></div><a href='#'>别滑了,木有了<i class='layui-icon' style='font-size:15px;'>&#xe60c;</i></a>",
                done: function (page, next) { //到达临界点（默认滚动触发），触发下一页
                    setTimeout(function () {
                        //以jQuery的Ajax请求为例，请求下一页数据（注意：page是从2开始返回）
                        var url="/search?keyWord="+isSearch+"&pageSize="+limit+"&pageIndex="+page;

                        $.get(url, function (res) {
                            //假设你的列表返回在data集合中
                            //console.log(res);
                            var lis = [];
                            var blog = "";
                            var pageCount = res.pageCount // 总页数
                            var pageNum = res.pageNum     // 当前页数
                            //console.log("当前页数："+pageNum+"|总页数："+pageCount);
                            layui.each(res.data, function (index, item) {
                                if (index == 0) {
                                    count = res.count;
                                }

                                var tagList = "";       // 文章标签list
                                var articlesType = "";  // 文章分类
                                var isnew="";//文章是否新发布
                                var istop="";//文章是否置顶
                                var ishot="";//文章热度
                                var isRecommend="";//文章是否推荐
                                if (item.count != 0) {
                                    // 筛选标签
                                    /*layui.each(item.blogTagList, function (index, tagItem) {
                                        tagList = tagList + tagItem.name + " "
                                    });*/
                                    var tagArr = item.tags.split(",");
                                    layui.each(tagArr,function(index,tagItem){
                                        tagList=tagList+tagItem+" "
                                    })
                                    if(item.isNew=="new"){
                                        //isnew='<div class="new-icon"><img  src="/static/front/images/new.png" ></div>';
                                        isnew='<span class="discount tag-new">NEW</span>';
                                    }
                                    if(item.isTop==1){
                                        istop='<span class="layui-badge article-bg-black">置顶</span>&nbsp;';
                                    }
                                    if(item.browsNum>=500){
                                        ishot='<img src="/static/front/images/hot.gif">';
                                    }
                                    if(item.isRecommend==1){
                                        isRecommend='<div style="position:absolute;/*top: -5px;*/right: 40px;"><img src="/static/front/images/true-4.png" ></div>';
                                    }
                                    // 筛选文章类型

                                    if(item.isReprint==1){
                                        articlesType='<span class="layui-badge article-green">原创</span>';
                                    }
                                    if(item.isReprint==2){
                                        articlesType='<span class="layui-badge article-gray">转载</span>';
                                    }
                                    // 博客内容div
                                    blog ='<div class="article shadow animated zoomIn">'+
                                             '<div class="article-left animated rotateInDownLeft">'+
                                               '<img src="'+item.coverImage+'" alt="'+item.title+'">'+
                                                '<span class="cat"><a href="https://www.zhyd.me/type/2">'+item.category+'</a></span>'+
                                            '</div>'+
                                             '<div class="article-right animated bounceInLeft">'+
                                               '<div class="article-title">'+
                                                   istop+
                                                   articlesType+

                                                 '<a href="article/'+item.id+'" target="_blank">'+item.title+'</a>'+
                                                 ishot +

                                               '</div>'+
                                            isRecommend+
                                            isnew+

                                             '<div class="article-abstract">'+item.remark+'</div>'+
                                             '</div>'+
                                             '<div class="clear"></div>'+
                                             '<div class="article-footer">'+
                                             '<span>'+
                                                '<i class="fa fa-clock-o"></i>&nbsp;&nbsp;'+
                                                 '<a href="#" style="color:#a6a6a6;" title="文章发布时间">'+item.createAt+'</a>'+
                                            '</span>'+
                                             '<span class="article-author">'+
                                                '<i class="fa fa-user"></i>&nbsp;&nbsp; '+
                                                 '<a href="#" title="文章作者" >'+item.author+'</a>'+
                                             '</span>'+
                                            /*'<span style="color: #dd483f">' +
                                                '<i class="iconfont icon-kinds"></i>&nbsp;' +
                                                '<a href="#" style="color: #dd483f" title="文章分类"> ' + item.category + '</a>' +
                                            '</span>' + */
                                            '<span style="color: green">' +
                                                '<i class="iconfont icon-biaoqian"></i>&nbsp;' +
                                                '<a href="#" style="color: green"  title="文章标签">' + tagList + '</a>' +
                                            '</span>' +
                                             '<span class="article-viewinfo">'+
                                                 '<i class="fa fa-eye"></i>&nbsp;'+item.browsNum+
                                             '</span>'+
                                             '<span class="article-viewinfo">'+
                                                '<i class="fa fa-commenting"></i>&nbsp;'+item.comments+'</span></div> </div>';

                                    lis.push('<li style="overflow: hidden;position: relative;">' + blog + '</li>');
                                }
                            });
                            //next(lis.join(''), pageNum < pageCount);
                            next(lis.join(''), page < pageCount);
                        });
                    }, 1);

                }
            });

        }
    }

    $('.search-input').keydown(function(e){
        var search=$('.search-input').val();
        search=edit.escape(search);
        var evt = window.event || e;
        if(evt.keyCode==13){
            grid.getBlog(search,5,1);
        }
    });

    var radius = 100;
    var d = 200;
    var dtr = Math.PI / 180;
    var mcList = [];
    var lasta = 1;
    var lastb = 1;
    var distr = true;
    var tspeed = 11;
    var size = 200;
    var mouseX = 0;
    var mouseY = 10;
    var howElliptical = 1;
    var aA = null;
    var oDiv = null;
    $(function () {
        // 播放公告
        playAnnouncement(3000);

    });


    // 加载热文排行
    $.get('/blogArticles/front/hotArticles' , function (res) {
        layui.each(res, function (index, item) {
            if (index <= 10) {
                //var myview="<i class='fa fa-eye'></i>&nbsp;<a href='#' style='color: blue' title='阅读数'> " + item.browsNum+ "</a>"
                //$("#blogsrank").append("<li><i class=\"iconfont icon-remen\" style='color: red;margin-left: -28px'></i><a class='animated lightSpeedIn hvr-bob' href=\"blogArticles/front/" + item.id + "\" target='_blank'>" + item.title + "</a>"+myview+"</li>");

                $("#blogsrank").append("<div class=\"layui-row layui-col-space3\"><div class=\"layui-col-xs1\"><i class=\"iconfont icon-remen\" style='color: red'></i></div><div class=\"layui-col-xs8 layui-elip\"><a href=\"blogArticles/front/"+ item.id + "\" target='_blank' title=\""+ item.title +"\" class=\"animated lightSpeedIn hvr-bob\">"+ item.title + "</a></div><div class=\"layui-col-xs3 layui-elip\"><a title=\"浏览：" + item.browsNum+ "\"><i class=\"fa fa-eye\"></i> " + item.browsNum+ "</a></div></div>");
            }
        });
    });
    // 加载栏目类型
    $.get('/blogCategory/front/categoryList', function (res) {
        layui.each(res, function (index, item) {
            //$("#blogtype").append("<div typeid=" + item.id + " class=\"set_8_button4 animated lightSpeedIn outline\" href=\"#\"><i class=\"iconfont icon-kinds\" style=\"color:#dd483f\"></i>&nbsp;" + item.name + "<span class=\"lines\"></span></div>");
            $("#blogtype").append("<div typeid=" + item.id + " class=\"set_8_button4 animated lightSpeedIn outline\" href=\"#\">" + item.name + "<span class=\"lines\"></span></div>");
        });
        $("#blogtype .set_8_button4").each(function(k,v){
            $(v).on("click",function(){
                var tid=$(this).attr("typeid");
                grid.getBlog(1,tid,4,1);
            });
        });
    });

    // 加载标签
    $.get('/blogTag/front/tagList', function (res) {
        layui.each(res, function (index, item) {
            //$("#blog-cloud-tag").append('<a tagid="'+ item.id  + '"class="layui-btn layui-btn-radius layui-btn-xs layui-btn-primary tag hvr-float-shadow" style="color: green"><i class="iconfont icon-biaoqian"></i>'+ item.name +'</a>');
            $("#blog-cloud-tag").append('<a tagid="'+ item.id  + '"  ><i class="iconfont icon-biaoqian"></i>'+ item.name +'</a>');
        });
        $("#blog-cloud-tag .tag").each(function(k,v){
            $(v).on("click",function(){
                var tagid=$(this).attr("tagid");
                grid.getBlog(2,tagid,4,1);
            });
        });

        var i=0;
        var oTag=null;
        /*oDiv=document.getElementById('tag_cloud_widget');*/
        oDiv=document.getElementById('blog-cloud-tag');
        aA=oDiv.getElementsByTagName('a');
        for(i=0;i<aA.length;i++)
        {
            oTag={};
            aA[i].onmouseover = (function (obj) {
                return function () {
                    obj.on = true;
                    this.style.zIndex = 9999;
                    this.style.color = '#fff';
                    this.style.background = '#0099ff';
                    this.style.padding = '5px 5px';
                    this.style.filter = "alpha(opacity=100)";
                    this.style.opacity = 1;
                }
            })(oTag)
            aA[i].onmouseout = (function (obj) {
                return function () {
                    obj.on = false;
                    this.style.zIndex = obj.zIndex;
                    this.style.color = '#fff';
                    this.style.background = '#30899B';
                    this.style.padding = '5px';
                    this.style.filter = "alpha(opacity=" + 100 * obj.alpha + ")";
                    this.style.opacity = obj.alpha;
                    this.style.zIndex = obj.zIndex;
                }
            })(oTag)
            oTag.offsetWidth = aA[i].offsetWidth;
            oTag.offsetHeight = aA[i].offsetHeight;
            mcList.push(oTag);
        }
        sineCosine( 0,0,0 );
        positionAll();
        (function () {
            update();
            setTimeout(arguments.callee, 40);
        })();
    });



    // 播放公告
    function playAnnouncement(interval) {
        /*var index = 0;
         var $announcement = $('.home-tips-container>span');
         //自动轮换
         setInterval(function () {
         index++;    //下标更新
         if (index >= $announcement.length) {
         index = 0;
         }
         $announcement.eq(index).stop(true, true).fadeIn().siblings('span').fadeOut();  //下标对应的图片显示，同辈元素隐藏
         }, interval);*/


        var _wrap=$(".mulitline");
        //var _interval=3000;
        var _moving;
        _wrap.hover(function(){
            clearInterval(_moving)
        },function(){
            _moving=setInterval(function(){
                var _field=_wrap.find("li:first");
                var _h=_field.height();
                _field.animate({marginTop:-_h+"px"},500,function(){
                    _field.css("marginTop",0).appendTo(_wrap)})},interval)}).trigger("mouseleave");
        if($(".mulitline li").length<=1){
            clearInterval(_moving)
        }
    }





    function update()
    {
        var a, b, c = 0;
        a = (Math.min(Math.max(-mouseY, -size), size) / radius) * tspeed;
        b = (-Math.min(Math.max(-mouseX, -size), size) / radius) * tspeed;
        lasta = a;
        lastb = b;
        if (Math.abs(a) <= 0.01 && Math.abs(b) <= 0.01) {
            return;
        }
        sineCosine(a, b, c);
        for (var i = 0; i < mcList.length; i++) {
            if (mcList[i].on) {
                continue;
            }
            var rx1 = mcList[i].cx;
            var ry1 = mcList[i].cy * ca + mcList[i].cz * (-sa);
            var rz1 = mcList[i].cy * sa + mcList[i].cz * ca;

            var rx2 = rx1 * cb + rz1 * sb;
            var ry2 = ry1;
            var rz2 = rx1 * (-sb) + rz1 * cb;

            var rx3 = rx2 * cc + ry2 * (-sc);
            var ry3 = rx2 * sc + ry2 * cc;
            var rz3 = rz2;

            mcList[i].cx = rx3;
            mcList[i].cy = ry3;
            mcList[i].cz = rz3;

            per = d / (d + rz3);

            mcList[i].x = (howElliptical * rx3 * per) - (howElliptical * 2);
            mcList[i].y = ry3 * per;
            mcList[i].scale = per;
            var alpha = per;
            alpha = (alpha - 0.6) * (10 / 6);
            mcList[i].alpha = alpha * alpha * alpha - 0.2;
            mcList[i].zIndex = Math.ceil(100 - Math.floor(mcList[i].cz));
        }
        doPosition();
    }
    function depthSort()
    {
        var i=0;
        var aTmp=[];
        for(i=0;i<aA.length;i++)
        {
            aTmp.push(aA[i]);
        }
        aTmp.sort
        (
            function (vItem1, vItem2)
            {
                if(vItem1.cz>vItem2.cz)
                {
                    return -1;
                }
                else if(vItem1.cz<vItem2.cz)
                {
                    return 1;
                }
                else
                {
                    return 0;
                }
            }
        );
        for(i=0;i<aTmp.length;i++)
        {
            aTmp[i].style.zIndex=i;
        }
    }
    function positionAll()
    {
        var phi = 0;
        var theta = 0;
        var max = mcList.length;
        for (var i = 0; i < max; i++) {
            if (distr) {
                phi = Math.acos(-1 + (2 * (i + 1) - 1) / max);
                theta = Math.sqrt(max * Math.PI) * phi;
            } else {
                phi = Math.random() * (Math.PI);
                theta = Math.random() * (2 * Math.PI);
            }
            //坐标变换
            mcList[i].cx = radius * Math.cos(theta) * Math.sin(phi);
            mcList[i].cy = radius * Math.sin(theta) * Math.sin(phi);
            mcList[i].cz = radius * Math.cos(phi);

            aA[i].style.left = mcList[i].cx + oDiv.offsetWidth / 2 - mcList[i].offsetWidth / 2 + 'px';
            aA[i].style.top = mcList[i].cy + oDiv.offsetHeight / 2 - mcList[i].offsetHeight / 2 + 'px';
        }
    }
    function doPosition()
    {
        var l = oDiv.offsetWidth / 2;
        var t = oDiv.offsetHeight / 2;
        for (var i = 0; i < mcList.length; i++) {
            if (mcList[i].on) {
                continue;
            }
            var aAs = aA[i].style;
            if (mcList[i].alpha > 0.1) {
                if (aAs.display != '')
                    aAs.display = '';
            } else {
                if (aAs.display != 'none')
                    aAs.display = 'none';
                continue;
            }
            aAs.left = mcList[i].cx + l - mcList[i].offsetWidth / 2 + 'px';
            aAs.top = mcList[i].cy + t - mcList[i].offsetHeight / 2 + 'px';
            //aAs.fontSize=Math.ceil(12*mcList[i].scale/2)+8+'px';
            //aAs.filter="progid:DXImageTransform.Microsoft.Alpha(opacity="+100*mcList[i].alpha+")";
            aAs.filter = "alpha(opacity=" + 100 * mcList[i].alpha + ")";
            aAs.zIndex = mcList[i].zIndex;
            aAs.opacity = mcList[i].alpha;
        }
    }
    function sineCosine( a, b, c)
    {
        sa = Math.sin(a * dtr);
        ca = Math.cos(a * dtr);
        sb = Math.sin(b * dtr);
        cb = Math.cos(b * dtr);
        sc = Math.sin(c * dtr);
        cc = Math.cos(c * dtr);
    }

});