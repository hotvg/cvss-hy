package com.cvss.controller;

import com.cvss.pojo.CvConditionPojo;
import com.cvss.pojo.SearchHistory;
import com.cvss.pojo.SysUser;
import com.cvss.service.ICvService;
import com.cvss.service.ISearchService;
import com.cvss.util.GridUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
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

    @RequestMapping(value = "/create")
    public int createSearch(SearchHistory searchHistory){
        return this.iSearchService.inertSearch(searchHistory);
    }

    @RequestMapping(value = "/destroy")
    public int destroySearch(@RequestBody Integer id){
        return this.iSearchService.deleteSearch(id);
    }

    @RequestMapping(value = "/destroy/batch")
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
        List<SearchHistory> list = this.iSearchService.selectHotSearch();
        PageInfo<SearchHistory> pageInfo = new PageInfo<>(list);
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
