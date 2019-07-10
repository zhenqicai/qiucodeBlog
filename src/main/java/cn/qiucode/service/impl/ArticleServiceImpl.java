package cn.qiucode.service.impl;

import cn.qiucode.dao.ArticleDao;
import cn.qiucode.dao.TagDao;
import cn.qiucode.entity.Article;
import cn.qiucode.service.ArticleService;
import cn.qiucode.utils.Page;
import cn.qiucode.utils.RelativeDateFormat;
import cn.qiucode.utils.search.LuceneIndex;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by wuming on 2019/4/23.
 */
@Service("articleService")
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleDao articleDao;
    @Autowired
    private TagDao tagDao;
    @Autowired
    private LuceneIndex luceneIndex;


    //@Override
    @Cacheable(cacheNames = "articlesList",
            key="T(String).valueOf(#pageNow).concat('-').concat(T(String).valueOf(#pageSize))")
    public Page<Article> findAll(int pageNow, int pageSize) {
        int startLimit=(pageNow-1)*pageSize;
        List<Article> arts=articleDao.findAll(startLimit,pageSize);
        //SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        for(Article art : arts){
            //art.setCreateAt(sdf.format(art.getCreateTime()));
            art.setCreateAt(RelativeDateFormat.showTime(art.getCreateTime()));
        }
        int totalCount=articleDao.articleCount();//getArticleCount();//arts.size();//
        int totalPage=(totalCount % pageSize == 0) ? (totalCount/pageSize) : (totalCount/pageSize)+1;

       /* List<Tag> tags=new ArrayList<Tag>();
        for(Article art : arts){
            System.out.println(art.getTags());
            tags=tagDao.findByIds(art.getTags());
            art.setTaglist(tags);
        }*/
        Page<Article> page=new Page<Article>();
        page.setData(arts);
        page.setTotalPage(totalPage);
        page.setCurrentPage(pageNow);
       /* page.setPageCount(totalPage);
        page.setPageNum(pageNow);*/
        return page;
    }



    @Override
    @Cacheable(value = "hotArticles")
    public List<Article> getHotArticle() {
        return articleDao.getHotArticle();
    }

    @Override
    @Cacheable(value = "articlesDetail", key = "#id")
    //@Cacheable(value = "articlesList", key = "'articlesDetail'+#id")
    public Article findArticle(Integer id) {
        return articleDao.findArticleById(id);
    }

    //@Override
    @CacheEvict(value = "articlesList", allEntries = true, beforeInvocation = true)
    public boolean addArticle(Article article){
        try{
            luceneIndex.addIndex(article);
        }catch(Exception e){
            System.out.println("添加索引出错了！");
        }
        return articleDao.addArticle(article);
    }

    //@Override
    // @Cacheable(value = "articleBrowsNum", key = "T(String).valueOf(#id).concat('-articleBrows')")
    @CacheEvict(value = "articlesList", allEntries = true, beforeInvocation = true)
    public void updateBrows(Integer id) {
        articleDao.updateBrows(id);
    }

    //@Override
    @CacheEvict(value = "articlesList", allEntries = true, beforeInvocation = true)
    public void updateCommonts(Integer id) {
        articleDao.updateCommonts(id);
    }

    @Override
    //@Cacheable(value="articleCount",key="getArticleCount")
    //@CacheEvict(value = "articlesList", allEntries = true, beforeInvocation = true)
    public int getArticleCount() {
        return articleDao.articleCount();
    }


   @Override
    public Page<Article> search(String keyWord, int pageNow, int pageSize) {
       try{
           int startLimit=(pageNow-1)*pageSize;
           List<Article> artList=luceneIndex.searchArticle(keyWord);
            
           int totalCount=getArticleCount();//artList.size();
           int totalPage=(totalCount % pageSize == 0) ? (totalCount/pageSize) : (totalCount/pageSize)+1;
           Page<Article> page=new Page<Article>();
           page.setData(artList);
           page.setTotalPage(totalPage);
           page.setCurrentPage(pageNow);
           
           return page;
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
}

