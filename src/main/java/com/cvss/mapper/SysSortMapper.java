package com.cvss.mapper;


import com.cvss.pojo.CvType;
import com.cvss.pojo.CvTypeSeries;
import com.cvss.pojo.CvTypeSeriesPojo;

import java.util.List;

/**
 * 系统类别管理数据持久层映射文件
 * Created by yufeng.liu on 2017-05-11.
 */
public interface SysSortMapper {

    //cv_type表
    int insertCvType(CvType record);
    int batchInsertCvType(List<CvType> listRecord);

    int deleteCvType(Integer id);
    int batchDeleteCvType(List<Integer> listId);

    int updateCvType(CvType record);
    int batchUpdateCvType(List<CvType> listRecord);

    List<CvType> selectAllCvType(CvType record);

    //cv_type_series表
    int insertCvTypeSeries(CvTypeSeries record);
    int batchInsertCvTypeSeries(List<CvTypeSeries> listRecord);

    int deleteCvTypeSeries(Integer id);
    int batchDeleteCvTypeSeries(List<Integer> listId);

    int updateCvTypeSeries(CvTypeSeries record);
    int batchUpdateCvTypeSeries(List<CvTypeSeries> listRecord);

    List<CvTypeSeriesPojo> selectAllCvTypeSeries(CvTypeSeries record);

}
