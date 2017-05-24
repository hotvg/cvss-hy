package com.cvss.controller;

import com.cvss.pojo.*;
import com.cvss.service.ISearchService;
import com.cvss.service.ISetService;
import com.cvss.service.ISettlementService;
import com.cvss.util.VerifyCodeUtil;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

/**
 * 页面Controller
 * Created by yufeng.liu on 2017-03-23.
 */

@Controller
public class PageController {

    private  String verifyCode;

    @Autowired
    private ISearchService iSearchService;
    @Autowired
    private ISettlementService iSettlementService;
    @Autowired
    private ISetService iSetService;

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

    @RequestMapping(value = "/login")
    public String showLogin(HttpSession session){
        SysSet sysSet = this.iSetService.selectSysSet();
        session.setAttribute("sysSet",sysSet);
        return "login";
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
     *
     * @return 首页
     */
    @RequestMapping(value = "/home-ftl")
    public String showHome(Model model,HttpServletRequest request){
        PageHelper.startPage(1,7);
        List<HotSearch> searchHotList = this.iSearchService.selectHotSearch();
        SysUser sysUser = (SysUser) request.getSession().getAttribute("sysUser");
        PageHelper.startPage(1,7);
        List<SearchHistory> searchLatelyList = this.iSearchService.selectLatelySearchByUserId(sysUser.getUserId());
        PageHelper.startPage(1,7);
        List<CvSettlementUserPojo> settlementsList = this.iSettlementService.selectAllByUserId(sysUser.getUserId());
        model.addAttribute("searchHotList",searchHotList);
        model.addAttribute("searchLatelyList",searchLatelyList);
        model.addAttribute("settlementsList",settlementsList);
        return "home";
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
     * 页面返回
     * @param page
     * @return
     */
    @RequestMapping(value = "/settlement/{page}")
    public String showSettlementPage(@PathVariable String page){
        return "settlement/"+page;
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
