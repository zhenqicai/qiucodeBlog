package cn.qiucode.utils;

import java.util.regex.Pattern;

/**
 * Created by wuming on 2018/10/5.
 */
public class UserAgentUtil {

    /**
     * 根据浏览着获取其电脑系统信息
     * @param request
     * @return
     */
    public static String getOS(/*HttpServletRequest request*/){
        String os="";
        String header ="aaaaaa" ;//request.getHeader("user-agent");
        if(header == null || header.equals("")){
            return "";
        }

        //得到用户的操作系统
        if (Pattern.matches("/win/i", header) && header.indexOf("95")>0) {
            os ="Win 95";
        } else if (Pattern.matches("/win 9x/i", header) && header.indexOf("4.90")>0) {
            os = "Win ME";
        } else if (Pattern.matches("/win/i", header) && Pattern.matches("/98/i", header)) {
            os = "Win 98";
        } else if (Pattern.matches("/win/i", header) && Pattern.matches("/nt 5.0/i", header)) {
            os = "Win 2000";
        } else if (Pattern.matches("/win/i", header) && Pattern.matches("/nt 6.0/i", header)) {
            os = "Win Vista";
        } else if (Pattern.matches("/win/i", header) && Pattern.matches("/nt 6.1/i", header)) {
            os = "Win 7";
        } else if (Pattern.matches("/win/i", header) && Pattern.matches("/nt 5.1/i", header)) {
            os = "Win XP";
        } else if (Pattern.matches("/win/i", header) && Pattern.matches("/nt 6.2/i", header)) {
            os = "Win 8";
        } else if (Pattern.matches("/win/i", header) && Pattern.matches("/nt 6.3/i", header)) {
            os = "Win 8.1";
        } else if (Pattern.matches("/win/i", header) && Pattern.matches("/nt 10/i", header)) {
            os = "Win 10";
        } else if (Pattern.matches("/win/i", header) && Pattern.matches("/nt/i", header)) {
            os = "Win NT";
        } else if (Pattern.matches("/win/i", header) && Pattern.matches("/32/i", header)) {
            os = "Win 32";
        } else if (Pattern.matches("/Mi/i", header)) {
            os = "小米";
        } else if (Pattern.matches("/Android/i", header) && Pattern.matches("/LG/i", header)) {
            os = "LG";
        } else if (Pattern.matches("/Android/i", header) && Pattern.matches("/M1/i", header)) {
            os = "魅族";
        } else if (Pattern.matches("/Android/i", header) && Pattern.matches("/MX4/i", header)) {
            os = "魅族4";
        } else if (Pattern.matches("/Android/i", header) && Pattern.matches("/M3/i", header)) {
            os = "魅族";
        } else if (Pattern.matches("/Android/i", header) && Pattern.matches("/M4/i", header)) {
            os = "魅族";
        } else if (Pattern.matches("/Android/i", header) && Pattern.matches("/Huawei/i", header)) {
            os = "华为";
        } else if (Pattern.matches("/Android/i", header) && Pattern.matches("/HM201/i", header)) {
            os = "红米";
        } else if (Pattern.matches("/Android/i", header) && Pattern.matches("/KOT/i", header)) {
            os = "红米4G版";
        } else if (Pattern.matches("/Android/i", header) && Pattern.matches("/NX5/i", header)) {
            os = "努比亚";
        } else if (Pattern.matches("/Android/i", header) && Pattern.matches("/vivo/i", header)) {
            os = "Vivo";
        } else if (Pattern.matches("/Android/i", header)) {
            os = "Android";
        } else if (Pattern.matches("/linux/i", header)) {
            os = "Linux";
        } else if (Pattern.matches("/unix/i", header)) {
            os = "Unix";
        } else if (Pattern.matches("/iPhone/i", header)) {
            os = "苹果";
        } else if (Pattern.matches("/sun/i", header) && Pattern.matches("/os/i", header)) {
            os = "SunOS";
        } else if (Pattern.matches("/ibm/i", header) && Pattern.matches("/os/i", header)) {
            os = "IBM OS/2";
        } else if (Pattern.matches("/Mac/i", header) && Pattern.matches("/PC/i", header)) {
            os = "Macintosh";
        } else if (Pattern.matches("/PowerPC/i", header)) {
            os = "PowerPC";
        } else if (Pattern.matches("/AIX/i", header)) {
            os = "AIX";
        } else if (Pattern.matches("/HPUX/i", header)) {
            os = "HPUX";
        } else if (Pattern.matches("/NetBSD/i", header)) {
            os = "NetBSD";
        } else if (Pattern.matches("/BSD/i", header)) {
            os = "BSD";
        } else if (Pattern.matches("/OSF1/i", header)) {
            os = "OSF1";
        } else if (Pattern.matches("/IRIX/i", header)) {
            os = "IRIX";
        } else if (Pattern.matches("/FreeBSD/i", header)) {
            os = "FreeBSD";
        } else if (Pattern.matches("/Mac OS/i", header)) {
            os = "Mac OS";
        }else if (os == ""){
            os = "未知";
        }
        return os;
    }

    public static void main(String[] args){
        String a="Windows NT 6.3";
        //System.out.println(Pattern.matches("(Win)",a));
        System.out.println(a.matches("(Windows)"));
    }
}
