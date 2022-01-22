# qiucodeBlog个人博客

#### 介绍
一个基于Springboot2.x的个人博客,ORM框架使用的是Mybatis，前端渲染模板引擎使用的是Freemarker，前端UI框架使用的是Layui，数据库使用的是Mysql5.6.x，图片存储在阿里云OSS上，全文搜索引擎使用Luncene。鄙人小站：[https://www.qiucode.cn/](https://www.qiucode.cn/) 
![输入图片说明](https://images.gitee.com/uploads/images/2019/0627/210847_c34f2ffd_419732.jpeg "niwozazhikan.jpg")
微信搜索： qiucode 或直接扫码 关注笔者的公众号

##### 首页
![输入图片说明](https://images.gitee.com/uploads/images/2019/0627/204135_17e36af9_419732.png "abcd.png")
##### 文章详情页
![输入图片说明](https://images.gitee.com/uploads/images/2019/0627/204333_dcb1a9a8_419732.png "dcba.png")
##### 时间轴
![输入图片说明](https://images.gitee.com/uploads/images/2019/0627/204454_8b9ef161_419732.png "af.png")
##### 网站留言
![输入图片说明](https://images.gitee.com/uploads/images/2019/0627/204622_34a818d1_419732.png "fa.png")
##### 后台登录   账号 admin 密码 123456 （别想多了，这是部署到你本地数据库的数据初始值，笔者的站点可不是这个密码哟）
![输入图片说明](https://images.gitee.com/uploads/images/2019/0627/212159_0948dcbb_419732.png "ht.png")
##### 发布文章
![输入图片说明](https://images.gitee.com/uploads/images/2019/0627/212449_8e56d9a0_419732.png "th.png")
#### 软件架构
> 后端方面概览
JDK版本： jdk1.7+
后端框架： Springboot2.x Mybatis 
模板渲染框架： Freemarker
数据库： Mysql5.6.x
全文搜索引擎： Luncene
图片存储OSS: 阿里云OSS

> 前端方面概览
界面UI: Layui（Layui整合JQuery，虽说JQuery有被逐渐替代）


#### 安装教程

1. 在本地Mysql创建qiucodeblog库，而后导入qiucodeblog,sql脚本即可
2. 使用IDEA或eclipse等IDE编辑器导入qiucodeBlog项目。
3. 本地运行可将cn.qiucode.controller.MessageController类的addMessage（）方法中调用asyncSendMail()注释起来，这是评论时发送邮箱提醒，
   同样是在该包下的ArticcleController类的upload（）方法（用于在后台管理系统发布文章时上传图片到阿里云OSS）可将相应的注释打开和阿里云OSS 
   相关的注释起来！我相信很少有人会详细把它看完！



#### 参与贡献

1. Fork 本仓库
2. 新建 Feat_xxx 分支
3. 提交代码
4. 新建 Pull Request

