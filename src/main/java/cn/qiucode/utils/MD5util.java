package cn.qiucode.utils;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.springframework.util.StringUtils;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * Created by wuming on 2017/12/15.
 */
public class MD5util {

    /**
     * 对字符串进行Md5加密
     *
     * @param input 原文
     * @return md5后的密文
     */
    public static String md5(String input) {
        byte[] code = null;
        try {
            code = MessageDigest.getInstance("md5").digest(input.getBytes());
        } catch (NoSuchAlgorithmException e) {
            code = input.getBytes();
        }
        BigInteger bi = new BigInteger(code);
        return bi.abs().toString(32).toUpperCase();
    }
    /**
     * 对字符串进行Md5加密
     *
     * @param input 原文
     * @param salt 随机数
     * @return string
     */
    public static String generatePasswordMD5(String input, String salt) {
        if(StringUtils.isEmpty(salt)) {
            salt = "";
        }
        return md5(md5(salt + md5(input+salt)));
    }

    private static String algorithmName = "md5";
    private static int hashIterations = 2;
    private static String salt = "123456";


    public static String encrypt(String str,String salt, String algorithmName, int hashIterations) {
        return new SimpleHash(algorithmName,str, ByteSource.Util.bytes(salt),hashIterations).toString();
    }
    //控制台输出的字符串替换数据库中password
    public static void main(String [] args){
        String pwd=encrypt("123456","admin"+salt,algorithmName,hashIterations);
        System.out.println(pwd);
    }

}
