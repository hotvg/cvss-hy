package com.cvss.mapper;

import com.cvss.pojo.HotSearch;
import com.cvss.pojo.SearchHistory;

import java.util.List;

/**
 * 搜索模块数据持久层
 * Created by yufeng.liu on 2017-05-15.
 */
public interface SearchMapper {
    int inertSearch(SearchHistory record);
    int deleteSearch(Integer id);
    int batchDeleteSearch(List<Integer> idList);

    List<SearchHistory> selectAllByUserId(Integer userId);
    List<SearchHistory> selectAll();
    List<HotSearch> selectHotSearch();
    List<SearchHistory> selectLatelySearch();
    List<SearchHistory> selectLatelySearchByUserId(Integer userId);
}
