package com.cvss.service;

import com.cvss.pojo.SysSet;

/**
 * 系统设置service接口
 * Created by yufeng.liu on 2017-05-19.
 */
public interface ISetService {
    int insertSysSet(SysSet record);
    int updateSysSet(SysSet record);
    SysSet selectSysSet();
}
