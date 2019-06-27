package cn.qiucode.entity;

import java.io.Serializable;
import java.util.List;

/**
 * Created by wuming on 2018/8/26.
 */
public class Menu implements Serializable {

    private Integer id;
    //private String name;//菜单url  # 表示顶级
    private String href;//菜单url  # 表示顶级
    private String hrefName;
    //private String title;//菜单名称
    private String name;//菜单名称
    private Integer type;
    private Integer status;//状态
    //private String statusName;//用于显示在页面  1 正常 0 禁止
    private String css;//菜单样式
    private Integer pid;//父id
    private Integer sort;//排序
    private Long createTime;
    private Long updateTime;
    private String remark;

    private String menu_name;
    private String pname;//父菜单名称

    private List<Menu> children;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        href="javascript:;";
        this.href = href;
    }

    public String getHrefName() {
        return hrefName;
    }

    public void setHrefName(String hrefName) {
        this.hrefName = hrefName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    /*public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        if(getStatus()==1)
            statusName="正常";
        else
            statusName="禁止";
        this.statusName = statusName;
    }*/

    public String getCss() {
        return css;
    }

    public void setCss(String css) {
        this.css = css;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public Long getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Long createTime) {
        this.createTime = createTime;
    }

    public Long getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Long updateTime) {
        this.updateTime = updateTime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getMenu_name() {
        return menu_name;
    }

    public void setMenu_name(String menu_name) {
        this.menu_name = menu_name;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public List<Menu> getChildren() {
        return children;
    }

    public void setChildren(List<Menu> children) {
        this.children = children;
    }
}
