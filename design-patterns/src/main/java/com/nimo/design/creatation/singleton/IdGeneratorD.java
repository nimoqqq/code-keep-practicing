package com.nimo.design.creatation.singleton;

/**
 * 静态内部类
 * 唯一性、创建过程的线程安全性，都由 JVM 来保证
 * @author : chuf
 * @date : 2023-05-09
 **/
public class IdGeneratorD {

    private IdGeneratorD() {
        System.out.println("构造方法");
    }

    private static class SingletonHolder {
        static {
            System.out.println("内部类初始化");
        }
        private static final IdGeneratorD INSTANCE = new IdGeneratorD();
    }

    public static IdGeneratorD getInstance() {
        return SingletonHolder.INSTANCE;
    }
}
