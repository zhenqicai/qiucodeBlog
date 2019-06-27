package cn.qiucode.entity;

/**
 * Created by wuming on 2019/4/23.
 */
public class Tag {

    private Integer id;
    private String name;//标签名称
    private Integer articleNum;//标签的文章数

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

    public Integer getArticleNum() {
        return articleNum;
    }

    public void setArticleNum(Integer articleNum) {
        this.articleNum = articleNum;
    }
}

