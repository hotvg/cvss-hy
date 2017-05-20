package com.cvss.service.impl;

import com.cvss.mapper.CvMapper;
import com.cvss.mapper.SettlementMapper;
import com.cvss.pojo.*;
import com.cvss.service.ISettlementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 结算service接口实现类
 * Created by yufeng.liu on 2017-05-19.
 */
@Service
public class SettlementServiceImpl implements ISettlementService {

    @Autowired
    private SettlementMapper settlementMapper;
    @Autowired
    private CvMapper cvMapper;

    @Override
    public int inertSettlement(CvSettlement record) {
        return this.settlementMapper.inertSettlement(record);
    }

    @Override
    public int deleteSettlement(Integer id) {
        return this.settlementMapper.deleteSettlement(id);
    }

    @Override
    public int batchDeleteSettlement(List<Integer> idList) {
        return this.settlementMapper.batchDeleteSettlement(idList);
    }

    @Override
    public List<CvSettlementUserPojo> selectAllByUserId(Integer userId) {
        return this.settlementMapper.selectAllByUserId(userId);
    }

    @Override
    public List<CvSettlementUserPojo> selectAll() {
        return this.settlementMapper.selectAll();
    }

    @Override
    public List<CvSettlementUserPojo> selectHotSettlement() {
        return this.settlementMapper.selectHotSettlement();
    }

    @Override
    public List<CvSettlementUserPojo> selectLatelySettlement() {
        return this.settlementMapper.selectLatelySettlement();
    }

    @Override
    public CvSettlementPojo selectInfo(Integer settlementId) {
        CvSettlementPojo cvSettlementPojo = this.settlementMapper.selectInfo(settlementId);
        CvPojo cvPojo = cvSettlementPojo.getCvPojo();
        CvConditionPojo cvConditionPojo = new CvConditionPojo();
        cvConditionPojo.setInternalModels(cvPojo.getInternalModels());
        List<CvPojo> cvPojoList = this.cvMapper.selectAll(cvConditionPojo);
        cvSettlementPojo.setCvPojo(cvPojoList.get(0));
        return cvSettlementPojo;
    }
}
