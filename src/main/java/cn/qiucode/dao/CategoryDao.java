package cn.qiucode.dao;

import cn.qiucode.entity.Category;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * Created by wuming on 2019/4/23.
 */
@Mapper
public interface CategoryDao {

    /**
     * 获取所有分类
     * @return
     */
    public List<Category> findAll();
}
