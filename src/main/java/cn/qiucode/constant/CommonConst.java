package cn.qiucode.constant;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by wuming on 2019/1/22.
 */
public class CommonConst {

    /**
     * user_session
     */
    public static final String USER_SESSION_KEY = "user_session";
    /**
     * 最大页码
     */
    public static final int MAX_PAGE = 100;
    /**
     * 所有设置选项
     */
    public static Map<String, String> OPTIONS = new HashMap<String, String>();
    /**
     * 所有菜单
     */
    //public static List<Menu> MENUS = new ArrayList<Menu>();
    /**
     * 主题
     */
    public static String THEME_NAME;

    /**
     * 同一IP三分钟以内重复访问同一篇文章只算一次
     */
    public static final Integer IP_REPEAT_TIME=180;

    /**
     * 同一IP30分钟以内只能评论一次哦
     */
    public static final Integer IP_REPEAT_MESSAGE_TIME=1800;

    /**
     * 点击次数超过多少更新到数据库
     */
    public static final int CLICK_EXCEED = 10;

    /**
     * 对上传的图片添加水印对应的图片
     */
    public static final String WATER_WORD="qiucode.cn";
}
