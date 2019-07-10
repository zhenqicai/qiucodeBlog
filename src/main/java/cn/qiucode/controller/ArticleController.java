package cn.qiucode.controller;


import cn.hutool.extra.servlet.ServletUtil;
import cn.qiucode.constant.CommonConst;
import cn.qiucode.entity.Article;
import cn.qiucode.entity.Category;
import cn.qiucode.entity.Tag;
import cn.qiucode.service.ArticleService;
import cn.qiucode.service.CategoryService;
import cn.qiucode.service.MessageService;
import cn.qiucode.service.TagService;
import cn.qiucode.utils.MapCache;
import cn.qiucode.utils.Page;
import cn.qiucode.utils.alioss.OSSClientUtil;
import cn.qiucode.utils.watermarker.WordWaterMarker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.tautua.markdownpapers.Markdown;
import org.tautua.markdownpapers.parser.ParseException;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.StringReader;
import java.io.StringWriter;
import java.util.*;

/**
 * Created by wuming on 2018/3/5.
 */
@Controller
@RequestMapping
public class ArticleController {

    @Autowired
    private ArticleService articleService;


    @Autowired
    private CategoryService categoryService;

    @Autowired
    private TagService tagService;

    @Autowired
    private OSSClientUtil ossClientUtil;

    @Autowired
    private MessageService messageService;

    /*@Autowired
    private CommentService commentService;*/

    @RequestMapping("/article/{id}")
    public String detail(@PathVariable("id") Integer id, ModelMap map, HttpServletRequest request){
        Article art=articleService.findArticle(id);
        //articleService.updateBrows(id);//跟新浏览数
        if(!checkRepeatIp(request, art.getId())) {
            updateArticleViews(art.getId(),art.getBrowsNum());
        }
        //暂时不使用
        /*Markdown markdown = new Markdown();
        try {
            StringWriter out = new StringWriter();
            markdown.transform(new StringReader(art.getContent()), out);
            out.flush();
            art.setContent(out.toString());
        }catch (ParseException e){
            e.printStackTrace();
        }*/
        //int messageCount=messageService.findMmessageCount(id);
       // map.put("messageCount",messageCount);
        map.put("article",art);
        return "front/detail";
    }

    protected MapCache cache = MapCache.single();

    /**
     * 检测同一IP十分钟以内重复访问同一篇文章
     * @param request
     * @param id 文章id
     * @return
     */
    public boolean checkRepeatIp(HttpServletRequest request, int id) {

        String value= ServletUtil.getClientIP(request)+":"+id;
        Integer count=cache.hget("hits:frequency", value);
        if(count!=null && count>0) {
            return true;
        }
        cache.hset("hits:frequency", value,1, CommonConst.IP_REPEAT_TIME);
        return false;
    }

    /**
     * 修改文章点击率
     * @param id
     * @param views
     */
    public void updateArticleViews(Integer id,Long views) {
        if (views == null) {
            views = 0L;
        }
        //获取缓存数据
        Long cacheViews=cache.hget("article"+id, "cacheViews");
        //如果缓存数据为null赋值1，反之加1
        cacheViews=cacheViews == null ? 1 : cacheViews+1;
        //如果缓存只大于等于设置的次数则修改到数据库
        if(cacheViews>= CommonConst.CLICK_EXCEED) {
            Article article=new Article();
            article.setId(id);
            article.setBrowsNum(views+cacheViews);
            articleService.updateBrows(id);
            cache.hset("article"+id, "cacheViews", null);
        }else {
            cache.hset("article"+id, "cacheViews", cacheViews);
        }
    }

    /**
     * 用于微信小程序
     * @param id
     * @return
     */
    @RequestMapping("/wxArticle/{id}")
    @ResponseBody
    public Article wxDetail(@PathVariable("id") Integer id){
        Article art=articleService.findArticle(id);
        articleService.updateBrows(id);//跟新浏览数
        return art;
    }

    @RequestMapping("/admin/article/index")
    public String index(){
        return "admin/article/index";
    }
    @RequestMapping("/admin/article/list")
    @ResponseBody
    public Page<Article> articleList(@RequestParam(required = false, value = "limit") Integer pageSize, @RequestParam(required = false, value = "page") Integer pageIndex){

        Page<Article> arts= articleService.findAll(pageIndex,pageSize);
        return arts;
    }
    @RequestMapping("/admin/article/loadAdd")
    public String loadAdd(Model model){
        List<Category> cates=categoryService.findAll();
        List<Tag> tags=tagService.findAll();
        model.addAttribute("categorys",cates);
        model.addAttribute("tags",tags);
        return "admin/article/add";
    }

