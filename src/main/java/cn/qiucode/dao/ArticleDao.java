package cn.qiucode.dao;

import cn.qiucode.entity.Article;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * Created by wuming on 2019/4/23.
 */
@Mapper
public interface  ArticleDao {

    public int articleCount();
    /**
     * 分页显示文章列表
     * @param pageNow
     * @param pageSize
     * @return
     */
    public List<Article> findAll(@Param("pageNow") int pageNow, @Param("pageSize") int pageSize);

    /**
     * 根据id获取某篇文章
     * @param id
     * @return
     */
    public Article findArticleById(Integer id);
    /**
     * 获取热门文章
     * @return
     */
    public List<Article> getHotArticle();

    /**
     * 发布新文章
     * @return
     */
    public boolean addArticle(Article article);

    /**
     * 跟新文章浏览数
     * @param id
     */
    public void updateBrows(Integer id);

    /**
     * 跟新文章评论数
     * @param id update posts set comments=comments+1 where id=?
     */
    public void updateCommonts(Integer id);
}

