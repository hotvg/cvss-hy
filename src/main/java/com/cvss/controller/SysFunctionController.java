package com.cvss.controller;

import com.cvss.pojo.*;
import com.cvss.service.IMenuService;
import com.cvss.util.GridUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 系统功能管理
 * Created by yufeng.liu on 2017-05-09.
 */
@Controller
@RequestMapping(value = "/sys/function")
public class SysFunctionController {

    @Autowired
    private IMenuService iMenuService;

    /**
     * 新增菜单
     * @param record 一条记录
     * @return 返回是否成功，true为成功
     */
    @RequestMapping(value = "/menu/create")
    @ResponseBody
    public int createMenu(@RequestBody SysMenu record){
        return this.iMenuService.insertSysMenu(record);
    }

    /**
     * 批量新增菜单
     * @param recordList 记录集合
     * @return 返回添加的条数
     */
    @RequestMapping(value = "/menu/create/batch")
    @ResponseBody
    public int createMoreMenu(@RequestBody List<SysMenu> recordList){
        return this.iMenuService.batchInsertSysMenu(recordList);
    }

    /**
     * 删除菜单
     * @param id 配件ID
     * @return 返回是否成功
     */
    @RequestMapping(value = "/menu/destroy")
    @ResponseBody
    public int destroySysMenu(@RequestBody Integer id){
        return this.iMenuService.deleteSysMenu(id);
    }

    /**
     * 批量删除菜单
     * @param idList 配件集合
     * @return 返回受影响的行数
     */
    @RequestMapping(value = "/menu/destroy/batch")
    @ResponseBody
    public int destroyMoreCv(@RequestBody  List<Integer> idList){
        return this.iMenuService.batchDeleteSysMenu(idList);
    }

    /**
     * 更改菜单
     * @param record 一条记录
     * @return 返回是否成功
     */
    @RequestMapping(value = "/menu/update")
    @ResponseBody
    public int updateSysMenu(@RequestBody SysMenu record){
        return this.iMenuService.updateSysMenu(record);
    }

    /**
     * 批量更改菜单
     * @param recordList 记录集合
     * @return 返回受影响的行数
     */
    @RequestMapping(value = "/menu/update/batch")
    @ResponseBody
    public int updateMoreSysMenu(@RequestBody List<SysMenu> recordList){
        return this.iMenuService.batchUpdateSysMenu(recordList);
    }

    /**
     * 记录菜单记录
     * @param record 可传参数
     * @param page 第几页
     * @param pageSize 每页大小
     * @return 返回grid数据
     */
    @RequestMapping(value = "/menu/read")
    @ResponseBody
    public GridUtil readSysMenu(SysMenu record, int page, int pageSize){
        PageHelper.startPage(page,pageSize);
        List<SysMenu> list =  this.iMenuService.selectAllSysMenu(record);
        PageInfo<SysMenu> pageInfo = new PageInfo<>(list);
        return new GridUtil<>(list,page,pageSize,pageInfo.getPages());
    }


    @RequestMapping(value = "/allot/create")
    @ResponseBody
    public int createAllot(@RequestBody SysMenuAllot sysMenuAllot){
        return this.iMenuService.insertAllot(sysMenuAllot);
    }

    @RequestMapping(value = "/allot/update")
    @ResponseBody
    public int updateAllot(@RequestBody SysMenuAllot sysMenuAllot){
        return this.iMenuService.updateAllot(sysMenuAllot);
    }

    @RequestMapping(value = "/allot/read")
    @ResponseBody
    public SysMenuAllot readAllot(HttpSession session){
        SysUser sysUser = (SysUser)session.getAttribute("sysUser");
        return this.iMenuService.selectAllotByRoleName(sysUser.getRoleCode());
    }
}
