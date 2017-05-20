package com.cvss.service.impl;

import com.cvss.mapper.SysSetMapper;
import com.cvss.pojo.SysSet;
import com.cvss.service.ISetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 系统设置service接口实现类
 * Created by yufeng.liu on 2017-05-19.
 */
@Service
public class SetServiceImpl implements ISetService {

    @Autowired
    private SysSetMapper sysSetMapper;

    @Override
    public int insertSysSet(SysSet record) {
        return this.sysSetMapper.insertSysSet(record);
    }

    @Override
    public int updateSysSet(SysSet record) {
        return this.sysSetMapper.updateSysSet(record);
    }

    @Override
    public SysSet selectSysSet() {
        return this.sysSetMapper.selectSysSet();
    }
}
