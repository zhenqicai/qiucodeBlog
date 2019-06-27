package cn.qiucode.controller;

import cn.qiucode.service.MailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by wuming on 2019/6/1.
 */
@RestController
@RequestMapping("email")
public class EmailController {

    @Autowired
    private MailService mailService;

    @RequestMapping
    public Map<String,Object> index(){
        Map<String,Object> result=new HashMap<>();
        try {
            mailService.sendSimpleMail("2834491983@qq.com","SpringBoot Email","这是一封普通的SpringBoot邮件");
            result.put("code",200);
            result.put("status","success");
            result.put("message","邮件发送成功!");
        }catch (Exception ex){
            ex.printStackTrace();
            result.put("code",-1);
            result.put("status","fail");
            result.put("message","邮件发送失败!");
        }
        return result;
    }

    @RequestMapping("/htmlEmail")
    public Map<String,Object> htmlEmail(){
        Map<String,Object> result=new HashMap<>();
        try {
            mailService.sendHtmlMail("2834491983@qq.com","有游客评论了【】这篇文章","<body style=\"text-align: center;margin-left: auto;margin-right: auto;\">\n"
                    + "	<div id=\"welcome\" style=\"text-align: center;position: absolute;\" >\n"
                    +"		<h3>评论内容如下:</h3>\n"
                    +"		<span>博主很赞！</span>"
                    + "	</div>\n" + "</body>");
            result.put("code",200);
            result.put("status","success");
            result.put("message","邮件发送成功!");
        }catch (Exception ex){
            ex.printStackTrace();
            result.put("code",-1);
            result.put("status","fail");
            result.put("message","邮件发送失败!");
        }
        return result;
    }

    @RequestMapping("/attachmentsMail")
    public Map<String,Object> attachmentsMail(){
        Map<String,Object> result=new HashMap<>();
        try {
            String filePath = "/static/front/images/aboutAuthor.png";
            mailService.sendAttachmentsMail("2834491983@qq.com", "这是一封带附件的邮件", "邮件中有附件，请注意查收！", filePath);
            result.put("code",200);
            result.put("status","success");
            result.put("message","邮件发送成功!");
        }catch (Exception ex){
            ex.printStackTrace();
            result.put("code",-1);
            result.put("status","fail");
            result.put("message","邮件发送失败!");
        }
        return result;
    }

    @RequestMapping("/resourceMail")
    public Map<String,Object> resourceMail(){
        Map<String,Object> result=new HashMap<>();
        try {
            String rscId = "上官江北";
            String content = "<html><body>这是有图片的邮件<br/><img src=\'cid:" + rscId + "\' ></body></html>";
            String imgPath = "/static/front/images/aboutAuthor.png";
            mailService.sendResourceMail("2834491983@qq.com", "这邮件中含有图片", content, imgPath, rscId);

            result.put("code",200);
            result.put("status","success");
            result.put("message","邮件发送成功!");
        }catch (Exception ex){
            ex.printStackTrace();
            result.put("code",-1);
            result.put("status","fail");
            result.put("message","邮件发送失败!");
        }
        return result;
    }

    /*@RequestMapping("/templateMail")
    public Map<String,Object> templateMail(){
        Map<String,Object> result=new HashMap<>();
        try {
            Context context = new Context();
            context.setVariable("project", "IJPay");
            context.setVariable("author", "Javen");
            context.setVariable("url", "https://github.com/Javen205/IJPay");
            String emailContent = templateEngine.process("emailTemp", context);

            mailService.sendHtmlMail("xxx@126.com", "这是模板邮件", emailContent);
            result.put("code",200);
            result.put("status","success");
            result.put("message","邮件发送成功!");
        }catch (Exception ex){
            ex.printStackTrace();
            result.put("code",-1);
            result.put("status","fail");
            result.put("message","邮件发送失败!");
        }
        return result;
    }*/

}
