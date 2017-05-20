package com.cvss.service;

import com.cvss.pojo.SysRole;

import java.util.List;

/**
 * 角色service接口
 * Created by yufeng.liu on 2017-05-19.
 */
public interface IRoleService extends IBaseService<SysRole>{
    int batchInsertRole(List<SysRole> recordList);
    int batchDeleteRole(List<Integer> idList);
    int batchUpdateRole(List<SysRole> recordList);
}
