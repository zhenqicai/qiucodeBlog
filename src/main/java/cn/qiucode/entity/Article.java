package cn.qiucode.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by wuming on 2019/4/23.
 */
public class Article implements Serializable {

    private Integer id;
    private String title;//文章标题
    private String content;//文章内容
    private String remark;//文章简介
    private Integer isTop;//文章是否置顶
    private Integer status;//是否草稿 0 草稿  1 发布
    private Integer isReprint;//是否原创  1 原创  2 转载
    private Long browsNum;//文章浏览数
    private Integer likeNum;//文章点赞数
    private Integer comments;//文章评论数
    private String tags;//文章标签列表
    private Integer typeid;//文章类型id
    private String author;//文章作者
    private Integer userId;//文章作者id
    private String coverImage;//文章缩略图
    private Date createTime;//文章创建时间
    private Date updateTime;//文章更新时间
    private Integer isRecommend;//文章是否推荐  0 不推荐  1 推荐  默认不推荐

    private String category;//分类名称
    private String isNew;//文章是否是新的
    private String createAt;//date类型转换成string

    private String cover_image;//文章缩略图 用于分享
    private Date create_time;//文章创建时间 后期将删除
    private Integer brows_num;//文章浏览数 后期将删除

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getIsTop() {
        return isTop;
    }

    public void setIsTop(Integer isTop) {
        this.isTop = isTop;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getIsReprint() {
        return isReprint;
    }

    public void setIsReprint(Integer isReprint) {
        this.isReprint = isReprint;
    }

    public Long getBrowsNum() {
        return browsNum;
    }

    public void setBrowsNum(Long browsNum) {
        this.browsNum = browsNum;
    }

    public Integer getLikeNum() {
        return likeNum;
    }

    public void setLikeNum(Integer likeNum) {
        this.likeNum = likeNum;
    }

    public Integer getComments() {
        return comments;
    }

    public void setComments(Integer comments) {
        this.comments = comments;
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public Integer getTypeid() {
        return typeid;
    }

    public void setTypeid(Integer typeid) {
        this.typeid = typeid;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getCoverImage() {
        return coverImage;
    }

    public void setCoverImage(String coverImage) {
        this.coverImage = coverImage;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Integer getIsRecommend() {
        return isRecommend;
    }

    public void setIsRecommend(Integer isRecommend) {
        this.isRecommend = isRecommend;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getIsNew() {
        return isNew;
    }

    public void setIsNew(String isNew) {
        this.isNew = isNew;
    }

    public String getCreateAt() {
        return createAt;
    }

    public void setCreateAt(String createAt) {
        this.createAt = createAt;
    }

    public String getCover_image() {
        return cover_image;
    }

    public void setCover_image(String cover_image) {
        this.cover_image = cover_image;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public Integer getBrows_num() {
        return brows_num;
    }

    public void setBrows_num(Integer brows_num) {
        this.brows_num = brows_num;
    }
}

