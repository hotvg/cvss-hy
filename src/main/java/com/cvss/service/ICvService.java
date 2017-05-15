package com.cvss.service;

import com.cvss.pojo.Cv;
import com.cvss.pojo.CvConditionPojo;
import com.cvss.pojo.CvPojo;

import java.util.List;

/**
 * 商用车业务层
 * Created by yufeng.liu on 2017-05-11.
 */
public interface ICvService {
    boolean insertCv(Cv record);
    int batchInsertCv(List<Cv> listRecord);

    boolean deleteCv(Integer id);
    int batchDeleteCv(List<Integer> listId);

    boolean updateCv(Cv record);
    int batchUpdateCv(List<Cv> listRecord);

    List<CvPojo> selectAll(CvConditionPojo record);
}
