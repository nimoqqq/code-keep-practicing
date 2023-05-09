package com.nimo.design.creatation.singleton;

/**
 * 枚举
 *
 * @author : chuf
 * @date : 2023-05-09
 **/
public enum IdGeneratorE {
    /**
     *
     */
    INSTANCE;

    public void businessMethod() {
        System.out.println("枚举创建单例");
    }
}
