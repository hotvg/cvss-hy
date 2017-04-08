package com.cvss.mapper;

import com.cvss.pojo.CvParts;
import com.cvss.pojo.CvPartsAdd;
import com.cvss.pojo.CvPartsReplace;
import com.cvss.pojo.CvPartsType;

import java.util.List;

/**
 * Created by yufeng.liu on 2017-04-07.
 */
public interface PartsMapper{

    //增
    int insertParts(CvParts record);
    int insertPartsAdd(CvPartsAdd record);
    int insertPartsReplace(CvPartsReplace record);
    int insertPartsType(CvPartsType record);

    //删
    int deleteParts(Integer id);
    int deletePartsAdd(Integer id);
    int deletePartsReplace(Integer id);
    int deletePartsType(Integer id);

    //改
    int updateParts(CvParts record);
    int updatePartsAdd(CvPartsAdd record);
    int updatePartsReplace(CvPartsReplace record);
    int updatePartsType(CvPartsType record);

    //查
    List<CvParts> selectAllParts(CvParts record);
    List<CvPartsAdd> selectAllPartsAdd(CvPartsAdd record);
    List<CvPartsReplace> selectAllPartsReplace(CvPartsReplace record);
    List<CvPartsType> selectAllPartsType(CvPartsType record);


}
