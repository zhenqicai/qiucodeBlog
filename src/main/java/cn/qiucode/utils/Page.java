package cn.qiucode.utils;

import java.io.Serializable;
import java.util.List;

/**
 * Created by wuming on 2019/4/23.
 */
public class Page<T> implements Serializable {


    //总的页数
    //private int pageCount;
    private int totalPage;
    //当前页
    //private int pageNum ;
    private int currentPage;

    //查询存储结果集
    private List<T> data;

    public Page() {
    }

    public Page(List<T> data, int totalPage) {
        this.data = data;
        this.totalPage = totalPage;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }
}

