package com.cvss.controller;

import com.cvss.pojo.SysUser;
import com.cvss.service.IMenuService;
import com.cvss.service.IUserService;
import com.cvss.util.GridUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 系统用户Controller类
 * Created by yufeng.liu on 2017-03-27.
 */
@Controller
@RequestMapping("/user")
public class UserController {

    private IUserService userService;
    @Autowired
    private IMenuService iMenuService;

    @Autowired
    @Qualifier("userService")
    public void setUserService(IUserService userService) {
        this.userService = userService;
    }

    /**
     * 登录
     * @param sysUser 用户
     * @param request HttpServletRequest
     * @return 返回是否成功
     */
    @RequestMapping("/login")
    @ResponseBody
    public String login(SysUser sysUser, HttpServletRequest request, Model model){
        sysUser = this.userService.selectOne(sysUser);
        if(sysUser!=null){
            request.getSession().setAttribute("sysUser",sysUser);
//            model.addAttribute('menuList',this.iMenuService.selectAllotByRoleName());
            return "success";
        }else{
            return "failure";
        }
    }

    /**
     * 新增角色
     * @param record 一条记录
     * @return 返回是否成功，true为成功
     */
    @RequestMapping(value = "/create")
    @ResponseBody
    public int createUser(@RequestBody SysUser record){
        return this.userService.insert(record);
    }

    /**
     * 批量新增角色
     * @param recordList 记录集合
     * @return 返回添加的条数
     */
    @RequestMapping(value = "/create/batch")
    @ResponseBody
    public int createMoreUser(@RequestBody List<SysUser> recordList){
        return this.userService.batchInsertUser(recordList);
    }

    /**
     * 删除角色
     * @param id 配件ID
     * @return 返回是否成功
     */
    @RequestMapping(value = "/destroy")
    @ResponseBody
    public int destroyUser(@RequestBody Integer id){
        return this.userService.deleteById(id);
    }

    /**
     * 批量删除角色
     * @param idList 配件集合
     * @return 返回受影响的行数
     */
    @RequestMapping(value = "/destroy/batch")
    @ResponseBody
    public int destroyMoreUser(@RequestBody  List<Integer> idList){
        return this.userService.batchDeleteUser(idList);
    }

    /**
     * 更改角色
     * @param record 一条记录
     * @return 返回是否成功
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public int updateUser(@RequestBody SysUser record){
        return this.userService.update(record);
    }

    /**
     * 批量更改角色
     * @param recordList 记录集合
     * @return 返回受影响的行数
     */
    @RequestMapping(value = "/update/batch")
    @ResponseBody
    public int updateMoreUser(@RequestBody List<SysUser> recordList){
        return this.userService.batchUpdateUser(recordList);
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
    public GridUtil readUser(SysUser record, int page, int pageSize){
        PageHelper.startPage(page,pageSize);
        List<SysUser> list =  this.userService.selectAllO(record);
        PageInfo<SysUser> pageInfo = new PageInfo<>(list);
        return new GridUtil<>(list,page,pageSize,pageInfo.getPages());
    }

    @RequestMapping(value = "/sign-out")
    @ResponseBody
    public boolean signOut(HttpServletRequest request){
        request.getSession().setAttribute("sysUser",null);
        return true;
    }

}
