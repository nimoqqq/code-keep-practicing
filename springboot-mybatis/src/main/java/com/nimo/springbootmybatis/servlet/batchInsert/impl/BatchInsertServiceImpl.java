package com.nimo.springbootmybatis.servlet.batchInsert.impl;

import com.nimo.springbootmybatis.entity.OrmUser;
import com.nimo.springbootmybatis.mapper.OrmUserMapper;
import com.nimo.springbootmybatis.servlet.batchInsert.BatchInsertService;
import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class BatchInsertServiceImpl implements BatchInsertService {
    private static final Logger LOGGER = LoggerFactory.getLogger(BatchInsertServiceImpl.class);

    @Autowired
    private OrmUserMapper ormUserMapper;

    @Autowired
    SqlSessionFactory sqlSessionFactory;

    /**
     * 一条条插入
     * @param users
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void addUserOneByOne(List<OrmUser> users) {
        long startTime = System.currentTimeMillis();
        SqlSession session = sqlSessionFactory.openSession(ExecutorType.BATCH);
        OrmUserMapper ormUserMapper = session.getMapper(OrmUserMapper.class);
        for (OrmUser user : users) {
            ormUserMapper.insertSelective(user);
        }
        session.flushStatements();
        long endTime = System.currentTimeMillis();
        LOGGER.info("一条条插入 SQL 耗费时间 {}", (endTime - startTime));
    }

    /**
     * 合并成一条 SQL 插入
     * @param users
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void addByOneSQL(List<OrmUser> users) {
        long startTime = System.currentTimeMillis();
        ormUserMapper.addByOneSQL(users);
        long endTime = System.currentTimeMillis();
        LOGGER.info("合并成一条 SQL 插入耗费时间 {}", (endTime - startTime));
    }
}
