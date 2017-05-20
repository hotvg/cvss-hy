package com.cvss.controller;

import com.cvss.pojo.CvParts;
import com.cvss.pojo.CvPartsType;
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
 * 配件Controller
 * Created by yufeng.liu on 2017-04-07.
 */
@Controller
@RequestMapping(value = "/parts/type")
public class PartsTypeController {

    @Autowired
    private IPartsService iPartsService;

    /**
     * 新增配件
     * @param record 一条记录
     * @return 返回是否成功，true为成功
     */
    @RequestMapping(value = "/create")
    @ResponseBody
    public boolean createPartsType(@RequestBody CvPartsType record){
        return this.iPartsService.insertPartsType(record);
    }

    /**
     * 批量新增配件
     * @param recordList 记录集合
     * @return 返回添加的条数
     */
    @RequestMapping(value = "/create/batch")
    @ResponseBody
    public int createMorePartsType(@RequestBody List<CvPartsType> recordList){
        return this.iPartsService.batchInsertPartsType(recordList);
    }

    /**
     * 删除配件
     * @param id 配件ID
     * @return 返回是否成功
     */
    @RequestMapping(value = "/destroy")
    @ResponseBody
    public boolean destroyPartsType(@RequestBody Integer id){
        return this.iPartsService.deleteParts(id);
    }

    /**
     * 批量删除配件
     * @param idList 配件集合
     * @return 返回受影响的行数
     */
    @RequestMapping(value = "/destroy/batch")
    @ResponseBody
    public int destroyMorePartsType(@RequestBody  List<Integer> idList){
        return this.iPartsService.batchDeleteParts(idList);
    }

    /**
     * 更改配件
     * @param record 一条记录
     * @return 返回是否成功
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public boolean updatePartsType(@RequestBody CvParts record){
        return this.iPartsService.updateParts(record);
    }

    /**
     * 批量更改配件
     * @param recordList 记录集合
     * @return 返回受影响的行数
     */
    @RequestMapping(value = "/update/batch")
    @ResponseBody
    public int updateMorePartsType(@RequestBody List<CvPartsType> recordList){
        return this.iPartsService.batchUpdatePartsType(recordList);
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
    public GridUtil readPartsType(CvPartsType record, int page, int pageSize){
        PageHelper.startPage(page,pageSize);
        List<CvPartsType> list =  this.iPartsService.selectAllPartsType(record);
        PageInfo<CvPartsType> pageInfo = new PageInfo<>(list);
        return new GridUtil<>(list,page,pageSize,pageInfo.getPages());
    }
}
