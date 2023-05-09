package com.nimo.design.creatation.builder.B;

/**
 * @author : chuf
 * @date : 2023-05-09
 **/
public class MainTest {

    public static void main(String[] args) {
        AbstractBuilder builder = new Builder();
        ResourcePoolConfigB resourcePoolConfigB = builder.customName("nimo")
                .customMaxTotal(16)
                .customMaxIdle(13)
                .customMinIdle(12)
                .build();
        System.out.println(resourcePoolConfigB.toString());
    }
}
