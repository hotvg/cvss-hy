package com.cvss.service;

import com.cvss.pojo.SysUser;

import java.util.List;

/**
 * 用户service接口
 * Created by yufeng.liu on 2017-03-27.
 */
public interface IUserService extends IBaseService<SysUser> {
    int batchInsertUser(List<SysUser> recordList);
    int batchDeleteUser(List<Integer> idList);
    int batchUpdateUser(List<SysUser> recordList);
}
