package com.cvss.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 测试页面专用
 * Created by yufeng.liu on 2017-05-09.
 */

@Controller
@RequestMapping(value = "/test")
public class TestController {

    @RequestMapping(value = "{page}")
    public String showPage(@PathVariable String page){
        return "test/" + page;
    }
}
