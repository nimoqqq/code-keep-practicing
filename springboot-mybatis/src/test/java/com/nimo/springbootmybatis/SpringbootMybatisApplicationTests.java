package com.nimo.springbootmybatis;

import com.nimo.springbootmybatis.entity.OrmUser;
import com.nimo.springbootmybatis.servlet.batchInsert.BatchInsertService;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@SpringBootTest
class SpringbootMybatisApplicationTests {

    private static final Logger LOGGER = LoggerFactory.getLogger(SpringbootMybatisApplicationTests.class);

    @Autowired
    BatchInsertService userService;

    /**
     * 单元测试加事务的目的是为了插入之后自动回滚，避免影响下一次测试结果
     * 一条一条插入
     */
    @Test
    @Transactional
    void addUserOneByOne() {
        List<OrmUser> users = new ArrayList<>();
        for (int i = 3; i < 5000; i++) {
            OrmUser u = new OrmUser();
            u.setId(i);
            u.setName("姓名" + i);
            u.setPassword("ff342e862e7c3285cdc07e" + i);
            u.setSalt("412365a109674b2dbb19" + i);
            u.setEmail(i + "@xkcoding.com");
            u.setPhone_number("17300000001" + i);
            u.setStatus(1);
            users.add(u);
        }
        userService.addUserOneByOne(users);
    }

    /**
     * 合并成一条 SQL 插入
     */
    @Test
    @Transactional
    void addByOneSQL() {
        List<OrmUser> users = new ArrayList<>();
        for (int i = 0; i < 50000; i++) {
            OrmUser u = new OrmUser();
            users.add(u);
        }
        userService.addByOneSQL(users);
    }

    /**
     * mp 批量插入
     */
//    @Test
//    @Transactional
//    void mpBatchInsert() {
//        List<OrmUser> users = new ArrayList<>();
//        for (int i = 0; i < 50000; i++) {
//            OrmUser u = new OrmUser();
//            users.add(u);
//        }
//        long startTime = System.currentTimeMillis();
//        userService.saveBatch(users,50000);
//        long endTime = System.currentTimeMillis();
//        logger.info("MyBatis Plus 批量插入耗时 {}", (endTime - startTime));
//    }

}
