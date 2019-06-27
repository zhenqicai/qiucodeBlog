package cn.qiucode.service;

import cn.qiucode.entity.Tag;

import java.util.List;

/**
 * Created by wuming on 2019/4/23.
 */
public interface TagService {

    public void saveTags(String tags);
    public boolean saveTag(Tag tag);
    public List<Tag> findAll();

    public String findTagByName(String name);

    public void updateTagCount(String name);

    public List<Tag> findByids(String tags);
}
