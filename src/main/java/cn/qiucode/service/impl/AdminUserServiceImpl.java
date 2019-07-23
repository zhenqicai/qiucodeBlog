package cn.qiucode.service.impl;


import cn.qiucode.dao.AdminUserDao;
import cn.qiucode.entity.AdminUser;
import cn.qiucode.service.AdminUserService;
import cn.qiucode.utils.MD5util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by wuming on 2018/8/25.
 */
@Service("adminUserService")
public class AdminUserServiceImpl implements AdminUserService {

    @Autowired
    private AdminUserDao adminUserDao;
    @Override
    public AdminUser findOne(String username, String password) {
        password= MD5util.md5(password);
        return adminUserDao.findOne(username,password);
    }
    @Override
    public AdminUser findByName(String username){
        return adminUserDao.findByName(username);
    }
}
