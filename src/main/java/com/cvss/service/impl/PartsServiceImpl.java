package com.cvss.service.impl;

import com.cvss.mapper.PartsMapper;
import com.cvss.pojo.CvParts;
import com.cvss.pojo.CvPartsAdd;
import com.cvss.pojo.CvPartsReplace;
import com.cvss.pojo.CvPartsType;
import com.cvss.service.IPartsService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
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
    public int batchInsertParts(List<CvParts> partsList) {
        return this.partsMapper.batchInsertParts(partsList);
    }

    @Override
    public boolean insertPartsAdd(CvPartsAdd record) {
        return this.partsMapper.insertPartsAdd(record)>0;
    }

    @Override
    public int batchInsertPartsAdd(List<CvPartsAdd> partsAddList) {
        return this.partsMapper.batchInsertPartsAdd(partsAddList);
    }

    @Override
    public boolean insertPartsReplace(CvPartsReplace record) {
        return this.partsMapper.insertPartsReplace(record)>0;
    }

    @Override
    public int batchInsertPartsReplace(List<CvPartsReplace> partsReplaceList) {
        return this.partsMapper.batchInsertPartsReplace(partsReplaceList);
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
    public int batchDeleteParts(List<Integer> idList) {
        return this.partsMapper.batchDeleteParts(idList);
    }

    @Override
    public boolean deletePartsAdd(Integer id) {
        return this.partsMapper.deletePartsAdd(id)>0;
    }

    @Override
    public int batchDeletePartsAdd(List<Integer> idList) {
        return this.partsMapper.batchDeletePartsAdd(idList);
    }

    @Override
    public boolean deletePartsReplace(Integer id) {
        return this.partsMapper.deletePartsReplace(id)>0;
    }

    @Override
    public int batchDeletePartsReplace(List<Integer> idList) {
        return this.partsMapper.batchDeletePartsReplace(idList);
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
    public int batchUpdateParts(List<CvParts> partsList) {
        return this.partsMapper.batchUpdateParts(partsList);
    }

    @Override
    public boolean updatePartsAdd(CvPartsAdd record) {
        return this.partsMapper.updatePartsAdd(record)>0;
    }

    @Override
    public int batchUpdatePartsAdd(List<CvPartsAdd> partsAddList) {
        return this.partsMapper.batchUpdatePartsAdd(partsAddList);
    }

    @Override
    public boolean updatePartsReplace(CvPartsReplace record) {
        return this.partsMapper.updatePartsReplace(record)>0;
    }

    @Override
    public int batchUpdatePartsReplace(List<CvPartsReplace> partsReplaceList) {
        return this.partsMapper.batchUpdatePartsReplace(partsReplaceList);
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