    @RequestMapping(value = "/admin/article/upload", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> upload(HttpServletRequest request)
            throws IllegalStateException, IOException {
        // @RequestParam("file") MultipartFile file,
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
                request.getSession().getServletContext());
        Map<String ,Object> result=new HashMap<String ,Object>();


        // 判断 request 是否有文件上传,即多部分请求
        if (multipartResolver.isMultipart(request)) {
            // 转换成多部分request
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
            // 取得request中的所有文件名
            Iterator<String> iter = multiRequest.getFileNames();
            while (iter.hasNext()) {
                // 取得上传文件
                MultipartFile f = multiRequest.getFile(iter.next());
                if (f != null) {
                    // 取得当前上传文件的文件名称
                    //String fileName = f.getOriginalFilename();
                    //OSSClientUtil ossClientUtil=new OSSClientUtil();
                    //后面打开 begin
                    //对上传的图片进行添加水印再上传到OSS
                    MultipartFile waterFile= WordWaterMarker.addWorkMarkToMutipartFile(f,CommonConst.WATER_WORD);
                    String name=ossClientUtil.uploadImg2Oss(waterFile);
                    String imgUrl = ossClientUtil.getImgUrl(name);
                   //end

                    // 如果名称不为“”,说明该文件存在，否则说明该文件不存在
                    //if (fileName.trim() != "") {
                    // 定义上传路径
                       /* String path = "C:\\Users\\wuming\\Desktop\\"
                                + myFileName;
                        File localFile = new File(path);
                        f.transferTo(localFile);*/

                    //String path = request.getSession().getServletContext().getRealPath("upload");

                    //        String fileName = new Date().getTime()+".jpg";
                        /*System.out.println(path);
                        File targetFile = new File(path, fileName);
                        if (!targetFile.exists()) {
                            targetFile.mkdirs();
                        }

                        //保存
                        f.transferTo(targetFile);
                        result.put("success",1);
                        result.put("message","上传成功");
                        //result.put("url", request.getContextPath() + "/upload/" + fileName);
                        result.put("url", "http://127.0.0.1:9090/blog-ssm/upload/" + fileName);*/
                    result.put("success",1);
                    result.put("message","上传成功");
                    //result.put("url", "http://127.0.0.1:9090/blog-ssm/upload/" + fileName);
                    result.put("url",imgUrl);
                }
            }
            //}
        }else{
            result.put("success",0);
            result.put("message","上传失败");
        }
        //ossClientUtil.destory();
        System.out.println(result.toString());
        return result;
    }





    @RequestMapping(value = "/admin/article/add", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> addArticle(Article article){
        Map<String,Object> result=new HashMap<String,Object>();
        article.setIsReprint(1);
        article.setCreateTime(new Date());
        article.setIsTop(0);
        article.setLikeNum(0);
        article.setComments(0);
        article.setBrowsNum(0L);
        boolean flag=articleService.addArticle(article);
        String[] tagNameArray=article.getTags().split(",");
        for (String name : tagNameArray) {
            String mTag=tagService.findTagByName(name);
            if(null==mTag){
                Tag tag=new Tag();
                tag.setName(name);
                tag.setArticleNum(1);
                tagService.saveTag(tag);
            }else{
                tagService.updateTagCount(name);
            }
        }
        //tagService.saveTags(article.getTags());
        if(flag){
            result.put("code",1);
            result.put("msg","新增文章成功");
        }else{
            result.put("code",-1);
            result.put("msg","出现错误，请联系管理员");
        }
        return result;
    }

  /**
     * 全文检索
     * @param keyWord
     * @param pageIndex
     * @param model
     * @return
     */
    @RequestMapping("/search")
    @ResponseBody
    public Page<Article>  search(@RequestParam(required = false, value = "keyWord") String keyWord,
                                  @RequestParam(required = false, value = "pageSize") Integer pageSize,
                                  @RequestParam(required = false, value = "pageIndex") Integer pageIndex,
                                  ModelMap model){
        if ("".equals(pageIndex) || null == pageIndex) {
            pageIndex = 1;
        }
        if ("".equals(pageSize) || null == pageSize) {
            pageSize = 10;
        }

        if("".equals(keyWord) || null==keyWord){
            return new Page<Article>();
        }
        Page<Article> page=articleService.search(keyWord,pageIndex,pageSize);

        return page;
    }

}
