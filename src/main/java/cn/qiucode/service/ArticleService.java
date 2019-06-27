package cn.qiucode.service;

import cn.qiucode.entity.Article;
import cn.qiucode.utils.Page;

import java.util.List;

/**
 * Created by wuming on 2019/4/23.
 */
public interface ArticleService {

    /**
     * 以分页形式显示文章列表
     * @param pageNow
     * @param pageSize
     * @return
     */
    public Page<Article> findAll(int pageNow, int pageSize);

    //获取文章总数
    @Deprecated
    public int getArticleCount();

    /**
     * 获取热门文章排行
     * @return
     */
    public List<Article> getHotArticle();

    public Article findArticle(Integer id);

    public boolean addArticle(Article article);

    public void updateBrows(Integer id);

    public void updateCommonts(Integer id);
}
