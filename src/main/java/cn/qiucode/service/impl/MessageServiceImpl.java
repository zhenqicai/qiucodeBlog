package cn.qiucode.service.impl;


import cn.qiucode.dao.MessageDao;
import cn.qiucode.entity.Message;
import cn.qiucode.service.MessageService;
import cn.qiucode.utils.Page;
import cn.qiucode.utils.RelativeDateFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.Caching;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by wuming on 2018/8/13.
 */
@Service("messageService")
public class MessageServiceImpl implements MessageService {

    @Autowired
    private MessageDao messageDao;
    //@Override

    /*@Caching(put = {
            @CachePut(value = "messagesList",
                    //key="'msgList'",
                    condition = "#message.articleId==null"),
            @CachePut(value = "articleMmessagesList",
                    //key="T(String).valueOf(#message.articleId).concat('-articleMessage')",
                    condition = "#message.articleId!=null")
    })*/
    @Caching(evict = {
            @CacheEvict(value = "messagesList",condition = "#message.articleId==null",key="1"),
            @CacheEvict(value = "articleMmessagesList",condition = "#message.articleId!=null",key="1")
    })
    @Deprecated
    public boolean addMessage(Message message) {

        return messageDao.insertMessage(message);
    }

    //@Override
    /*@Cacheable(cacheNames = "messagesList",
            key="T(String).valueOf(#pageNow).concat('-').concat(T(String).valueOf(#pageSize))")*/
    @Caching(cacheable = {
            @Cacheable(value = "messagesList",
                    //key="T(String).valueOf(#pageNow).concat('-').concat(T(String).valueOf(#pageSize))",
                   // key="'msgList'",
                    condition = "#articleId==null",
                    key="1"),
            @Cacheable(value = "articleMmessagesList",
                    //key="T(String).valueOf(#articleId).concat('-').concat(T(String).valueOf(#pageNow)).concat('-').concat(T(String).valueOf(#pageSize))",
                    //key="T(String).valueOf(#articleId).concat('-articleMessage')",
                    condition = "#articleId!=null",
                    key="1")
    })
    @Deprecated
    public Page<Message> findAll(Integer articleId, Integer pageNow, Integer pageSize) {
        int startLimit=(pageNow-1)*pageSize;
        List<Message> msgs=messageDao.findAllMessage(articleId,startLimit,pageSize);
        List<Message> children=null;
        if(null!=msgs){
            for(Message msg : msgs){
                msg.setCreateAt(RelativeDateFormat.showTime(msg.getCreateTime()));
                children=messageDao.findChildrenMessage(msg.getId());
                if(null!=children){
                    for(Message child : children){
                        child.setCreateAt(RelativeDateFormat.showTime(child.getCreateTime()));
                    }
                }
                msg.setChildren(children);
            }
        }
        int totalCount=messageDao.findMmessageCount(articleId);//msgs.size();//
        int totalPage=(totalCount % pageSize == 0) ? (totalCount/pageSize) : (totalCount/pageSize)+1;

       /* List<Tag> tags=new ArrayList<Tag>();
        for(Article art : arts){
            System.out.println(art.getTags());
            tags=tagDao.findByIds(art.getTags());
            art.setTaglist(tags);
        }*/
        Page<Message> page=new Page<Message>();
        page.setData(msgs);
        page.setTotalPage(totalPage);
        page.setCurrentPage(pageNow);
        /*page.setPageCount(totalPage);
        page.setPageNum(pageNow);*/
        return page;
    }

    @Override
    public int findMmessageCount(Integer id) {
        return messageDao.findMmessageCount(id);
    }


    @Override
    //@CachePut(value = "articleMmessagesList",key="T(String).valueOf(#message.articleId).concat('-articleMessage')")
    @CacheEvict(value = "articleMmessagesList", allEntries = true, beforeInvocation = true)
    public boolean addArticleMessage(Message message) {
        return messageDao.insertMessage(message);
    }

    @Override
    //@CachePut(value = "messagesList",key="#message")
    @CacheEvict(value = "messagesList", allEntries = true, beforeInvocation = true)
    public boolean addLevelMessage(Message message) {
        return messageDao.insertMessage(message);
    }

    @Override
    @Cacheable(cacheNames = "articleMmessagesList",key="T(String).valueOf(#articleId).concat('-').concat(T(String).valueOf(#pageNow)).concat('-').concat(T(String).valueOf(#pageSize))")
    public Page<Message> findArticleMessageAll(Integer articleId, Integer pageNow, Integer pageSize) {
        int startLimit=(pageNow-1)*pageSize;
        List<Message> msgs=messageDao.findAllMessage(articleId,startLimit,pageSize);
        List<Message> children=null;
        if(null!=msgs){
            for(Message msg : msgs){
                msg.setCreateAt(RelativeDateFormat.showTime(msg.getCreateTime()));
                children=messageDao.findChildrenMessage(msg.getId());
                if(null!=children){
                    for(Message child : children){
                        child.setCreateAt(RelativeDateFormat.showTime(child.getCreateTime()));
                    }
                }
                msg.setChildren(children);
            }
        }
        int totalCount=msgs.size();//messageDao.findMmessageCount(articleId);//msgs.size();//
        int totalPage=(totalCount % pageSize == 0) ? (totalCount/pageSize) : (totalCount/pageSize)+1;

       /* List<Tag> tags=new ArrayList<Tag>();
        for(Article art : arts){
            System.out.println(art.getTags());
            tags=tagDao.findByIds(art.getTags());
            art.setTaglist(tags);
        }*/
        Page<Message> page=new Page<Message>();
        page.setData(msgs);
        page.setTotalPage(totalPage);
        page.setCurrentPage(pageNow);
        /*page.setPageCount(totalPage);
        page.setPageNum(pageNow);*/
        return page;
    }

    @Override
    @Cacheable(cacheNames = "messagesList",
            key="T(String).valueOf(#pageNow).concat('-').concat(T(String).valueOf(#pageSize))")
    public Page<Message> findLevelMessageAll(Integer pageNow, Integer pageSize) {
        int startLimit=(pageNow-1)*pageSize;
        List<Message> msgs=messageDao.findAllMessage(null,startLimit,pageSize);
        List<Message> children=null;
        if(null!=msgs){
            for(Message msg : msgs){
                msg.setCreateAt(RelativeDateFormat.showTime(msg.getCreateTime()));
                children=messageDao.findChildrenMessage(msg.getId());
                if(null!=children){
                    for(Message child : children){
                        child.setCreateAt(RelativeDateFormat.showTime(child.getCreateTime()));
                    }
                }
                msg.setChildren(children);
            }
        }
        int totalCount=messageDao.findMmessageCount(null);//msgs.size();//
        int totalPage=(totalCount % pageSize == 0) ? (totalCount/pageSize) : (totalCount/pageSize)+1;

       /* List<Tag> tags=new ArrayList<Tag>();
        for(Article art : arts){
            System.out.println(art.getTags());
            tags=tagDao.findByIds(art.getTags());
            art.setTaglist(tags);
        }*/
        Page<Message> page=new Page<Message>();
        page.setData(msgs);
        page.setTotalPage(totalPage);
        page.setCurrentPage(pageNow);
        /*page.setPageCount(totalPage);
        page.setPageNum(pageNow);*/
        return page;
    }
}
