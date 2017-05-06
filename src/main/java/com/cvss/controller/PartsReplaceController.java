package com.cvss.controller;

import com.cvss.pojo.CvPartsReplace;
import com.cvss.service.IPartsService;
import com.cvss.util.GridUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 配件可换装
 * Created by yufeng.liu on 2017-05-04.
 */
@Controller
@RequestMapping(value = "parts/replace")
public class PartsReplaceController {

    @Autowired
    private IPartsService iPartsService;

    /**
     * 新增配件
     * @param record 一条记录
     * @return 返回是否成功，true为成功
     */
    @RequestMapping(value = "/create")
    @ResponseBody
    public boolean createParts(@RequestBody CvPartsReplace record){
        return this.iPartsService.insertPartsReplace(record);
    }

    /**
     * 批量新增配件
     * @param recordList 记录集合
     * @return 返回添加的条数
     */
    @RequestMapping(value = "/create/batch")
    @ResponseBody
    public int createMoreParts(@RequestBody List<CvPartsReplace> recordList){
        return this.iPartsService.batchInsertPartsReplace(recordList);
    }

    /**
     * 删除配件
     * @param id 配件ID
     * @return 返回是否成功
     */
    @RequestMapping(value = "/destroy")
    @ResponseBody
    public boolean destroyParts(@RequestBody Integer id){
        return this.iPartsService.deletePartsReplace(id);
    }

    /**
     * 批量删除配件
     * @param idList 配件集合
     * @return 返回受影响的行数
     */
    @RequestMapping(value = "/destroy/batch")
    @ResponseBody
    public int destroyMoreParts(@RequestBody  List<Integer> idList){
        return this.iPartsService.batchDeletePartsReplace(idList);
    }

    /**
     * 更改配件
     * @param record 一条记录
     * @return 返回是否成功
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public boolean updateParts(@RequestBody CvPartsReplace record){
        return this.iPartsService.updatePartsReplace(record);
    }

    /**
     * 批量更改配件
     * @param recordList 记录集合
     * @return 返回受影响的行数
     */
    @RequestMapping(value = "/update/batch")
    @ResponseBody
    public int updateMoreParts(@RequestBody List<CvPartsReplace> recordList){
        return this.iPartsService.batchUpdatePartsReplace(recordList);
    }

    /**
     * 记取配件记录
     * @param record 可传参数
     * @param page 第几页
     * @param pageSize 每页大小
     * @return 返回grid数据
     */
    @RequestMapping(value = "/read")
    @ResponseBody
    public GridUtil readParts(CvPartsReplace record, int page, int pageSize){
        PageHelper.startPage(page,pageSize);
        List<CvPartsReplace> list =  this.iPartsService.selectAllPartsReplace(record);
        PageInfo<CvPartsReplace> pageInfo = new PageInfo<>(list);
        return new GridUtil<>(list,page,pageSize,pageInfo.getPages());
    }
}
