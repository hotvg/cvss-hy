package com.cvss.mapper;

import com.cvss.pojo.SysSet;

import java.util.List;

/**
 * 系统设置数据库映射接口
 * Created by yufeng.liu on 2017-05-19.
 */
public interface SysSetMapper {
    int insertSysSet(SysSet record);
    int updateSysSet(SysSet record);
    SysSet selectSysSet();
}
