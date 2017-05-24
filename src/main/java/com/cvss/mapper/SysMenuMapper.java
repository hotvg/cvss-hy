package com.cvss.mapper;

import com.cvss.pojo.SysMenu;
import com.cvss.pojo.SysMenuPojo;

import java.util.List;

/**
 * 菜单数据库映射接口
 * Created by yufeng.liu on 2017-05-19.
 */
public interface SysMenuMapper {

    int insertSysMenu(SysMenu record);
    int batchInsertSysMenu(List<SysMenu> listRecord);

    int deleteSysMenu(Integer id);
    int batchDeleteSysMenu(List<Integer> listId);

    int updateSysMenu(SysMenu record);
    int batchUpdateSysMenu(List<SysMenu> listRecord);

    List<SysMenuPojo> selectAllSysMenu(SysMenu record);
}
