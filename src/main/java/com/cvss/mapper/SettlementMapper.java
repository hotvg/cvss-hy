package com.cvss.mapper;

import com.cvss.pojo.CvSettlement;
import com.cvss.pojo.CvSettlementPojo;
import com.cvss.pojo.CvSettlementUserPojo;

import java.util.List;

/**
 * 结算数据库映射类
 * Created by yufeng.liu on 2017-05-19.
 */
public interface SettlementMapper {
    int inertSettlement(CvSettlement record);
    int deleteSettlement(Integer id);
    int batchDeleteSettlement(List<Integer> idList);

    List<CvSettlementUserPojo> selectAllByUserId(Integer userId);
    List<CvSettlementUserPojo> selectAll();
    List<CvSettlementUserPojo> selectHotSettlement();
    List<CvSettlementUserPojo> selectLatelySettlement();
    CvSettlementPojo selectInfo(Integer settlementId);
}
