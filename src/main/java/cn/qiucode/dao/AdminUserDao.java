package cn.qiucode.dao;


import cn.qiucode.entity.AdminUser;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * Created by wuming on 2018/8/25.
 */
@Mapper
public interface AdminUserDao {

    /**
     * 根据用户名密码查找对应的用户
     * @param password
     * @param username
     * @return
     */
    public AdminUser findOne(@Param("username") String username, @Param("password") String password);
}
