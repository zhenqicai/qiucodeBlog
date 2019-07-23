package cn.qiucode.utils;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

/**
 * @author 上官江北
 * @date 2019/7/23 20:07
 **/
public class EncryptUtils {

    private static String algorithmName = "md5";
    private static int hashIterations = 2;
    private static String salt = "123456";

    public static String encrypt(String str,String salt, String algorithmName, int hashIterations) {
        return new SimpleHash(algorithmName,str, ByteSource.Util.bytes(salt),hashIterations).toString();
    }
    //控制台输出的字符串替换数据库中password
    public static void main(String [] args){
        String pwd=EncryptUtils.encrypt("zhangsan123","admin"+salt,algorithmName,hashIterations);
        System.out.println(pwd);
    }
}
