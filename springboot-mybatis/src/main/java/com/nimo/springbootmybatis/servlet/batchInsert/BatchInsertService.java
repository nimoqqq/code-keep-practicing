package com.nimo.springbootmybatis.servlet.batchInsert;

import com.nimo.springbootmybatis.entity.OrmUser;

import java.util.List;

public interface BatchInsertService {

    void addUserOneByOne(List<OrmUser> users);

    void addByOneSQL(List<OrmUser> users);
}
