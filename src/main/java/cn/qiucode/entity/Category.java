package cn.qiucode.entity;

import java.io.Serializable;

/**
 * Created by wuming on 2019/4/23.
 */
public class Category implements Serializable {

    private Integer id;
    private String name;//分类名称

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
