package com.cvss.mapper;

import com.cvss.pojo.CvParts;
import com.cvss.pojo.CvPartsAdd;
import com.cvss.pojo.CvPartsReplace;
import com.cvss.pojo.CvPartsType;

import java.util.List;

/**
 * 配件持久层接口
 * Created by yufeng.liu on 2017-04-07.
 */
public interface PartsMapper{

    //增
    int insertParts(CvParts record);
    int batchInsertParts(List<CvParts> partsList);
    int insertPartsAdd(CvPartsAdd record);
    int batchInsertPartsAdd(List<CvPartsAdd> partsAddList);
    int insertPartsReplace(CvPartsReplace record);
    int batchInsertPartsReplace(List<CvPartsReplace> partsReplaceList);
    int insertPartsType(CvPartsType record);

    //删
    int deleteParts(Integer id);
    int batchDeleteParts(List<Integer> idList);
    int deletePartsAdd(Integer id);
    int batchDeletePartsAdd(List<Integer> idList);
    int deletePartsReplace(Integer id);
    int batchDeletePartsReplace(List<Integer> idList);
    int deletePartsType(Integer id);

    //改
    int updateParts(CvParts record);
    int batchUpdateParts(List<CvParts> partsList);
    int updatePartsAdd(CvPartsAdd record);
    int batchUpdatePartsAdd(List<CvPartsAdd> partsAddList);
    int updatePartsReplace(CvPartsReplace record);
    int batchUpdatePartsReplace(List<CvPartsReplace> partsReplaceList);
    int updatePartsType(CvPartsType record);

    //查
    List<CvParts> selectAllParts(CvParts record);
    List<CvPartsAdd> selectAllPartsAdd(CvPartsAdd record);
    List<CvPartsReplace> selectAllPartsReplace(CvPartsReplace record);
    List<CvPartsType> selectAllPartsType(CvPartsType record);


}
