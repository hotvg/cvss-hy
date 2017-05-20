package com.cvss.service;

import com.cvss.pojo.SearchHistory;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 搜索模块service层
 * Created by yufeng.liu on 2017-05-15.
 */
public interface ISearchService {
    int inertSearch(SearchHistory record);
    int deleteSearch(Integer id);
    int batchDeleteSearch(List<Integer> idList);

    List<SearchHistory> selectAllByUserId(Integer userId);
    List<SearchHistory> selectAll();
    List<SearchHistory> selectHotSearch();
    List<SearchHistory> selectLatelySearch();
    List<SearchHistory> selectLatelySearchByUserId(Integer userId);
}
