package com.nimo.springbootmybatis.mapper;

import com.nimo.springbootmybatis.entity.OrmUser;

import java.util.List;

public interface OrmUserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OrmUser record);

    int insertSelective(OrmUser record);

    OrmUser selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OrmUser record);

    int updateByPrimaryKey(OrmUser record);

    List<OrmUser> getAll();
}