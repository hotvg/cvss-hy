package com.cvss.service.impl;

import com.cvss.mapper.SearchMapper;
import com.cvss.pojo.HotSearch;
import com.cvss.pojo.SearchHistory;
import com.cvss.service.ISearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 搜索模块service接口实现类
 * Created by yufeng.liu on 2017-05-19.
 */
@Service
public class SearchServiceImpl implements ISearchService {

    @Autowired
    private SearchMapper searchMapper;

    @Override
    public int inertSearch(SearchHistory record) {
        return this.searchMapper.inertSearch(record);
    }

    @Override
    public int deleteSearch(Integer id) {
        return this.searchMapper.deleteSearch(id);
    }

    @Override
    public int batchDeleteSearch(List<Integer> idList) {
        return this.searchMapper.batchDeleteSearch(idList);
    }

    @Override
    public List<SearchHistory> selectAllByUserId(Integer userId) {
        return this.searchMapper.selectAllByUserId(userId);
    }

    @Override
    public List<SearchHistory> selectAll() {
        return this.searchMapper.selectAll();
    }

    @Override
    public List<HotSearch> selectHotSearch() {
        return this.searchMapper.selectHotSearch();
    }

    @Override
    public List<SearchHistory> selectLatelySearch() {
        return this.searchMapper.selectLatelySearch();
    }

    @Override
    public List<SearchHistory> selectLatelySearchByUserId(Integer userId) {
        return this.searchMapper.selectLatelySearchByUserId(userId);
    }
}
