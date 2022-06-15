package com.nimo.springMybatis.service;

import com.nimo.springMybatis.entitys.User;
import com.nimo.springMybatis.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author : chuf
 * @date : 2022-06-15
 **/
@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private UserService service;

    public void methodA(){
        int a = 10/0;
    }

    @Transactional
    public void methodB(){
        User user = new User();
        user.setAge(1);
        user.setName("nimo");
        user.setId(7L);
        userMapper.insert(user);
        System.out.println(this);
        this.methodA();
    }
}
