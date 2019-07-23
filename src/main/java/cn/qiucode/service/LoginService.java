package cn.qiucode.service;

import java.util.Map;

/**
 * @author 上官江北
 * @date 2019/7/22 21:20
 **/
public interface LoginService {

    public Map<String,Object> login(String userName, String password);

    public void logout();
}
