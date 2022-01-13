package com.nimo.springbootmybatis.mapper;

import com.nimo.springbootmybatis.entity.OrmUser;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrmUserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OrmUser record);

    int insertSelective(OrmUser record);

    OrmUser selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OrmUser record);

    int updateByPrimaryKey(OrmUser record);

    List<OrmUser> getAll();
}