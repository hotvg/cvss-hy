package com.cvss.controller;

import com.cvss.pojo.SysSet;
import com.cvss.service.ISetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 系统设置
 * Created by yufeng.liu on 2017-05-09.
 */
@Controller
@RequestMapping(value = "/sys/set")
public class SysSetController {

    @Autowired
    private ISetService iSetService;

    /**
     * 新增系统设置
     *
     * @param record 一条记录
     * @return 返回是否成功，true为成功
     */
    @RequestMapping(value = "/create")
    @ResponseBody
    public int createSysSet(@RequestBody SysSet record) {
        return this.iSetService.insertSysSet(record);
    }

    /**
     * 更改系统设置
     *
     * @param record 一条记录
     * @return 返回是否成功
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public int updateSysSet(@RequestBody SysSet record) {
        return this.iSetService.updateSysSet(record);
    }

    @RequestMapping(value = "/")
    public String showPage(){
        return null;
    }

}