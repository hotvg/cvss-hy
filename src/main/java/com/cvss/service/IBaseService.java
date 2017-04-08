package com.cvss.service;

import java.util.List;

/**
 * Created by yufeng.liu on 2017-03-23.
 */
public interface IBaseService<T> {
    int insert(T record);

    int deleteById(Integer id);

    int deleteByRecord(T record);

    int update(T record);

    T selectOne(T record);

    List<T> selectAll();

    List<T> selectAll(T record);
}
