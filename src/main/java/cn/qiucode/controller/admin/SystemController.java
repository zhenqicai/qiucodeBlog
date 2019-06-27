package cn.qiucode.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by wuming on 2018/8/29.
 */
@Controller
@RequestMapping("/system")
public class SystemController {

    @RequestMapping("/index")
    public String index(){
        return "admin/system/index";
    }
}
