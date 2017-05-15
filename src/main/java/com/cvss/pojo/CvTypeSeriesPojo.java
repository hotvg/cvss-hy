package com.cvss.pojo;

public class CvTypeSeriesPojo extends BasePojo{
    private Integer seriesId;

    private String seriesName;

    private CvType typeId;

    public Integer getSeriesId() {
        return seriesId;
    }

    public void setSeriesId(Integer seriesId) {
        this.seriesId = seriesId;
    }

    public String getSeriesName() {
        return seriesName;
    }

    public void setSeriesName(String seriesName) {
        this.seriesName = seriesName;
    }

    public CvType getTypeId() {
        return typeId;
    }

    public void setTypeId(CvType typeId) {
        this.typeId = typeId;
    }

    @Override
    public String toString() {
        return "CvTypeSeriesPojo{" +
                "seriesId=" + seriesId +
                ", seriesName='" + seriesName + '\'' +
                ", typeId=" + typeId +
                '}';
    }
}