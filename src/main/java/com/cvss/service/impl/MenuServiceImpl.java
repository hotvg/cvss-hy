package com.cvss.service.impl;

import com.cvss.mapper.SysMenuAllotMapper;
import com.cvss.mapper.SysMenuMapper;
import com.cvss.pojo.SysMenu;
import com.cvss.pojo.SysMenuAllot;
import com.cvss.service.IMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 菜单service接口实现类
 * Created by yufeng.liu on 2017-05-19.
 */
@Service
public class MenuServiceImpl implements IMenuService{


    @Autowired
    private SysMenuAllotMapper sysMenuAllotMapper;
    @Autowired
    private SysMenuMapper sysMenuMapper;

    @Override
    public int insertSysMenu(SysMenu record) {
        return this.sysMenuMapper.insertSysMenu(record);
    }

    @Override
    public int batchInsertSysMenu(List<SysMenu> listRecord) {
        return this.sysMenuMapper.batchInsertSysMenu(listRecord);
    }

    @Override
    public int deleteSysMenu(Integer id) {
        return this.sysMenuMapper.deleteSysMenu(id);
    }

    @Override
    public int batchDeleteSysMenu(List<Integer> listId) {
        return this.sysMenuMapper.batchDeleteSysMenu(listId);
    }

    @Override
    public int updateSysMenu(SysMenu record) {
        return this.sysMenuMapper.updateSysMenu(record);
    }

    @Override
    public int batchUpdateSysMenu(List<SysMenu> listRecord) {
        return this.sysMenuMapper.batchUpdateSysMenu(listRecord);
    }

    @Override
    public List<SysMenu> selectAllSysMenu(SysMenu record) {
        return this.sysMenuMapper.selectAllSysMenu(record);
    }

    @Override
    public int insertAllot(SysMenuAllot record) {
        return this.sysMenuAllotMapper.insertAllot(record);
    }

    @Override
    public int updateAllot(SysMenuAllot record) {
        return this.sysMenuAllotMapper.updateAllot(record);
    }

    @Override
    public SysMenuAllot selectAllotByRoleName(String roleName) {
        return this.sysMenuAllotMapper.selectAllotByRoleName(roleName);
    }
}
