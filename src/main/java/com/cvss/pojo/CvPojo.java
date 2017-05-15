package com.cvss.pojo;

import java.math.BigDecimal;

public class CvPojo extends BasePojo{
    private Integer cvId;

    private String internalModels;

    private String externalModels;

    private CvTypeSeries cvTypeSeries;

    private BigDecimal retailPrice;

    private CvParts cab;

    private CvParts gearbox;

    private CvParts drive;

    private String wheelBase;

    private CvParts tire;

    private CvParts engine;

    private CvParts flip;

    private CvParts mount;

    private CvParts bunkers;

    private String otherDescription;

    private BigDecimal tractiveTonnage;

    private String carSize;

    public CvTypeSeries getCvTypeSeries() {
        return cvTypeSeries;
    }

    public void setCvTypeSeries(CvTypeSeries cvTypeSeries) {
        this.cvTypeSeries = cvTypeSeries;
    }

    public CvParts getBunkers() {
        return bunkers;
    }

    public void setBunkers(CvParts bunkers) {
        this.bunkers = bunkers;
    }

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
        this.internalModels = internalModels;
    }

    public String getExternalModels() {
        return externalModels;
    }

    public void setExternalModels(String externalModels) {
        this.externalModels = externalModels;
    }

    public CvTypeSeries getSeriesId() {
        return cvTypeSeries;
    }

    public void setSeriesId(CvTypeSeries cvTypeSeries) {
        this.cvTypeSeries = cvTypeSeries;
    }

    public BigDecimal getRetailPrice() {
        return retailPrice;
    }

    public void setRetailPrice(BigDecimal retailPrice) {
        this.retailPrice = retailPrice;
    }

    public CvParts getCab() {
        return cab;
    }

    public void setCab(CvParts cab) {
        this.cab = cab;
    }

    public CvParts getGearbox() {
        return gearbox;
    }

    public void setGearbox(CvParts gearbox) {
        this.gearbox = gearbox;
    }

    public CvParts getDrive() {
        return drive;
    }

    public void setDrive(CvParts drive) {
        this.drive = drive;
    }

    public String getWheelBase() {
        return wheelBase;
    }

    public void setWheelBase(String wheelBase) {
        this.wheelBase = wheelBase;
    }

    public CvParts getTire() {
        return tire;
    }

    public void setTire(CvParts tire) {
        this.tire = tire;
    }

    public CvParts getEngine() {
        return engine;
    }

    public void setEngine(CvParts engine) {
        this.engine = engine;
    }

    public CvParts getFlip() {
        return flip;
    }

    public void setFlip(CvParts flip) {
        this.flip = flip;
    }

    public CvParts getMount() {
        return mount;
    }

    public void setMount(CvParts mount) {
        this.mount = mount;
    }

    public String getOtherDescription() {
        return otherDescription;
    }

    public void setOtherDescription(String otherDescription) {
        this.otherDescription = otherDescription;
    }

    public BigDecimal getTractiveTonnage() {
        return tractiveTonnage;
    }

    public void setTractiveTonnage(BigDecimal tractiveTonnage) {
        this.tractiveTonnage = tractiveTonnage;
    }

    public String getCarSize() {
        return carSize;
    }

    public void setCarSize(String carSize) {
        this.carSize = carSize;
    }

    @Override
    public String toString() {
        return "CvPojo{" +
                "cvId=" + cvId +
                ", internalModels='" + internalModels + '\'' +
                ", externalModels='" + externalModels + '\'' +
                ", cvTypeSeries=" + cvTypeSeries +
                ", retailPrice=" + retailPrice +
                ", cab=" + cab +
                ", gearbox=" + gearbox +
                ", drive=" + drive +
                ", wheelBase='" + wheelBase + '\'' +
                ", tire=" + tire +
                ", engine=" + engine +
                ", flip=" + flip +
                ", mount=" + mount +
                ", otherDescription='" + otherDescription + '\'' +
                ", tractiveTonnage=" + tractiveTonnage +
                ", carSize='" + carSize + '\'' +
                '}';
    }
}