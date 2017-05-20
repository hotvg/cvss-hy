package com.cvss.service.impl;

import com.cvss.mapper.SysUserMapper;
import com.cvss.pojo.SysUser;
import com.cvss.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 用户service接口实现类
 * Created by yufeng.liu on 2017-03-29.
 */
@Service("userService")
public class UserServiceImpl implements IUserService {

    @Autowired
    private SysUserMapper sysUserMapper;

    @Override
    public int insert(SysUser record) {
        return this.sysUserMapper.insert(record);
    }

    @Override
    public int deleteById(Integer id) {
        return this.sysUserMapper.deleteById(id);
    }

    @Override
    public int deleteByRecord(SysUser record) {
        return this.sysUserMapper.deleteByRecord(record);
    }

    @Override
    public int update(SysUser record) {
        return this.sysUserMapper.update(record);
    }

    @Override
    public SysUser selectOne(SysUser record) {
        List<SysUser> list = this.sysUserMapper.selectOne(record);
        if(list.size()>0){
            return list.get(0);
        }else {
            return null;
        }
    }

    @Override
    public List<SysUser> selectAll() {
        return this.sysUserMapper.selectAll();
    }

    @Override
    public List<SysUser> selectAllO(SysUser record) {
        return this.sysUserMapper.selectAllO(record);
    }

    @Override
    public int batchInsertUser(List<SysUser> recordList) {
        return this.sysUserMapper.batchInsertUser(recordList);
    }

    @Override
    public int batchDeleteUser(List<Integer> idList) {
        return this.sysUserMapper.batchDeleteUser(idList);
    }

    @Override
    public int batchUpdateUser(List<SysUser> recordList) {
        return this.sysUserMapper.batchUpdateUser(recordList);
    }
}
