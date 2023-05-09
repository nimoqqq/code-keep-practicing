package com.nimo.design.creatation.singleton;

/**
 * @author : chuf
 * @date : 2023-05-09
 **/
public class SingletonTest {
    public static void main(String[] args) {
        IdGeneratorD instanceD = IdGeneratorD.getInstance();

        IdGeneratorE instanceE = IdGeneratorE.INSTANCE;
        instanceE.businessMethod();
    }
}
