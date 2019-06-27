layui.define(["jquery"],function(exports){
    $ = layui.jquery;
    var  c = function () {
        //判断pc/mobile客户端
        c.prototype.browserRedirect = function() {
            var sUserAgent = navigator.userAgent.toLowerCase();
            var bIsIpad = sUserAgent.match(/ipad/i) == "ipad";
            var bIsIphoneOs = sUserAgent.match(/iphone os/i) == "iphone os";
            var bIsMidp = sUserAgent.match(/midp/i) == "midp";
            var bIsUc7 = sUserAgent.match(/rv:1.2.3.4/i) == "rv:1.2.3.4";
            var bIsUc = sUserAgent.match(/ucweb/i) == "ucweb";
            var bIsAndroid = sUserAgent.match(/android/i) == "android";
            var bIsCE = sUserAgent.match(/windows ce/i) == "windows ce";
            var bIsWM = sUserAgent.match(/windows mobile/i) == "windows mobile";
            if (bIsIpad || bIsIphoneOs || bIsMidp || bIsUc7 || bIsUc || bIsAndroid || bIsCE || bIsWM) {
                return 'mobile';
            } else {
                return 'pc';
            }
        };
        //获取当前url根路径
        c.prototype.getRoot = function() {
            var curWwwPath=window.document.location.href;        //获取完整的地址
            var pathName=window.document.location.pathname;     //获取项目后的地址
            var pos=curWwwPath.indexOf(pathName);      //得到位数地址
            var localhostPath =curWwwPath.substring(0,pos);         //得到协议加域名地址
            var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);    //得到项目地址
            if(projectName.indexOf(".php")>-1){
                return(localhostPath);
            }else{
                return(localhostPath);
            }
        }
    };
    var comm = new c();
    exports("comm",comm);
});
























