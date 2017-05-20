package com.cvss.controller;

import com.cvss.pojo.*;
import com.cvss.service.IRoleService;
import com.cvss.util.GridUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 系统角色
 * Created by yufeng.liu on 2017-05-09.
 */
@Controller
@RequestMapping(value = "/role")
public class SysRoleController {
    
    @Autowired
    private IRoleService iRoleService;

    /**
     * 新增角色
     * @param record 一条记录
     * @return 返回是否成功，true为成功
     */
    @RequestMapping(value = "/create")
    @ResponseBody
    public int createRole(@RequestBody SysRole record){
        return this.iRoleService.insert(record);
    }

    /**
     * 批量新增角色
     * @param recordList 记录集合
     * @return 返回添加的条数
     */
    @RequestMapping(value = "/create/batch")
    @ResponseBody
    public int createMoreRole(@RequestBody List<SysRole> recordList){
        return this.iRoleService.batchInsertRole(recordList);
    }

    /**
     * 删除角色
     * @param id 配件ID
     * @return 返回是否成功
     */
    @RequestMapping(value = "/destroy")
    @ResponseBody
    public int destroyRole(@RequestBody Integer id){
        return this.iRoleService.deleteById(id);
    }

    /**
     * 批量删除角色
     * @param idList 配件集合
     * @return 返回受影响的行数
     */
    @RequestMapping(value = "/destroy/batch")
    @ResponseBody
    public int destroyMoreRole(@RequestBody  List<Integer> idList){
        return this.iRoleService.batchDeleteRole(idList);
    }

    /**
     * 更改角色
     * @param record 一条记录
     * @return 返回是否成功
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public int updateRole(@RequestBody SysRole record){
        return this.iRoleService.update(record);
    }

    /**
     * 批量更改角色
     * @param recordList 记录集合
     * @return 返回受影响的行数
     */
    @RequestMapping(value = "/update/batch")
    @ResponseBody
    public int updateMoreRole(@RequestBody List<SysRole> recordList){
        return this.iRoleService.batchUpdateRole(recordList);
    }

    /**
     * 记取角色记录
     * @param record 可传参数
     * @param page 第几页
     * @param pageSize 每页大小
     * @return 返回grid数据
     */
    @RequestMapping(value = "/read")
    @ResponseBody
    public GridUtil readRole(SysRole record, int page, int pageSize){
        PageHelper.startPage(page,pageSize);
        List<SysRole> list =  this.iRoleService.selectAllO(record);
        PageInfo<SysRole> pageInfo = new PageInfo<>(list);
        return new GridUtil<>(list,page,pageSize,pageInfo.getPages());
    }


}
