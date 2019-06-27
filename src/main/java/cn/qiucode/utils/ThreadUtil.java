package cn.qiucode.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

import java.util.concurrent.ThreadPoolExecutor;

/**
 * Created by qiuxingsong on 2019/1/28.
 */
public class ThreadUtil {
    private static ThreadPoolTaskExecutor poolTaskExecutor;

    private static final Logger logger = LoggerFactory.getLogger(ThreadUtil.class);
    static {
        init();
    }

    private ThreadUtil() {// 不允许实例化工具类
    }

    private static void init() {
        logger.info("初始化线程开始>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
        poolTaskExecutor = new ThreadPoolTaskExecutor();
        // 线程池所使用的缓冲队列
        poolTaskExecutor.setQueueCapacity(100);
        // 线程池维护线程的最少数量(核心线程数)
        poolTaskExecutor.setCorePoolSize(5);
        // 线程池维护线程的最大数量
        poolTaskExecutor.setMaxPoolSize(20);
        // 线程池维护线程所允许的空闲时间
        poolTaskExecutor.setKeepAliveSeconds(200);
        //对拒绝task的处理策略
        poolTaskExecutor.setRejectedExecutionHandler(new ThreadPoolExecutor.CallerRunsPolicy());
        poolTaskExecutor.initialize();
        logger.info("初始化线程结束>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    }

    /**
     * 执行线程
     *
     * @param runnable
     */
    public static void execute(Runnable runnable) {
        if (poolTaskExecutor == null) {
            init();
        }
        poolTaskExecutor.execute(runnable);
    }
}
