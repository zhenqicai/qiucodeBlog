package cn.qiucode.funcinter;/**
 * Created by wuming on 2019/6/22.
 */

/**
 * @author 上官江北
 * @description 接口增强之默认接口
 * @date 2019/6/22 10:47
 **/
public interface DefaultInter {
    default public int count(){
        return 1;
    }

    public static String findName(){
        return "张三";
    }
}
