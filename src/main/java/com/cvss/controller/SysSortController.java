package com.cvss.controller;

import com.cvss.pojo.*;
import com.cvss.service.ISysSortService;
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
 * 系统类别管理
 * Created by yufeng.liu on 2017-05-09.
 */
@Controller
@RequestMapping(value = "/sort")
public class SysSortController {

    @Autowired
    private ISysSortService iSysSortService;

    /**
     * 新增商用车分类
     * @param record 一条记录
     * @return 返回是否成功，true为成功
     */
    @RequestMapping(value = "/type/create")
    @ResponseBody
    public boolean createCvType(@RequestBody CvType record){
        return this.iSysSortService.insertCvType(record);
    }

    /**
     * 批量新增商用车分类
     * @param recordList 记录集合
     * @return 返回添加的条数
     */
    @RequestMapping(value = "/type/create/batch")
    @ResponseBody
    public int createMoreCvType(@RequestBody List<CvType> recordList){
        return this.iSysSortService.batchInsertCvType(recordList);
    }

    /**
     * 新增商用车分类
     * @param record 一条记录
     * @return 返回是否成功，true为成功
     */
    @RequestMapping(value = "/series/create")
    @ResponseBody
    public boolean createCvTypeSeries(@RequestBody CvTypeSeries record){
        return this.iSysSortService.insertCvTypeSeries(record);
    }

    /**
     * 批量新增商用车分类
     * @param recordList 记录集合
     * @return 返回添加的条数
     */
    @RequestMapping(value = "/series/create/batch")
    @ResponseBody
    public int createMoreCvTypeSeries(@RequestBody List<CvTypeSeries> recordList){
        return this.iSysSortService.batchInsertCvTypeSeries(recordList);
    }

    /**
     * 删除商用车分类
     * @param id 配件ID
     * @return 返回是否成功
     */
    @RequestMapping(value = "/type/destroy")
    @ResponseBody
    public boolean destroyCvType(@RequestBody Integer id){
        return this.iSysSortService.deleteCvType(id);
    }

    /**
     * 批量删除商用车
     * @param idList 配件集合
     * @return 返回受影响的行数
     */
    @RequestMapping(value = "/type/destroy/batch")
    @ResponseBody
    public int destroyMoreCvType(@RequestBody  List<Integer> idList){
        return this.iSysSortService.batchDeleteCvType(idList);
    }

    /**
     * 删除商用车分类
     * @param id 配件ID
     * @return 返回是否成功
     */
    @RequestMapping(value = "/series/destroy")
    @ResponseBody
    public boolean destroyCvTypeSeries(@RequestBody Integer id){
        return this.iSysSortService.deleteCvTypeSeries(id);
    }

    /**
     * 批量删除商用车
     * @param idList 配件集合
     * @return 返回受影响的行数
     */
    @RequestMapping(value = "/series/destroy/batch")
    @ResponseBody
    public int destroyMoreCvTypeSeries(@RequestBody  List<Integer> idList){
        return this.iSysSortService.batchDeleteCvTypeSeries(idList);
    }

    /**
     * 更改商用车
     * @param record 一条记录
     * @return 返回是否成功
     */
    @RequestMapping(value = "/type/update")
    @ResponseBody
    public boolean updateCvType(@RequestBody CvType record){
        return this.iSysSortService.updateCvType(record);
    }

    /**
     * 批量更改商用车
     * @param recordList 记录集合
     * @return 返回受影响的行数
     */
    @RequestMapping(value = "/type/update/batch")
    @ResponseBody
    public int updateMoreCvType(@RequestBody List<CvType> recordList){
        return this.iSysSortService.batchUpdateCvType(recordList);
    }

    /**
     * 更改商用车
     * @param record 一条记录
     * @return 返回是否成功
     */
    @RequestMapping(value = "/series/update")
    @ResponseBody
    public boolean updateCvTypeSeries(@RequestBody CvTypeSeries record){
        return this.iSysSortService.updateCvTypeSeries(record);
    }

    /**
     * 批量更改商用车
     * @param recordList 记录集合
     * @return 返回受影响的行数
     */
    @RequestMapping(value = "/series/update/batch")
    @ResponseBody
    public int updateMoreCvTypeSeries(@RequestBody List<CvTypeSeries> recordList){
        return this.iSysSortService.batchUpdateCvTypeSeries(recordList);
    }

    /**
     * 记取商用车记录
     * @param record 可传参数
     * @param page 第几页
     * @param pageSize 每页大小
     * @return 返回grid数据
     */
    @RequestMapping(value = "/type/read")
    @ResponseBody
    public GridUtil readCvType(CvType record, int page, int pageSize){
        PageHelper.startPage(page,pageSize);
        List<CvType> list =  this.iSysSortService.selectAllCvType(record);
        PageInfo<CvType> pageInfo = new PageInfo<>(list);
        return new GridUtil<>(list,page,pageSize,pageInfo.getPages());
    }

    /**
     * 记取商用车记录
     * @param record 可传参数
     * @param page 第几页
     * @param pageSize 每页大小
     * @return 返回grid数据
     */
    @RequestMapping(value = "/series/read")
    @ResponseBody
    public GridUtil readParts(CvTypeSeries record, int page, int pageSize){
        PageHelper.startPage(page,pageSize);
        List<CvTypeSeriesPojo> list =  this.iSysSortService.selectAllCvTypeSeries(record);
        PageInfo<CvTypeSeriesPojo> pageInfo = new PageInfo<>(list);
        return new GridUtil<>(list,page,pageSize,pageInfo.getPages());
    }


}
