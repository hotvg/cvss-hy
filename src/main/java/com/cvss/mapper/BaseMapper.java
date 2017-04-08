package com.cvss.mapper;

import java.util.List;

/**
 * Created by yufeng.liu on 2017-03-29.
 */
public interface BaseMapper<T> {

    int insert(T record);

    int deleteById(Integer id);

    int deleteByRecord(T record);

    int update(T record);

    List<T> selectOne(T record);

    List<T> selectAll();

    //通过条件查找
    List<T> selectAllO(T record);
}
