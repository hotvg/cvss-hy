package com.cvss.controller;

import com.cvss.pojo.SysUser;
import com.cvss.util.VerifyCodeUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;

/**
 * Created by yufeng.liu on 2017-03-23.
 */

@Controller
public class PageController {

    private  String verifyCode;

    /**
     * 展示首页
     * @return index.html
     */
    @RequestMapping(value = "/")
    public String showIndex(HttpServletRequest request, Model model) {
        SysUser sysUser = (SysUser)request.getSession().getAttribute("sysUser");
        model.addAttribute("username",sysUser.getUserName());
        return "index";
    }

    /**
     * 页面返回
     * @param page
     * @return
     */
    @RequestMapping(value = "/{page}")
    public String showPage(@PathVariable String page){
        return page;
    }

    /**
     * 页面返回
     * @param page
     * @return
     */
    @RequestMapping(value = "/include/{page}")
    public String showIncludePage(@PathVariable String page){
        return "include/"+page;
    }

    /**
     * 验证码
     * @param response
     */
    @RequestMapping(value = "/verifyCodeImg")
    public void showVerifyCodeImg(HttpServletResponse response){
        try {
            response.setContentType("image/jpg");
            OutputStream outputStream = response.getOutputStream();
            outputStream.write(VerifyCodeUtil.outPutImage(95,32,4));

            verifyCode = VerifyCodeUtil.getVerifyCode();

            outputStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/verifyCode")
    @ResponseBody
    public String showVerifyCode(){
        return verifyCode;
    }
}
