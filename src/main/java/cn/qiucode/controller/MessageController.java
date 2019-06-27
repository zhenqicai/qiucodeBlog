package cn.qiucode.controller;


import cn.hutool.extra.servlet.ServletUtil;
import cn.qiucode.constant.CommonConst;
import cn.qiucode.entity.Message;
import cn.qiucode.entity.vo.RequestMessageParam;
import cn.qiucode.service.ArticleService;
import cn.qiucode.service.MailService;
import cn.qiucode.service.MessageService;
import cn.qiucode.utils.MapCache;
import cn.qiucode.utils.Page;
import cn.qiucode.utils.ThreadUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by wuming on 2018/8/13.
 */
@Controller
@RequestMapping("/message/")
public class MessageController {

    @Autowired
    private MessageService messageService;

    @Autowired
    private ArticleService articleService;

    @Autowired
    private MailService mailService;

    @RequestMapping("add2")
    @ResponseBody
    public Map<String,Object>  addMessage2(Message message){
       // =new Message();
        //System.out.println(message.getNickname());
        Map<String,Object> res=new HashMap<String,Object>();
        boolean flag=messageService.addMessage(message);
        if(flag){
            res.put("code",1);
            res.put("msg","评论成功！");
        }else{
            res.put("code",-1);
            res.put("msg","程序异常，留言失败，请稍后重试");
        }
        return res;
    }

    @RequestMapping("add")
    @ResponseBody
    public Map<String,Object>  addMessage(@RequestBody RequestMessageParam messageParam, HttpServletRequest request){
        // =new Message();
        //System.out.println(message.getNickname());
        Map<String,Object> res=new HashMap<String,Object>();

        if(!checkRepeatIp(request)){
            Message message=new Message();
            if(null==messageParam.getParam() || "".equals(messageParam.getParam())){
                message.setPid(0);
            }else{
                String[] param=messageParam.getParam().split(",");
                message.setPid(Integer.valueOf(param[0]));
                message.setReplyId(Integer.valueOf(param[1]));
                message.setReplyNickName(param[2]);
            }
            if(null==messageParam.getArticleId() || "".equals(messageParam.getArticleId())){
                message.setType(1);//留言
            }else{
                message.setType(2);//评论
                int articleId=messageParam.getArticleId();
                message.setArticleId(articleId);
            }
            String os="";//UserAgentUtil.getOS(request);
            message.setOs(os);
            message.setContent(messageParam.getContent());
            message.setNickname(messageParam.getNickname());
            message.setEmail(messageParam.getEmail());
            message.setCreateTime(new Date());
            int n = (int)(Math.random()*6+1);
            String headurl=String.format("/static/front/images/commonhead%d.jpg",n);
            message.setHeadurl(headurl);
            message.setStatus(1);
            //boolean flag=messageService.addMessage(message);
            boolean flag=false;
            if(null==messageParam.getArticleId() || "".equals(messageParam.getArticleId())){
                flag=messageService.addLevelMessage(message);//添加留言
            }else{
                flag=messageService.addArticleMessage(message);
            }
            if(null==messageParam.getParam() || "".equals(messageParam.getParam())){
                if(null!=messageParam.getArticleId() || !"".equals(messageParam.getArticleId())){
                    articleService.updateCommonts(messageParam.getArticleId());//跟新文章评论数
                }
            }
            if(flag){
                res.put("code",1);
                res.put("msg","评论成功！");
            }else{
                res.put("code",2);
                res.put("msg","程序异常，留言失败，请稍后重试");
            }
        }else{
            res.put("code",3);
            res.put("msg","不好意思，您已评论过了，30分钟后才能再次评论哦！");
        }
        //发送邮箱通知
        asyncSendMail(messageParam.getArticleId(),messageParam.getContent());
        return res;
    }

    //异步处理线程
    public void asyncSendMail(final Integer articleId,final String content){
        ThreadUtil.execute(new Runnable() {
            @Override
            public void run() {
                try{
                    String subject=null==articleId ? "有新游客留言了！" : "有游客评论了ID为【"+articleId+"】这篇文章";
                    String msgTitle=null==articleId ? "留言内容如下:" : "评论内容如下:";
                    mailService.sendHtmlMail("2834491983@qq.com",subject,"<body style=\"text-align: center;margin-left: auto;margin-right: auto;\">\n"
                            + "	<div id=\"welcome\" style=\"text-align: center;position: absolute;\" >\n"
                            +"		<h3>"+msgTitle+"</h3>\n"
                            +"		<span>"+content+"</span>"
                            + "	</div>\n" + "</body>");
                }catch(Exception e){
                    e.printStackTrace();
                }
            }
        });
    }

    @RequestMapping("list")
    @ResponseBody
    public Page<Message> listMessage(
                       @RequestParam(required = false, value = "articleId") Integer articleId,
                       @RequestParam(required = false, value = "pageSize") Integer pageSize,
                       @RequestParam(required = false, value = "pageIndex") Integer pageIndex){
        if ("".equals(pageIndex) || null == pageIndex) {
            pageIndex = 1;
        }
        if ("".equals(pageSize) || null == pageSize) {
            pageSize = 5;
        }

        //Page<Message> msgs= messageService.findAll(articleId,pageIndex,pageSize);
        Page<Message> msgs=new Page<>();
        if(null==articleId){
            msgs=messageService.findLevelMessageAll(pageIndex,pageSize);//留言分页
        }else{
            msgs=messageService.findArticleMessageAll(articleId,pageIndex,pageSize);
        }
        return msgs;

    }

    protected MapCache cache = MapCache.single();
    /**
     * 检测同一IP十分钟以内重复访问同一篇文章
     * @param request
     * @return
     */
    public boolean checkRepeatIp(HttpServletRequest request) {

        String value= ServletUtil.getClientIP(request);
        Integer count=cache.hget("hits:message", value);
        if(count!=null && count>0) {
            return true;
        }
        cache.hset("hits:message", value,1, CommonConst.IP_REPEAT_MESSAGE_TIME);
        return false;
    }
}
