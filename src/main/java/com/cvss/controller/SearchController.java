package com.cvss.controller;

import com.cvss.pojo.CvConditionPojo;
import com.cvss.service.ICvService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 搜索controller
 * Created by yufeng.liu on 2017-05-15.
 */
@Controller
@RequestMapping(value = "/search")
public class SearchController {

    @Autowired
    private ICvService iCvService;

    @RequestMapping(value = "/{page}")
    public String showPage(@PathVariable String page){
        return "search/" + page;
    }

    @RequestMapping(value = "/result")
    public String showPage(CvConditionPojo record, Model model){
        model.addAttribute("cvPojo",iCvService.selectAll(record).get(0));
        return "search/search-result";
    }
}
