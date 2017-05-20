package com.cvss.mapper;

import com.cvss.pojo.SysMenu;
import com.cvss.pojo.SysMenuAllot;

import java.util.List;

/**
 * 菜单数据库映射接口
 * Created by yufeng.liu on 2017-05-19.
 */
public interface SysMenuAllotMapper {

    int insertAllot(SysMenuAllot record);

    int updateAllot(SysMenuAllot record);

    SysMenuAllot selectAllotByRoleName(String roleName);
}
