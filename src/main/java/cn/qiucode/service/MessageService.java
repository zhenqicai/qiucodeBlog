package cn.qiucode.service;


import cn.qiucode.entity.Message;
import cn.qiucode.utils.Page;

/**
 * Created by wuming on 2018/8/13.
 */
public interface MessageService {

    /**
     * 查找某文章下的评论数
     * @param id
     * @return
     */
    public int findMmessageCount(Integer id);

    @Deprecated
    public boolean addMessage(Message message);

    /**
     * 以分页形式显示文章的评论列表或留言列表
     * @param pageNow
     * @param pageSize
     * @return
     */
    @Deprecated
    public Page<Message> findAll(Integer articleId, Integer pageNow, Integer pageSize);

    /**
     * 用于添加文章评论
     * @param message
     * @return
     */
    public boolean addArticleMessage(Message message);

    /**
     * 用于添加留言
     * @param message
     * @return
     */
    public boolean addLevelMessage(Message message);

    /**
     * 用于查找某篇文章下的所有评论  并分页
     * @param articleId
     * @param pageNow
     * @param pageSize
     * @return
     */
    public Page<Message> findArticleMessageAll(Integer articleId, Integer pageNow, Integer pageSize);

    /**
     * 用于查找所有留言  并分页
     * @param pageNow
     * @param pageSize
     * @return
     */
    public Page<Message> findLevelMessageAll(Integer pageNow, Integer pageSize);

}
