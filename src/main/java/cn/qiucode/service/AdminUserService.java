package cn.qiucode.service;


import cn.qiucode.entity.AdminUser;

/**
 * Created by wuming on 2018/8/25.
 */
public interface AdminUserService {

    public AdminUser findOne(String username, String password);

    public AdminUser findByName(String username);
}
