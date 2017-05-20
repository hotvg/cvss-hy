package com.cvss.pojo;

import java.util.Date;

public class CvSettlementUserPojo {
    private Integer settlementId;

    private String internalModels;

    private String partsJson;

    private SysUser sysUser;

    private Long totalPrice;

    private Date createTime;

    public Integer getSettlementId() {
        return settlementId;
    }

    public void setSettlementId(Integer settlementId) {
        this.settlementId = settlementId;
    }

    public String getInternalModels() {
        return internalModels;
    }

    public void setInternalModels(String internalModels) {
        this.internalModels = internalModels;
    }

    public String getPartsJson() {
        return partsJson;
    }

    public void setPartsJson(String partsJson) {
        this.partsJson = partsJson;
    }

    public SysUser getSysUser() {
        return sysUser;
    }

    public void setSysUser(SysUser sysUser) {
        this.sysUser = sysUser;
    }

    public Long getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Long totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}