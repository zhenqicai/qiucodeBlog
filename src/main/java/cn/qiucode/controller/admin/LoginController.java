package cn.qiucode.controller.admin;


import cn.qiucode.entity.AdminUser;
import cn.qiucode.service.AdminUserService;
import cn.qiucode.service.LoginService;
import cn.qiucode.utils.AesUtils;
import cn.qiucode.utils.MD5util;
import cn.qiucode.utils.RandomUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by wuming on 2018/8/25.
 */
@Controller
public class LoginController {

    @Autowired
    private AdminUserService adminUserService;

    @Autowired
    private LoginService loginService;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String toLogin(Map<String, Object> map, HttpServletRequest request){
        loginService.logout();
        String key = RandomUtils.generateString(16);
        map.put("key",key);
        return "front/login";
    }
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> login(String username, String password,String key){
        Map<String,Object> res=new HashMap<String,Object>();
        password= AesUtils.decrypt(password,key);//MD5util.md5(password);
        Map<String,Object> loginResult=loginService.login(username, password);
        boolean flag=(boolean)loginResult.get("success");
        if(flag){
            res.put("code",1);
            res.put("msg","登录成功！");
            res.put("url","/admin/index");
        }else{
            res.put("code",-1);
            res.put("msg","账号密码不正确,登录失败！");
        }
       
        return res;
    }
    @RequestMapping("/admin/index")
    public String index(){
        return "admin/index";
    }

    @RequestMapping("/logout")
    public String logOut(HttpSession session) {
        loginService.logout();
        return "front/login";
    }
}
