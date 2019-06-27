package cn.qiucode.service.impl;


import cn.qiucode.dao.CategoryDao;
import cn.qiucode.entity.Category;
import cn.qiucode.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by wuming on 2018/8/12.
 */
@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryDao categoryDao;
    @Override
    //@Cacheable(value = "categoryList")
    public List<Category> findAll() {
        return categoryDao.findAll();
    }
}
