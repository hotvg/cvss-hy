package com.cvss.pojo;

/**
 * 功能分配实体类
 * Created by yufeng.liu on 2017-05-20.
 */
public class SysMenuAllot {
    private Integer allotId;
    private String menuJson;
    private SysRole sysRole;

    public Integer getAllotId() {
        return allotId;
    }

    public void setAllotId(Integer allotId) {
        this.allotId = allotId;
    }

    public String getMenuJson() {
        return menuJson;
    }

    public void setMenuJson(String menuJson) {
        this.menuJson = menuJson;
    }

    public SysRole getSysRole() {
        return sysRole;
    }

    public void setSysRole(SysRole sysRole) {
        this.sysRole = sysRole;
    }
}
