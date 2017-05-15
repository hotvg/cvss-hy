package com.cvss.pojo;

import java.math.BigDecimal;

/**
 * 商用车用于条件判断的pojo类
 * Created by yufeng.liu on 2017-05-15.
 */
public class CvConditionPojo extends Cv{

    private BigDecimal retailPriceLarge;

    private BigDecimal retailPriceSmall;

    private Integer typeId;

    public BigDecimal getRetailPriceLarge() {
        return retailPriceLarge;
    }

    public void setRetailPriceLarge(BigDecimal retailPriceLarge) {
        this.retailPriceLarge = retailPriceLarge;
    }

    public BigDecimal getRetailPriceSmall() {
        return retailPriceSmall;
    }

    public void setRetailPriceSmall(BigDecimal retailPriceSmall) {
        this.retailPriceSmall = retailPriceSmall;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    @Override
    public String toString() {
        return "CvConditionPojo{" +
                "retailPriceLarge=" + retailPriceLarge +
                ", retailPriceSmall=" + retailPriceSmall +
                ", typeId=" + typeId +
                '}';
    }
}
