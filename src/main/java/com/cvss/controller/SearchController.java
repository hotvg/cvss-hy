package com.cvss.controller;

import com.cvss.pojo.*;
import com.cvss.service.ICvService;
import com.cvss.service.ISearchService;
import com.cvss.util.GridUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;
import java.util.List;

/**
 * 搜索controller
 * Created by yufeng.liu on 2017-05-15.
 */
@Controller
@RequestMapping(value = "/search")
public class SearchController {

    @Autowired
    private ISearchService iSearchService;
    @Autowired
    private ICvService iCvService;

    @RequestMapping(value = "/{page}")
    public String showPage(@PathVariable String page){
        return "search/" + page;
    }

    @RequestMapping(value = "/result")
    public String returnResult(CvConditionPojo record, Model model,HttpServletRequest request){
        model.addAttribute("cvPojo",this.iCvService.selectAll(record).get(0));
        SysUser sysUser = (SysUser)request.getSession().getAttribute("sysUser");
        SearchHistory searchHistory = new SearchHistory();
        searchHistory.setCreateTime(new Date());
        searchHistory.setInternalModels(record.getInternalModels());
        searchHistory.setUserId(sysUser.getUserId());
        this.iSearchService.inertSearch(searchHistory);
        return "search/search-result";
    }

    @RequestMapping(value = "/condition")
    public String returnResult(@RequestBody CvConditionPojo record, Model model){
        model.addAttribute("cvPojoList",this.iCvService.selectAll(record));
        return "search/condition-result";
    }

    @RequestMapping(value = "/index")
    public String returnHistory(Model model,HttpServletRequest request){
        PageHelper.startPage(1,10);
        List<HotSearch> hotList = this.iSearchService.selectHotSearch();
        SysUser sysUser = (SysUser) request.getSession().getAttribute("sysUser");
        PageHelper.startPage(1,10);
        List<SearchHistory> latelyList = this.iSearchService.selectLatelySearchByUserId(sysUser.getUserId());
        model.addAttribute("hotList",hotList);
        model.addAttribute("latelyList",latelyList);
        return "search/condition-search";
    }

    @RequestMapping(value = "/create")
    @ResponseBody
    public int createSearch(SearchHistory searchHistory){
        return this.iSearchService.inertSearch(searchHistory);
    }

    @RequestMapping(value = "/destroy")
    @ResponseBody
    public int destroySearch(@RequestBody Integer id){
        return this.iSearchService.deleteSearch(id);
    }

    @RequestMapping(value = "/destroy/batch")
    @ResponseBody
    public int destroySearch(@RequestBody List<Integer> idList){
        return this.iSearchService.batchDeleteSearch(idList);
    }

    @RequestMapping(value = "/read")
    @ResponseBody
    public GridUtil readSearchAll(HttpServletRequest request,int page, int pageSize){
        PageHelper.startPage(page,pageSize);
        SysUser sysUser = (SysUser)request.getSession().getAttribute("sysUser");
        List<SearchHistory> list;
        if(sysUser.getRoleCode().equals("ADMIN")){
            list =  this.iSearchService.selectAll();
        }else{
            list =  this.iSearchService.selectAllByUserId(sysUser.getUserId());
        }
        PageInfo<SearchHistory> pageInfo = new PageInfo<>(list);
        return new GridUtil<>(list,page,pageSize,pageInfo.getPages());
    }

    @RequestMapping(value = "/read/hot")
    @ResponseBody
    public GridUtil readHotSearchAll(int page, int pageSize){
        PageHelper.startPage(page,pageSize);
        List<HotSearch> list = this.iSearchService.selectHotSearch();
        PageInfo<HotSearch> pageInfo = new PageInfo<>(list);
        return new GridUtil<>(list,page,pageSize,pageInfo.getPages());
    }

    @RequestMapping(value = "/read/lately")
    @ResponseBody
    public GridUtil readLatelySearchAll(HttpServletRequest request,int page, int pageSize){
        PageHelper.startPage(page,pageSize);
        SysUser sysUser = (SysUser)request.getSession().getAttribute("sysUser");
        List<SearchHistory> list;
        if(sysUser.getRoleCode().equals("ADMIN")){
            list =  this.iSearchService.selectLatelySearch();
        }else{
            list =  this.iSearchService.selectLatelySearchByUserId(sysUser.getUserId());
        }
        PageInfo<SearchHistory> pageInfo = new PageInfo<>(list);
        return new GridUtil<>(list,page,pageSize,pageInfo.getPages());
    }


}
