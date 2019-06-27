package cn.qiucode.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by wuming on 2018/8/26.
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @RequestMapping("/main")
    public String main(){
        return "admin/main";
    }
}
