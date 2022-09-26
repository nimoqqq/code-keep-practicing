package com.nimo.springbootjavabasic.demo;

import java.sql.SQLDataException;

/**
 * @author : chuf
 * @date : 2022-09-26
 * 重写的方法不能比被重写的方法限制性强
 * 重写的方法不能比被重写的方法抛出的异常范围更大
 **/
public class Dog {
    public void bark() throws Exception{
        System.out.println("woof");
    }
}

class Hound extends Dog {

    @Override
    public void bark() throws RuntimeException, NullPointerException {
        System.out.println("bow1");
    }
}

