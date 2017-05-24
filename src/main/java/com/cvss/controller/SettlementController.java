package com.cvss.controller;

import com.cvss.pojo.*;
import com.cvss.service.ISettlementService;
import com.cvss.util.GridUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 结算Controller类
 * Created by yufeng.liu on 2017-05-20.
 */
@Controller
@RequestMapping(value = "/settlement")
public class SettlementController {

    @Autowired
    private ISettlementService iSettlementService;

    @RequestMapping(value = "/create")
    @ResponseBody
    public int createSettlement(@RequestBody CvSettlement cvSettlement,HttpServletRequest request){
        SysUser sysUser = (SysUser)request.getSession().getAttribute("sysUser");
        cvSettlement.setUserId(sysUser.getUserId());
        return this.iSettlementService.inertSettlement(cvSettlement);
    }

    @RequestMapping(value = "/destroy")
    @ResponseBody
    public int destroySettlement(Integer id){
        return this.iSettlementService.deleteSettlement(id);
    }

    @RequestMapping(value = "/destroy/batch")
    @ResponseBody
    public int batchDestroySettlement(List<Integer> idList){
        return this.iSettlementService.batchDeleteSettlement(idList);
    }

    @RequestMapping(value = "/read")
    @ResponseBody
    public GridUtil<CvSettlementUserPojo> readSettlement(HttpServletRequest request, int page, int pageSize){
        PageHelper.startPage(page,pageSize);
        SysUser sysUser = (SysUser)request.getSession().getAttribute("sysUser");
        List<CvSettlementUserPojo> list;
        if(sysUser.getRoleCode().equals("ADMIN")){
            list =  this.iSettlementService.selectAll();
        }else{
            list =  this.iSettlementService.selectAllByUserId(sysUser.getUserId());
        }
        PageInfo<CvSettlementUserPojo> pageInfo = new PageInfo<>(list);
        return new GridUtil<>(list,page,pageSize,pageInfo.getPages());
    }

    @RequestMapping(value = "/read/hot")
    @ResponseBody
    public GridUtil readHotSearchAll(int page, int pageSize){
        PageHelper.startPage(page,pageSize);
        List<CvSettlementUserPojo> list = this.iSettlementService.selectHotSettlement();
        PageInfo<CvSettlementUserPojo> pageInfo = new PageInfo<>(list);
        return new GridUtil<>(list,page,pageSize,pageInfo.getPages());
    }

    @RequestMapping(value = "/read/lately")
    @ResponseBody
    public GridUtil readLatelySearchAll(HttpServletRequest request,int page, int pageSize){
        PageHelper.startPage(page,pageSize);
        SysUser sysUser = (SysUser)request.getSession().getAttribute("sysUser");
        List<CvSettlementUserPojo> list;
        if(sysUser.getRoleCode().equals("ADMIN")){
            list =  this.iSettlementService.selectLatelySettlement();
        }else{
            list =  this.iSettlementService.selectLatelySettlementByUserId(sysUser.getUserId());
        }
        PageInfo<CvSettlementUserPojo> pageInfo = new PageInfo<>(list);
        return new GridUtil<>(list,page,pageSize,pageInfo.getPages());
    }

    @RequestMapping(value = "/read/info")
    public String readInfo(Integer settlementId, Model model){
        CvSettlementPojo cvSettlementPojo = this.iSettlementService.selectInfo(settlementId);
        model.addAttribute("cvSettlementPojo",cvSettlementPojo);
        return "settlement/info";
    }
}
