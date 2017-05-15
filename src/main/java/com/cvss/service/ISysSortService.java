package com.cvss.service;

import com.cvss.pojo.CvType;
import com.cvss.pojo.CvTypeSeries;
import com.cvss.pojo.CvTypeSeriesPojo;

import java.util.List;

/**
 * 商用车service层接口
 * Created by yufeng.liu on 2017-05-11.
 */
public interface ISysSortService {

    //cv_type表
    boolean insertCvType(CvType record);
    int batchInsertCvType(List<CvType> listRecord);

    boolean deleteCvType(Integer id);
    int batchDeleteCvType(List<Integer> listId);

    boolean updateCvType(CvType record);
    int batchUpdateCvType(List<CvType> listRecord);

    List<CvType> selectAllCvType(CvType record);

    //cv_type_series表
    boolean insertCvTypeSeries(CvTypeSeries record);
    int batchInsertCvTypeSeries(List<CvTypeSeries> listRecord);

    boolean deleteCvTypeSeries(Integer id);
    int batchDeleteCvTypeSeries(List<Integer> listId);

    boolean updateCvTypeSeries(CvTypeSeries record);
    int batchUpdateCvTypeSeries(List<CvTypeSeries> listRecord);

    List<CvTypeSeriesPojo> selectAllCvTypeSeries(CvTypeSeries record);
}
