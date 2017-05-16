package com.cvss.mapper;

import com.cvss.pojo.Cv;
import com.cvss.pojo.CvConditionPojo;
import com.cvss.pojo.CvPojo;
import com.cvss.pojo.CvSearchPojo;

import java.util.List;

/**
 * 商用车数据库映射文件
 * Created by yufeng.liu on 2017-05-10.
 */
public interface CvMapper{

    int insertCv(Cv record);
    int batchInsertCv(List<Cv> listRecord);

    int deleteCv(Integer id);
    int batchDeleteCv(List<Integer> listId);

    int updateCv(Cv record);
    int batchUpdateCv(List<Cv> listRecord);

    List<CvPojo> selectAll(CvConditionPojo record);

    List<CvSearchPojo> selectAllInternalModels();

}
