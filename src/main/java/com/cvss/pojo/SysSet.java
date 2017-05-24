package com.cvss.pojo;

public class SysSet {
    private String sysLogo;

    private String sysTitle;

    private String sysMc;

    private String sysOc;

    private String companyName;

    public String getSysLogo() {
        return sysLogo;
    }

    public void setSysLogo(String sysLogo) {
        this.sysLogo = sysLogo == null ? null : sysLogo.trim();
    }

    public String getSysTitle() {
        return sysTitle;
    }

    public void setSysTitle(String sysTitle) {
        this.sysTitle = sysTitle == null ? null : sysTitle.trim();
    }

    public String getSysMc() {
        return sysMc;
    }

    public void setSysMc(String sysMc) {
        this.sysMc = sysMc == null ? null : sysMc.trim();
    }

    public String getSysOc() {
        return sysOc;
    }

    public void setSysOc(String sysOc) {
        this.sysOc = sysOc == null ? null : sysOc.trim();
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName == null ? null : companyName.trim();
    }

    @Override
    public String toString() {
        return "SysSet{" +
                "sysLogo='" + sysLogo + '\'' +
                ", sysTitle='" + sysTitle + '\'' +
                ", sysMc='" + sysMc + '\'' +
                ", sysOc='" + sysOc + '\'' +
                ", companyName='" + companyName + '\'' +
                '}';
    }
}