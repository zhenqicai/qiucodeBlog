package cn.qiucode.entity.vo;

/**
 * Created by wuming on 2018/8/19.
 */
public class RequestMessageParam {

    private Integer articleId;//文章id
    private String content;//评论该文章的内容
    private String nickname;//评论者昵称
    private String email;//评论者邮箱
    private String param;//额外参数  包括pid replyId  replyNickName

    public Integer getArticleId() {
        return articleId;
    }

    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getParam() {
        return param;
    }

    public void setParam(String param) {
        this.param = param;
    }
}
