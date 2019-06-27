package cn.qiucode.dao;

import cn.qiucode.entity.Tag;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

/**
 * Created by wuming on 2019/4/23.
 */
@Mapper
public interface TagDao {

    /**
     * 新增标签
     * @param tag
     * @return
     */
    public boolean saveTag(Tag tag);
    /**
     * 获取所有标签
     * @return
     */
    public List<Tag> findAll();

    /**
     * 根据标签名称查找标签
     * @param name
     * @return
     */
    public String findTagByName(String name);

    /**
     * 根据标签名称跟新标签的文章数
     * @param name
     */
    public void updateTagCount(String name);

    /**
     * 根据文章的标签id查出该文章的所有标签
     * @param tags
     * @return
     */
    public List<Tag> findByIds(String tags);
}

