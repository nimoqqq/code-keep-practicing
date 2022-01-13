package com.nimo.springbootmybatis.servlet;

import com.nimo.springbootmybatis.entity.OrmUser;

import java.util.List;

public interface UserService {
    int deleteByPrimaryKey(Integer id);

    int insertSelective(OrmUser record);

    OrmUser selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OrmUser record);

    List<OrmUser> getAll();
}
