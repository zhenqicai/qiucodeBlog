package cn.qiucode.dao;


import cn.qiucode.entity.Message;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by wuming on 2018/8/13.
 */
@Mapper
public interface MessageDao {

    /**
     * 新增一条评论或留言
     * @param message
     * @return
     */
    public boolean insertMessage(Message message);

    /**
     * 查询该文章下的所有评论 或 所有留言的总数
     * @param articleId
     * @return
     */
    public int findMmessageCount(@Param("articleId") Integer articleId);

    public List<Message> findAllMessage(@Param("articleId") Integer articleId, @Param("pageNow") int pageNow, @Param("pageSize") int pageSize);

    /**
     * 查找该评论下的所有子评论
     * @param pId
     * @return
     */
    public List<Message> findChildrenMessage(@Param("pId") Integer pId);
}
