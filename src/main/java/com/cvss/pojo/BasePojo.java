package com.cvss.pojo;

import java.util.Date;

/**
 * Created by yufeng.liu on 2017-04-07.
 */
public class BasePojo {

    private Date createTime;

    private Integer status;

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
