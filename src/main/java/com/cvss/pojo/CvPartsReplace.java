package com.cvss.pojo;

public class CvPartsReplace  extends BasePojo{
    private Integer replaceId;

    private Integer replaceBefore;

    private Integer replaceAfter;

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

    public Integer getReplaceBefore() {
        return replaceBefore;
    }

    public void setReplaceBefore(Integer replaceBefore) {
        this.replaceBefore = replaceBefore;
    }

    public Integer getReplaceAfter() {
        return replaceAfter;
    }

    public void setReplaceAfter(Integer replaceAfter) {
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