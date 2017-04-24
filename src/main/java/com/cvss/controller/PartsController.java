package com.cvss.controller;

import com.cvss.pojo.CvParts;
import com.cvss.service.IPartsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by yufeng.liu on 2017-04-07.
 */
@Controller
@RequestMapping(value = "/parts")
public class PartsController {

    @Autowired
    private IPartsService iPartsService;

    @RequestMapping(value = "/cab")
    @ResponseBody
    public List<CvParts> showCab(CvParts record, Integer page, Integer pageSize){
        return this.iPartsService.selectAllParts(record,page,pageSize);
    }
}
