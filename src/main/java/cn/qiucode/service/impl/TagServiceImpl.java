package cn.qiucode.service.impl;


import cn.qiucode.dao.TagDao;
import cn.qiucode.entity.Tag;
import cn.qiucode.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by wuming on 2018/8/11.
 */
@Service("tagService")
public class TagServiceImpl implements TagService {

    @Autowired
    private TagDao tagDao;
    @Override
    //@Cacheable(value = "tagList")
    public List<Tag> findAll() {
        return tagDao.findAll();
    }

    @Override
    public String findTagByName(String name) {
        return tagDao.findTagByName(name);
    }

    @Override
    public void updateTagCount(String name) {
        tagDao.updateTagCount(name);
    }

    @Override
    public boolean saveTag(Tag tag) {
        return tagDao.saveTag(tag);
    }

    @Override
    public void saveTags(String tags) {
        String[] tagNameArray=tags.split(",");
        for (String name : tagNameArray) {
            String mTag=findTagByName(name);
            if(null==mTag){
                Tag tag=new Tag();
                tag.setName(name);
                tag.setArticleNum(1);
                saveTag(tag);
            }else{
                updateTagCount(name);
            }
        }
    }

    @Override
    public List<Tag> findByids(String tags) {
        return tagDao.findByIds(tags);
    }
}
