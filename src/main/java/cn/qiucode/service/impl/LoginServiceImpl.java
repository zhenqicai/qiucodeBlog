package cn.qiucode.service.impl;

import cn.qiucode.service.LoginService;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * @author 上官江北
 * @date 2019/7/22 21:25
 **/
@Service("loginService")
public class LoginServiceImpl implements LoginService {

    @Override
    public Map<String, Object> login(String userName, String password) {
        Map<String,Object> result=new HashMap<>();
        if(StringUtils.isBlank(userName)){
            result.put("message","用户名为空");
            result.put("success",false);
            return result;
        }
        String msg="";
        // 1、获取Subject实例对象
        Subject currentUser = SecurityUtils.getSubject();
        // 2、将用户名和密码封装到UsernamePasswordToken
        UsernamePasswordToken token = new UsernamePasswordToken(userName, password);
        try{
            currentUser.login(token);// 传到MyAuthorizingRealm类中的方法进行认证
            Session session = currentUser.getSession();
            session.setAttribute("userName", userName);
            result.put("message","登录成功！");
            result.put("success",true);
            return result;
        }catch (UnknownAccountException e){
            e.printStackTrace();
            msg="账号不存在!";
        } catch (AuthenticationException e) {
            e.printStackTrace();
            msg="用户验证失败!";
        }
        result.put("message",msg);
        result.put("success",false);
        return result;
    }

    @Override
    public void logout() {
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
    }
}
