package com.nimo.springbootmybatis.servlet.impl;

import com.nimo.springbootmybatis.entity.OrmUser;
import com.nimo.springbootmybatis.mapper.OrmUserMapper;
import com.nimo.springbootmybatis.servlet.UserService;
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

}
