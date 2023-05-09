package com.nimo.design.creatation.singleton;

/**
 * 双层检测
 *
 * @author : chuf
 * @date : 2023-05-09
 **/
public class IdGeneratorC {

    private static volatile IdGeneratorC INSTANCE;

    private IdGeneratorC() {
    }

    public static IdGeneratorC getInstance() {
        if (INSTANCE == null) {
            synchronized (IdGeneratorC.class) {
                if (INSTANCE == null) {
                    INSTANCE = new IdGeneratorC();
                }
            }
        }
        return INSTANCE;
    }
}
