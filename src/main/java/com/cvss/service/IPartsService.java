package com.cvss.service;

import com.cvss.pojo.CvParts;
import com.cvss.pojo.CvPartsAdd;
import com.cvss.pojo.CvPartsReplace;
import com.cvss.pojo.CvPartsType;

import java.util.List;

/**
 * Created by yufeng.liu on 2017-04-07.
 */
public interface IPartsService {

    //增
    boolean insertParts(CvParts record);
    boolean insertPartsAdd(CvPartsAdd record);
    boolean insertPartsReplace(CvPartsReplace record);
    boolean insertPartsType(CvPartsType record);

    //删
    boolean deleteParts(Integer id);
    boolean deletePartsAdd(Integer id);
    boolean deletePartsReplace(Integer id);
    boolean deletePartsType(Integer id);

    //改
    boolean updateParts(CvParts record);
    boolean updatePartsAdd(CvPartsAdd record);
    boolean updatePartsReplace(CvPartsReplace record);
    boolean updatePartsType(CvPartsType record);

    //查
    List<CvParts> selectAllParts(CvParts record);
    List<CvPartsAdd> selectAllPartsAdd(CvPartsAdd record);
    List<CvPartsReplace> selectAllPartsReplace(CvPartsReplace record);
    List<CvPartsType> selectAllPartsType(CvPartsType record);
}
