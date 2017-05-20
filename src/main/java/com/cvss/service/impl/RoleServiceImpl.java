package com.cvss.service.impl;

import com.cvss.mapper.SysRoleMapper;
import com.cvss.pojo.SysRole;
import com.cvss.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 角色service接口实现类
 * Created by yufeng.liu on 2017-05-19.
 */
@Service
public class RoleServiceImpl implements IRoleService {

    @Autowired
    private SysRoleMapper sysRoleMapper;

    @Override
    public int insert(SysRole record) {
        return this.sysRoleMapper.insert(record);
    }

    @Override
    public int deleteById(Integer id) {
        return this.sysRoleMapper.deleteById(id);
    }

    @Override
    public int deleteByRecord(SysRole record) {
        return this.sysRoleMapper.deleteByRecord(record);
    }

    @Override
    public int update(SysRole record) {
        return this.sysRoleMapper.update(record);
    }

    @Override
    public SysRole selectOne(SysRole record) {
        return this.sysRoleMapper.selectOne(record).get(0);
    }

    @Override
    public List<SysRole> selectAll() {
        return this.sysRoleMapper.selectAll();
    }

    @Override
    public List<SysRole> selectAllO(SysRole record) {
        return this.sysRoleMapper.selectAllO(record);
    }

    @Override
    public int batchInsertRole(List<SysRole> recordList) {
        return this.sysRoleMapper.batchInsertRole(recordList);
    }

    @Override
    public int batchDeleteRole(List<Integer> idList) {
        return this.sysRoleMapper.batchDeleteRole(idList);
    }

    @Override
    public int batchUpdateRole(List<SysRole> recordList) {
        return this.sysRoleMapper.batchUpdateRole(recordList);
    }
}
