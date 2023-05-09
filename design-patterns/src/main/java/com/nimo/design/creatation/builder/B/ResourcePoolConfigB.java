package com.nimo.design.creatation.builder.B;

/**
 * @author : chuf
 * @date : 2023-05-09
 **/
public class ResourcePoolConfigB {

    private String name;
    private int maxTotal;
    private int maxIdle;
    private int minIdle;

    public ResourcePoolConfigB(Builder builder) {
        this.name = builder.name;
        this.maxTotal = builder.maxTotal;
        this.maxIdle = builder.maxIdle;
        this.minIdle = builder.minIdle;
    }

    @Override
    public String toString() {
        return "ResourcePoolConfigB{" +
                "name='" + name + '\'' +
                ", maxTotal=" + maxTotal +
                ", maxIdle=" + maxIdle +
                ", minIdle=" + minIdle +
                '}';
    }
}
