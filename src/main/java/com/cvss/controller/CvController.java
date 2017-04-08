package com.cvss.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by yufeng.liu on 2017-04-03.
 */
@Controller
@RequestMapping(value = "/cv")
public class CvController {
    /**
     * 页面返回
     * @param page
     * @return
     */
    @RequestMapping(value = "/{page}")
    public String showPage(@PathVariable String page){
        return "cv/" + page;
    }
}
