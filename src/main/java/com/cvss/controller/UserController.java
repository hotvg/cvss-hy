package com.cvss.controller;

import com.cvss.pojo.SysUser;
import com.cvss.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by yufeng.liu on 2017-03-27.
 */
@Controller
@RequestMapping("/user")
public class UserController {

    private IUserService userService;

    @Autowired
    @Qualifier("userService")
    public void setUserService(IUserService userService) {
        this.userService = userService;
    }

    /**
     * 登录
     * @param sysUser
     * @param request
     * @return 有用户，返回true
     */
    @RequestMapping("/login")
    @ResponseBody
    public String login(SysUser sysUser, HttpServletRequest request){
        sysUser = this.userService.selectOne(sysUser);
        if(sysUser!=null){
            request.getSession().setAttribute("sysUser",sysUser);
            return "success";
        }else{
            return "failure";
        }
    }

}
