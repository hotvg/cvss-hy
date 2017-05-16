package com.cvss.service.impl;

import com.cvss.mapper.CvMapper;
import com.cvss.pojo.Cv;
import com.cvss.pojo.CvConditionPojo;
import com.cvss.pojo.CvPojo;
import com.cvss.pojo.CvSearchPojo;
import com.cvss.service.ICvService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 商用车Service层实现类
 * Created by yufeng.liu on 2017-05-11.
 */
@Service
public class CvServiceImpl implements ICvService{

    @Autowired
    private CvMapper cvMapper;


    @Override
    public boolean insertCv(Cv record) {
        return this.cvMapper.insertCv(record)>0;
    }

    @Override
    public int batchInsertCv(List<Cv> listRecord) {
        return this.cvMapper.batchInsertCv(listRecord);
    }

    @Override
    public boolean deleteCv(Integer id) {
        return this.cvMapper.deleteCv(id)>0;
    }

    @Override
    public int batchDeleteCv(List<Integer> listId) {
        return this.cvMapper.batchDeleteCv(listId);
    }

    @Override
    public boolean updateCv(Cv record) {
        return this.cvMapper.updateCv(record)>0;
    }

    @Override
    public int batchUpdateCv(List<Cv> listRecord) {
        return this.cvMapper.batchUpdateCv(listRecord);
    }

    @Override
    public List<CvPojo> selectAll(CvConditionPojo record) {
        return this.cvMapper.selectAll(record);
    }

    @Override
    public List<CvSearchPojo> selectAllInternalModels() {
        return this.cvMapper.selectAllInternalModels();
    }
}
