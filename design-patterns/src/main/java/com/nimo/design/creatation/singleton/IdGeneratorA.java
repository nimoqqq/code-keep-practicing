package com.nimo.design.creatation.singleton;

/**
 * 饿汉式
 *
 * @author : chuf
 * @date : 2023-05-09
 **/
public class IdGeneratorA {

    private static final IdGeneratorA INSTANCE = new IdGeneratorA();

    private IdGeneratorA() {
    }

    public static IdGeneratorA getInstance() {
        return INSTANCE;
    }
}
