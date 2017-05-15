package com.cvss.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 搜索controller
 * Created by yufeng.liu on 2017-05-15.
 */
@Controller
@RequestMapping(value = "/search")
public class SearchController {

    @RequestMapping(value = "/{page}")
    public String showPage(@PathVariable String page){
        return "search/" + page;
    }
}
