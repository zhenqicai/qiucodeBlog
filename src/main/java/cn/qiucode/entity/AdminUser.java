package cn.qiucode.entity;

import java.io.Serializable;

/**
 * Created by wuming on 2018/8/25.
 */
public class AdminUser implements Serializable {

    private Integer id;
    private String username;//后台管理员名称
    private String password;//后台管理员密码
    private String faceurl;//后台管理员头像图片地址
    private String email;//后台管理员邮箱
    private Integer status;//状态
    private String remark;//备注

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFaceurl() {
        return faceurl;
    }

    public void setFaceurl(String faceurl) {
        this.faceurl = faceurl;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
