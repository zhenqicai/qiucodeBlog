package cn.qiucode.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by wuming on 2018/9/9.
 */
@Controller
@RequestMapping
public class TimeLineController {

    @RequestMapping("/timeline")
    public String timeLine(){
        return "front/timeline";
    }
}
