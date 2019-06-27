package cn.qiucode.controller.admin;


import cn.qiucode.entity.AdminUser;
import cn.qiucode.service.AdminUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by wuming on 2018/8/25.
 */
@Controller
@RequestMapping
public class LoginController {

    @Autowired
    private AdminUserService adminUserService;
    @RequestMapping("/admin")
    public String toLogin(){
        return "front/login";
    }
    @RequestMapping("/admin/login")
    @ResponseBody
    public Map<String,Object> login(String username, String password){
        Map<String,Object> res=new HashMap<String,Object>();
        AdminUser adminUser=adminUserService.findOne(username,password);
        if(null!=adminUser){
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
}
