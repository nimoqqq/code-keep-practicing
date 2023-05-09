package com.nimo.design.creatation.singleton;

/**
 * 懒汉式
 *
 * @author : chuf
 * @date : 2023-05-09
 **/
public class IdGeneratorB {

    private static IdGeneratorB INSTANCE;

    private IdGeneratorB() {
    }

    public static synchronized IdGeneratorB getInstance() {
        if (INSTANCE == null) {
            INSTANCE = new IdGeneratorB();
        }
        return INSTANCE;
    }
}
