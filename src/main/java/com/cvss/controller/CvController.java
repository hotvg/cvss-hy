package com.cvss.controller;

import com.cvss.pojo.Cv;
import com.cvss.pojo.CvConditionPojo;
import com.cvss.pojo.CvPojo;
import com.cvss.service.ICvService;
import com.cvss.util.GridUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 商用车控制层
 * Created by yufeng.liu on 2017-04-03.
 */
@Controller
@RequestMapping(value = "/cv")
public class CvController {

    @Autowired
    private ICvService iCvService;

    /**
     * 页面返回
     * @param page 页面
     * @return ftl模板页面
     */
    @RequestMapping(value = "/{page}")
    public String showPage(@PathVariable String page){
        return "cv/" + page;
    }

    /**
     * 新增商用车
     * @param record 一条记录
     * @return 返回是否成功，true为成功
     */
    @RequestMapping(value = "/all/create")
    @ResponseBody
    public boolean createCv(@RequestBody Cv record){
        return this.iCvService.insertCv(record);
    }

    /**
     * 批量新增商用车
     * @param recordList 记录集合
     * @return 返回添加的条数
     */
    @RequestMapping(value = "/all/create/batch")
    @ResponseBody
    public int createMoreCv(@RequestBody List<Cv> recordList){
        return this.iCvService.batchInsertCv(recordList);
    }

    /**
     * 删除商用车
     * @param id 配件ID
     * @return 返回是否成功
     */
    @RequestMapping(value = "/all/destroy")
    @ResponseBody
    public boolean destroyCv(@RequestBody Integer id){
        return this.iCvService.deleteCv(id);
    }

    /**
     * 批量删除商用车
     * @param idList 配件集合
     * @return 返回受影响的行数
     */
    @RequestMapping(value = "/all/destroy/batch")
    @ResponseBody
    public int destroyMoreCv(@RequestBody  List<Integer> idList){
        return this.iCvService.batchDeleteCv(idList);
    }

    /**
     * 更改商用车
     * @param record 一条记录
     * @return 返回是否成功
     */
    @RequestMapping(value = "/all/update")
    @ResponseBody
    public boolean updateCv(@RequestBody Cv record){
        return this.iCvService.updateCv(record);
    }

    /**
     * 批量更改商用车
     * @param recordList 记录集合
     * @return 返回受影响的行数
     */
    @RequestMapping(value = "/all/update/batch")
    @ResponseBody
    public int updateMoreCv(@RequestBody List<Cv> recordList){
        return this.iCvService.batchUpdateCv(recordList);
    }

    /**
     * 记取商用车记录
     * @param record 可传参数
     * @param page 第几页
     * @param pageSize 每页大小
     * @return 返回grid数据
     */
    @RequestMapping(value = "/all/read")
    @ResponseBody
    public GridUtil readCv(CvConditionPojo record, int page, int pageSize){
        PageHelper.startPage(page,pageSize);
        List<CvPojo> list =  this.iCvService.selectAll(record);
        PageInfo<CvPojo> pageInfo = new PageInfo<>(list);
        return new GridUtil<>(list,page,pageSize,pageInfo.getPages());
    }
}
