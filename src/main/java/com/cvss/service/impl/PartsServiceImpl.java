package com.cvss.service.impl;

import com.cvss.mapper.PartsMapper;
import com.cvss.pojo.CvParts;
import com.cvss.pojo.CvPartsAdd;
import com.cvss.pojo.CvPartsReplace;
import com.cvss.pojo.CvPartsType;
import com.cvss.service.IPartsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by yufeng.liu on 2017-04-07.
 */
@Service("partsService")
public class PartsServiceImpl implements IPartsService {

    @Autowired
    private PartsMapper partsMapper;

    @Override
    public boolean insertParts(CvParts record) {
        return this.partsMapper.insertParts(record)>0;
    }

    @Override
    public boolean insertPartsAdd(CvPartsAdd record) {
        return this.partsMapper.insertPartsAdd(record)>0;
    }

    @Override
    public boolean insertPartsReplace(CvPartsReplace record) {
        return this.partsMapper.insertPartsReplace(record)>0;
    }

    @Override
    public boolean insertPartsType(CvPartsType record) {
        return partsMapper.insertPartsType(record)>0;
    }

    @Override
    public boolean deleteParts(Integer id) {
        return this.partsMapper.deleteParts(id)>0;
    }

    @Override
    public boolean deletePartsAdd(Integer id) {
        return this.partsMapper.deletePartsAdd(id)>0;
    }

    @Override
    public boolean deletePartsReplace(Integer id) {
        return this.partsMapper.deletePartsReplace(id)>0;
    }

    @Override
    public boolean deletePartsType(Integer id) {
        return this.partsMapper.deletePartsType(id)>0;
    }

    @Override
    public boolean updateParts(CvParts record) {
        return this.partsMapper.updateParts(record)>0;
    }

    @Override
    public boolean updatePartsAdd(CvPartsAdd record) {
        return this.partsMapper.updatePartsAdd(record)>0;
    }

    @Override
    public boolean updatePartsReplace(CvPartsReplace record) {
        return this.partsMapper.updatePartsReplace(record)>0;
    }

    @Override
    public boolean updatePartsType(CvPartsType record) {
        return this.partsMapper.updatePartsType(record)>0;
    }

    @Override
    public List<CvParts> selectAllParts(CvParts record) {
        return this.partsMapper.selectAllParts(record);
    }

    @Override
    public List<CvPartsAdd> selectAllPartsAdd(CvPartsAdd record) {
        return this.partsMapper.selectAllPartsAdd(record);
    }

    @Override
    public List<CvPartsReplace> selectAllPartsReplace(CvPartsReplace record) {
        return this.partsMapper.selectAllPartsReplace(record);
    }

    @Override
    public List<CvPartsType> selectAllPartsType(CvPartsType record) {
        return this.partsMapper.selectAllPartsType(record);
    }
}
