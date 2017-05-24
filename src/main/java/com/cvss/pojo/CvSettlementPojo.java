package com.cvss.pojo;

import java.util.Date;

public class CvSettlementPojo {
    private Integer settlementId;

    private CvPojo cvPojo;

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

    public CvPojo getCvPojo() {
        return cvPojo;
    }

    public void setCvPojo(CvPojo cvPojo) {
        this.cvPojo = cvPojo;
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

    @Override
    public String toString() {
        return "CvSettlementPojo{" +
                "settlementId=" + settlementId +
                ", cvPojo=" + cvPojo +
                ", partsJson='" + partsJson + '\'' +
                ", sysUser=" + sysUser +
                ", totalPrice=" + totalPrice +
                ", createTime=" + createTime +
                '}';
    }
}