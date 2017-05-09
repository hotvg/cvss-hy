package com.cvss.pojo;

public class CvPartsReplacePojo extends BasePojo{
    private Integer replaceId;

    private CvParts replaceBefore;

    private CvParts replaceAfter;

    private String unit;

    private Long taxPrice;

    private String remarks;

    private Integer typeId;

    public Integer getReplaceId() {
        return replaceId;
    }

    public void setReplaceId(Integer replaceId) {
        this.replaceId = replaceId;
    }

    public CvParts getReplaceBefore() {
        return replaceBefore;
    }

    public void setReplaceBefore(CvParts replaceBefore) {
        this.replaceBefore = replaceBefore;
    }

    public CvParts getReplaceAfter() {
        return replaceAfter;
    }

    public void setReplaceAfter(CvParts replaceAfter) {
        this.replaceAfter = replaceAfter;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit == null ? null : unit.trim();
    }

    public Long getTaxPrice() {
        return taxPrice;
    }

    public void setTaxPrice(Long taxPrice) {
        this.taxPrice = taxPrice;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }
}