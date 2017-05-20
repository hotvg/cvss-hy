package com.cvss.service;

import com.cvss.pojo.CvParts;
import com.cvss.pojo.CvPartsAdd;
import com.cvss.pojo.CvPartsReplace;
import com.cvss.pojo.CvPartsType;

import java.util.List;

/**
 * 配件
 * Created by yufeng.liu on 2017-04-07.
 */
public interface IPartsService {

    //增
    boolean insertParts(CvParts record);
    int batchInsertParts(List<CvParts> partsList);
    boolean insertPartsAdd(CvPartsAdd record);
    int batchInsertPartsAdd(List<CvPartsAdd> partsAddList);
    boolean insertPartsReplace(CvPartsReplace record);
    int batchInsertPartsReplace(List<CvPartsReplace> partsReplaceList);
    boolean insertPartsType(CvPartsType record);
    int batchInsertPartsType(List<CvPartsType> partsTypeList);

    //删
    boolean deleteParts(Integer id);
    int batchDeleteParts(List<Integer> idList);
    boolean deletePartsAdd(Integer id);
    int batchDeletePartsAdd(List<Integer> idList);
    boolean deletePartsReplace(Integer id);
    int batchDeletePartsReplace(List<Integer> idList);
    boolean deletePartsType(Integer id);
    int batchDeletePartsType(List<Integer> idList);

    //改
    boolean updateParts(CvParts record);
    int batchUpdateParts(List<CvParts> partsList);
    boolean updatePartsAdd(CvPartsAdd record);
    int batchUpdatePartsAdd(List<CvPartsAdd> partsAddList);
    boolean updatePartsReplace(CvPartsReplace record);
    int batchUpdatePartsReplace(List<CvPartsReplace> partsReplaceList);
    boolean updatePartsType(CvPartsType record);
    int batchUpdatePartsType(List<CvPartsType> partsTypeList);

    //查
    List<CvParts> selectAllParts(CvParts record);
    List<CvPartsAdd> selectAllPartsAdd(CvPartsAdd record);
    List<CvPartsReplace> selectAllPartsReplace(CvPartsReplace record);
    List<CvPartsType> selectAllPartsType(CvPartsType record);
}
