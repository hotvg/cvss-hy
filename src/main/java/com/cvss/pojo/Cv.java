package com.cvss.pojo;

import java.math.BigDecimal;

public class Cv{
    private Integer cvId;

    private String internalModels;

    private String externalModels;

    private Integer seriesId;

    private BigDecimal retailPrice;

    private Integer parts1;

    private Integer parts2;

    private Integer parts3;

    private Integer parts4;

    private Integer parts5;

    private Integer parts6;

    private Integer parts7;

    private Integer parts8;

    private Integer parts9;

    public Integer getCvId() {
        return cvId;
    }

    public void setCvId(Integer cvId) {
        this.cvId = cvId;
    }

    public String getInternalModels() {
        return internalModels;
    }

    public void setInternalModels(String internalModels) {
        this.internalModels = internalModels == null ? null : internalModels.trim();
    }

    public String getExternalModels() {
        return externalModels;
    }

    public void setExternalModels(String externalModels) {
        this.externalModels = externalModels == null ? null : externalModels.trim();
    }

    public Integer getSeriesId() {
        return seriesId;
    }

    public void setSeriesId(Integer seriesId) {
        this.seriesId = seriesId;
    }

    public BigDecimal getRetailPrice() {
        return retailPrice;
    }

    public void setRetailPrice(BigDecimal retailPrice) {
        this.retailPrice = retailPrice;
    }

    public Integer getParts1() {
        return parts1;
    }

    public void setParts1(Integer parts1) {
        this.parts1 = parts1;
    }

    public Integer getParts2() {
        return parts2;
    }

    public void setParts2(Integer parts2) {
        this.parts2 = parts2;
    }

    public Integer getParts3() {
        return parts3;
    }

    public void setParts3(Integer parts3) {
        this.parts3 = parts3;
    }

    public Integer getParts4() {
        return parts4;
    }

    public void setParts4(Integer parts4) {
        this.parts4 = parts4;
    }

    public Integer getParts5() {
        return parts5;
    }

    public void setParts5(Integer parts5) {
        this.parts5 = parts5;
    }

    public Integer getParts6() {
        return parts6;
    }

    public void setParts6(Integer parts6) {
        this.parts6 = parts6;
    }

    public Integer getParts7() {
        return parts7;
    }

    public void setParts7(Integer parts7) {
        this.parts7 = parts7;
    }

    public Integer getParts8() {
        return parts8;
    }

    public void setParts8(Integer parts8) {
        this.parts8 = parts8;
    }

    public Integer getParts9() {
        return parts9;
    }

    public void setParts9(Integer parts9) {
        this.parts9 = parts9;
    }
}