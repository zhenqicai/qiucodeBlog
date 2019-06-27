package cn.qiucode.controller;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by wuming on 2019/4/27.
 */
@Controller
public class ErrorPageController implements ErrorController {

    private static final String ERROR_PATH = "/error";

    @RequestMapping(ERROR_PATH)
    public String handleError(HttpServletRequest request) {
        Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
        if (statusCode.equals(HttpStatus.NOT_FOUND.value())) {
            //return "redirect:/404";
            return "forward:/404";
        } else {
            return "redirect:/500";
        }
    }

    /**
     * 渲染404页面
     * @return String
     */
    @GetMapping(value = "/404")
    public String fourZeroFour() {
        return "error/404";
    }

    /**
     * 渲染500页面
     * @return String
     */
    @GetMapping(value = "/500")
    public String fiveZeroZero() {
        return "error/500";
    }

    @Override
    public String getErrorPath() {
        return ERROR_PATH;
    }
}
