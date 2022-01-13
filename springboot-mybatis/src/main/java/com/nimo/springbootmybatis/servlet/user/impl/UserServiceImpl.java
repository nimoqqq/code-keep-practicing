package com.nimo.springbootmybatis.servlet.user.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.nimo.springbootmybatis.entity.OrmUser;
import com.nimo.springbootmybatis.mapper.OrmUserMapper;
import com.nimo.springbootmybatis.servlet.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private OrmUserMapper ormUserMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return ormUserMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insertSelective(OrmUser record) {
        return ormUserMapper.insert(record);
    }

    @Override
    public OrmUser selectByPrimaryKey(Integer id) {
        return ormUserMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(OrmUser record) {
        return ormUserMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public List<OrmUser> getAll() {
        return ormUserMapper.getAll();
    }

    @Override
    public PageInfo<OrmUser> pageAll(Integer page, Integer size) {
        return PageHelper.startPage(page, size).doSelectPageInfo(() -> ormUserMapper.getAll());
    }

}
