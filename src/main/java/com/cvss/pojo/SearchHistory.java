package com.cvss.pojo;

import java.util.Date;

public class SearchHistory {
    private Integer searchId;

    private String internalModels;

    private Integer userId;

    private Date createTime;

    public Integer getSearchId() {
        return searchId;
    }

    public void setSearchId(Integer searchId) {
        this.searchId = searchId;
    }

    public String getInternalModels() {
        return internalModels;
    }

    public void setInternalModels(String internalModels) {
        this.internalModels = internalModels;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}