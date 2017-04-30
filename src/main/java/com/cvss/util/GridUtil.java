package com.cvss.util;

import java.util.List;

/**
 * 用于给页面grid传数据
 * Created by yufeng.liu on 2017-04-26.
 */
public class GridUtil<T> {

    private List<T> data;

    private int page;

    private int pageSize;

    private int totalPage;

    public GridUtil(List<T> data, int page, int pageSize, int totalPage) {
        this.data = data;
        this.page = page;
        this.pageSize = pageSize;
        this.totalPage = totalPage;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }
}
