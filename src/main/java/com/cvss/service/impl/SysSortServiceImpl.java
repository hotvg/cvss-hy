package com.cvss.service.impl;

import com.cvss.mapper.SysSortMapper;
import com.cvss.pojo.CvType;
import com.cvss.pojo.CvTypeSeries;
import com.cvss.pojo.CvTypeSeriesPojo;
import com.cvss.service.ISysSortService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 商用车分类service层
 * Created by yufeng.liu on 2017-05-11.
 */
@Service
public class SysSortServiceImpl implements ISysSortService {

    @Autowired
    private SysSortMapper sysSortMapper;


    @Override
    public boolean insertCvType(CvType record) {
        return this.sysSortMapper.insertCvType(record)>0;
    }

    @Override
    public int batchInsertCvType(List<CvType> listRecord) {
        return this.sysSortMapper.batchInsertCvType(listRecord);
    }

    @Override
    public boolean deleteCvType(Integer id) {
        return this.sysSortMapper.deleteCvType(id)>0;
    }

    @Override
    public int batchDeleteCvType(List<Integer> listId) {
        return this.sysSortMapper.batchDeleteCvType(listId);
    }

    @Override
    public boolean updateCvType(CvType record) {
        return this.sysSortMapper.updateCvType(record)>0;
    }

    @Override
    public int batchUpdateCvType(List<CvType> listRecord) {
        return this.sysSortMapper.batchUpdateCvType(listRecord);
    }

    @Override
    public List<CvType> selectAllCvType(CvType record) {
        return this.sysSortMapper.selectAllCvType(record);
    }

    @Override
    public boolean insertCvTypeSeries(CvTypeSeries record) {
        return this.sysSortMapper.insertCvTypeSeries(record)>0;
    }

    @Override
    public int batchInsertCvTypeSeries(List<CvTypeSeries> listRecord) {
        return this.sysSortMapper.batchInsertCvTypeSeries(listRecord);
    }

    @Override
    public boolean deleteCvTypeSeries(Integer id) {
        return this.sysSortMapper.deleteCvTypeSeries(id)>0;
    }

    @Override
    public int batchDeleteCvTypeSeries(List<Integer> listId) {
        return this.sysSortMapper.batchDeleteCvTypeSeries(listId);
    }

    @Override
    public boolean updateCvTypeSeries(CvTypeSeries record) {
        return this.sysSortMapper.updateCvTypeSeries(record)>0;
    }

    @Override
    public int batchUpdateCvTypeSeries(List<CvTypeSeries> listRecord) {
        return this.sysSortMapper.batchUpdateCvTypeSeries(listRecord);
    }

    @Override
    public List<CvTypeSeriesPojo> selectAllCvTypeSeries(CvTypeSeries record) {
        return this.sysSortMapper.selectAllCvTypeSeries(record);
    }
}
