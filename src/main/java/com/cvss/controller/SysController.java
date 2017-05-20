package com.cvss.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 系统配置
 * Created by yufeng.liu on 2017-05-09.
 */
@Controller
@RequestMapping(value = "/sys")
public class SysController {

    @RequestMapping(value = "/{page}")
    public String showPage(@PathVariable String page){
        return "sys/" + page;
    }

    @RequestMapping(value = "/account/{page}")
    public String showAccountPage(@PathVariable String page){
        return "sys/account/" + page;
    }

    @RequestMapping(value = "/set/{page}")
    public String showSetPage(@PathVariable String page){
        return "sys/set/" + page;
    }

    @RequestMapping(value = "/sort/{page}")
    public String showSortPage(@PathVariable String page){
        return "sys/sort/" + page;
    }

    @RequestMapping(value = "/function/{page}")
    public String showFunctionPage(@PathVariable String page){
        return "sys/function/" + page;
    }
}
