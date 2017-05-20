package com.cvss.mapper;

import com.cvss.pojo.SysUser;

import java.util.List;

public interface SysUserMapper extends BaseMapper<SysUser>{

    int batchInsertUser(List<SysUser> recordList);
    int batchDeleteUser(List<Integer> idList);
    int batchUpdateUser(List<SysUser> recordList);

}