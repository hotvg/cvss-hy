package com.cvss.service;

import com.cvss.pojo.SysMenu;
import com.cvss.pojo.SysMenuAllot;

import java.util.List;

/**
 * 功能service接口
 * Created by yufeng.liu on 2017-05-19.
 */
public interface IMenuService {
    int insertSysMenu(SysMenu record);
    int batchInsertSysMenu(List<SysMenu> listRecord);

    int deleteSysMenu(Integer id);
    int batchDeleteSysMenu(List<Integer> listId);

    int updateSysMenu(SysMenu record);
    int batchUpdateSysMenu(List<SysMenu> listRecord);

    List<SysMenu> selectAllSysMenu(SysMenu record);

    int insertAllot(SysMenuAllot record);

    int updateAllot(SysMenuAllot record);

    SysMenuAllot selectAllotByRoleName(String roleName);
}
