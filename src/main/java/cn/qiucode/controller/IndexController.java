package cn.qiucode.controller;

import cn.qiucode.entity.Article;
import cn.qiucode.entity.Category;
import cn.qiucode.entity.Tag;
import cn.qiucode.service.ArticleService;
import cn.qiucode.service.CategoryService;
import cn.qiucode.service.TagService;
import cn.qiucode.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by wuming on 2019/4/23.
 */
@Controller
@RequestMapping
public class IndexController {


    @Autowired
    private ArticleService articleService;

    @Autowired
    private TagService tagService;

    @Autowired
    private CategoryService categoryService;

    @RequestMapping("/")
    public String index(){
        return "front/index";

    }
    @RequestMapping("/blogArticles/front/list")
    @ResponseBody
    public Page<Article> page(@RequestParam(required = false, value = "pageSize") Integer pageSize, @RequestParam(required = false, value = "pageIndex") Integer pageIndex){
        if ("".equals(pageIndex) || null == pageIndex) {
            pageIndex = 1;
        }
        if ("".equals(pageSize) || null == pageSize) {
            pageSize = 10;
        }

        Page<Article> arts= articleService.findAll(pageIndex,pageSize);
        return arts;
    }

    @RequestMapping("/message")
    public String message(){
        return "front/message";
    }

    @RequestMapping("/toSearch")
    public String toSearch(){
        return "front/search";
    }

    @RequestMapping("/blogTag/front/tagList")
    @ResponseBody
    public List<Tag> getTagList(){
        List<Tag> tags=tagService.findAll();
        return tags;
    }

    @RequestMapping("blogCategory/front/categoryList")
    @ResponseBody
    public List<Category> getCategoryList(){
        List<Category> categoeys=categoryService.findAll();
        return categoeys;
    }

    @RequestMapping("blogArticles/front/hotArticles")
    @ResponseBody
    public List<Article> getHotArticle(){
        List<Article> arts=articleService.getHotArticle();
        return arts;
    }



    @RequestMapping("/list")
    public String list(ModelMap map){
        return "list";
    }

    @RequestMapping("/about")
    public String about(){
        return "front/about";
    }

}

