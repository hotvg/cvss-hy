package com.cvss.mapper;

import com.cvss.pojo.SysRole;
import com.cvss.pojo.SysUser;

import java.util.List;

/**
 * 角色
 * Created by yufeng.liu on 2017-05-19.
 */
public interface SysRoleMapper extends BaseMapper<SysRole> {

    int batchInsertRole(List<SysRole> recordList);
    int batchDeleteRole(List<Integer> idList);
    int batchUpdateRole(List<SysRole> recordList);

}
