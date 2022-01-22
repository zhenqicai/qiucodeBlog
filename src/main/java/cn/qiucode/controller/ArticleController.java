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
//import cn.qiucode.utils.alioss.OSSClientUtil;
import cn.qiucode.utils.watermarker.WordWaterMarker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

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

//    @Autowired
//    private OSSClientUtil ossClientUtil;

    @Autowired
    private MessageService messageService;

    /*@Autowired
    private CommentService commentService;*/

    @RequestMapping("/article/{id}")
    public String detail(@PathVariable("id") Integer id, ModelMap map, HttpServletRequest request){
        Article art=articleService.findArticle(id);
        //articleService.updateBrows(id);//���������
        if(!checkRepeatIp(request, art.getId())) {
            updateArticleViews(art.getId(),art.getBrowsNum());
        }
        //��ʱ��ʹ��
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
     * ���ͬһIPʮ���������ظ�����ͬһƪ����
     * @param request
     * @param id ����id
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
     * �޸����µ����
     * @param id
     * @param views
     */
    public void updateArticleViews(Integer id,Long views) {
        if (views == null) {
            views = 0L;
        }
        //��ȡ��������
        Long cacheViews=cache.hget("article"+id, "cacheViews");
        //�����������Ϊnull��ֵ1����֮��1
        cacheViews=cacheViews == null ? 1 : cacheViews+1;
        //�������ֻ���ڵ������õĴ������޸ĵ����ݿ�
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
     * ����΢��С����
     * @param id
     * @return
     */
    @RequestMapping("/wxArticle/{id}")
    @ResponseBody
    public Article wxDetail(@PathVariable("id") Integer id){
        Article art=articleService.findArticle(id);
        articleService.updateBrows(id);//���������
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


        // �ж� request �Ƿ����ļ��ϴ�,���ಿ������
        if (multipartResolver.isMultipart(request)) {
            // ת���ɶಿ��request
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
            // ȡ��request�е������ļ���
            Iterator<String> iter = multiRequest.getFileNames();
            while (iter.hasNext()) {
                // ȡ���ϴ��ļ�
                MultipartFile f = multiRequest.getFile(iter.next());
                if (f != null) {
                    // ȡ�õ�ǰ�ϴ��ļ����ļ�����
                    //String fileName = f.getOriginalFilename();
                    //OSSClientUtil ossClientUtil=new OSSClientUtil();
                    //����� begin
                    //���ϴ���ͼƬ�������ˮӡ���ϴ���OSS
                    MultipartFile waterFile= WordWaterMarker.addWorkMarkToMutipartFile(f,CommonConst.WATER_WORD);
                     // ��������ע����������  ���п� �ٰ���һ�ι����ļ��ϴ������� ���ƴ洢˵�����
                    //   String name=ossClientUtil.uploadImg2Oss(waterFile);
                   //     String imgUrl = ossClientUtil.getImgUrl(name);
                   //end

                    // ������Ʋ�Ϊ����,˵�����ļ����ڣ�����˵�����ļ�������
                    //if (fileName.trim() != "") {
                    // �����ϴ�·��
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

                        //����
                        f.transferTo(targetFile);
                        result.put("success",1);
                        result.put("message","�ϴ��ɹ�");
                        //result.put("url", request.getContextPath() + "/upload/" + fileName);
                        result.put("url", "http://127.0.0.1:9090/blog-ssm/upload/" + fileName);*/
                    result.put("success",1);
                    result.put("message","�ϴ��ɹ�");
                    //result.put("url", "http://127.0.0.1:9090/blog-ssm/upload/" + fileName);
                    //result.put("url",imgUrl);
                }
            }
            //}
        }else{
            result.put("success",0);
            result.put("message","�ϴ�ʧ��");
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
            result.put("msg","�������³ɹ�");
        }else{
            result.put("code",-1);
            result.put("msg","���ִ�������ϵ����Ա");
        }
        return result;
    }

  /**
     * ȫ�ļ���
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
