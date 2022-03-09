package com.nimo.springMybatis;

import com.nimo.springMybatis.entitys.User;
import com.nimo.springMybatis.mapper.UserMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

/**
 * @program: code-keep-practicing
 * @ClassName: SampleTest
 * @description:
 * @author: chuf
 * @create: 2022-03-09 14:10
 **/
@SpringBootTest
public class SampleTest {

    @Autowired
    private UserMapper userMapper;

    @Test
    public void testSelect() {
        System.out.println(("----- selectAll method test ------"));
        List<User> userList = userMapper.selectList(null);
//        Assert.assertEquals(5, userList.size());
        userList.forEach(System.out::println);
    }

}
